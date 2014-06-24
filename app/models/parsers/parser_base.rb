module Parsers
  class ParserBase
    
    def initialize(pdf_location, multiline_states, clazz)
      @current_font = nil
      @color = [0, 0, 0]
      @font_size = 0

      @entity = nil

      @line = []

      @state ||= nil
      @pdf_location = pdf_location
      @multiline_states = multiline_states
      @clazz = clazz
    end
    
    def check_state(str)
      nil
    end
    
    def is_new_entity(new_state)
      false  # new_state == :name
    end
    
    def create_entity(str)
      nil  # { name: str }
    end
    
    def text(str)
      new_state = check_state str
      ret = nil

      if new_state
        while @line.include? '-' do
          idx = @line.index '-'
          @line[idx-1] += @line[idx+1]
          @line.delete_at idx
          @line.delete_at idx+1
        end

        @entity[@state] = @line.join(' ') if @entity

        if is_new_entity new_state
          ret = @entity
          @entity = create_entity
        end

        @state = new_state
        @line = []
        @line << str if @multiline_states.include? new_state
      else
        @line << str
      end

      ret
    end
    
    def parse(first, last=nil)

      last ||= first
      doc = PDF::Reader.new @pdf_location

      entities = []

      for page in first..last do
        r = PDF::Reader::RegisterReceiver.new
        p = doc.page(page)
        p.walk r

        fonts = Hash[p.fonts.map { |l, f| [l, PDF::Reader::Font.new(p.objects, p.objects.deref(f))] }]

        r.callbacks.each do |cb|
          case cb[:name]
            when :show_text
              f = text @current_font.to_utf8(cb[:args][0])
              entities << f if f
            when :set_color_for_nonstroking_and_special
              @color = cb[:args].map { |c| (c * 255).to_i }
            when :set_text_font_and_size
              @current_font = fonts[cb[:args][0].to_sym]
            when :set_text_matrix_and_text_line_matrix
              xscale, xskew, yskew, yscale, movex, movey = cb[:args]
              @font_size = xscale
            when :show_text_with_positioning
              tmp = []
              cb[:args].each { |child| child.each { |a| tmp << @current_font.to_utf8(a) if a.is_a? String } }
              f = text tmp.join('')
              feats << f if f
          end
        end

        entities << @entity if @entity
      end
      entities
    end
    
    def to_seed
      lens = { }
    
      feats.each do |f|
        lens.keys.each do |key|
          lens[key] = [ lens[key], f[key].length+2 ].max
        end
      end
    
      # puts lens
    
      File.open "#{@clazz.name.downcase}_seed.rb", 'w' do |file|
        file.write "#{@clazz.name.downcase} = #{@clazz.name}.create [\n"
        @entities.each do |feat|
          file.write '\t{ '
          lens.keys.each do |key|
            str = to_str(feat[key])
            file.write "#{key}: #{str}"
          
            if key == :benefit
              file.write ' },\n'
            else
              file.write ", #{" " * (lens[key] - str.length)}"
            end
          end
        end
        file.write "]\n"
      end
    end
  
    def to_str(str)
      if str
        "'#{str.strip.gsub "'", %q(\\\')}'"
      else
        'nil'
      end
    end
  end
end