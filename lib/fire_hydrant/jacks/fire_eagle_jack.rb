class FireEagleJack
  def self.connect(switchboard, settings)
    switchboard.plug!(AutoAcceptJack, NotifyJack, PubSubJack)

    switchboard.on_pubsub_event do |event|
      event.payload.each do |payload|
        payload.elements.each do |item|
          rsp = item.first_element("rsp")
          response = FireEagle::Response.new(rsp.to_s)
          user = response.users[0]
          on(:location_update, user)
        end
      end
    end

    def switchboard.on_location_update(&block)
      register_hook(:location_update, &block)
    end
  end
end
