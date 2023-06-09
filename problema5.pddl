; Alumna: Cristina Sánchez Justicia 
; Práctica 3 TSI 

(define (problem ReclutarUnidades)
    (:domain StarCraft)
    (:objects
        ; Se van a usar tres unidades 
        vce1 vce2 vce3 - unidad
        Marine1 Marine2 - unidad
        Soldado1 - unidad
        ; Investigación a realizar
        Spartan - investigacion
        ; Se indica la instancia de los edificios que habrá aunque 
        ; a algunos solo se les asigne una localización durante 
        ; la ejecución 
        centro1 extractor barracones1 laboratorio1 - edificio
        ; Se definen los nodos 
        c1_1 c1_2 c1_3 c1_4 c1_5 c2_1 c2_2 c2_3 c2_4 c3_1 c3_2 c3_3 c3_4 c4_2 c4_3 c4_4 - localizacion
    )
    (:init
        ; Se indican los tipos de las unidades a usar 
        (esTipoUnidad vce1 VCE)
        (esTipoUnidad vce2 VCE)
        (esTipoUnidad vce3 VCE)
        (esTipoUnidad Marine1 Marine)
        (esTipoUnidad Marine2 Marine)
        (esTipoUnidad Soldado1 Soldado)

        ; Elementos con los que se comienza la partida 
        (unidadReclutada vce1)
        (edificioConstruido centro1)

        ; Se indican los tipos de los edificios a usar
        (esTipoEdificio extractor Extractor)
        (esTipoEdificio barracones1 Barracones)
        (esTipoEdificio centro1 CentroDeMando)
        (esTipoEdificio laboratorio1 Laboratorio)

        ; Se indican las posiciones de los objetos 
        (en centro1 c1_1)
        (en Minerales c2_2)
        (en Minerales c4_4)
        (en Gas c1_5)
        (en vce1 c1_1)
        (en Especia c1_3)
        
        ; Materiales necesarios para construir edificios 
        (necesita Extractor Minerales)
        (necesita Barracones Minerales)
        (necesita Barracones Gas)
        (necesita Laboratorio Minerales)
        (necesita Laboratorio Gas)

        (investigarNecesita Spartan Minerales)
        (investigarNecesita Spartan Gas)
        (investigarNecesita Spartan Especia)
        
        ; Materiales necesarios para reclutar unidades 
        (reclutarNecesita Marine Minerales)
        (reclutarNecesita VCE Minerales)
        (reclutarNecesita Soldado Minerales)
        (reclutarNecesita Soldado Gas)

        ; Se definen las aristas que conectan los nodos que 
        ; representan el mundo 
        (camino c1_1 c2_1)(camino c1_1 c1_2)(camino c1_2 c2_2)
        (camino c1_2 c1_1)(camino c1_3 c2_3)(camino c1_4 c2_4)
        (camino c1_4 c1_5)(camino c1_5 c1_4)(camino c1_5 c4_4)
        (camino c2_1 c1_1)(camino c2_1 c3_1)(camino c2_2 c1_2)
        (camino c2_2 c3_2)(camino c2_2 c2_3)(camino c2_3 c3_3)
        (camino c2_3 c2_4)(camino c2_3 c2_2)(camino c2_4 c1_4)
        (camino c2_4 c2_3)(camino c3_1 c2_1)(camino c3_1 c3_2)
        (camino c3_2 c2_2)(camino c3_2 c4_2)(camino c3_2 c3_1)
        (camino c3_3 c2_3)(camino c3_4 c4_4)(camino c4_2 c3_2)
        (camino c4_2 c4_3)(camino c4_3 c4_4)(camino c4_3 c4_2)
        (camino c4_4 c3_4)(camino c4_4 c4_3)(camino c4_4 c1_5)
        (camino c2_3 c1_3)
    )
    (:goal
        (and
            ; Construir unos barracones en la posición 14
            (en barracones1 c1_4)
            ; Construir un laboratorio en la posición 12
            (en laboratorio1 c1_2)
            ; Que los dos marines y el soldado estén en la posición 14
            (en Marine1 c1_4)
            (en Marine2 c1_4)
            (en Soldado1 c1_4)
        )
    )
)