# GitClient

[![Code Climate](https://codeclimate.com/github/rai200890/git_client/badges/gpa.svg)](https://codeclimate.com/github/rai200890/git_client)

## Description

Client for consuming Gitlab and Github APIs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'git_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install git_client

## Usage

### Client initialization:
```ruby
client = GitClient::GitClient.new({provider: :gitlab, base_url: <repository_url>, private_token: <token>}).client
```

### Retrieving projects:
```ruby

request = client.projects
projects = request.parsed_response
raw_response = request.response
```
###Retrieving file:
```ruby
request = client.file project_id: 92, filepath: "Gemfile.lock", commit_sha: '83eb671a5'
file_contents = request.response
```
### Retrieving errors:
```ruby
errors = request.parsed_errors
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/git_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
