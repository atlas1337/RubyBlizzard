Gem::Specification.new do |s|
  s.name        = 'ruby_blizzard'
  s.version     = '0.0.1'
  s.date        =  Date.today.to_s
  s.summary     = 'An API for Battle.net'
  s.description = 'An API for Battle.net'
  s.authors     = ['atlas1337']
  s.email       = 'atlas1337@gmail.com'
  s.files       = Dir.glob("{lib}/**/*")
  s.homepage    =
    'http://rubygems.org/gems/ruby_blizzard'
  s.license       = 'GPL-3.0'

  s.add_dependency('json')
  s.add_dependency('nokogiri')
  s.add_dependency('rest-client')
end
