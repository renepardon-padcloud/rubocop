# encoding: utf-8

module Rubocop
  module Cop
    class TrailingWhitespace < Cop
      MSG = 'Trailing whitespace detected.'

      def inspect(source, tokens, ast, comments)
        source.each_with_index do |line, index|
          if line =~ /.*[ \t]+$/
            add_offence(:convention,
                        Location.new(index + 1, line.rstrip.length),
                        MSG)
          end
        end
      end
    end
  end
end
