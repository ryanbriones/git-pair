module GitPair
  class Author
    def self.add(abbr, email, options = {})
      base_command = "git config"
      
      args = []
      args << "--global" if options[:global]
      args << "git-pair.authors.#{abbr}"
      args << %Q("#{email}")

      command = "#{base_command} #{args.join(' ')}"
      system(command)
      return $?
    end

    def self.show
      author_regex = /^git-pair.authors.([^=]+)=(.+)$/
      authors = `git config --list | grep 'git-pair.authors'`
      
      puts "Authors"
      puts "========"

      authors.each_line do |line|
        line =~ author_regex
        puts "#{$1} - #{$2}"
      end
      return 0
    end

    def self.find_by_abbr(pair_abbr)
      pair = `git config git-pair.authors.#{pair_abbr}`.chomp
      return pair unless pair.empty?
    end
  end
end
