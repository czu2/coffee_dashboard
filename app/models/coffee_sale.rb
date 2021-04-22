class CoffeeSale < ApplicationRecord

    scope :last_month, -> {where("date BETWEEN ? AND ?", 30.days.ago, Date.today)}
    scope :last_three_months, -> { where("date BETWEEN ? AND ?", 2.months.ago, Date.today)}
    scope :last_six_months, ->{ where("date BETWEEN ? AND ?", 5.months.ago, Date.today)}
    scope :last_twelve_months, -> {where("date BETWEEN ? AND ?", 11.months.ago, Date.today)}

end
