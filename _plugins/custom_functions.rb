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


      def get_url(url)
        return "" if not url
        if url.start_with?("http")
            url
        else
            "/fall2024#{url}"
        end
      end


      def display_link_or_badge(page, hide_title=false, new_line=true, simple=false)
        type = page['type'] == "homework" ? "hw" : page['type']
        link_class = simple ? "" : type
        class_name = new_line ? "block" : "inline-block"
        
        if page['draft'] == 0 or page['draft'] == nil
          # Return an anchor (<a>) tag if the url exists
          link = "<span class='mb-1 #{class_name}'>
                <a class='#{link_class}' href='#{get_url(page['url'])}'>
                    #{type ? type.capitalize : ""} #{page['num']}
                </a>#{simple ? ":" : ""}
                #{hide_title ? "" : "<span>#{page['title']}</span>"}
            </span>"
        else
          # Return a span if no url exists
          "<span class='mb-1 #{class_name}'><span class='badge'>#{page['type']} #{page['num']}</span> #{hide_title ? "" : page['title']}</span>"
        end
      end
      


      def display_assignment(page, hide_title=false, new_line=true)
        if page['type'] == 'lab'
          # Return an anchor (<a>) tag if the url exists
          "<div class='mb-1'>Lab #{page['num']}</div>"
        else
          # Return a span if no url exists
          display_link_or_badge(page, hide_title=hide_title, new_line=new_line)
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


      def convert_to_date_if_not_already(date)
        # date.is_a?(Time) ? Date.parse(date.to_s) : Date.parse(date)
        if date.is_a?(String)
            Date.strptime(date, '%Y-%m-%d')  # Parse string to Date
        elsif date.is_a?(Date)
            date  # If it's already a Date object, use it as is
        end
      end


      def get_labs_by_module_by_date(page, site, date)
        labs = get_labs_by_module(page, site)
        labs = labs.select { |lab| lab['start_date'] == date }
        
      end


      def get_labs_by_module(page, site)
        labs = []
        if page['labs'] # Ensure page['labs'] is not nil before using it
            labs = site['assignments'].select { |item| page['labs'].include?(item['num']) && item['type'] == 'lab' }
        end
        return labs
      end


      def get_all_module_activities(page, site)
        resources = []
        slides = page['slides'] || []
        readings = page['readings'] || []
        activities = page['activities'] || []
        exercise_files = page['exercise_files'] || []  
        labs = []
        if page['labs'] # Ensure page['labs'] is not nil before using it
            labs = site['assignments'].select { |item| page['labs'].include?(item['num']) }
        end
        resources.concat(slides).concat(readings).concat(activities).concat(exercise_files).concat(labs)
      end



      def get_module_dates(page, site)
        items = get_all_module_activities(page, site)  
        items.map { |item| 
            # Parse the due_date string into a Date object
            convert_to_date_if_not_already(item['start_date']) if item['start_date'] 
        }.compact.uniq.sort
      end



      def filter_list_by_date(list, date)
            list.select{ |item| item['start_date'] == date if item['start_date'] } 
        []
      end
  
    end
  end
  
  Liquid::Template.register_filter(Jekyll::MyCustomFilters)
  