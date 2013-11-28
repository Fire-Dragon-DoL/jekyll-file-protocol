# JekyllFileProtocol

This gem provides a small set of helpers that should allow you to generate a
static website that will work on file protocol, using **relative paths** instead
of absolute paths.

This gem is born to help me creating relative paths for filters of the gem [jekyll-assets](https://github.com/ixti/jekyll-assets), which I highly recommend expecially if you know how Ruby on Rails works.

## Installation

Add this line to your application's Gemfile:

    gem 'jekyll-file-protocol', '~> 0.4.0'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jekyll-file-protocol

## Usage

The gem actually provides some helpers (filters) that are quite straightforward to use.  
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

The other filter is `relative_tag` which can be used with `stylesheet`,
`javascript` and `image`.

```
# /_site/house/rooms/living.html

<html>
  <body>
    {{ 'living.png' | image | relative_tag }}
  </body>
</html>
```

And the output is the same as before.  
There are also some useful helpers (tags) to get url filename with and without
extension and directory of url filename:
`url_filename`, `url_filename_with_ext` and `url_directoryname`.

Examples

```
# /this/is/my/test.html

{% url_filename %}          # => test
{% url_filename_with_ext %} # => test.html
{% url_directoryname %}     # => my
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
