require 'yaml'
require 'git'

module Park

  # return current git config
  def current_config
    system 'git config -l --global'
  end

  # init config file
  def init_config
    begin
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
    rescue
      $stderr.puts "An error occured."
    end
  end

  # Check if config inited
  def init_config?
    if File.exist?(Dir.home + "/.park.yml")
      return true
    else
      return false
    end
  end

  # Check if config inited
  def inited
    if !init_config? then
      $stderr.puts 'park not initialized'
      return false
    else
      return true
    end
  end

  # git configs list
  def list_accounts
    return 0 if !inited

    config_file = File.open Dir.home + "/.park.yml"
    config = YAML.load(config_file)
    if config.is_a?(Hash) then
      config.each_key do |key|
        puts key
      end
    end
    config_file.close
  end

  # Add new git account to .park.yml
  def add_account
    return 0 if !inited

    # Get data from user based on defined options
    opts = ["name","email"]

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

  end

  # Remove an account information from .park.yml
  def rm_account(username)
    return 0 if !inited

    users_file = File.open Dir.home + "/.park.yml"
    users = YAML.load(users_file)

    if users[username] then
      users.delete(username)

      File.open(Dir.home + '/.park.yml', 'w') do |f|
        f.write(users.to_yaml)
      end

      puts "#{username} successfully removed."
    else
      puts "#{username} not exists."
    end
  end

  # Switch active git account
  def switch_account(username=nil)
    return 0 if !inited


  end

end
