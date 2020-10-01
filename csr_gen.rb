# Creates a CSR and private key for an SSL cert.
class Cert
  def self.details
    @country = 'US'
    puts 'Enter common name (url)'
    @cn = gets.chomp.downcase
    puts 'Is this a cert to an iseatz domain? [y/n]'
    input = gets.chomp.downcase
    if input == 'y'
      @state = 'Louisiana'
      @city = 'New Orleans'
      @org = 'iSeatz'
    else
      puts 'Enter the organization name'
      @org = gets.chomp
      puts 'Enter the state'
      @state = gets.chomp
      puts  'Enter a city'
      @city = gets.chomp
    end
    verify
  end

  def self.verify
    puts 'Is this correct? [y/n]'
    puts "org= #{@org} city= #{@city} state= #{@state} country= #{@country} cn= #{@cn}"
    answer = gets.chomp
    if answer == 'y'
      @filename = @cn.gsub!('*', 'star').gsub!('.', '_')
      system "openssl req -new -newkey rsa:2048 -nodes -out #{@filename}.csr -keyout #{@filename}.key -subj '/C=#{@country}/ST=#{@state}/L=#{@city}/O=#{@org}/CN=#{@cn}'"
    else
      details
    end
  end
end

Cert.details
