require 'spec_helper'
require 'EntryData/visits_ascending.rb'

describe EntryData::AscendingVisit do
  subject { described_class.new(log_entries).call }

  let(:log_entries) do
    [
      { url: "/test", ip: "126.318.035.038" },
      { url: "/test", ip: "126.318.035.039" },
      { url: "/test/1", ip: "126.318.035.038" },
      { url: "/test/1", ip: "126.318.035.038" },
      { url: "/test/2", ip: "126.318.035.038" }
    ]
  end

  let(:expected_message) do
    <<~MSG
      /test/2 1 Ascending views
      /test 2 Ascending views
      /test/1 2 Ascending views
    MSG
  end

  it "prints message" do
    expect { subject }.to output(expected_message).to_stdout
  end
end
