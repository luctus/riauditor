#AWS EC2 RI Auditor

Am I really using my AWS EC2 Reserved Instances? Audit your EC2 Reserved Instances. 
Inspired by a [Matthew G Keller's post] (http://www.matthewgkeller.com/blog/2014/01/07/aws-ec2-reserved-instance-auditing)

## Development

You need to have Docker installed in your computer (if you are using a Mac, then I really recommend you to user [Dinghy](https://github.com/codekitchen/dinghy)) and the [nginx-proxy container](https://github.com/jwilder/nginx-proxy) up and running.

Now, make sure you edit the `.env` file with your Google credentials. It should looks like this:
```
RAILS_ENV=development
PASSENGER_APP_ENV=development
RACK_ENV=development
GOOGLE_CLIENT_ID=<<REPLACE HERE>>
GOOGLE_CLIENT_SECRET=<<REPLACE HERE>>
```

Then, check the configuration file at `config/settings.yml` and make sure it contains all the AWS regions you work with. It initially contains `us-east-1`, `sa-east-1`, `eu-west-1`, and `ap-southeast-1`.

Finaly, build, and start the container.
```
riauditor$ docker-compose build
riauditor$ docker-compose up -d
```

Point the hostname ```dev.riauditor.com``` to your docker proxy ip (in mac, ```vim /etc/hosts```)

You are ready! visit: http://dev.riauditor.com in your browser

You will see something like this:
<img width="1207" alt="RI Auditor sample" src="https://cloud.githubusercontent.com/assets/365101/9720979/5dbe4c96-556a-11e5-9889-d0ed944d7b6f.png">
