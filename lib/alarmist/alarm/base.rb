module Alarmist
  module Alarm
    class Base
      class MissingPlaybookError < StandardError; end

      # Given the class SomeModule::FooAlarm, looks for some_module/foo_playbook.md
      # within the playbook dir specified during config.
      def playbook_exists?
        maybe_playbook_path = self.class.name.underscore.gsub("alarm", "playbook.md")
        File.file?(File.join(Alarmist.playbook_path, maybe_playbook_path))
      end
    end
  end
end
