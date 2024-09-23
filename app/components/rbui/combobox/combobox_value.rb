# frozen_string_literal: true

module RBUI
  class ComboboxValue < Base
    def initialize(placeholder: nil, **attrs)
      @placeholder = placeholder
      super(**attrs)
    end

    def view_template(&block)
      span(**attrs) do
        block ? block.call : @placeholder
      end
    end

    private

    def default_attrs
      {
        data: {
          rbui__combobox_target: "value"
        },
        class: "pointer-events-none"
      }
    end
  end
end
