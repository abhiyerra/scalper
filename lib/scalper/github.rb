module Scapler
  class Github
    def self.parse(url)
      if url =~ /github.com\/(.*)\/(.*)\/issues\/(\d+)/
        link_info = {
          :user     => $1,
          :repo     => $2,
          :issue_id => $3,
        }

        url = "https://api.github.com/repos/#{link_info[:user]}/#{link_info[:repo]}/issues/#{link_info[:issue_id]}"
        @request_info ||= JSON.parse(HTTParty.get(url).body)
        puts url
        if @request_info.has_key?('message') && @request_info['message'] =~ /Not Found/ || @request_info['message'] =~ /API Rate Limit Exceeded/
          self.destroy
          raise "Issue doesn't exist"
        end
        @request_info
      else
        raise "Invalid github url"
      end
    end
  end
end
