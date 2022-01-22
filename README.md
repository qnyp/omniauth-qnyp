# Omniauth::Qnyp

This is the official OmniAuth strategy for authenticating to qnyp.
To use it, you'll need to register your application on [qnyp Applications Page](https://qnyp.com/oauth/applications/new) (Login required).

## Using This Strategy

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-qnyp'
```

Next, tell OmniAuth about this provider.
For a Rails app, your `config/initializers/omniauth.rb` file should look like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :qnyp, ENV.fetch('QNYP_APP_ID'), ENV.fetch('QNYP_APP_SECRET'), scope: 'public'
end
```

Replace `QNYP_APP_ID` and `QNYP_APP_SECRET` with your application ID and application secret.

## Scopes

qnyp API lets you set scopes to provide granular access to different types of data.

If you want to access public information by API, specify `scope:` option with `public`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :qnyp, '...', '...', scope: 'public'
end
```

Or, if you want to access public information and write a log by API, specify `scope:` option with `public write`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :qnyp, '...', '...', scope: 'public write'
end
```

## Auth Hash Schema

OmniAuth will return an authentication hash similar to the example below. Learn more about the [Auth Hash Schema](https://github.com/omniauth/omniauth/wiki/Auth-Hash-Schema).

```ruby
{
  "provider" => "qnyp",
  "uid" => 1, # User ID
  "info" => {
    "language" => "ja", # Preffered language for UI (ja or en)
    "name" => "junya", # Name for display
    "profile_image_url" => "http://example.com/profile_image.png", # Profile image URL
    "username" => "junya", # Username (unique identifier)
  },
  "credentials" => {
    "expires" => false,
    "token" => "...", # Access token
  }
}
```

## Development

```
$ bundle install
```

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
