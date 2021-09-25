Gem::Specification.new do |s|

  s.name     = 'web_api'
  s.version  = '1.0.210925'

  s.homepage = 'https://github.com/carlosjhr64/web_api'

  s.author   = 'carlosjhr64'
  s.email    = 'carlosjhr64@gmail.com'

  s.date     = '2021-09-25'
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

  s.add_runtime_dependency 'crstruct', '~> 0.1.191207'
  s.requirements << 'ruby: ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-linux]'

end
