class WelcomeController < ApplicationController
	require 'SoundCloud'

	@@genre = 'Your Genre of Choice'
	@@limit = 50
	@@duration = 45
	@@track_arr = []
	@@names_arr = []


	def index
		@tracks = @@track_arr[0..@@limit]
		@names = @@names_arr[0..@@limit]
		@duration = @@duration
		@genre = @@genre
	end

	def get_songs
		@@track_arr = []
		@@names_arr = []
		@@duration = params[:minutes]
		@@limit = params[:minutes].to_i / 4
		@@genre = params[:genre]


		client = SoundCloud.new(client_id: 'b61acae9ab94159d1de902fdee787599')
		tracks = client.get('/tracks', :genres => @@genre, :limit => 50)
		puts tracks[1]
		tracks.each do |track|
			puts track.streamable
			if track.streamable 
				url = track.uri.to_s + "/stream?client_id=b61acae9ab94159d1de902fdee787599"	
				@@track_arr << url
				@@names_arr << track.title
			end
		end
		redirect_to '/'
	end

	def search


	end

	def update
		p params
		redirect_to '/'
	end

end
