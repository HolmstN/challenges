class School
  def initialize
    @school = {}
  end

  def to_h
    Hash[@school.sort]
  end

  def add(name, grade)
    if @school[grade]
      @school[grade] << name
      @school[grade] = @school[grade].sort
    else
      @school[grade] = [name]
    end
  end

  def grade(grade)
    @school.fetch(grade, [])
  end
end
