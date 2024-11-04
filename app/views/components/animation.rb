# frozen_string_literal: true

class Animation < Components::Base
  def initialize(path:, options: {}, delay: 0, **attrs)
    @path = path
    @options = options.to_json
    @delay = delay
    @attrs = attrs
  end

  def view_template(&)
    div(data_controller: "lottie", data_lottie_path_value: @path, data_lottie_options_value: @options, data_lottie_delay_value: @delay, **@attrs, &)
  end
end
