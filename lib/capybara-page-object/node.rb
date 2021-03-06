require 'capybara-page-object/delegators'


module CapybaraPageObject
  class Node
    include Delegators

    attr_accessor :source

    def initialize(source=nil)
      @source = source
    end

    def self.from_string(string, target)
      new(Capybara.string(string).find(target))
    end

    def classes
      classes_list = source[:class] or return []
      classes_list.split(' ')
    end

    def source
      @source ||= Capybara.current_session
    end

    def self.element(name, &block)
      define_method(name, &block)
    end

    def self.field(name, &block)
      define_method(name, &block)
    end
  end
end
