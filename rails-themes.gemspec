Gem::Specification.new do |s|
  s.name = 'rails-themes'
  s.version = '1.0.0'
  s.author = 'Francesc Esplugas'
  s.email = 'contact@francescesplugas.com'
  s.summary = 'Macros to have themes on Rails applications'

  s.add_dependency('rails', '>= 3.0.0')

  s.files = Dir['lib/**/*']
  s.require_path = 'lib'
end
