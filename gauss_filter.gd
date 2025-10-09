class_name ImagenConBlur extends Image

func gauss_blur(a,standar_desviation)-> Image:
	var imagen_blureada = Image.create_empty(self.get_width(),self.get_height(),true,self.get_format())
	for x in imagen_blureada.get_width():
		for y in imagen_blureada.get_height():
			imagen_blureada.set_pixel(x,y,convolucion_ventana_gauss(x,y,a,standar_desviation))
		
	return imagen_blureada
	
func convolucion_ventana_gauss(x,y,tamaño_de_ventana,standar_desviation)->Color:
	var color_res = Color(0,0,0,1.0)
	var ancho 	= self.get_width() - 1
	var alto 	= self.get_height()- 1
	var rango	= (tamaño_de_ventana-1)/2
	var e		= 2.71828183

	for i in range(-rango,rango+1):
		for j in range(-rango,rango+1):
			var x_i = x+i
			var y_j = y+j
			if x_i < 0 or x_i > ancho:
				x_i = x
			if y_j < 0 or y_j > alto:
				y_j = y
				
			var pixel_ventana:Color	= self.get_pixel(x_i,y_j)
			var d = 2* pow(standar_desviation,2)
			var exponente = (i * i) + (j * j)
			exponente = exponente / d
			var gaus_value		= (1/(PI*d)) * pow(e,-exponente)
			color_res = color_res	+ (pixel_ventana * gaus_value)
	
	
	return color_res
