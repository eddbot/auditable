# frozen_string_literal: true

require 'logger'

logger ||= Logger.new($stdout)

Auditable = Module.new do
  define_singleton_method :included do |klass|
    klass.define_singleton_method :method_added do |method_name|

      return if method_defined?(:_auditable)

      alias_method :_auditable, method_name

      define_method method_name do
        logger.info(">>> LOGGING ACCESS TO #{method_name} <<<")
        _auditable
      end
    end
  end
end
