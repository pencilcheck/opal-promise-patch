require 'opal'
require 'promise'

class Promise
  def method_missing(method_name, *args, &block)
    self.then do |result|
      result.send(method_name.to_sym, *args, &block)
    end.fail do |error|
      raise error
    end
  end
end
