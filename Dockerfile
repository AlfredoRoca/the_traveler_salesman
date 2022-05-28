FROM ruby:3.0
ENV LC_ALL=C.UTF-8 LANG=C.UTF-8

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# CMD ["./your-daemon-or-script.rb"]