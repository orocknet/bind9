#!/usr/bin/sh -s
## shellcheck disable=SC2002
#
apt-get -y install curl dos2unix
blocklist="/etc/bind/zones/trustpositif.blocklist"
echo "::: Getting trustpositif.kominfo.go.id list..."
curl -q -k "https://trustpositif.kominfo.go.id/files/downloads/database/blacklist/pengaduan/domains" >/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/chadmayfield/pihole-blocklists/master/lists/pi_blocklist_porn_top1m.list" >>/tmp/domain.txt
curl -q "https://blocklist.site/app/dl/porn" >>/tmp/domain.txt
dos2unix /tmp/domain.txt
echo "::: Removing bad character..."
cat /tmp/domain.txt|sed 's/\.trustpositifkominfo$//g'| \
grep -v "[\`\~\!\@\#\$\%\^\&\=\(\)\:\,\'\;\?\/]"| \
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

\$INCLUDE \"/etc/bind/zones/trustpositif.blocklist\"
\$INCLUDE \"/etc/bind/zones/gambling.blocklist\"
\$INCLUDE \"/etc/bind/zones/porn.blocklist\"" >/etc/bind/zones/trustpositif.zone

echo "::: Done."
