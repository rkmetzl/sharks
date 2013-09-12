class Time

  def strfjtime(input)
    strficu(input)
  end
  
  def strficu(input)
    a = input.split("'")
    chunks = a.values_at(* a.each_index.select {|i| i.even?})
    chunks.map!{|a| a == "" ? "'" : a}
    preserve = a.values_at(* a.each_index.select {|i| i.odd?})

    final_array = []
    chunks.each do |chunk|
      out_string = ""
      pieces = chunk.scan(/((.)\2*)/).map(&:first)
      pieces.each do |piece|
        if !(piece =~ /[a-zA-Z]/) #skip non-letters
          out_string << piece
          next
        end
        letter = piece[0]
        count = piece.length
        piece = case letter
                  when 'G'
                    "AD"
                  when 'y'
                    count > 2 ? "%Y" : "%y"
                  when 'M'
                    case count
                    when 0..3
                      "%m"
                    when 3...4
                      "%b"
                    else
                      "%B"
                    end
                  when 'D'
                    "%j"
                  when 'd'
                    "%-d"
                  when 'F'
                    "%u"
                  when 'E'
                    count < 4 ? "%a" : "%A"
                  when 'a'
                    "%p"
                  when 'H'
                    "%H"
                  when 'h'
                    "%I"
                  when 'm'
                    "%M"
                  when 's'
                    "%S"
                  when 'S'
                    "%L"
                  when 'z'
                    "%Z"
                  when 'Z'
                    "%Z%z"
                  else
                    ""
                  end
        out_string << piece
      end
      final_array << out_string
    end

    final_string = final_array.zip(preserve).flatten.join("")
    strftime(final_string)
  end
end