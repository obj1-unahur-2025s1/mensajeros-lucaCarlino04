// Mensajeros
object roberto {
  var pesoPropio = 90
  var vehiculo = bici
  method cambiarVehiculo(unVehiculo) {
    vehiculo = unVehiculo
  }
  method peso() = pesoPropio + vehiculo.peso()
  method puedeLlamar() = false
}

object chuck {
  method peso() = 80
  method puedeLlamar() = true
}

object neo {
  var credito = 15
  method peso() = 0
  method puedeLlamar() = credito > 10
}

// Vehiculos de Roberto
object bici {
  var peso = 5
  method peso() = peso
}

object camion {
  var acoplados = 1
  method peso() = acoplados * 500
  method acoplar() {
    acoplados += 1
  }
  method desacoplar() {
    acoplados -= 1
  }
}

// Destinos
object puente {
  method puedeLlegar(unMensajero) {
    return unMensajero.peso() < 1000
  }
}

object matrix {
  method puedeLlegar(unMensajero) {
    return unMensajero.puedeLlamar()
  }
}

object paquete {
  var estaPago = false
  var destino = puente
  var mensajero = roberto

  method precio() = 50

  method pagarPaquete() {
    estaPago = true
  }

  method asignarDestino(unDestino) {
    destino = unDestino
  }

  method asignarMensajero(unMensajero) {
    mensajero = unMensajero
  }

  method puedeEntregarse() {
    return estaPago && destino.puedeLlegar(mensajero)
  }
}

object paquetito {
  var estaPago = true
  var destino = puente
  var mensajero = roberto
  
  method precio() = 0

  method pagarPaquete() {
    estaPago = true
  }

  method asignarDestino(unDestino) {
    destino = unDestino
  }

  method asignarMensajero(unMensajero) {
    mensajero = unMensajero
  }

  method puedeEntregarse() {
    return true
  }
}

object paqueton {
  var estaPago = false
  const destinos = []
  var mensajero = roberto
  var precioPorDestino = 100

  method precio() {
    return destinos.size() * precioPorDestino
  }

  method pagarPaquete() {
    estaPago = true
  }

  method asignarDestino(unDestino) {
    if (!destinos.contains(unDestino)) {
      destinos.add(unDestino)
    }
  }

  method asignarMensajero(unMensajero) {
    mensajero = unMensajero
  }

  method puedeEntregarse() {
    return estaPago && destinos.all { destino => destino.puedeLlegar(mensajero) }
  }
}

object mensajeria {
  const mensajeros = []

  method mensajeros() = mensajeros

  method contratarMensajero(unMensajero) {
     mensajeros.add(unMensajero)
  }

  method despedirMensajero(unMensajero) {
    mensajeros.remove(unMensajero)
  }

  method despedirAtodos() {
    mensajeros.clear()
  }

  method esGrande() {
    return mensajeros.size() > 2
  }

  method puedeEntregarElPrimero() {
    paquete.pagarPaquete()
    paquete.asignarMensajero(mensajeros.first())
    
    return paquete.puedeEntregarse()
  }

  method pesoUltimoMensajero() {
    return mensajeros.last().peso()
  }

  method pesoPromedio() {
    return mensajeros.average{ mensajero => mensajero.peso() }
  }
}