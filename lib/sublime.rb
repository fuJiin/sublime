require "json"

class Sublime

  def self.load_path
    File.expand_path(__FILE__ + "/..")
  end

  autoload :Settings, "#{load_path}/sublime/settings"

  module Platform
    autoload :OSX, "#{Sublime.load_path}/sublime/platform/osx"
  end
end

# Load OS specific helpers
#
case RbConfig::CONFIG["host_os"]
when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
  # Windows
when /darwin|mac os/
  Sublime::Settings.send(:extend, Sublime::Platform::OSX)
when /linux/
  # Linux
when /solaris|bsd/
  # Unix
end

