require_relative 'spec_helper'

describe "Changes to ActionController" do

  let(:controller) { InstanceMethodDummy.new }

  describe "is_tablet_device?" do

    let(:user_agent)      { Object.new }
    let(:expected_result) { Object.new }

    it "should return the result from the tablet module" do
      controller.user_agent = user_agent
      ::MobileFu::Tablet.stubs(:is_a_tablet_device?).with(user_agent).returns expected_result
      controller.is_tablet_device?.must_be_same_as expected_result
    end

  end

end

class InstanceMethodDummy

  include ActionController::MobileFu::InstanceMethods

  attr_accessor :user_agent

  def request
    @request ||= begin
      r = Object.new
      r.stubs(:user_agent).returns user_agent
      r
    end
  end

end

