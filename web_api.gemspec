Gem::Specification.new do |s|

  s.name     = 'web_api'
  s.version  = '1.0.221219'

  s.homepage = 'https://github.com/carlosjhr64/web_api'

  s.author   = 'CarlosJHR64'
  s.email    = 'carlosjhr64@gmail.com'

  s.date     = '2022-12-19'
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

  s.add_runtime_dependency 'crstruct', '~> 1.0', '>= 1.0.221218'
  s.requirements << 'ruby: ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [aarch64-linux]'

end
