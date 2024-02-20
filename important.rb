# frozen_string_literal: true

require_relative 'auditable'

class Important
  include Auditable

  def vip
    'super secret'
  end
end

class Admin
  include Auditable

  def top_secret
    'even more secret'
  end
end

important = Important.new
p important.vip
# = OUTPUT =
# >>> LOGGING ACCESS TO vip <<<
# "super secret"

admin = Admin.new
p admin.top_secret
# = OUTPUT =
# >>> LOGGING ACCESS TO top_secret <<<
# "even more secret"
