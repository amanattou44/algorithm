(ip_address, log_format, *apache_logs) = ARGF.readlines.map(&:chomp)

class ApacheLogs
  def initialize(search_ip = "", address = "", ident_user = "", user = "", access = "", request = "", status_code = 400, byte = 0, url = "", user_agent = "")
    @search_ip = search_ip
    @address = address
    @ident_user = ident_user
    @user = user
    @access = access
    @request = request
    @status_code = status_code
    @byte = byte
    @url = url
    @user_agent = user_agent
  end
  #attr_accessor :address, :user, :access, :request, :status_code, :byte, :url, :user_agent
  
  def parse(logs)
    logs.map do |log|
      (@address, _) = log.split(" - -")
      if self.match @address
        (_, @idennt_user, _) = log.split(" ")
        (_, _, @user, _) = log.split(" ")
        (@access, _) = log[log.index("[")..log.index("]")].split(" ")
        (_, @access) = @access.split("[")
        (_, @request) = log.split("\"")
        (_, @request) = @request.split(" ")
        (_, _, @status_code) = log.split("\"")
        (@status_code, @byte) = @status_code.split(" ")
        (_, _, _, @url) = log.split("\"")
        (_, _, _, _, _, @user_agent) = log.split("\"")
        self.output
      end
    end
  end

  def match(ip)
    (_, _, search_three_octet, search_four_octet) = @search_ip.split(".")
    (_, _, three_octet, four_octet) = @address.split(".")
    if search_three_octet.class == Regexp
      regex_three = search_three_octet
    elsif search_three_octet == "*"
      regex_three = Regexp.new ".*"
    elsif search_three_octet[search_three_octet.index("[")..search_three_octet.index("]")].length > 5
      front = search_three_octet[search_three_octet.index("[")..search_three_octet.index("-")].gsub(/\[(.*)\-/, '\1').to_i
      back = search_three_octet[search_three_octet.index("-")..search_three_octet.index("]")].gsub(/\-(.*)\]/, '\1').to_i
      if three_octet.to_i >= front && three_octet.to_i <= back
        regex_three = Regexp.new three_octet
      else
        regex_three = Regexp.new " "
      end
    else
      regex_three = Regexp.new search_three_octet
    end
    if search_four_octet.class == Regexp
      regex_four = search_four_octet
    elsif search_four_octet == "*"
      regex_four = Regexp.new ".*"
    elsif search_four_octet[search_four_octet.index("[")..search_four_octet.index("]")].length > 5
      regex_four = Regexp.new "[0-9]*"
    else
      regex_four = Regexp.new search_four_octet
    end
    if three_octet.match regex_three
      if four_octet.match regex_four
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def output
    p "#{@address} #{@access} #{@request}"
  end
end

b = ApacheLogs.new ip_address
b.parse apache_logs
