ARG RUBY_VERSION
FROM ruby:${RUBY_VERSION}-alpine
MAINTAINER codesign2@icloud.com

ENV RUBY_VERSION=${RUBY_VERSION}

# Build deps
RUN apk update \
  && apk add --no-cache git openssh-client

# Install Bundler
RUN gem install bundler

# Install testing utilities
RUN bundle add rspec capybara rspec-json-matchers shoulda-matchers timecop selenium-webdriver chromedriver-helper --group "test"

# Install linting utilities
RUN bundle add rubocop --group "development"

# Install testing + dev utilities
RUN bundle add simplecov rubocop-performance --group "development, test"

# Install debugger beautification
RUN bundle add pry pry-nav byebug --group "development, test"
