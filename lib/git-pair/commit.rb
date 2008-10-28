require 'git-pair/author'

module GitPair
  class Commit
    def self.commit(message, pair_abbr)
      base_command = "git commit"

      author = GitPair::Author.find_by_abbr(pair_abbr)
      
      args = []
      args << %Q(-m "#{message}") unless message.nil? || message.empty?
      args << %Q(--author="#{author}") if author

      command = "#{base_command} #{args.join(' ')}"
      system(command)
      return $?
    end
  end
end
