require 'web_api'
include WEB_API

# IRB Tools
require 'irbtools/configure'
_ = WEB_API::VERSION.split('.')[0..1].join('.')
Irbtools.welcome_message = "### WEB_API(#{_}) ###"
require 'irbtools'
IRB.conf[:PROMPT][:WEB_API] = {
  PROMPT_I:    '> ',
  PROMPT_N:    '| ',
  PROMPT_C:    '| ',
  PROMPT_S:    '| ',
  RETURN:      "=> %s \n",
  AUTO_INDENT: true,
}
IRB.conf[:PROMPT_MODE] = :WEB_API
