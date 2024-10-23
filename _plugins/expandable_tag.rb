# _plugins/expandable_tag.rb
module Jekyll

    class ExpandableTag < Liquid::Block
  
      def initialize(tag_name, markup, tokens)
        super
        # Parse named arguments
        @args = {}
        markup.split(' ').each do |arg|
            key, value = arg.split('=')
            if value
                @args[key] = value.gsub(/^['"]|['"]$/, '') # Remove surrounding quotes
            end
        end
      end

      def generate_random_id(length = 8)
        characters = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
        Array.new(length) { characters.sample }.join
      end
  
      def render(context)

        # Capture the content between the custom tags
        content = super

        # Get the Markdown converter from Jekyll's site context
        converter = context.registers[:site].find_converter_instance(Jekyll::Converters::Markdown)

        # Convert the captured content from Markdown to HTML
        rendered_content = converter.convert(content)

        # Generate target id:
        target = "panel_#{generate_random_id}"

        # Extract the first heading (assuming it's a <h1>, <h2>, <h3>, etc.)
        heading_match = rendered_content.match(/<h[1-6][^>]*>(.*?)<\/h[1-6]>/)

        if heading_match
            # Remove the first heading from the rendered content
            rendered_content = rendered_content.sub(heading_match[0], '')
            heading = heading_match[0].gsub(/<\/h[1-6]>/, "</h#{heading_match[0][2]}>")
            heading_match = heading.sub(/<h[1-6]/, "<h#{heading_match[0][2]} onclick='toggleExpandable(this)' style='cursor: pointer;' target-panel='##{target}'")
        end

        is_expanded = @args['expanded'] == "true" ? true : false
        display = is_expanded ? "display: block;" : "display: none;"
        icon = is_expanded ? "<i class='fa-solid fa-angle-down'></i>" : "<i class='fa-solid fa-angle-right'></i>"
  
        # Wrap the content in a div with a button for expand/collapse functionality
        # Escape the HTML output to prevent Liquid from rendering it as code
        return "<div class='expandable-section'>
            <div class='toggle-header'>

                <button class='toggle-button' 
                    target-panel='##{target}'
                    onclick='toggleExpandable(this)'
                    >#{icon}</button>

                #{heading_match}
            </div>
            <div class='expandable-content' 
                style='#{display}'
                id='#{target}'
                >#{rendered_content}</div>
        </div>"
      end
    end
  end
  
  Liquid::Template.register_tag('expandable', Jekyll::ExpandableTag)
