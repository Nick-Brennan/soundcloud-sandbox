class WelcomeController < ApplicationController
	require 'SoundCloud'

	@@genre = 'magic taco'
	@@limit = 50

	def index
		puts @@limit
		if @@limit == 0
			@@limit = 50
		end
		track_arr = []
		names_arr = []
		client = SoundCloud.new(client_id: 'b61acae9ab94159d1de902fdee787599')
		tracks = client.get('/tracks', :genres => @@genre, :limit => @@limit)
		puts tracks[1]
		tracks.each do |track|
			puts track.streamable
			if track.streamable 
				url = track.uri.to_s + "/stream?client_id=b61acae9ab94159d1de902fdee787599"	
				track_arr << url
				names_arr << track.title
			end
		end
		@tracks = track_arr
		@names = names_arr
	end

	def search
		@@limit = params[:minutes].to_i / 4
		@@genre = params[:genre]
		redirect_to '/'
	end

	def update
		p params
		redirect_to '/'
	end

end
