# syntax=docker/dockerfile:1
FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /geolocation_app
WORKDIR /geolocation_app
COPY Gemfile /geolocation_app/Gemfile
COPY Gemfile.lock /geolocation_app/Gemfile.lock
RUN gem install bundler:2.3.7
RUN bundle install
ADD . /geolocation_app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]