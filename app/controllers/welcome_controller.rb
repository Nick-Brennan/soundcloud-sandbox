class WelcomeController < ApplicationController
	require 'SoundCloud'

	@@genre = 'magic taco'

	def index
		track_arr = []
		names_arr = []
		client = SoundCloud.new(client_id: 'b61acae9ab94159d1de902fdee787599')
		tracks = client.get('/tracks', :genres => @@genre)
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
		@@genre = params[:genre]
		redirect_to '/'
	end

end
