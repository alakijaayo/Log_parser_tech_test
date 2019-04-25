require "EntryData/base"

module EntryData
  class Visit < Base
    private

    def message
      "visits"
    end

    def mapper(url, ip)
      [url, ip.size]
    end
  end
end
