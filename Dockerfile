FROM phusion/passenger-ruby22:0.9.16

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]


RUN apt-get update

RUN gem install mini_portile:0.6.2 nokogiri:1.6.6.2 rails:4.2.0

# Active nginx
RUN rm -f /etc/service/nginx/down

# Install bundle of gems
WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install

# Copy the nginx template for configuration and preserve environment variables
RUN rm /etc/nginx/sites-enabled/default

# Add the nginx site and config
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

# Add the rails-env configuration file
ADD rails-env.conf /etc/nginx/main.d/rails-env.conf

RUN mkdir /home/app/webapp
COPY . /home/app/webapp
RUN usermod -u 1000 app
RUN chown -R app:app /home/app/webapp

# Run assets:precompile
RUN cd /home/app/webapp && bundle exec rake assets:precompile

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80
