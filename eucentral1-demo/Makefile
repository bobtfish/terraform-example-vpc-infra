.phoney: all

all: .terraform variables.tf.json

.terraform:
	    terraform get
	    for i in $$(ls .terraform/modules/); do make -C ".terraform/modules/$$i"; done

gitupdate:
	for i in $$(ls .terraform/modules/); do cd ".terraform/modules/$$i"; git pull --rebase origin master; cd ../../../; done

sshnat:
	ssh -A -i ../id_rsa ubuntu@$$(terraform output nat_public_ip)

deploywww:
	curl -H "Content-Type: application/json" -X POST -d @marathon_www.json $$(terraform output marathon_api)/v2/apps

clean:
	rm -fr .terraform variables.tf.json

variables.tf.json:
	ruby getvariables.rb > variables.tf.json

