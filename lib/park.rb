require 'yaml'

module Park

  # return current git config
  def current_config
    system 'git config -l --global'
  end

  # init config file
  def init_config
    if !File.exist?(Dir.home + "/.park.yml")
      system 'touch ~/.park.yml'
      put users.to_yml
    else
      puts "config file already exists."
    end
  end

  # git configs list
  def list_accounts
    config_file = File.open Dir.home + "/.park.yml"
    config = YAML.load(config_file)
    puts config
    config_file.close
  end

  def add_account
  end

  def switch_account(username=nil)
  end

end
