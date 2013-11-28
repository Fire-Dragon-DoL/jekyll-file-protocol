# JekyllFileProtocol

This gem provides a small set of helpers that should allow you to generate a
static website that will work on file protocol, using **relative paths** instead
of absolute paths.

This gem is born to help me creating relative paths for filters of the gem [jekyll-assets](https://github.com/ixti/jekyll-assets), which I highly recommend expecially if you know how Ruby on Rails works.

## Installation

Add this line to your application's Gemfile:

    gem 'jekyll-file-protocol', '~> 0.1.3'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jekyll-file-protocol

## Usage

The gem actually provides a single helper (a filter) that is quite straightforward to use.  
The example will use the asset_path filter provided by jekyll-assets gem.

So imagine we have these files:

```
# /house/rooms/living.html

<html>
	<body>
		<img src="{{ 'living.png' | asset_path | relative_path }}" />
    </body>
</html>
```

```
# /assets/living.png
```

The resulting html will be:

```
# /_site/house/rooms/living.html

<html>
	<body>
		<img src="../../assets/living.png" />
    </body>
</html>
```

## TODO

- Write some tests
- Add helpers that work file with asset\_path on SCSS

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
