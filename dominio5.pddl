; Alumna: Cristina Sánchez Justicia 
; Práctica 3 TSI 

(define (domain StarCraft)
   ; Para hacer lógica más avanzada 
   (:requirements :adl )
   (:types
      posicionable localizacion - object
      ; Unidad y edificio son clases y tipoEdificio y tipoRecurso
      ; son clases abstractas
      unidad edificio tipoUnidad tipoEdificio tipoRecurso - posicionable
   )
   ; En el ejercicio se utilizan VCE, Extractor y ambos recursos 
   (:constants 
      CentroDeMando Barracones Extractor Laboratorio - tipoEdificio
      VCE - tipoUnidad
      Marine - tipoUnidad
      Soldado - tipoUnidad
      Minerales Gas - tipoRecurso
   )
   ; Molde para los predicados que definen el mundo 
   (:predicates
      ; Indica si una unidad está asignada a un nodo con recursos 
      (asignado ?u - unidad)
      
      ; Indica la posición de los objetos en el mundo 
      (en ?p - posicionable ?x - localizacion)
      
      ; Indica la conexión entre dos nodos 
      (camino ?x - localizacion ?y - localizacion)
      
      ; Se ha extraído un recurso. Una vez que se extraen se tienen 
      ; recursos infinitos durante toda la partida 
      (ha_extraido ?tr - tipoRecurso)
      
      ; Indica el tipo de edificio 
      (esTipoEdificio ?e - edificio ?t - tipoEdificio)
      
      ; Indica el tipo de la unidad 
      (esTipoUnidad ?u - unidad ?t - tipoUnidad)
      
      ; Indica los requisitos para construir un edificio 
      (necesita ?te - tipoEdificio ?tr - tipoRecurso)

      ; Indica los requisitos para reclutar una unidad
      (reclutarNecesita ?tu - tipoUnidad ?tr - tipoRecurso)

      ; Indica que el edificio ha sido construido 
      (edificioConstruido ?e - edificio)

      ; Infica que una unidad ha sido reclutada
      (unidadReclutada ?u - unidad)
   )
   
   (:action Investigar
   :parameters (?e - edificio ?i - investigacion)
   :precondition 
      (and 
      
      )
   :effect 
      (and 
      
      )
   )

   ; Se crean nuevas unidades
   (:action Reclutar
   :parameters (?e - edificio ?u - unidad ?l - localizacion)
   :precondition 
      (and
         ; No puede estar reclutada ya  
         (not (unidadReclutada ?u))
         ; Tiene que existir el edificio en la localización
         (en ?e ?l)
         ; El edificio tiene que ser el apropiado
         (imply (esTipoUnidad ?u VCE)
            (esTipoEdificio ?e CentroDeMando)
         )         
         (imply (esTipoUnidad ?u Marine)
            (esTipoEdificio ?e Barracones)
         )         
         (imply (esTipoUnidad ?u Soldado)
            (esTipoEdificio ?e Barracones)
         )         
         
         ; Hay que tener los materiales necesarios 
         ; Existe un tipo de unidad tal que la unidad es de ese 
         ; tipo y para todos los recursos si los necesita, se han 
         ; extraído 
         (exists (?tu - tipoUnidad) 
            (and (esTipoUnidad ?u ?tu)
               ; para todos los recursos, la unidad no necesita el recurso 
               ; o lo necesita y se está extrayendo
               (forall (?tr - tipoRecurso) 
               ; Si el tipo de edificio necesita el material, se 
               ; comprueba que se ha extraido 
                  (or 
                     (not (reclutarNecesita ?tu ?tr))
                     (and (ha_extraido ?tr)
                     (reclutarNecesita ?tu ?tr))
                  )
               )
            )
         )        
      )
   :effect 
      (and 
         ; Se genera una unidad en la localización 
         (en ?u ?l)

      )
   )

   ; Cambia una unidad a otra posición si hay una unión para llegar 
   (:action Navegar
   ; Recibe la unidad, la posición donde se encuentra y la posición 
   ; donde se quiere ir 
   :parameters (?u - unidad ?x ?y - localizacion)
   :precondition
   ; debe existir un camino entre los dos nodos y la unidad debe 
   ; estar situada en la primera 
      (and
         ; La unidad no puede estar asignada
         (not (asignado ?u))
         (camino ?x ?y)
         (en ?u ?x)
      )
   :effect
      (and
         (en ?u ?y)
         ; La unidad deja de estar en la posición anterior 
         (not (en ?u ?x))
      )
   )

   ; Se coloca a una unidad en una posición con un tipo de recurso 
   ; para el resto de la partida 
   (:action Asignar
   ; tr: tipo de recurso que hay en l 
   :parameters (?u - unidad ?l - localizacion ?tr - tipoRecurso)
   :precondition
      (and
         ; Una vez se asigna la unidad, se queda asignada para el
         ; resto de la partida  
         (not (asignado ?u))
         ; La unidad tiene que estar en la localización a asignar 
         (en ?u ?l)
         ; Tiene que haber un tipo de recurso en esa localización 
         (en ?tr ?l)
         (imply
            ; Para poder extraer gas tiene que haber un extractor 
            (en Gas ?l)
            (exists
               ; Se busca entre todos los edificios uno que sea un 
               ; extractor 
               ; El extractor tiene que estar en la localización 
               ; adecuada 
               (?e - Edificio)
               (and (en ?e ?l) (esTipoEdificio ?e Extractor)
               )
            )
         )
      )
   :effect
      (and
         ; Una vez asignada la unidad, extrar el material 
         (ha_extraido ?tr)
         ; La unidad se asigna hasta el final de la partida  
         (asignado ?u)
      )
   )

   ; Construye un edificio, siempre que se hayan extraido los 
   ; materiales necesarios 
   (:action Construir
   ; edificio: Edificio que se quiere construir
   ; localización: dónde se quiere construir. La unidad tiene que
   ; estar situada ahí  
   ; Los materiales con los que se construye no se pasan por 
   ; parámetro sino que se buscan dentro de la acción
   :parameters (?u - unidad ?e - edificio ?l - localizacion)
   :precondition 
      (and 
         ; La unidad tiene que estar en la localización
         ; La unidad no puede estar asignada  
         (en ?u ?l)
         (not (asignado ?u))
         ; Se debe evitar que se construya más de un edificio en la 
         ; misma localización
         (not (en ?e ?l))         
         (not (edificioConstruido ?e))
         (forall (?e - edificio)
            (and 
               (not (en ?e ?l))
            )
         )
         ; El extractor tiene que estar en un nodo con gas vespeno
         (imply (esTipoEdificio ?e extractor)
            (and (en Gas ?l))
         )
         ; Se tienen que tener los recursos correspondientes
         ; Existe un tipo de edificio tal que el edificio es de ese 
         ; tipo y para todos los recursos si los necesita, los ha 
         ; extraído 
         (exists (?te - tipoEdificio) 
            (and (esTipoEdificio ?e ?te)
               ; para todos los recursos, el edificio no necesita el recurso 
               ; o lo necesita y se está extrayendo
               (forall (?tr - tipoRecurso) 
               ; Si el tipo de edificio necesita el material, se 
               ; comprueba que se ha extraido 
                  (or 
                     (not (necesita ?te ?tr))
                     (and (ha_extraido ?tr)
                     (necesita ?te ?tr))
                  )
               )
            )
         )
         ; Precondiciones redundantes 
         (esTipoUnidad ?u VCE)  
      )
   :effect 
      (and 
         ; Se asigna un edificio en esa localización 
         (en ?e ?l)
         (edificioConstruido ?e)
      )
   )
)