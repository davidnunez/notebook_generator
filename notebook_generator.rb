require 'prawn'
require 'prawn/measurement_extensions'
custom_size = [8.375.in, 11.in]

Prawn::Document.generate("notebook_template.pdf",
							:page_size => custom_size,
							:margin => 0) do 

	stroke_color "CCCCCC"
	line [1.in, 0],[1.in, 11.in]
	stroke
	line [8.375.in - 0.5.in, 0],[8.375.in - 0.5.in, 11.in]
	stroke
	line [0, 1.in],[8.375.in, 1.in]
	stroke
	# # line [1.in, 0],[1.in, 8.375.in]
	# stroke


end


