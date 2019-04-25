require 'spec_helper'
require 'reader'

describe Reader do
  subject { described_class.new(file_path) }

  context "when file exists" do
    let(:file_path) { "spec/fixtures/20_lines.log" }

    before { subject.call }

    it "reads ten log entries" do
      expect(subject.entries.count).to eq 20
    end
  end

  context "when file does not exist" do
    let(:file_path) { "spec/fixtures/new_file.log" }

    it "raises an error message" do
      expect { subject.call }.to raise_error(Errno::ENOENT)
    end
  end
end
