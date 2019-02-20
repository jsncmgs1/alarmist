module Alarmist
  module Task
    class MissingAlarmError < StandardError; end

    class Base
      def run
        raise 'not implemented'
      end

      def alarm
        @alarm ||= Object.const_get("#{self.class.name.gsub('Task', 'Alarm')}")
      rescue NameError
        raise MissingAlarmError, "#{self.class.name} has no corresponding Alarm."
      end
    end
  end
end
