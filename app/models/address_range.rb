class AddressRange < ActiveRecord::Base
	belongs_to :geocode

	#list nigerian state and city abbreviations
	ABBR = ["FC","AB","AD Adamawa state", "AK Akwa Ibom state","AN Anambra state", "BA Bauchi  state","BY Bayelsa state", "BE Benue state",
"BO Borno state","CR Cross River state","DE Delta state","EB Ebonyi  state","ED Edo state",
"EK Ekiti state", "EN Enugu state", "GO Gombe state","IM Imo state
","JI Jigawa  state
","KD Kaduna  state
", "KN Kano  state"]

	 class << self
    def find_all_by_search_params(num,street_name,zipcode)
      street_name = street_name#.upcase
      results = self.where("street = ? AND num_start <= ? AND num_end >= ? AND is_even = ?",street_name,num,num,num.even?)
      
      # if we can't find the address using a literal search, use the street matcher
      if results.blank?
        #words = street_name.upcase.strip.split
        words = street_name
        ignored_words,search_words = words.partition {|w| ABBR.include? w}
        street_matcher = '[[:<:]](' + search_words*"|" + ')[[:>:]]'
        results = self.where("street ~ ? AND num_start <= ? AND num_end >= ? AND is_even = ?",street_matcher,num,num,num.even?)
      end

      #if we have multiple possibilities, try to filter by zipcode
      if results.length > 1 && zipcode.strip =~ /^\d{5}$/
        results = results.select {|x| x.zipcode == zipcode.strip}
      end

      #if we still have multiple possibilities, try to add in the ignored words, if we have any
      if results.length > 1 && ignored_words.length > 1
        street_matcher = '[[:<:]](' + words*"|" + ')[[:>:]]'
        results = self.where("street ~ ? AND num_start <= ? AND num_end >= ? AND is_even = ?",street_matcher,num,num,num.even?)
        #and filter again by zipcode, perhaps
        if geo_ids.length > 1 && zipcode.strip =~ /^\d{5}$/
          results = results.select {|x| x.zipcode == zipcode.strip}
        end
      end
      
      return results
      
    end
  end


end
