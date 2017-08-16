

file = File.open("alumnos.csv", "r")
data = file.readlines
file.close

def verificar_aprobado(promedio, nota_aprobacion=7)
	promedio.to_f >= nota_aprobacion
end

continuar = true

	while(continuar)

puts "____MENU DE OPCIONES____"	
	puts "1) Salir"
	puts "2) Cantidad de Alumnos"	
	puts "3) Nombres de alumnos y promedios"
	puts "4) Crear archivo de promedios"
	puts "5) Aprobados"
	puts "ingrese una opcion" 
	opcion = gets.chomp.to_i

if opcion == 1
	continuar = false
	puts "adios"
end
	if opcion < 1 || opcion > 5 || opcion.to_i == 0
		puts "Opcion no valida, intente nuevamente.."
end



if opcion == 3
	arr_prom = [] 
	data.each do |linea|
	arr_linea = linea.split(", ")
	suma = arr_linea[1].to_f + arr_linea[2].to_f + arr_linea[3].to_f
	prom = suma / 3
	arr_prom << "#{arr_linea[0]}, #{prom}"
	end
	puts arr_prom
end



if opcion == 4
	
	arr_prom = [] 
	data.each do |linea|
	arr_linea = linea.split(", ")
	suma = arr_linea[1].to_f + arr_linea[2].to_f + arr_linea[3].to_f
	prom = suma / 3
	arr_prom << "#{arr_linea[0]}, #{prom}"
	contador_inasistencias = 0
		arr_linea.each do |elemento|
			contador_inasistencias += 1 if elemento == "A"

		end
	
end

	
	file = File.open("promedios.csv", "w")
	arr_prom.each do |alumno|
		file.puts alumno
	end
	file.close
end


if opcion == 5
	file = File.open("promedios.csv", "r")
	content = file.readlines
	file.close
	
	content.each do |alumno| 
		arr_alumno = alumno.chomp.split(", ") 
		
		if verificar_aprobado(arr_alumno[1])
			puts "El alumno #{arr_alumno[0]} ha aprobado"
		end
	end

end

end






