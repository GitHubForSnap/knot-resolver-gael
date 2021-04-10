#!/bin/bash

DENY_HOSTS=$SNAP_COMMON/policies/deny_hosts.url 
DENY_DOMAINS=$SNAP_COMMON/policies/deny_domains.url
DENY_POLICY=$SNAP_COMMON/policies/deny_policy.rpz
DENY_POLICY_NEW=$SNAP_COMMON/policies/deny_policy.rpz.new

COMMENT_PATTERN='^[[:blank:]]*[^[:blank:]#;]'

TMP_HOSTS=`mktemp`  
TMP_DOMAINS=`mktemp`

# Process the deny hosts URLs
if [[ -f $DENY_HOSTS ]] ; then

   # Loop through the URLs ignoring comments
   for URL in $(grep "$COMMENT_PATTERN" "$DENY_HOSTS")
   do
      # Retrieve the hosts from the URLs. Delete comments. Remove IPs. Store the hosts in TMP_HOSTS
      wget --quiet -O - "$URL" | sed 's/#.*$//' | cut -d ' ' -f 2 >> $TMP_HOSTS

   done
fi

# Process the deny domains URLs
if [[ -f $DENY_DOMAINS ]] ; then

   # Loop through the URLs ignoring comments
   for URL in $(grep "$COMMENT_PATTERN" "$DENY_DOMAINS")
   do 

      # Retrieve the domains from the URLs. Delete comments. Store the domains in TMP_DOMAINS
      wget --quiet -O - "$URL" | sed 's/#.*$//' >> $TMP_DOMAINS

   done
fi    

# Create deny policy header
echo -e '$TTL\t2' > $DENY_POLICY_NEW
echo -e '@\tIN\tSOA\tlocalhost.\troot.localhost.\t(2 2w 2w 2w 2w)' >> $DENY_POLICY_NEW
echo -e '\tIN\tNS\tlocalhost.\n' >> $DENY_POLICY_NEW

# Concatenate hosts and domains, remove duplicates, remove empty lines, create NXDOMAIN entries in DENY_POLICY_NEW
cat $TMP_HOSTS $TMP_DOMAINS | sort -u | sed '/^[[:space:]]*$/d' | grep "[.]" | sed -e 's/.*/\0\tCNAME\t.\n*.\0\tCNAME\t./' >> $DENY_POLICY_NEW

mv "$DENY_POLICY_NEW" "$DENY_POLICY"
echo "$DENY_POLICY has been updated"

rm "$TMP_HOSTS"
rm "$TMP_DOMAINS"

exit 0
