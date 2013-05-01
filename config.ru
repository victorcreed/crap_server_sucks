require "open-uri"
@root = File.expand_path(File.dirname(__FILE__))

run Proc.new { |env|
  path = Rack::Utils.unescape(env['PATH_INFO'])
  
  index_file = @root + "/index.html"
  puts index_file
  if File.exists?(index_file)
    puts "its inside"
    page = open("http://google.com")
    content  = page.read.gsub!("google", "haji macchooo")
    [200, {'Content-Type' => 'text/html'}, [content]]
  else
    Rack::Directory.new(@root).call(env)
  end
}
