module Admino
  module Table
    class Row
      attr_reader :view_context

      alias_method :h, :view_context

      def initialize(view_context)
        @view_context = view_context
      end

      def parse_column_args(args)
        html_options = args.extract_options!

        attribute_name = if args.first.is_a?(Symbol)
                           args.shift
                         else
                           nil
                         end

        label = if args.first.is_a?(String) || args.first.is_a?(Symbol)
                  args.shift
                else
                  nil
                end

        [attribute_name, label, html_options]
      end

      def parse_action_args(args)
        html_options = args.extract_options!

        action_name = if args.first.is_a?(Symbol)
                        args.shift
                      else
                        nil
                      end

        url = if args.first.is_a?(String)
                  args.shift
                else
                  nil
                end

        label = args.shift

        [action_name, url, label, html_options]
      end

      def to_html
        nil
      end
    end
  end
end

