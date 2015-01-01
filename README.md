#AWS EC2 RI Auditor


Am I really using my AWS EC2 Reserved Instances? Audit your EC2 Reserved Instances. 
Inspired by a [Matthew G Keller's post] (http://www.matthewgkeller.com/blog/2014/01/07/aws-ec2-reserved-instance-auditing)

## Development
```
$ git clone [repo]
$ cd riauditor
riauditor$ vagrant up
riauditor$ vagrant ssh
```
Now, you are inside the new VM
```
$ cd /riauditor
riauditor$ bundle install --no-deployment; bundle install --deployment
riauditor$ rbenv rehash
riauditor$ bin/rake db:create
riauditor$ bin/rake db:migrate
riauditor$ mkdir tmp
riauditor$ touch tmp/restart.txt
```

Point the hostname ```dev.riauditor.com``` to the ```33.33.33.112``` ip (in mac, ```vim /etc/hosts```)

You are ready! visit: http://dev.riauditor.com in your browser
