require "checkurl/version"

module Checkurl
  class Error < StandardError; end
  
  class self
    def response_code url
      begin
        url = URI(url.strip)
        response = Net::HTTP.get_response(url)

        return {code: response.code, message: response.message}
      rescue => e
        return "ERROR: #{e}"
      end
    end

    def working? url
      begin
        url = URI(url.strip)
        response = Net::HTTP.get_response(url)
        !%W(4 5).include?(response.code[0]) || response.code.to_i == 403 # 403 - for unauthorized access of resource
      rescue Errno::ENOENT
        false #false if can't find the server
      rescue => e
        false
      end
    end
  end
end
