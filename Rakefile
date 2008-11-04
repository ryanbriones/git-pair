require 'rubygems'
require 'rake/gempackagetask'

spec = Gem::Specification.new do |s|
  s.name = 'git-pair'
  s.version = '0.0.3'
  s.summary = 'Simple interface for adding your pair to a commit via git commit --author'
  s.files = FileList['[A-Z]*', 'bin/*', 'lib/**/*']
  s.has_rdoc = false
  s.bindir = 'bin'
  s.executables = ['git-pair']
  s.default_executable = 'git-pair'
  s.author = 'Ryan Carmelo Briones'
  s.email = 'ryan.briones@brionesandco.com'
  s.homepage = 'http://brionesandco.com/ryanbriones'
end

package_task = Rake::GemPackageTask.new(spec) {}

task :build_gemspec do
  File.open("#{spec.name}.gemspec", "w") do |f|
    f.write spec.to_ruby
  end
end

task :default => [:build_gemspec, :gem]
