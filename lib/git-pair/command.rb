require 'optparse'
require 'git-pair/author'
require 'git-pair/commit'

module GitPair
  class Command
    def initialize
      @options = {}
      @sub_command = nil
      @sub_args = []
    end

    def self.run!(argv)
      command = self.new
      command.parse(argv)
      command.run_sub_command
    end

    def run_sub_command
      case @sub_command
      when "show"
        return GitPair::Author.show
      when "add"
        unless @sub_args.length == 2
          puts %Q(Usage: #{$0} add js "John Smith <jsmith@example.com>")
          return 1
        end

        return GitPair::Author.add(@sub_args[0], @sub_args[1], @options)
      when "commit"
        return GitPair::Commit.commit(@options[:message], @sub_args[0])
      else
        puts %Q(Usage: #{$0} show)
        puts %Q(Usage: #{$0} add js "John Smith <jsmith@example.com>")
        puts %Q(Usage: #{$0} commit [pair] [-m <msg>] )
        return 0
      end
    end

    def parse(args)
      OptionParser.new do |opts|
        
        opts.on('-m <msg>') do |m|
          @options[:message] = m
        end

        opts.on('--global') do |g|
          @options[:global] = g
        end

        opts.parse!(args)
        
      end

      @sub_command = args.shift
      @sub_args = args
    end
  end
end
