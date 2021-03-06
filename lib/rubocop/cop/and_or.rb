# encoding: utf-8

module Rubocop
  module Cop
    class AndOr < Cop
      MSG = 'Use %s instead of %s.'

      OPS = { 'and' => '&&', 'or' => '||' }

      def on_and(node)
        process_logical_op(node)

        super
      end

      def on_or(node)
        process_logical_op(node)

        super
      end

      private

      def process_logical_op(node)
        op = node.loc.operator.source
        op_type = node.type.to_s

        if op == op_type
          add_offence(:convention,
                      node.loc.operator,
                      sprintf(MSG, OPS[op], op))
        end
      end
    end
  end
end
