# frozen_string_literal: true

class Components::Base < Phlex::HTML
  TAILWIND_MERGER = ::TailwindMerge::Merger.new.freeze unless defined?(TAILWIND_MERGER)

  attr_reader :attrs

  def initialize(**user_attrs)
    @attrs = mix(default_attrs, user_attrs)
    @attrs[:class] = TAILWIND_MERGER.merge(@attrs[:class]) if @attrs[:class]
  end

  if defined?(Rails) && Rails.env.development?
    def before_template
      comment { "Before #{self.class.name}" }
      super
    end
  end

  private

  def default_attrs
    {}
  end
end
