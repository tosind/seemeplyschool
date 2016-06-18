class GradeLevelSchool < ActiveRecord::Base
	belongs_to :school
  belongs_to :grade_level
  before_destroy :delete_geocode_grade_walkzone_schools
  
  def total_choices
    if first_choice.present?
      total = 0
      total += first_choice
      total += second_choice
      total += third_choice
      total += fourth_higher_choice
      total
    end
  end
  
  def demand
    if total_choices.present? && open_seats.present?
      total_choices.to_f / open_seats
    end
  end
  
  def ela_score
    if mcas_ela_advanced.present? && mcas_ela_proficient.present? && mcas_ela_needsimprovement.present? && mcas_ela_failing.present?
      score = 0
      score += mcas_ela_advanced * 4
      score += mcas_ela_proficient * 3
      score += mcas_ela_needsimprovement * 2
      score += mcas_ela_failing * 1
      (score / 4) * 100
    else
      nil
    end
  end

  def math_score
    if mcas_math_advanced.present? && mcas_math_proficient.present? && mcas_math_needsimprovement.present? && mcas_math_failing.present?
      score = 0
      score += mcas_math_advanced * 4
      score += mcas_math_proficient * 3
      score += mcas_math_needsimprovement * 2
      score += mcas_math_failing * 1
      (score / 4) * 100
    else
      nil
    end
  end
  
  def ela_percentile
    scores = GradeLevelSchool.find_all_by_grade_number(self.grade_number).map(&:ela_score).compact.sort
    ((scores.index(self.ela_score) / scores.size.to_f) * 100).to_i
  end
  
  def math_percentile
    scores = GradeLevelSchool.find_all_by_grade_number(self.grade_number).map(&:math_score).compact.sort
    ((scores.index(self.math_score) / scores.size.to_f) * 100).to_i
  end
  
  private
  
  def delete_geocode_grade_walkzone_schools
    GeocodeGradeWalkzoneSchool.where(grade_level_id: self.grade_level.try(:id), school_id: self.school.try(:id)).delete_all
  end
end
