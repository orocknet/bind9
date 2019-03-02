#!/usr/bin/sh -e
## shellcheck disable=SC2002
#
apt-get -y install curl dos2unix
blocklist="/etc/bind/zones/adstracker.blocklist"
echo
echo "::: Getting adblockplus list..."
curl -q -L "https://easylist-downloads.adblockplus.org/abpindo+easylist.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >/tmp/domain.txt
curl -q -L "https://easylist-downloads.adblockplus.org/abpvn+easylist.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://easylist-downloads.adblockplus.org/bulgarian_list+easylist.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://easylist-downloads.adblockplus.org/easylistchina.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://easylist-downloads.adblockplus.org/easylistczechslovak+easylist.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://easylist-downloads.adblockplus.org/easylistdutch+easylist.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://easylist-downloads.adblockplus.org/easylistgermany+easylist.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://easylist-downloads.adblockplus.org/israellist+easylist.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://easylist-downloads.adblockplus.org/easylistitaly+easylist.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://easylist-downloads.adblockplus.org/easylistlithuania+easylist.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://easylist-downloads.adblockplus.org/easylistspanish+easylist.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://easylist-downloads.adblockplus.org/latvianlist+easylist.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://easylist-downloads.adblockplus.org/liste_ar+liste_fr+easylist.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://easylist-downloads.adblockplus.org/liste_fr+easylist.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://easylist-downloads.adblockplus.org/rolist+easylist.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://easylist-downloads.adblockplus.org/ruadlist+easylist.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://easylist-downloads.adblockplus.org/malwaredomains_full.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://easylist-downloads.adblockplus.org/adwarefilters.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
echo
echo "::: Getting adguard list..."
curl -q -L "https://filters.adtidy.org/windows/filters/[1-16].txt"|grep '^||.*\^'|grep -v '[\$\=\~\*\/]'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://filters.adtidy.org/windows/filters/[101-123].txt"|grep '^||.*\^'|grep -v '[\$\=\~\*\/]'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q -L "https://filters.adtidy.org/windows/filters/[200-240].txt"|grep '^||.*\^'|grep -v '[\$\=\~\*\/]'|sed 's/[\|\^]//g' >>/tmp/domain.txt
echo
echo "::: Getting ads tracking list..."
curl -q "https://raw.githubusercontent.com/reek/anti-adblock-killer/master/anti-adblock-killer-filters.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/Dawsey21/Lists/master/adblock-list.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/IDKwhattoputhere/uBlock-Filters-Plus/master/uBlock-Filters-Plus.txt"|grep -v '\*'|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/Yhonay/antipopads/master/popads.txt"|grep '^||.*\^$'|sed 's/[\|\^]//g' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/notracking/hosts-blocklists/master/hostnames.txt"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/notracking/hosts-blocklists/master/domains.txt"|grep -v '[\#\:]'|sed 's/address\=\///g'|sed -e 's/\/0.0.0.0//g' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/StevenBlack/hosts/master/data/UncheckyAds/hosts"|grep -v "[\:\#]"|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt"|grep -v "[\:\#]"|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/android-tracking.txt"|grep -v "[\:\#]" >>/tmp/domain.txt
curl -q "https://adaway.org/hosts.txt"|grep -v "[\:\#]"|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt"|grep -v "[\:\#]"|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt"|grep -v "[\:\#]"|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://hosts-file.net/ad_servers.txt"|grep -v "[\:\#]"|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://www.squidblacklist.org/downloads/dg-ads.acl"|grep -v "[\:\#]" >>/tmp/domain.txt
curl -q "https://v.firebog.net/hosts/AdguardDNS.txt"|grep -v "[\:\#]" >>/tmp/domain.txt
curl -q "https://v.firebog.net/hosts/Easylist.txt"|grep -v "[\:\#]" >>/tmp/domain.txt
curl -q "https://v.firebog.net/hosts/Easyprivacy.txt"|grep -v "[\:\#]" >>/tmp/domain.txt
curl -q "https://v.firebog.net/hosts/Prigent-Ads.txt"|grep -v "[\:\#]" >>/tmp/domain.txt
curl -q "https://v.firebog.net/hosts/Airelle-trc.txt"|grep -v "[\:\#]" >>/tmp/domain.txt
curl -q -d mimetype=plaintext -d hostformat=unixhosts "http://pgl.yoyo.org/adservers/serverlist.php?" >>/tmp/domain.txt
curl -q "https://blocklist.site/app/dl/tracking" >>/tmp/domain.txt
curl -q "https://blocklist.site/app/dl/ads" >>/tmp/domain.txt

dos2unix /tmp/domain.txt
echo "::: Removing bad character..."
cat /tmp/domain.txt|grep -v "[\`\~\!\@\#\$\%\^\&\=\(\)\:\,\'\;\?\*\/]"| \
grep -v '\.[0-9]\+$'|grep -v '\.$'|grep -v '^\.'|grep -v '\.\.'|grep -v '\ '|grep -v '^[a-zA-Z]*$'| \
grep -v '^........................................................................................................................'| \
sed "/^$/d"|sort|uniq >/tmp/domain.txt.tmp
echo "::: Updating database..."
cat /dev/null > $blocklist;
for i in $(cat /tmp/domain.txt.tmp);
do
echo "$i\tIN\tCNAME\t0.0.0.0" >>$blocklist;
done
echo "::: Removing temporary..."
rm -rf /tmp/domain.txt
rm -rf /tmp/domain.txt.tmp

echo "\$TTL 86400
@   IN   SOA   localhost. root.localhost. ( `date +"%d%m%Y"` 10800 10800 10800 10800 )
@   IN   NS   localhost.

\$INCLUDE \"/etc/bind/zones/adstracker.blocklist\"
\$INCLUDE \"/etc/bind/zones/ads.blocklist\"" >/etc/bind/zones/adstracker.zone

echo "::: Done."
