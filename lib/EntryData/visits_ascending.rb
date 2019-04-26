require "EntryData/base"

module EntryData
  class AscendingVisit < Base

    def call
      grouped_log_entries.sort_by { |_, counter| counter }.each do |url, counter|
        puts "#{url} #{counter} #{message}"
      end
    end

    private

    def message
      "Ascending views"
    end

    def mapper(url, ip)
      [url, ip.size]
    end

  end
end
