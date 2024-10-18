module Jekyll

    module MyCustomFilters
      def reverse_string(input)
        input.reverse
      end



      # Custom filter to generate all Tuesdays and Thursdays between two dates
      def tuesdays_and_thursdays(start_date, end_date)
        # Parse the input dates
        start_date = Date.parse(start_date)
        end_date = Date.parse(end_date)
  
        # Initialize an empty array to store the result
        result = []
  
        # Iterate through the date range
        (start_date..end_date).each do |date|
          # Check if the day is Tuesday (2) or Thursday (4)
          if date.wday == 2 || date.wday == 4
            result << date
          end
        end
  
        # Return the result as an array of date strings
        result.map(&:to_s)
      end



      def extract_due_dates(pages)
        # Select only pages that have a `due_date` field and return their dates
        pages.map { |page| 
        # Parse the due_date string into a Date object
        page['due_date'] if page['due_date'] 
      }.compact.uniq.sort
      end


      def combine_dates(arr1, arr2)
        combined = arr1.concat(arr2)
        # Parse the date strings to Date objects if they are strings
        combined.map! do |date|
            if date.is_a?(String)
            Date.strptime(date, '%Y-%m-%d')  # Parse string to Date
            elsif date.is_a?(Date)
            date  # If it's already a Date object, use it as is
            end
        end
        combined.compact.uniq.sort
      end


      def get_week_number(start_date, end_date)
        # Parse the start date and end date into Date objects if they are strings
        start_date = Date.strptime(start_date, '%Y-%m-%d') if start_date.is_a?(String)
        end_date = Date.strptime(end_date, '%Y-%m-%d') if end_date.is_a?(String)
  
        # Calculate the difference in days between the two dates
        days_difference = (end_date - start_date).to_i
  
        # Convert the difference in days to weeks and return the result
        (days_difference / 7.0).to_i + 1
      end


      def display_link_or_badge(page, hide_title=false)
        type = page['type'] == "homework" ? "hw" : page['type']
        if page['draft'] == 0
          # Return an anchor (<a>) tag if the url exists
          link = "<div class='mb-1'><a class='#{type}' href='/fall2024#{page['url']}'>#{type} #{page['num']}</a> #{hide_title ? "" : page['title']}</div>"
        else
          # Return a span if no url exists
          "<div class='mb-1'><span class='badge'>#{page['type']} #{page['num']}</span> #{hide_title ? "" : page['title']}</div>"
        end
      end


      def display_assignment(page, hide_title=false)
        if page['type'] == 'lab'
          # Return an anchor (<a>) tag if the url exists
          "<div class='mb-1'>Lab #{page['num']}</div>"
        else
          # Return a span if no url exists
          display_link_or_badge(page, hide_title=hide_title)
        end
      end


      def has_holiday_or_deadline(pages)
        # Iterate over the list of pages
        pages.each do |page|
          # Check if the page_type is either 'holiday' or 'deadline'
          if page['type'] == 'holiday' || page['type'] == 'deadline'
            return true
          end
        end
        # Return false if no page matches
        false
      end
  
    end
  end
  
  Liquid::Template.register_filter(Jekyll::MyCustomFilters)
  