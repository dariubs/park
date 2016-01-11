module Park

  class Config

    class << self

      def open
        config_file = File.open Dir.home + "/.park.yml"
        config = YAML.load(config_file)
      end

      def close
        config_file.close
      end

    end

  end

end
