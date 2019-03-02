#!/usr/bin/sh -e
## shellcheck disable=SC2002
#
apt-get -y install curl dos2unix
blocklist="/etc/bind/zones/badsite.blocklist"

# stuk
#curl -q "http://hosts-file.malwareteks.com/hosts-MAC.txt"|grep -v '[\#\:]'|awk '{print $1}' >/tmp/domain.txt
#curl -q -A 'Mozilla/5.0' -e www.google.com http://adblock.mahakala.is|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
#curl -q "http://hostsfile.mine.nu/hosts0.txt"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt

curl -q "https://raw.githubusercontent.com/Clefspeare13/pornhosts/master/0.0.0.0/hosts"|grep -v '[\#\:]'|awk '{print $2}' >/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/Sinfonietta/hostfiles/master/pornography-hosts"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/Sinfonietta/hostfiles/master/gambling-hosts"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/marktron/fakenews/master/fakenews"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/greatis/Anti-WebMiner/master/blacklist.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/Marfjeh/coinhive-block/master/domains"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/hosts.txt"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/UncheckyAds/hosts"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/michaeltrimm/hosts-blocking/master/_hosts.txt"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Spam/hosts"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Risk/hosts"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/StevenBlack/hosts/master/data/KADhosts/hosts"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/StevenBlack/hosts/master/data/add.Spam/hosts"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/quidsup/notrack/master/trackers.txt"|sed 's/\#.*//g'|sed 's/\ //g'|grep -v "#" >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/Marfjeh/coinhive-block/master/domains"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/bkrcrc/turk-adlist/master/hosts"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/quidsup/notrack/master/malicious-sites.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/win10/spy.txt"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-malware.txt"|awk '{print $1}'|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://hosts-file.net/exp.txt"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://hosts-file.net/emd.txt"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://hosts-file.net/psh.txt"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://hosts-file.net/grm.txt"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://hostsfile.org/Downloads/hosts.txt"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://s3.amazonaws.com/lists.disconnect.me/simple_malware.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://v.firebog.net/hosts/Shalla-mal.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://v.firebog.net/hosts/Prigent-Malware.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://v.firebog.net/hosts/Prigent-Phishing.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://v.firebog.net/hosts/Airelle-hrsk.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://v.firebog.net/hosts/static/w3kbl.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://v.firebog.net/hosts/BillStearns.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://v.firebog.net/hosts/Kowabit.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://v.firebog.net/hosts/Shalla-mal.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://ransomwaretracker.abuse.ch/downloads/RW_DOMBL.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://ransomwaretracker.abuse.ch/downloads/CW_C2_DOMBL.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://ransomwaretracker.abuse.ch/downloads/LY_C2_DOMBL.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://ransomwaretracker.abuse.ch/downloads/TC_C2_DOMBL.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://ransomwaretracker.abuse.ch/downloads/TL_C2_DOMBL.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://www.dshield.org/feeds/suspiciousdomains_Low.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://www.dshield.org/feeds/suspiciousdomains_Medium.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://www.dshield.org/feeds/suspiciousdomains_High.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://www.joewein.net/dl/bl/dom-bl-base.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://zerodot1.gitlab.io/CoinBlockerLists/hosts"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/Dawsey21/Lists/master/main-blacklist.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/matomo-org/referrer-spam-blacklist/master/spammers.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://raw.githubusercontent.com/vokins/yhosts/master/hosts"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "http://www.joewein.de/sw/blacklist/dom-bl.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://blocklist.kowabit.de/list.txt"|grep -v '[\#\:\!\]]' >>/tmp/domain.txt
curl -q "http://mirror1.malwaredomains.com/files/justdomains"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "http://winhelp2002.mvps.org/hosts.txt"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "http://www.malwaredomainlist.com/hostslist/hosts.txt"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "http://someonewhocares.org/hosts/hosts"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://zeustracker.abuse.ch/blocklist.php?download=domainblocklist"|grep -v '[\#\:]' >>/tmp/domain.txt
##curl -q "https://zeustracker.abuse.ch/blocklist.php?download=ipblocklist"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://ransomwaretracker.abuse.ch/downloads/RW_DOMBL.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
##curl -q "https://ransomwaretracker.abuse.ch/downloads/RW_IPBL.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "http://mirror1.malwaredomains.com/files/immortal_domains.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "http://sysctl.org/cameleon/hosts"|grep -v '[\#\:]'|awk '{print $2}' >>/tmp/domain.txt
curl -q "https://bitbucket.org/ethanr/dns-blacklists/raw/8575c9f96e5b4a1308f2f12394abd86d0927a4a0/bad_lists/Mandiant_APT1_Report_Appendix_D.txt"|grep -v '[\#\:]' >>/tmp/domain.txt
curl -q "https://openphish.com/feed.txt"|sed 's/^http.*\:\/\///g'|sed 's/\/.*//g' >>/tmp/domain.txt

curl -q "https://blocklist.site/app/dl/ads" >>/tmp/domain.txt
curl -q "https://blocklist.site/app/dl/phishing" >>/tmp/domain.txt
curl -q "https://blocklist.site/app/dl/ransomware" >>/tmp/domain.txt
curl -q "https://blocklist.site/app/dl/proxy" >>/tmp/domain.txt
curl -q "https://blocklist.site/app/dl/malware" >>/tmp/domain.txt
curl -q "https://blocklist.site/app/dl/scam" >>/tmp/domain.txt
curl -q "https://blocklist.site/app/dl/spam" >>/tmp/domain.txt
curl -q "https://blocklist.site/app/dl/fraud" >>/tmp/domain.txt
curl -q "https://blocklist.site/app/dl/fakenews" >>/tmp/domain.txt

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

\$INCLUDE \"/etc/bind/zones/blackdom.blocklist\"
\$INCLUDE \"/etc/bind/zones/badsite.blocklist\"
\$INCLUDE \"/etc/bind/zones/eset.blocklist\"
\$INCLUDE \"/etc/bind/zones/proxyauth.blocklist\"" >/etc/bind/zones/blackdom.zone

echo "::: Done."
