(define (domain StarCraft)
   (:requirements :adl)
   (:types
      posicionable localizacion - object
      unidad edificio tipoUnidad tipoEdificio tipoRecurso - posicionable
   )
   (:constants 
      CentroDeMando Barracones - tipoEdificio
      VCE - tipoUnidad
      Minerales Gas - tipoRecurso
   )
   (:predicates
      (en ?p - posicionable ?x - localizacion)
      (camino ?x - localizacion ?y - localizacion)
      (ha_extraido ?tr - tipoRecurso)
      (esTipoEdificio ?e - edificio ?t - tipoEdificio)
      (esTipoUnidad ?u - unidad ?t - tipoUnidad)
      (necesita ?te - tipoEdificio ?tr - tipoRecurso)
   )

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