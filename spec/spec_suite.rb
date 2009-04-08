class SpecSuite
  class << self
    def all
      core
      rails
    end

    def core
      run Dir["#{dir}/{erect,erector}/**/*_spec.rb"]
    end

    def rails
      supported_rails_versions.keys.sort.reverse.each do |version|
        run_with_rails(version)
      end
    end

    private

    def run_with_rails(version)
      puts "Running rails_spec_suite for Rails version #{version}"

      symlink_config(version)
      symlink_vendor_rails(version)

      ENV['RAILS_SUITE_VERSION'] = version
      require File.join(dir, "rails", "application", "spec", "suite")
    end

    def symlink_config(version)
      system "rm -rf #{dir}/rails/application/config && cp -r #{dir}/rails/dependencies/config/#{version} #{dir}/rails/application/config"
    end
    
    def symlink_vendor_rails(version)
      system "cd #{dir}/rails/application/vendor && ln -nfs ../../dependencies/rails/#{version} rails"
    end

    def supported_rails_versions
      {
        "1.99.0" => {'version' => '1.99.0', 'git_tag' => 'v2.0.0_RC1'},
        "2.0.2" => {'version' => '2.0.2', 'git_tag' => 'v2.0.2'},
        "2.1.0" => {'version' => '2.1.0', 'git_tag' => 'v2.1.0'},
        "2.2.0" => {'version' => '2.2.0', 'git_tag' => 'v2.2.0'},
        "2.2.2" => {'version' => '2.2.2', 'git_tag' => 'v2.2.2'},
        "2.3.2" => {'version' => '2.3.2', 'git_tag' => 'v2.3.2'},
        # "edge" => {'version' => 'edge', 'git_tag' => 'master'}, #TODO: Readd edge support
      }
    end

    def run(files)
      files.each do |file|
        require file
      end
    end

    def dir
      File.dirname(__FILE__)
    end
  end
end

if $0 == __FILE__
  SpecSuite.all
end