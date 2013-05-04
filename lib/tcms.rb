
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
require "xmlrpc/client"
require 'debugger'


class Tcms
  def initialize
    XMLRPC::Config.module_eval { # avoid "RuntimeError: wrong/unknown XML-RPC type 'nil'" using Ruby 1.9
        remove_const(:ENABLE_NIL_PARSER)
        const_set(:ENABLE_NIL_PARSER, true)
    }
    @server = XMLRPC::Client.new("tcms.engineering.redhat.com", "/xmlrpc/",443, nil, nil,'-----', '------', true,nil)
    @server.instance_variable_get(:@http).instance_variable_set(:@verify_mode, OpenSSL::SSL::VERIFY_NONE)
  end


  def get_test_cases(testplan)
    #"7332"
    @server.call("TestPlan.get_test_cases", testplan)
  end
end

tcms = Tcms.new
puts tcms.get_test_cases('7332')

