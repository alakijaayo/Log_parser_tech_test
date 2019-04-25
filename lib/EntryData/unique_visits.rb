require "EntryData/base"

module EntryData
  class UniqueVisit < Base
    private

    def message
      "unique views"
    end

    def mapper(url, ip)
      [url, ip.uniq.size]
    end
  end
end
