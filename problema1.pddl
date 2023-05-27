; Alumna: Cristina Sánchez Justicia 
; Práctica 3 TSI 
(define (problem GenerarMinerales)
    (:domain StarCraft)
    (:objects
        ; Este problema solo utiliza un VCE 
        vce1 - unidad
        centro1  - edificio
        ; Se definen los nodos del grafo que representa el mundo 
        c1_1 c1_2 c1_3 c1_4 c1_5 c2_1 c2_2 c2_3 c2_4 c3_1 c3_2 c3_3 c3_4 c4_2 c4_3 c4_4 - localizacion
    )
    (:init
        ; Se definen los tipos de los elementos que van a ser utilizados durante el problema 
        (esTipoUnidad vce1 VCE)
        (esTipoEdificio centro1 CentroDeMando)
        ; Se posicionan los elementos que van a ser utilizados durante el problema 
        (en centro1 c1_1)
        (en Minerales c2_4)
        (en Minerales c4_4)
        (en vce1 c1_1)
        ; Se definen las aristas que unen los nodos del grafo que representa el mundo 
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
            (ha_extraido Minerales)
        )
    )
)