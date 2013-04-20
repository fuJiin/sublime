class Sublime

  module Platform

    module OSX

      def sublime_path
        File.expand_path("~/Library/Application Support/Sublime Text 2")
      end

      def self.system_default
        new("#{default_package_path}/Preferences (OSX).sublime-settings")
      end
    end
  end

end