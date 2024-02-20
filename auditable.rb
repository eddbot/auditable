# frozen_string_literal: true

module Auditable
  def self.included(klass)
    def klass.method_added(method_name)
      super

      return if method_defined?(:_auditable)

      alias_method :_auditable, method_name

      define_method method_name do
        puts ">>> LOGGING ACCESS TO #{method_name} <<<"
        _auditable
      end
    end
  end
end
