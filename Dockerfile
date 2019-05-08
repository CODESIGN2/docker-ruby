ARG BASE_VERSION
FROM ruby:${BASE_VERSION}-alpine
MAINTAINER codesign2@icloud.com

ENV BASE_VERSION=${BASE_VERSION}

# Build deps
RUN apk update \
  && apk add --no-cache git openssh-client build-base \
    libxml2-dev libxslt-dev postgresql-dev libffi-dev readline-dev \
    yaml-dev zlib-dev bzip2-dev ca-certificates tzdata \
    linux-headers

# Install Bundler
RUN gem install bundler

# Init Gemfile
RUN bundle init

# Install testing utilities
RUN bundle add rspec capybara rspec-json_matchers shoulda-matchers timecop nokogiri selenium-webdriver chromedriver-helper --group "test"

# Install linting utilities
RUN bundle add rubocop --group "development"

# Install testing + dev utilities
RUN bundle add simplecov rubocop-performance --group "development, test"

# Install debugger beautification
RUN bundle add pry pry-nav byebug --group "development, test"
