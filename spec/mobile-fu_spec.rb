require_relative 'spec_helper'

describe "Changes to ActionController" do

  let(:controller) { InstanceMethodDummy.new }

  [
    ["xxx",  false],
    ["IPad", true],
    ["Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; ARM; Trident/6.0; Touch)", true]
  ].each do |example|

    describe "is_tablet_device?" do

      it "should return the expected result" do
        controller.user_agent = example[0]
        controller.is_tablet_device?.must_equal example[1]
      end

    end

  end

end

class InstanceMethodDummy

  include ActionController::MobileFu::InstanceMethods

  attr_accessor :user_agent

  def request
    unless @request
      @request = Object.new
      @request.stubs(:user_agent).returns user_agent
    end
    @request
  end

end

