class Dogs
  POOR      = (0..5).to_a.sample
  AVERAGE   = (6..10).to_a.sample
  EXCELLENT = (11..15).to_a.sample

  def initialize
    joe   = {
      :name => {:first => "Joe", :last=> "Smith"},
      :owner_quality => EXCELLENT
    }
    sarah = {
      :name => {:first => "Sarah", :last => "Darnum"},
      :owner_quality => AVERAGE
    }
    andrew = {
      :name => {:first => "Andrew", :last => "Beter"},
      :owner_quality => AVERAGE
    }

    @dogs = [
      {name: "Fido",     size: :large,  owner: joe},
      {name: "Yapper",   size: :small,  owner: joe},
      {name: "Bruiser",  size: :large,  owner: joe},
      {name: "Tank",     size: :huge,   owner: sarah},
      {name: "Beast",    size: :large,  owner: sarah},
      {name: "Harleigh", size: :medium, owner: andrew},
      {name: "Trixie",   size: :small,  owner: andrew}
    ]
    end


  # only edit below this line

  def small_dogs
    @dogs.select{|dog| dog[:size] == :small}
  end

  def huge_dog
    @dogs.find{|dog| dog[:size] == :huge}
  end

  def large_dog_names
    @dogs.select{|dog| dog[:size] == :large}.map{|dog| dog[:name]}
  end

  def joes_large_dogs
    @dogs.select{|dog| dog[:size] == :large && dog[:owner][:name][:first] == "Joe"}.map{|dog| dog[:name]}
  end

  def sizes
    @dogs.map{|dog| dog[:size]}.uniq
  end

  def owners
    @dogs.map{|dog| dog[:owner]}.uniq.map{|owner| owner[:name][:first] + " " + owner[:name][:last]}
  end

  def average_owners
    # @dogs.map{|dog| dog[:owner]}.uniq.map{|owner| owner[:owner_quality] == AVERAGE}.map{|owner| owner[:name][:first] + " " + owner[:name][:last]}
    
  end

  def to_s
    # {} will return nil when there isn't an value for the key
    # Hash.new([]) is close, but it will use the same list for every missing
    # key, which will result in every owner having every dog
    by_owner = Hash.new{|hash, key| hash[key] = []}
    # group the dogs by owners in a new hash
    # the format of the by_owner hash will be: {owner: [dog1, dog2...], ...}
    @dogs.each{|dog| by_owner[dog[:owner][:name][:first]] << dog[:name]}
    # iterate over the by_owner
    by_owner.map do |owner, dogs|
      # the string always starts with owner
      "#{owner} owns: " +
      # if are one or two dogs, join them with ' and ', and no commas
      if dogs.size < 3
        dogs.join(' and ')
        # if are three or more, join all but the last with ', ', then join
        # the last one with an oxford comma ' and ' oxford comma
      else
        "#{dogs[0..-2].join(', ')}, and #{dogs[-1]}"
      end
      # join the join the resulting list of strings with newlines
      # ?\n is shorthand for "\n"
    end.join(?\n)
  end

  def find_by_owner(name)

  end

end
