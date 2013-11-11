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

  #STATES = [:name, :flavor, :prereq, :benefit]

  def initialize
    @current_font = nil
    @color = [0, 0, 0]
    @font_size = 0

    @feat = nil

    @line = []

    @state = :benefit
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

      @feat[@state] = @line.join(' ') if @feat

      if new_state == :name
        ret = @feat
        @feat = {name: str}
      end

      @state = new_state
      @line = []
      @line << str if [:name, :flavor].include? new_state
    else
      @line << str
    end

    ret
  end

  def check_state(str)
    str = str.downcase

    nil

    if @state == :name
      :flavor
    elsif str.start_with? 'prerequisites'
      :prereq
    elsif str.start_with? 'benefit'
      :benefit
    elsif @font_size == 14
      :name
    end
  end

  def parse(first, last=nil)

    last ||= first
    doc = PDF::Reader.new "#{Dir.home}/Documents/Legend.pdf"

    feats = []

    for page in first..last do
      r = PDF::Reader::RegisterReceiver.new
      p = doc.page(page)
      p.walk r

      fonts = Hash[p.fonts.map { |l, f| [l, PDF::Reader::Font.new(p.objects, p.objects.deref(f))] }]

      r.callbacks.each do |cb|
        case cb[:name]
          when :show_text
            f = text @current_font.to_utf8(cb[:args][0])
            feats << f if f
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

      feats << @feat if @feat
    end
    feats
  end

  def auto_parse
    parse 160, 185
  end
  
  def to_seed(feats)
    lens = { name: 0, flavor: 0, prereq: 0, benefit: 0 }
    
    feats.each do |f|
      lens.keys.each do |key|
        lens[key] = [ lens[key], f[key].length+2 ].max
      end
    end
    
    puts lens
    
    File.open 'feat_seed.rb', 'w' do |file|
      file.write "feats = Feats.create [\n"
      feats.each do |feat|
        file.write "\t{ "
        lens.keys.each do |key|
          str = to_str(feat[key])
          file.write "#{key}: #{str}"
          
          if key == :benefit
            file.write " },\n"
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
      "nil"
    end
  end
end