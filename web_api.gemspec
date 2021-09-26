Gem::Specification.new do |s|

  s.name     = 'web_api'
  s.version  = '1.0.210926'

  s.homepage = 'https://github.com/carlosjhr64/web_api'

  s.author   = 'CarlosJHR64'
  s.email    = 'carlosjhr64@gmail.com'

  s.date     = '2021-09-26'
  s.licenses = ['MIT']

  s.description = <<DESCRIPTION
Ruby library for web api's.
DESCRIPTION

  s.summary = <<SUMMARY
Ruby library for web api's.
SUMMARY

  s.require_paths = ['lib']
  s.files = %w(
README.md
lib/web_api.rb
lib/web_api/web_api.rb
lib/web_api/web_api_method.rb
  )

  s.add_runtime_dependency 'crstruct', '~> 0.1.210920'
  s.requirements << 'ruby: ruby 3.0.2p107 (2021-09-01 revision 0db68f0233) [x86_64-linux]'

end
