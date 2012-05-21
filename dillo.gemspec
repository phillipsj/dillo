Gem::Specification.new do |s|
  s.name        = "dillo"
  s.version     = "0.1.2"
  s.date        = "2012-05-21"
  s.summary     = "Ruby interface to the City of Austin's Data Portal API"
  s.description = "Dillo is a Ruby module that allows you to easily interact with the City of Austin's Data Portal."

  s.files = ["README.md", "lib/dillo.rb"]

  s.add_dependency "faraday_middleware",    "~> 0.8"
  s.add_dependency "multi_json", "~> 1.0"
  s.add_development_dependency 'rspec', '~> 2.6'
  s.add_development_dependency 'simplecov', '~> 0.4'
  s.add_development_dependency 'webmock', '~> 1.7'

  s.authors  = ["Jamie Phillips"]
  s.email    = ["jamie.phillips@austintexas.gov"]
  s.homepage = "http://github.com/phillipsj/dillo"
end
