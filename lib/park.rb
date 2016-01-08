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
      users['default'] = {
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

  def init_config?
    if File.exist?(Dir.home + "/.park.yml")
      return true
    else
      return false
    end
  end

  # git configs list
  def list_accounts
    config_file = File.open Dir.home + "/.park.yml"
    config = YAML.load(config_file)
    if config.is_a?(Hash) then
      config.each_key do |key|
        puts key
      end
    end
    config_file.close
  end

  def add_account
    if init_config?

      puts "Your name : "
      name = STDIN.gets

      puts "Your email : "
      email = STDIN.gets

      puts "Account name : "
      username = STDIN.gets.chomp

      users_file = File.open Dir.home + "/.park.yml"
      users = YAML.load(users_file)

      users[username] = {
        :name => name,
        :email => email
      }

      File.open(Dir.home + '/.park.yml', 'w') do |f|
        f.write(users.to_yaml)
      end

    else
      puts "first init pars : `pars init`"
    end

  end

  def rm_account(username)
    users_file = File.open Dir.home + "/.park.yml"
    users = YAML.load(users_file)

    users.delete(username)

    File.open(Dir.home + '/.park.yml', 'w') do |f|
      f.write(users.to_yaml)
    end

    puts "#{username} successfully removed."
  end

  def switch_account(username=nil)
  end

end
