# when the gem is required, this file is the first one to be required (that has the same name of the gem [test] and is in the lib directory)

require 'ey_balancer/version'
class EyBalancer  
  def self.works?
    true
  end
end