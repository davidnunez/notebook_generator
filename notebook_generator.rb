require 'prawn'
require 'prawn/measurement_extensions'
require 'qr4r'

WIDTH  = 8.375.in;
HEIGHT = 11.in;
NOTEBOOK_VOLUME = "001"
NOTEBOOK_START_PAGE = 32

custom_size = [WIDTH, HEIGHT]

current_page = NOTEBOOK_START_PAGE

Prawn::Document.generate("notebook_template.pdf",
							:page_size => custom_size,
							:margin => 0) do 
	
	15.times do 
		stroke_color "CCCCCC"
		fill_color "CCCCCC"
		line [1.in, 0],[1.in, 11.in]
		stroke
		line [8.375.in - 0.5.in, 0],[8.375.in - 0.5.in, 11.in]
		stroke
		line [0, 1.in],[8.375.in, 1.in]
		stroke



		bounding_box([1.in, 0], :width => WIDTH, :height => HEIGHT) do
			stroke_bounds
			stroke_circle [0,0], 20
		end
		bound_width = WIDTH-1.5.in
		bound_height = HEIGHT-1.in

		
		
		i = 1.25.in 
		j = 1.25.in

		until j >= HEIGHT

			until i >= WIDTH - 0.5.in  do
				fill_circle [i, j], 1
				i += 0.25.in
			end
			i = 1.25.in
			j += 0.25.in
		end


		s = "#{NOTEBOOK_VOLUME}-#{"%03d" % current_page}"#'@notebook(001-013)'
		fname = "qr.png"
		Qr4r::encode(s, fname)

		image "qr.png", :width => 0.50.in, :at => [0.50.in,1.in]
		text_box s, :at => [0.50.in, 0.4.in],
	             :width => 0.5.in, :height => 0.25.in,
	             :overflow => :shrink_to_fit, :min_font_size => nil
	#	text_box s, :at => [0.50.in], :width=>0.50.in, :height=>0.25.in # , :overflow => :shrink_to_fit
		current_page += 1
		start_new_page
	end	
end