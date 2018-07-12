require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def get_currency
  array = []
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  page.css(".currency-name-container").each do |nom|
    array.push(nom.text)
  end
  return array
end

def get_price
  array = []
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  page.css(".price").each do |price|
    array.push(price.text)
  end
  return array
end

var = Hash[get_currency.zip(get_price)]
var.each do |nom, price|
	puts "#{nom}: #{price}"
end
