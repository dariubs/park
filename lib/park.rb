require 'yaml'
require 'git'

module Park

  # return current git config
  def current_config
    system 'git config -l --global'
  end

  # init config file
  def init_config
    if !File.exist?(Dir.home + "/.park.yml")
      system 'touch ~/.park.yml'

      g = Git.open(Dir.pwd)

      users = {}
      users[:default] = {
        :name => g.config('user.name'),
        :email => g.config('user.email')
      }

      File.open(Dir.home + '/.park.yml', 'w') do |f|
        f.write(users.to_yaml)
      end
    else
      puts "config file already exists."
    end
  end

  # git configs list
  def list_accounts
    config_file = File.open Dir.home + "/.park.yml"
    config = YAML.load(config_file)
    if config.is_a?(Hash) then
      config.each_pair do |key, value|
        puts key
      end
    end
    config_file.close
  end

  def add_account
  end

  def switch_account(username=nil)
  end

end
