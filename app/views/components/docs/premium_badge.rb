# frozen_string_literal: true

class Docs::PremiumBadge < ApplicationComponent
    def template
        render Badge.new(variant: :violet) do
            svg(
                xmlns: "http://www.w3.org/2000/svg",
                viewbox: "0 0 24 24",
                fill: "currentColor",
                class: "w-3 h-3 mr-1"
            ) do |s|
                s.path(
                    fill_rule: "evenodd",
                    d:
                    "M12 1.5a5.25 5.25 0 00-5.25 5.25v3a3 3 0 00-3 3v6.75a3 3 0 003 3h10.5a3 3 0 003-3v-6.75a3 3 0 00-3-3v-3c0-2.9-2.35-5.25-5.25-5.25zm3.75 8.25v-3a3.75 3.75 0 10-7.5 0v3h7.5z",
                    clip_rule: "evenodd"
                )
            end
            plain "Premium"
        end
    end
end