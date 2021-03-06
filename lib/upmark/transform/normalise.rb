module Upmark
  module Transform
    # A transform class withich normalises start/end/empty tags into the
    # same structure.
    class Normalise < Parslet::Transform

      rule(element: subtree(:invalid)) do
        raise Upmark::ParseFailed.new('Invalid parse result', nil)
      end

      # Strip empty tags
      rule(empty: subtree(:invalid)) do
        ' '
      end

      rule(
        element: {
          start_tag: {name: simple(:name), attributes: subtree(:attributes)},
          end_tag:   {name: simple(:end_tag_name)},
          children:  subtree(:children)
        }
      ) do
        unless name == end_tag_name
          raise Upmark::ParseFailed.new('Mismatched tags', nil)
        end
        {
          element: {
            name:       name,
            attributes: attributes,
            children:   children,
            ignore:     false
          }
        }
      end

      rule(
        element: {
          empty_tag: { name: simple(:name) }
        }
      ) do
        {
          element: {
            name:       name,
            attributes: [],
            children:   [],
            ignore:     false
          }
        }
      end

      rule(
        element: {
          empty_tag: {name: simple(:name), attributes: subtree(:attributes)}
        }
      ) do
        {
          element: {
            name:       name,
            attributes: attributes,
            children:   [],
            ignore:     false
          }
        }
      end

    end
  end
end
