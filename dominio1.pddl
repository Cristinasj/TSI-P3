(define (domain StarCraft)
   ; Para utilizar cláusulas más avanzadas que and 
   (:requirements :adl)
   (:types
      posicionable localizacion - object
      ; Las unidades son "clases" mientras que los tiposUnidad son las "clases abstractas". Esto es análogo con edificio y tipoEdificio  
      unidad edificio tipoUnidad tipoEdificio tipoRecurso - posicionable
   )
   (:constants
      ; En este ejercicio solo se va a utilizar VCE y Minerales 
      CentroDeMando Barracones - tipoEdificio
      VCE - tipoUnidad
      Minerales Gas - tipoRecurso
   )
   (:predicates
      ; Indica la posición de cualquier objeto en el mundo 
      (en ?p - posicionable ?x - localizacion)
      ; Indica la existencia de un camino entre dos nodos 
      (camino ?x - localizacion ?y - localizacion)
      ; Indica que un recurso ha sido extraído 
      (ha_extraido ?tr - tipoRecurso)
      ; Indica el tipo de un edificio. En este caso será solo centro de mando 
      (esTipoEdificio ?e - edificio ?t - tipoEdificio)
      ; Indica el tipo de una unidad. En este caso serán VCE
      (esTipoUnidad ?u - unidad ?t - tipoUnidad)
      ; Recurso necesario para construir un edificio. Será usado en ejercicios posteriores.  
      (necesita ?te - tipoEdificio ?tr - tipoRecurso)
   )

   ; Esta acción mueve una unidad de una posición a otra 
   (:action Navegar
   :parameters (?u - unidad ?x ?y - localizacion)
   :precondition
      (and
         (camino ?x ?y)
         (en ?u ?x)
      )
   :effect
      (and
         (en ?u ?y)
         (not (en ?u ?x))
      )
   )

   ; Esta acción asigna una unidad a una posición con recursos. Una vez que la unidad está asignada, no se desasigna durante la partida  
   (:action Asignar
   :parameters (?u - unidad ?x - localizacion ?tr - tipoRecurso)
   :precondition
      (and
         (en ?u ?x)
         (en ?tr ?x)
      )
   :effect
      (and
         (ha_extraido ?tr)
      )
   )

)