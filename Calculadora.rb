
class Costos

	def trabajadores
		puts ("Escriba todo lo relacionado con precios en COP sin usar . ni ,")
		puts ("Costos")

		@costo_hora = []
		@num_horas = []

		puts ("Cuantas personas van a trabajar en el proyecto")
		@num_personas = gets().to_i

		puts ("Cuantos dias dura el proyecto")
		@tiempo = gets().to_i

		i = 1

		while i <= @num_personas

			puts ("Escriba el costo por hora del trabajor #{i}: ")
			costo = gets().to_f
			@costo_hora.push(costo)
			i = i + 1
		end

		i = 1

		while i <= @num_personas

			puts ("Escriba el numero de horas diarias que realiza el trabajor #{i}: ")
			costo = gets().to_f
			@num_horas.push(costo)
			i = i + 1
		end
	end

	def cambiar_hora

		puts ("Escriba 1 si desea cambiar el costo por hora o 2 si desea cambiar el numero de horas de un trabajador")
		cambio = gets.to_i

		case cambio
		when 1
			puts "Ingrese el numero del trabajador que desea cambiar su costo por hora"
			trabajador = gets().to_i
			
			if trabajador > @num_personas or trabajador < 0
				puts "Escogio un valor no correcto, vuelva a intentar"
				cambiar_hora
			else
				trabajador = trabajador-1
				puts "El costo por hora actual del trabajador #{trabajador+1} es de #{@costo_hora[trabajador]} ingrese el nuevo valor por hora"
				@costo_hora[trabajador] = gets.to_f
				puts @costo_hora[trabajador]
				calcular_esfuerzo
			end
		when 2
			puts "Ingrese el numero del trabajador que desea cambiar su numero de horas"
			trabajador = gets().to_i

			if trabajador > @num_personas or trabajador < 0
				puts "Escogio un valor no correcto, vuelva a intentar"
				cambiar_hora
			else
				trabajador = trabajador-1
				puts "El numero de horas actual del trabajador #{trabajador+1} es de #{@num_horas[trabajador]} ingrese el nuevo numero de horas"
				@num_horas[trabajador] = gets.to_f
				puts @num_horas[trabajador]
				calcular_esfuerzo
			end
		else
			puts "Usted a puesto un numero equivocado, presione enter para reintentar"
			cambiar_hora
		end
	end

	def calcular_esfuerzo

		i = 0

		while i < @num_personas
			puts ("El trabajador #{i+1} tiene un costo de hora de: #{@costo_hora[i]}")
			puts ("El trabajador #{i+1} trabaja un numero de horas de: #{@num_horas[i]}")

			i = i + 1
		end

		x = 0
		@valor_esfuerzo = 0
		valor_trabajador = 0

		while x < @num_personas

			valor_trabajador = @costo_hora[x]*@num_horas[x]*@tiempo
			@valor_esfuerzo = @valor_esfuerzo + valor_trabajador
			@valor_esfuerzo.to_f
			
			x = x + 1
		end

		puts ("El valor total de sus trabajadores es de #{@valor_esfuerzo}")
	end

	def costos_viaticos
		loop do
			puts ("Escriba el costo que tendra en viaticos durante el tiempo que dure el proyecto")
			@viaticos = gets.chomp
			if @viaticos.match?(/\A\d+(\.\d+)?\z/)
				@valor_viaticos = @viaticos.to_f
				puts ("El valor de sus viaticos es de #{@valor_viaticos}")
				return
			else
				puts "por favor ingresa un numero valido"
			end
		end
	end

	def cambiar_viaticos
		loop do
			puts ("El valor actual de sus viaticos es de #{@valor_viaticos}, ingrese el valor nuevo:")
			@viaticos = gets.chomp
			if @viaticos.match?(/\A\d+(\.\d+)?\z/)
				@valor_viaticos = @viaticos.to_f
				puts ("El nuevo valor de sus viaticos es de #{@valor_viaticos}")
				return
			else
				puts "por favor ingresa un numero valido"
			end
		end
	end

		def costos_infraestructura
		loop do
			puts ("Escriba el costo que tendra en infraestructura durante el tiempo que dure el proyecto")
			@infraestructura = gets.chomp
			if @infraestructura.match?(/\A\d+(\.\d+)?\z/)
				@valor_infraestructura = @infraestructura.to_f
				puts ("El valor de su infraestructura es de #{@valor_infraestructura}")
				return
			else
				puts "por favor ingresa un numero valido"
			end
		end
	end

	def cambiar_infraestructura
		loop do
			puts ("El valor actual de su infraestructura es de #{@infraestructura}, ingrese el valor nuevo:")
			@infraestructura = gets.chomp
			if @infraestructura.match?(/\A\d+(\.\d+)?\z/)
				@valor_infraestructura = @infraestructura.to_f
				puts ("El nuevo valor de su infraestructura es de #{@valor_infraestructura}")
				return
			else
				puts "por favor ingresa un numero valido"
			end
		end
	end

	def costo_total
		$valor = @valor_esfuerzo + @valor_viaticos + @valor_infraestructura
		puts("El valor total de sus costos es de: #{$valor}")
	end
	def agregar_gasto(nombre, monto)
		if monto.to_f.to_s == monto || monto.to_i.to_s == monto
		  $gastos[nombre] = $gastos.fetch(nombre, 0) + monto.to_f
		else
		  puts "El monto del gasto debe ser un número. No se agregó el gasto '#{nombre}'."
		end
	  end
	
	def suma_gastos
	  $total_gastos=$gastos.values.sum
	end

	def ingresar_gastos
		puts "Gastos"
		$gastos = {}
		loop do
		  print "Ingrese el nombre del gasto: "
		  nombre = gets.chomp
	  
		  print "Ingrese el monto del gasto para #{nombre}: "
		  monto = gets.chomp
	  
		  agregar_gasto(nombre, monto)
	  
		  puts "¿Desea agregar otro gasto? (S/N): "
		  opcion = gets.chomp.upcase
	  
		  break if opcion != "S"
		end
	end
	def impuestos
		# $total_gastos = $gastos.values.sum
		$retencion_fuente = $valor + $riesgos_calculados + $total_gastos
		$retencion_fuente = $retencion_fuente * 0.11
		$reteica = $retencion_fuente * 0.01
		$iva = $valor + $total_gastos + $riesgos_calculados + $retencion_fuente + $reteica
		$iva = $iva * 0.19
		$coste_impuestos_total = $retencion_fuente + $reteica + $iva
	end
	def editar_gastos
		puts "¿Desea modificar algún gasto existente? (S/N): "
		opcion = gets.chomp.upcase
	  
		if opcion == "S"
		  puts "Gastos existentes:"
		  $gastos.each_with_index { |(nombre, monto), index| puts "#{index + 1}. #{nombre}: #{monto}" }
	  
		  print "Ingrese el número del gasto que desea modificar: "
		  numero_gasto = gets.chomp.to_i
	  
		  gasto_seleccionado = $gastos.keys[numero_gasto - 1]
	  
		  print "Ingrese el nuevo monto para el gasto #{gasto_seleccionado}: "
		  nuevo_monto = gets.chomp.to_f
	  
		  $gastos[gasto_seleccionado] = nuevo_monto
	  
		  puts "¡Gasto modificado exitosamente!"
		else
		  puts "No se realizarán modificaciones en los gastos existentes."
		end
	  end
	def calcular_riesgos
	  	$riesgos_calculados = 0.10 * ($total_gastos + $valor)
  	end 
	def comunicacion_calculadora_final
		puts "El valor designado a gastos es: #{$total_gastos} COP"

		total_1 = $valor + $total_gastos

		puts "El total de costos mas los gastos es de: #{total_1} COP"  
		puts "El valor designado a riesgos siendo del 10% es de #{$riesgos_calculados} COP"
		
		total_2 = total_1 + $riesgos_calculados
		total_gastos_software = total_2 + $coste_impuestos_total 
		puts "El valor de los costos mas los gastos mas los riesgos es de: #{total_2} "
		puts "El costo total por Retenciones a la fuente del proyecto es de: #{$retencion_fuente}"
		puts "El costo total por el Reteica es de: #{$reteica}"
		puts "El costo total por IVA del proyecto es de: #{$iva}"
		puts "El costo total a raiz de impuestos es de: #{$coste_impuestos_total}"
		puts ""
		puts "En total, el software que acaba de calcular tendra un coste de: #{total_gastos_software} COP"
	end	

end



calculadora = Costos.new

calculadora.trabajadores
calculadora.calcular_esfuerzo
calculadora.cambiar_hora
calculadora.costos_viaticos
calculadora.cambiar_viaticos
calculadora.costos_infraestructura
calculadora.cambiar_infraestructura
calculadora.costo_total
calculadora.ingresar_gastos
calculadora.editar_gastos
calculadora.suma_gastos
calculadora.calcular_riesgos
calculadora.impuestos
calculadora.comunicacion_calculadora_final

sleep 10

gets()