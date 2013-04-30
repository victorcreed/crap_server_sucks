@root = File.expand_path(File.dirname(__FILE__))

run Proc.new { |env|
  path = Rack::Utils.unescape(env['PATH_INFO'])
  
  index_file = @root + "/index.html"
  puts index_file
  if File.exists?(index_file)
    puts "its inside"
    [200, {'Content-Type' => 'text/html'}, [File.read(index_file)]]
  else
    Rack::Directory.new(@root).call(env)
  end
}
