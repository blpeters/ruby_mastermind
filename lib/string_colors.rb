# frozen_string_literal: true

module StringColors
  RGB_COLOR_MAP = {
    red: '255;85;85',
    orange: '224;170;0',
    yellow: '221;255;51',
    green: '80;250;123',
    blue: '130;220;255',
    violet: '255;10;255',
    white: '10;10;10;'
  }.freeze

  refine String do
    def string_color(color)
      rbg_color = RGB_COLOR_MAP[color]
      "\e[38;2;#{rbg_color}m#{self}\e[0m"
    end

    def background_color(color)
      rbg_color = RGB_COLOR_MAP[color]
      "\e[48;2;#{rbg_color}m#{self}\e[0m"
    end
  end
end