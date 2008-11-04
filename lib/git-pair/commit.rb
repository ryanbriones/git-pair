require 'git-pair/author'

module GitPair
  class Commit
    def self.commit(pair_abbr, git_args)
      command = "git commit"

      author = GitPair::Author.find_by_abbr(pair_abbr)

      command << %Q( --author="#{author}") if author
      command << " #{git_args}" if git_args && git_args != ""
      
      system(command)
      return $?
    end
  end
end
