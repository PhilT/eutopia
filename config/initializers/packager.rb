def package type, globs, create = true
  compressor = {:javascripts => JSMin, :stylesheets => CSSMin}[type]
  extension = {:javascripts => 'js', :stylesheets => 'css'}[type]
  include_method = {:javascripts => 'javascript_include_tag', :stylesheets => 'stylesheet_link_tag'}[type]
  raise "package type unknown. Only :javascripts or :stylesheets supported." unless compressor && extension && include_method
  package_name = "packaged.#{extension}"

  file = File.open(File.join(Rails.root, 'public', 'assets', package_name), 'w') if (compress? && create)
  globs.each do |glob|
    Dir.glob(File.join(Rails.root, 'public', type.to_s, glob)).each do |path|
      if compress? && create
        file.puts(compressor.minify(File.open(path)))
      elsif !create
        send(include_method, File.join(type.to_s, path))
      end
    end
  end
  file.close if file
  send include_method, File.join('/assets', package_name) if compress? && !create
end

def compress?
  !%w(development test).include?(Rails.env)
end

def include_stylesheets create = false
  package :stylesheets, %w(lib/jquery_ui/redmond/*.css lib/*.css *.css), create
end

def include_javascripts create = false
  package :javascripts, %w(lib/jquery.js lib/jquery_ui/*.js lib/*.js *.js), create
end

puts 'Compressing assets...' if compress?
include_stylesheets true
include_javascripts true
puts 'Finished compressing assets.' if compress?

