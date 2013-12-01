module MobileFu

  module Tablet

    def self.user_agents
      /ipad|android 3.0|xoom|sch-i800|gt-p1000|playbook|tablet|kindle|honeycomb|nexus 7|windows nt [0-9.]+; arm/.freeze
    end

    def self.is_a_tablet_device? user_agent
      !!(user_agent.to_s.downcase =~ ::MobileFu::Tablet.user_agents)
    end

  end

end
