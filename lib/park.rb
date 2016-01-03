require 'yaml'

module Park
  # return current git config
  def current
    system 'git config -l'
  end

  # init config file
  def init
    system 'touch ~/.park.yml'
  end

  # git configs list
  def list
    config_file = File.open Dir.home + "/.park.yml"
    config = YAML.load(config_file)
    puts config
    config_file.close
  end


end
