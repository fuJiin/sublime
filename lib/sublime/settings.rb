class Sublime

  class Settings < Hash

    attr_reader :filepath, :file

    def initialize(filepath = nil)
      if filepath
        @filepath = File.expand_path(filepath)
        @file     = File.open(@filepath, "r")
        self.merge! JSON.parse(file.read)
      end
    end

    def full_configs
      klass = self.class
      klass.default.
        merge(klass.system_default).
        merge(self)
    end

    def write!
      user = self.class.user
      user = self # transfer data
      user.save!
    end

    def save!
      File.open @filepath, "w+" do |file|
        file.puts JSON.pretty_generate(self)
      end
    end

    def update!(conf = {})
      merge!(conf)
      save!
    end

    class << self

      def default
        new("#{default_package_path}/.sublime-settings")
      end

      def user
        new("#{user_package_path}/Preferences.sublime-settings")
      end

      # Paths
      # ===== #

      def default_package_path
        "#{sublime_path}/Packages/Default"
      end

      def user_package_path
        "#{sublime_path}/Packages/User"
      end
    end
  end

end