# pcap file to analyze
pcap=$1

#get path to save
path=${pcap%.*}

# delete current configuration
rm -rf /etc/snort/*

# copy new configuration
cp -a /opt/snortrules-snapshot-2972/. /etc/snort/

# remove previous alerts
rm -rf /var/log/snort/alert || true

# analyze pcap file
snort -c /etc/snort/etc/snort.conf -r $pcap

# cat alerts
cp /var/log/snort/alert "$path"_alerts.txt
