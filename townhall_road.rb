require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'


def get_the_email_of_a_townhal_from_its_webpage(page_url)
  url = page_url
  page = Nokogiri::HTML(open(page_url))
  links = page.css("td")[7].text   # => My webpag
end

directory_url = "http://annuaire-des-mairies.com/val-d-oise.html"

def get_all_the_urls_of_val_doise_townhallsname(directory_url)
  page = Nokogiri::HTML(open(directory_url))
  array = Array.new()
  townhalls_links = page.css("a[class=lientxt]")
  townhalls_links.each do |link|
    name = link.text
    new_links = link['href']
    url = "http://annuaire-des-mairies.com"+ new_links
    email = get_the_email_of_a_townhal_from_its_webpage(url)
    array.push({"name" => name, "email" => email})
  end
  return array
end

print get_all_the_urls_of_val_doise_townhallsname(directory_url)
