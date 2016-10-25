#AWS EC2 RI Auditor

Am I really using my AWS EC2 Reserved Instances? Audit your EC2 Reserved Instances. 
Inspired by a [Matthew G Keller's post] (http://www.matthewgkeller.com/blog/2014/01/07/aws-ec2-reserved-instance-auditing)

## Development

Make sure you edit the `.env` file with your Google credentials. It should looks like this:
```
RAILS_ENV=development
PASSENGER_APP_ENV=development
RACK_ENV=development
GOOGLE_CLIENT_ID=<<REPLACE HERE>>
GOOGLE_CLIENT_SECRET=<<REPLACE HERE>>
```

```
riauditor$ docker-compose build
riauditor$ docker-compose up -d
```

Point the hostname ```dev.riauditor.com``` to your docker proxy ip (in mac, ```vim /etc/hosts```)

You are ready! visit: http://dev.riauditor.com in your browser

You will see something like this:
<img width="1207" alt="RI Auditor sample" src="https://cloud.githubusercontent.com/assets/365101/9720979/5dbe4c96-556a-11e5-9889-d0ed944d7b6f.png">