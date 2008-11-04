require 'optparse'
require 'git-pair/author'
require 'git-pair/commit'

module GitPair
  class Command
    def initialize
      @options = {:passthru => []}
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
          puts %Q(Usage: #{$0} add [--global] js "John Smith <jsmith@example.com>")
          return 1
        end

        return GitPair::Author.add(@sub_args[0], @sub_args[1], @options)
      when "commit"
        pair_abbr = @sub_args.shift
        passthru = "#{@options[:passthru].join(' ')} -- #{@sub_args.join(' ')}"
        
        return GitPair::Commit.commit(pair_abbr, passthru)
      else
        puts %Q(Usage: #{$0} show)
        puts %Q(Usage: #{$0} add [--global] js "John Smith <jsmith@example.com>")
        puts %Q(Usage: #{$0} commit [pair] [git_options])
        return 0
      end
    end

    def parse(args)
      OptionParser.new do |opts|
        
        opts.on('--global') do |g|
          @options[:global] = g
        end

        # git commit options
        opts.on('-a', '--all') { |a| @options[:passthru] << "-a"}
        opts.on('-C <commit>', '--reuse-message=<commit>') { |c| @options[:passthru] << "-C #{c}" }
        opts.on('-c <commit>', '--reedit-message=<commit>') { |c| @options[:passthru] << "-c #{c}" }
        opts.on('-F <file>', '--file=<file>') { |f| @options[:passthru] << %Q(-F "#{f}") }
        opts.on('-m <msg>', '--message=<msg>') { |m| @options[:passthru] << %Q(-m "#{m}") }
        opts.on('-t <file>', '--template=<file>') { |t| @options[:passthru] <<  %Q(-t "#{t}") }
        opts.on('-s', '--signoff') { |s| @options[:passthru] << "-s" }
        opts.on('-n', '--no-verify') { |n| @options[:passthru] << "-n" }
        opts.on('--allow-empty') { |ae| @options[:passthru] << "--allow-empty" }
        opts.on('--cleanup=<mode>') { |cl| @options[:passthru] << "-cleanup=#{cl}" }
        opts.on('-e', '--edit') { |e| @options[:passthru] << "-e" }
        opts.on('--amend') { |am| @options[:passthru] << "--amend" }
        opts.on('-i', '--include') { |i| @options[:passthru] << "-i" }
        opts.on('-o', '--only') { |o| @options[:passthru] << "-o" }
        opts.on('-u[<mode>]', '--untracked-files[=<mode>]') { |u| @options[:passthru] << "-u#{u}" }
        opts.on('-v', '--verbose') { |v| @options[:passthru] << "-v" }
        opts.on('-q', '--quiet') { |q| @options[:passthru] << "-q" }

        opts.parse!(args)
        
      end

      @sub_command = args.shift
      @sub_args = args
    end
  end
end
