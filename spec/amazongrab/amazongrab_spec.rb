require 'spec_helper'
require 'fakeweb'
require 'open-uri'
module AmazonGrab
	describe Grabber do
		describe "#grab" do
			# before(:each) do
			# 	FakeWeb.register_uri(:get, "http://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=Matri", :response => "C:/ruby/amazongrab/spec/amazongrab/matri.html")	
			# end
			# it "loads name of the product alone" do
			#  #@dir = File.expand_path("./../../bin/amazongrab", File.dirname(__FILE__))
			#  `AmazonGrab grab -n Matri`.should == "The Matrix\n" #ruby filename to execute
			# end
			# it "loads the price and name of the product" do
			#  `AmazonGrab grab -n Matri -p`.should == "$1.99to rent\nThe Matrix\n" #ruby filename to execute
			# end
			# it "loads the rating and name of the product" do
			#  `AmazonGrab grab -n Matri -r`.should == "4.5 out of 5 stars\nThe Matrix\n" #ruby filename to execute
			# end
			# it "loads the authors and name of the product" do
			#  `AmazonGrab grab -n Matri -a`.should == "The Matrix\nKeanu Reeves, Laurence Fishburne, Carrie-anne Moss and Hugo Weaving (Amazon Instant Video)\n" #ruby filename to execute
			# end
			it "loads the page and returns price" do
			 page = Nokogiri::HTML(open("http://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=Matri"))
			 # puts(open("http://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=Matri"))
			 @grabber = AmazonGrab::Grabber.new
			 @grabber.prodPrice(page).should == "$1.99to rent"
			end
			it "loads the page and returns rating" do
			 page = Nokogiri::HTML(open("http://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=Matri"))
			 # puts(open("http://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=Matri"))
			 @grabber = AmazonGrab::Grabber.new
			 @grabber.prodRating(page).should == "4.5 out of 5 stars"
			end
			it "loads the page and returns name of the product" do
			 page = Nokogiri::HTML(open("http://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=Matri"))
			 # puts(open("http://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=Matri"))
			 @grabber = AmazonGrab::Grabber.new
			 @grabber.prodTitle(page)[0].lstrip.rstrip.should == "The Matrix"
			end
			it "loads the page and returns authors" do
			 page = Nokogiri::HTML(open("http://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=Matri"))
			 # puts(open("http://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=Matri"))
			 @grabber = AmazonGrab::Grabber.new
			 @grabber.prodTitle(page)[1].lstrip.rstrip.should == "Keanu Reeves, Laurence Fishburne, Carrie-anne Moss and Hugo Weaving (Amazon Instant Video)"
			end
		end
	end
end