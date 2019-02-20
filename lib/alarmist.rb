require "alarmist/version"
require "alarmist/task/base"
require "alarmist/alarm/base"
require "alarmist/config"
require "active_support/core_ext/string"

module Alarmist
  def self.configure(&block)
    @config = Alarmist::Config.new
    instance_exec(@config, &block)
  end

  def self.playbook_path
    @config.playbook_path
  end
end
