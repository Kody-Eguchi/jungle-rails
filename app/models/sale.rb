class Sale < ApplicationRecord

  # def self.active
  #   where("sales.starts_on < ? AND sales.ends_on >= ?", Date.current, Date.current).any?
  # end


  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end
 
end
