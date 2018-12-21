FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /app
WORKDIR /app
COPY ./src/Gemfile /app/Gemfile
COPY ./src/Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY ./src /app
RUN rm -rf /app/tmp/pids
CMD bundle exec rails s -p 3000 -b '0.0.0.0'