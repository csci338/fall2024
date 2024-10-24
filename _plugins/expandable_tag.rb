# _plugins/expandable_tag.rb
module Jekyll

    class ExpandableTag < Liquid::Block
  
      def initialize(tag_name, markup, tokens)
        super
        # Parse named arguments
        @args = {}
        # Regex to match key-value pairs, handling quoted values
        markup.scan(/(\w+)=["']([^"']+)["']|\b(\w+)=([^\s]+)/).each do |matches|
            key = matches[0] || matches[2]
            value = matches[1] || matches[3]
            @args[key] = value
        end
      end

      def generate_random_id(length = 8)
        characters = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
        Array.new(length) { characters.sample }.join
      end
  
      def render(context)

        # Capture the content between the custom tags
        content = super

        content = content.strip

        # Get the Markdown converter from Jekyll's site context
        converter = context.registers[:site].find_converter_instance(Jekyll::Converters::Markdown)

        # Convert the captured content from Markdown to HTML
        rendered_content = converter.convert(content)


        is_expanded = @args['expanded'] == "true" ? true : false
        level = @args['level'] || 2
        title = @args['title'] || "Section"
        display = is_expanded ? "display: block;" : "display: none;"
        icon = is_expanded ? "<i class='fa-solid fa-angle-down'></i>" : "<i class='fa-solid fa-angle-right'></i>"
  


        # Generate target id:
        target = "panel_#{generate_random_id}"
        header_id = "heading_#{generate_random_id}"

        # Wrap the content in a div with a button for expand/collapse functionality
        # Escape the HTML output to prevent Liquid from rendering it as code
        return "<div class='expandable-section'>
            <div class='toggle-header'>
                <button class='toggle-button' 
                    target-panel='##{target}'
                    onclick='toggleExpandable(this)'
                    >#{icon}</button>
                <h#{level} 
                    id=\"#{header_id}\"
                    target-panel=\"##{target}\"
                    onclick=\"toggleExpandable(this)\"
                    style=\"cursor: pointer;\">#{title}</h#{level}>
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
