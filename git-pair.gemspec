Gem::Specification.new do |s|
  s.name = %q{git-pair}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Carmelo Briones"]
  s.date = %q{2008-10-28}
  s.default_executable = %q{git-pair}
  s.email = %q{ryan.briones@brionesandco.com}
  s.executables = ["git-pair"]
  s.files = ["Rakefile", "bin/git-pair", "lib/git-pair", "lib/git-pair/author.rb", "lib/git-pair/command.rb", "lib/git-pair/commit.rb"]
  s.homepage = %q{http://brionesandco.com/ryanbriones}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Simple interface for adding your pair to a commit via git commit --author}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
    else
    end
  else
  end
end
