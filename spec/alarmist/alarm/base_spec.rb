module FakeModule; end
module AnotherFakeModule; end
class FakeModule::FooAlarm < Alarmist::Alarm::Base; end
class AnotherFakeModule::BarAlarm < Alarmist::Alarm::Base; end

RSpec.describe Alarmist::Alarm::Base do
  before do
    Alarmist.configure {|config| config.playbook_path = "./spec/playbooks" }
  end

  describe "#playbook_exists?" do
    it "raises an error if the playbook is missing" do
      alarm = AnotherFakeModule::BarAlarm.new
      expect { alarm.playbook_exists? }.to raise_error { Alarmist::Alarm::Base::MissingPlaybookError }
    end

    it "returns true if the playbook exists somewhere in the playbooth_path" do
      alarm = FakeModule::FooAlarm.new
      expect(alarm.playbook_exists?).to be(true)
    end
  end
end
