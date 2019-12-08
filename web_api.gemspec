Gem::Specification.new do |s|

  s.name     = 'web_api'
  s.version  = '0.2.0'

  s.homepage = 'https://github.com/carlosjhr64/web_api'

  s.author   = 'carlosjhr64'
  s.email    = 'carlosjhr64@gmail.com'

  s.date     = '2015-01-04'
  s.licenses = ['MIT']

  s.description = <<DESCRIPTION
Ruby library for web api's.

In Beta.  Testing not done.  Only GET and POST implemented.
DESCRIPTION

  s.summary = <<SUMMARY
Ruby library for web api's.
SUMMARY

  s.extra_rdoc_files = ['README.rdoc']
  s.rdoc_options     = ["--main", "README.rdoc"]

  s.require_paths = ["lib"]
  s.files = %w(
History.txt
Manifest.txt
README.rdoc
TODO.txt
examples/bitcoincharts
examples/blockexplorer
examples/facebook
examples/mtgox1
examples/mtgox2
examples/twitter
examples/youtube
features/main.feature
features/step_definitions/main_steps.rb
lib/web_api.rb
lib/web_api/auth.rb
lib/web_api/auto.rb
lib/web_api/client.rb
lib/web_api/signed.rb
lib/web_api/signed2.rb
lib/web_api/signet.rb
lib/web_api/version.rb
lib/web_api/web_api.rb
test/web_api.rb
web_api.gemspec
  )

  s.add_development_dependency 'help_parser', '~> 1.2', '>= 1.2.0'
  s.add_development_dependency 'oauth', '~> 0.4', '>= 0.4.7'
  s.add_development_dependency 'signet', '~> 0.6', '>= 0.6.0'
  s.requirements << 'ruby: ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-linux]'

end
