#!/bin/sh

# echo "Waiting MySQL to start on 5432..."

# while ! nc -z dailytics-db 3306; do
#   sleep 0.1
# done

# echo "MySQL started"

echo "Creating development database"
setuser app bundle exec rake db:migrate

echo "Creating test database"
RAILS_ENV=test setuser app bundle exec rake db:create db:migrate
