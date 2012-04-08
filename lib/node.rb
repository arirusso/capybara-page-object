require 'collections'
require 'key_value'
require 'html5_data'
require 'delegators'

module CapybaraPageObject
  class Node < Capybara::Node::Element
    include Delegators
    include CapybaraPageObject::Collections
    include CapybaraPageObject::HTML5Data

    attr_accessor :source

    def initialize(source=nil)
      source ||= Capybara.current_session
      @source = source
    end

    def self.from_string(string, target)
      new(Capybara.string(string).find(target))
    end

    def classes
      classes_list = source[:class] or return []
      classes_list.split(' ')
    end
  end

  class MissingPath < RuntimeError
  end
end
