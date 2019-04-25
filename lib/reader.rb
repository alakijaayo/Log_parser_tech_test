class Reader
  attr_reader :file_path, :entries

  def initialize(file_path)
    @file_path = file_path
    @entries = []
  end

  def call
    with_file do |line|
      url, ip = line.split
      @entries << { url: url, ip: ip }
    end
  end

  private

  def with_file
    File.open(file_path, 'r') do |file|
      while (line = file.gets)
        yield line
      end
    end
  end
end
