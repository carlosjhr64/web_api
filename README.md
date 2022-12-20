# WebApi

* [VERSION 2.0.221220](https://www.github.com/carlosjhr64/web_api)
* [github](https://www.github.com/carlosjhr64/web_api)
* [rubygems](https://rubygems.org/gems/web_api)

## DESCRIPTION:

Ruby library for web api's.

## SYNOPSIS:
```ruby
require 'web_api'
webapi = WebApi.new "https://api.site.org/path-to-base/",
                             header: {Authorization: "Bearer ABC123XYZ"}
# for a post to https://api.site.org/path-to-base/resource...
webapi.add(:resource, type: :post)
# You can pass the post's (or query's) key value pairs in a hash.
body = webapi.resource(data: {key: "value"})
```
## INSTALL:
```console
$ gem install web_api
```
## MORE:

There's not that much code here...
under 200 lines in `lib/**.rb` at the time of this writing.
Take a look at the examples given at [github](https://github.com/carlosjhr64/web_api/tree/master/examples)
for use cases.

The model is that at each step...

1. instantiation of a WebApi object
2. addition of a WebApi method
3. call to a WebApi method

...one builds up the url, type, data, and header of the http request.
The WebApi methods `#new`, `#add`, and `#<method>`
all have the same argument signature:

    extension String,
    type:     Symbol,
    data:     Hash,
    header:   Hash,
    dumper:   Proc,
    Parser:   Proc|Hash(String, Proc)

The extension builds up the url by concatenation.
The data and headers hashes are built up with merge.
The type, dumper, and parser can be changed at each step.

One can read the code to check the minor nuances of each method's signature,
such as default values.

Note that `#add` will assume extension is the same as the name of the method if
no extension is given.

Note that `#<method>` will assume the user meant to pass data if
it only gets a hash:

    #<method>({"a"=>"ABC","x"=>"XYZ"})
    #=> #<method>('', data: {"a"=>"ABC","x"=>"XYZ"})

The dumper to dump the data in a post request is JSON.dump by default
if JSON is available.

The parser to parse the body of an "application/json" type content is
JSON.parse by default if available.
You can read the code and inspect `WebApi::PARSER`
to see the other parsers available by default.

If one does not want to parse the response's body,
one can set `parser: :none`. For example:
```ruby
body = webapi.resourse(data: {key: "value"}, parser: :none)
```
## LICENSE:

(The MIT License)

Copyright (c) 2022 CarlosJHR64

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
