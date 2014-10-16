require 'slim'
require 'sass'
require 'coffee-script'

TITLE = 'd3 app'
JS_FILES = [
  'd3.js'
]

END{
  make if __FILE__ == $0
}

def make
  slim = File.read 'base.slim'
  coffee = File.read 'script.coffee'
  sass = File.read 'style.sass'

  js = CoffeeScript.compile coffee
  css = Sass.compile sass, syntax: :sass

  context = Context.new\
    title: TITLE,
    css: css,
    js: js,
    js_files: JS_FILES

  html = Slim::Template.new { slim }.render context
  
  File.write 'index.html', html
  puts 'updated'
end
 

class Context
  def initialize fields
    fields.each { |name, value|
      define_singleton_method name do value end
    }
  end
end
