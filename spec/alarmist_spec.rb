RSpec.describe Alarmist do
  it "has a version number" do
    expect(Alarmist::VERSION).not_to be nil
  end

  describe ".configure" do
    it "yields a config object to be set" do
      expect { |b| Alarmist.configure(&b) }.to yield_with_args(Alarmist::Config)
    end
  end

  describe ".playbook_path" do
    it "returns the config objects playbook_path" do
      Alarmist.configure do |config|
        config.playbook_path = "some_path"
      end

      expect(Alarmist.playbook_path).to eq("some_path")
    end
  end
end
