require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = [ ]
   doc = Nokogiri::HTML(open(index_url))
   doc.css(".student-card").each do |student|
     student_info = { }
     student_info[:name] = student.css("h4").text
     student_info[:location] = student.css("p").text
     #binding.pry
     student_info[:profile_url] = student.css("a").attr("href").value
     students << student_info
   end
   students
  end

  def self.scrape_profile_page(profile_url)

  end

end
