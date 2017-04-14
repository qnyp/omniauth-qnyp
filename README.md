# Omniauth::Qnyp

This is the official OmniAuth strategy for authenticating to qnyp. To use it, you'll need to sign up for an OAuth2 Application ID and Secret on the [qnyp Applications Page](https://qnyp.com/oauth/applications/new).

## Using This Strategy

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-qnyp'
```

Next, tell OmniAuth about this provider. For a Rails app, your config/initializers/omniauth.rb file should look like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :qnyp, 'API_KEY', 'API_SECRET'
end
```

Replace 'API_KEY' and 'API_SECRET' with the appropriate values you obtained earlier.

If you are using Devise then it will look like this:

```ruby
Devise.setup do |config|
  config.omniauth :qnyp, ENV['QNYP_APP_ID'], ENV['QNYP_APP_SECRET']
end
```

## Scopes

qnyp API lets you set scopes to provide granular access to different types of data.
If you want to use API which requires `write` scope, specify `scope:` option:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :qnyp, 'API_KEY', 'API_SECRET', scope: 'write'
end
```

## Auth Hash Schema

OmniAuth will return an authentication hash similar to the example below. Learn more about the [Auth Hash Schema](https://github.com/omniauth/omniauth/wiki/Auth-Hash-Schema).

```ruby
{
  "provider"=>"qnyp"
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`,
and then run `bundle exec rake release` to create a git tag for the version,
push git commits and tags, and push the `.gem` file to rubygems.org.

## Contributing

1. Fork it ( https://github.com/qnyp/omniauth-qnyp/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## License

The MIT License (MIT)
Copyright (c) 2017 qnyp, LLC.

See `LICENSE.txt`.
