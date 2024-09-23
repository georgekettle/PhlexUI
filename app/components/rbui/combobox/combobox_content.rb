# frozen_string_literal: true

module RBUI
  class ComboboxContent < Base
    def initialize(**attrs)
      @id = "content#{SecureRandom.hex(4)}"
      super
    end

    def view_template(&)
      div(**attrs) do
        div(class: "min-w-max max-h-[300px] overflow-y-auto overflow-x-hidden rounded-md border bg-popover text-popover-foreground shadow-md outline-none animate-out group-data-[rbui--combobox-open-value=true]/combobox:animate-in fade-out-0 group-data-[rbui--combobox-open-value=true]/combobox:fade-in-0 zoom-out-95 group-data-[rbui--combobox-open-value=true]/combobox:zoom-in-95 slide-in-from-top-2", &)
      end
    end

    private

    def default_attrs
      {
        id: @id,
        role: "listbox",
        data: {
          controller: "rbui--combobox-content",
          rbui__combobox_target: "content",
          action: "keydown.enter->rbui--combobox#onKeyEnter keydown.esc->rbui--combobox#onEscKey keydown.down->rbui--combobox#onKeyDown keydown.up->rbui--combobox#onKeyUp"
        },
        class: "combobox-content hidden w-full absolute top-0 left-0 z-50"
      }
    end
  end
end
