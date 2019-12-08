# web_api

* [github](https://www.github.com/carlosjhr64/web_api)
* [rubygems](https://rubygems.org/gems/web_api)

## DESCRIPTION:

Ruby library for web api's.

In Beta.  Testing not done.  Only GET and POST implemented.

## SYNOPSIS:

    require 'web_api'
    webapi = WEB_API::WebApi.new
    ###                **Name**           **Url**           **Type(get or post)**
    webapi.add(:wutuwant, 'http://service.org/v1/wutuwant', :get)
    # You can pass the post's (or query's) key value pairs in a hash.
    response = webapi.wutuwant({'key'=>'value'   })

## FEATURES/PROBLEMS:

* Beta, still testing.

## INSTALL:

    $ sudo gem install web_api

## LICENSE:

(The MIT License)

Copyright (c) 2019 CarlosJHR64

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
