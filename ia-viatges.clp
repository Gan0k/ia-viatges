;;-------------------------------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------------------------------
;;
;;                PRACTICA 2 IA: SBC
;;
;; Alumnos: Albert Martinez
;;          Sergio Rodriguez
;;          Guido Arnau 
;; Cuatrimestre: 2014 Q1
;;
;;-------------------------------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------------------------------

;;-------------------------------------------------------------------------------------------------------------
;;                    ONTOLOGY
;;-------------------------------------------------------------------------------------------------------------

;; Aqui va el .pons

;;-------------------------------------------------------------------------------------------------------------
;;                    INSTANCES
;;-------------------------------------------------------------------------------------------------------------

;; Aqui va el .pins


;;; Fi del codi generat per Protege -------------------
;;; ---------------------------------------------------

;;; Inici de la solucio implementada

;;; Declaracio de classes propies

;;; Es crea una classe para las recomanacions per a poder fer llistes de recomenacions i tractarles millor

(defclass VisitedDestination
    (is-a USER)
    (role concrete)
    (slot number-days
        (type INTEGER)
        (create-acessor read-write))
    (slot destination
        (type INSTANCE)
        (create-accessor read-write))
    (slot score
        (type INTEGER)
        (create-accessor read-write))
    ; preferencies completes
    (multislot reasons
        (type STRING)
        (create-accessor read-write))
    (multislot pois
        (type INSTANCE)
        (create-accessor read-write))
    (slot cost
        (type INTEGER)
        (create-accessor read-write))
)


(defclass Trip 
    (is-a USER)
    (role concrete)
    (multislot visited-destinations
        (type INSTANCE)
        (create-accessor read-write))
    ; derived score from visited places
    (slot score
        (type INTEGER)
        (create-accessor read-write))
    ; Reasons of visited places
    (multislot reasons
        (type STRING)
        (create-accessor read-write))
    ; Derived cost of visited places
    (slot cost
        (type INTEGER)
        (create-accessor read-write))

    ; List of used transports. not used now
    ;(multislot transports
    ;    (type INSTANCE)
    ;    (create-accessor read-write))

    ; List of visited destinations
    (multislot visited-destinations
        (type INSTANCE)
        (create-accessor read-write))
)


;;; Fi declaracio classes propies

;;; Main will have a multislot of 2 Trip instances