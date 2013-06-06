## Sublime

Basic wrapper for Sublime Text 2 settings.  Has shortcuts for default and user paths.

## Basic Usage

```ruby
settings = Sublime::Settings.user.new
settings.merge!("theme" => "Soda Dark.sublime-theme")
settings.save!
```
Or shortcut

```ruby
Sublime::Settings.user.update!("theme" => "Soda Dark.sublime-theme")
```

Setting object are just Ruby hashes, so you can call any hash methods for manipulation.

## Contributing

Only paths for OSX have been defined.  Feel free to fork do pull requests for filepaths on Linux or Windows.

## Copyright

Copyright (c) 2013 Elpizo Choi. See LICENSE.txt for
further details.