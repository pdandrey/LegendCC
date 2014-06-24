require 'pdf-reader'

class NilClass
  def to_s
    'nil'
  end
  
  def length
    3
  end
end

class Parse

  

  

  def check_state(str)
    str = str.downcase

    if @state == :name
      :flavor
    elsif str.start_with? 'prerequisites'
      :prereq
    elsif str.start_with? 'benefit'
      :benefit
    elsif @font_size == 14
      :name
    else
      nil
    end
    
  end

  

  def auto_parse
    parse 160, 185
  end
  
  
end