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

```
Parsehub.configure do |config|
  config.api_key = 'your-account-api-key'
end
```

## Usage

### Project
**Get list of projects**
```
Parsehub::Project.list
```
**Get project**
```
Parsehub::Project.fetch('project-token')
```
**Run project**
```
Parsehub::Project.run('project-token')
```
**Get last run data for a project**
```
Parsehub::Project.last_ready_run('project-token')
```

### Run
**Get run**
```
Parsehub::Run.fetch('run-token')
```
**Get run data**
```
Parsehub::Run.data('run-token')
```
**Cancel run**
```
Parsehub::Run.cancel('run-token')
```
**Delete run**
```
Parsehub::Run.delete('run-token')
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/parsehub/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
