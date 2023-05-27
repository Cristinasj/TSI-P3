(define (domain StarCraft)
   (:requirements :adl )
   (:types
      posicionable localizacion - object
      unidad edificio tipoUnidad tipoEdificio tipoRecurso - posicionable
   )
   (:constants 
      CentroDeMando Barracones Extractor - tipoEdificio
      VCE - tipoUnidad
      Minerales Gas - tipoRecurso
   )
   (:predicates
      (asignado ?u - unidad)
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
   :parameters (?u - unidad ?l - localizacion ?tr - tipoRecurso)
   :precondition
      (and
         (not (asignado ?u))
         (en ?u ?l)
         (en ?tr ?l)
         (imply
            (en Gas ?l)
            (exists
               (?e - Edificio)
               (and (en ?e ?l) (esTipoEdificio ?e Extractor)
               )
            )
         )
      )
   :effect
      (and
         (ha_extraido ?tr)
         (asignado ?u)
      )
   )

   (:action Construir
   ; recurso: mineral con el que se construye
   :parameters (?u - unidad ?e - edificio ?l - localizacion ?tr - tipoRecurso)
   :precondition 
      (and 
         (en ?u ?l)
         (ha_extraido ?tr)
         (exists (?te - tipoEdificio)
            (and 
               (necesita ?te ?tr)
               (esTipoEdificio ?e ?te)
            )
         )
      )   
   :effect 
      (and 
         (en ?e ?l)
      )
   )

)