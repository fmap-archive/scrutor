class Search
  include DataMapper::Resource
  
  property :id, Serial
  property :input, String
  property :created_at, DateTime, :default => Time.now

  def url 
    if input =~ %r"^(https?|ftp|file)://"
      return input.chomp
    else
      words = input.split(' ')
      words.unshift('!ddg') unless engines.has_key?(words.first)
      return engines[words.shift] + CGI::escape(words.join ?\s)
    end
  end

  private

  def engines
    TOML.load_file("#{API_ROOT}/config/engines.toml")
  end
end
