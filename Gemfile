# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

group :development do
    gem 'sinatra-reloader', '~> 1.0'
    gem 'dotenv', '~> 2.7', '>= 2.7.6'
end

group :production do
    gem 'sinatra', '~> 2.1'
    gem 'pg', '~> 1.2', '>= 1.2.3'
    gem 'puma', '~> 3.4'
    gem 'json', '~> 2.6', '>= 2.6.1'
end