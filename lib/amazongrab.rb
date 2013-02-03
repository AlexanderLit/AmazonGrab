require "amazongrab/version"
require 'nokogiri'
require 'open-uri'
#require 'fakeweb'

module AmazonGrab
  class Grabber
    def grab(prodName,rating,price,authors)
		printParameters = Hash["rating" => rating, "price" => price, "authors" => authors]
		page = Nokogiri::HTML(open(reqHelper(prodName)))

		# file = File.open("C:/site.html", "a")
		# file.write(page)
		
		minedData = dataMiner(page)
		dataPrinter(minedData,printParameters)
    end
	def reqHelper(prodName)
		return "http://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=" + URI.escape(prodName)
	end
	
	def dataMiner(page)
		return minedData = Hash["price" => prodPrice(page), "title" => prodTitle(page), "rating" => prodRating(page)]
	end
	def prodPrice(page)
		price = page.css('div#result_0').css('div.newPrice').css('span').text
		return(price)
	end
	def prodTitle(page)
		title = page.css('div#result_0').css('div.productTitle').text.split("by")
		return(title)
	end
	def prodRating(page)
		rating = page.css('div#result_0').css('span.asinReviewsSummary').css('img')[0].attribute('title').text
		return(rating)
	end

	def dataPrinter(minedData,printParameters)
		if printParameters["price"]
			puts minedData["price"]
		end
		if printParameters["rating"]
			puts minedData["rating"]
		end
		puts minedData["title"][0].lstrip.rstrip
		if printParameters["authors"]
			puts minedData["title"][1].lstrip.rstrip
		end
	end
  end
end