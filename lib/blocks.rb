



def map_this(array)
  
  array.each do |element|
    puts yield(element) if block_given?
  end
  
end

def render_header_and_footer_around
  
  rendered_string = "[HEADER]"
  rendered_string = "#{rendered_string}\n[#{yield}]" if block_given?
  rendered_string = "#{rendered_string}\n[FOOTER]"
  
end

