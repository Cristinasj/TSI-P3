; Alumna: Cristina Sánchez Justicia 
; Práctica 3 TSI 

(define (problem GenerarGas)
    (:domain StarCraft)
    (:objects
        ; Se van a usar dos unidades 
        vce1 vce2 - unidad
        ; Se construirá un extractor. Se indica la instancia y 
        ; se le asigna una localización durante la ejecución 
        centro1 extractor - edificio
        ; Se definen los nodos 
        c1_1 c1_2 c1_3 c1_4 c1_5 c2_1 c2_2 c2_3 c2_4 c3_1 c3_2 c3_3 c3_4 c4_2 c4_3 c4_4 - localizacion
    )
    (:init
        ; Se indican los tipos de los objetos a usar 
        (esTipoUnidad vce1 VCE)
        (esTipoEdificio extractor Extractor)
        (esTipoEdificio centro1 CentroDeMando)
        
        ; Se indican las posiciones de los objetos 
        (en centro1 c1_1)
        (en Minerales c2_4)
        (en Minerales c4_4)
        (en Gas c1_5)
        (en vce1 c1_1)
        (en vce2 c1_1)
        
        ; Materiales necesarios para construir edificios 
        (necesita Extractor Minerales)
        
        ; Se definen las aristas que conectan los nodos que 
        ; representan el mundo 
        (camino c1_1 c2_1)
        (camino c1_1 c1_2)
        (camino c1_2 c2_2)
        (camino c1_2 c1_1)
        (camino c1_3 c2_3)
        (camino c1_4 c2_4)
        (camino c1_4 c1_5)
        (camino c1_5 c1_4)
        (camino c1_5 c4_4)
        (camino c2_1 c1_1)
        (camino c2_1 c3_1)
        (camino c2_2 c1_2)
        (camino c2_2 c3_2)
        (camino c2_2 c2_3)
        (camino c2_3 c3_3)
        (camino c2_3 c2_4)
        (camino c2_3 c2_2)
        (camino c2_4 c1_4)
        (camino c2_4 c2_3)
        (camino c3_1 c2_1)
        (camino c3_1 c3_2)
        (camino c3_2 c2_2)
        (camino c3_2 c4_2)
        (camino c3_2 c3_1)
        (camino c3_3 c2_3)
        (camino c3_4 c4_4)
        (camino c4_2 c3_2)
        (camino c4_2 c4_3)
        (camino c4_3 c4_4)
        (camino c4_3 c4_2)
        (camino c4_4 c3_4)
        (camino c4_4 c4_3)
        (camino c4_4 c1_5)
    )
    (:goal
        (and
            ; El objetivo es conseguir gas
            (ha_extraido Gas)
        )
    )
)