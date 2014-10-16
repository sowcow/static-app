require 'listen'
require_relative 'make'

files = [
  '.',
  { ignore: /index.html/ }
]

listener = Listen.to *files do
  make
end
END{
  listener.start
  sleep
}
