require 'spec_helper'

module FakeModule; end
class FakeModule::FooTask < Alarmist::Task::Base; end
class FakeModule::FooAlarm < Alarmist::Alarm::Base; end

module AnotherFakeModule; end
class AnotherFakeModule::FooTask < Alarmist::Task::Base; end

RSpec.describe Alarmist::Task::Base do
  describe '#alarm' do
    it "returns the corresponding alarm class if defined" do
      task = FakeModule::FooTask.new
      expect(task.alarm).to be FakeModule::FooAlarm
    end

    it "raises MissingAlarmError if corresponding alarm is not defined" do
      task = AnotherFakeModule::FooTask.new
      expect { task.alarm }.to raise_error { Alarmist::Task::MissingAlarmError }
    end
  end
end
