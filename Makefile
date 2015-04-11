.PHONEY: all

all: ssh_key etcd_discovery_uri admin_iprange.txt
	true

etcd_discovery_uri:
	curl http://discovery.etcd.io/new > etcd_discovery_uri

ssh_key: id_rsa id_rsa.pub

id_rsa:
	ssh-keygen -t rsa -f id_rsa -N ''

admin_iprange.txt:
	echo $$(curl 'http://api.ipify.org?format=text' 2>/dev/null)/32 > admin_iprange.txt

id_rsa.pub:
	ssh-keygen -y -f id_rsa > id_rsa.pub

clean:
	rm id_rsa id_rsa.pub

