# frozen_string_literal: true

module RBUI
  class CommandInput < Base
    def initialize(placeholder: "Type a command or search...", **attrs)
      @placeholder = placeholder
      super(**attrs)
    end

    def view_template
      input_container do
        search_icon
        input(**attrs)
      end
    end

    private

    def search_icon
      svg(
        xmlns: "http://www.w3.org/2000/svg",
        viewbox: "0 0 20 20",
        fill: "currentColor",
        class: "w-4 h-4 mr-1.5"
      ) do |s|
        s.path(
          fill_rule: "evenodd",
          d:
            "M9 3.5a5.5 5.5 0 100 11 5.5 5.5 0 000-11zM2 9a7 7 0 1112.452 4.391l3.328 3.329a.75.75 0 11-1.06 1.06l-3.329-3.328A7 7 0 012 9z",
          clip_rule: "evenodd"
        )
      end
    end

    def input_container(&)
      div(class: "flex items-center border-b px-3", &)
    end

    def default_attrs
      {
        class: "flex h-10 w-full rounded-md bg-transparent py-3 text-sm outline-none placeholder:text-muted-foreground disabled:cursor-not-allowed disabled:opacity-50",
        placeholder: @placeholder,
        data_action: "input->rbui--command#filter keydown.enter->rbui--command#handleKeydown keydown.esc->rbui--command#dismiss",
        # data_action: "input->rbui--command#filter keydown.down->rbui--command#handleKeydown keydown.up->rbui--command#handleKeydown keydown.enter->rbui--command#handleKeydown keydown.esc->rbui--command#dismiss",
        data_rbui__command_target: "input",
        autocomplete: "off",
        autocorrect: "off",
        spellcheck: false,
        autofocus: true,
        aria_autocomplete: "list",
        role: "combobox",
        aria_expanded: true,
        value: ""
      }
    end
  end
end
