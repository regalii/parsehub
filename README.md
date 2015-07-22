# Parsehub

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'parsehub'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install parsehub

## Configure

```ruby
Parsehub.configure do |config|
  config.api_key = 'your-account-api-key'
end
```

## Usage

### Project
**Get list of projects**
```ruby
Parsehub::Project.list
```
**Get project**
```ruby
Parsehub::Project.fetch('project-token')
```
**Run project**
```ruby
Parsehub::Project.run('project-token')
```
**Get last run data for a project**
```ruby
Parsehub::Project.last_ready_run('project-token')
```

### Run
**Get run**
```ruby
Parsehub::Run.fetch('run-token')
```
**Get run data**
```ruby
Parsehub::Run.data('run-token')
```
**Cancel run**
```ruby
Parsehub::Run.cancel('run-token')
```
**Delete run**
```ruby
Parsehub::Run.delete('run-token')
```

## Versioning

`x.y.z`

* x = Parsehub's API major version
* y = Parsehub's API minor version
* z = Gem's release release number

For instance, `2.0.1` Gem version 1 that maps to Parsehub's API v2.0. 

## Contributing

1. Fork it ( https://github.com/[my-github-username]/parsehub/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
