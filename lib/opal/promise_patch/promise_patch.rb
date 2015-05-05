if RUBY_PLATFORM == 'opal'
  require 'promise'
else
  # Opal doesn't expose its promise library directly
  # gem_dir = Gem::Specification.find_by_name('opal').gem_dir
  require 'opal'

  gem_dir = File.join(Opal.gem_dir, '..')
  require(gem_dir + '/stdlib/promise')

  Opal.append_path File.expand_path('../../..', __FILE__).untaint
end

class Promise
  def method_missing(method_name, *args, &block)
    self.then do |result|
      result.send(method_name.to_sym, *args, &block)
    end.fail do |error|
      raise error
    end
  end
end

class Object
  def to_promise
    Promise.new.resolve(self)
  end
end
