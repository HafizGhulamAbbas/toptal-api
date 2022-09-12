def check_duplicate list
    visited = Set.new
    list.each do |element|
        puts element
        if visited.include?(element["label"])
            return true
        else
            visited << element["label"]
        end
    end
    return false
end