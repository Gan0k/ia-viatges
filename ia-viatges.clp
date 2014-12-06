;;-------------------------------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------------------------------
;;
;;                PRACTICA 2 IA: SBC
;;
;; Alumnes: Albert Martinez
;;          Sergio Rodriguez
;;          Guido Arnau 
;; Quatrimestre: 2014 Q1
;;
;;-------------------------------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------------------------------

;;-------------------------------------------------------------------------------------------------------------
;;                    ONTOLOGIA
;;-------------------------------------------------------------------------------------------------------------

;; Aqui va el .pons

; Thu Dec 04 16:47:46 CET 2014
; 
;+ (version "3.4.8")
;+ (build "Build 629")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot name_poi
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot destinations_are
		(type INSTANCE)
;+		(allowed-classes Destination)
;+		(inverse-slot type_destination_is)
		(create-accessor read-write))
	(multislot accomodations_are
		(type INSTANCE)
;+		(allowed-classes Accomodation)
;+		(inverse-slot is_in)
		(create-accessor read-write))
	(single-slot name_city
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot name_type_dest
;+		(comment "Ex: Gran Ciutat Europea")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot has_climate
		(type INSTANCE)
;+		(allowed-classes Clima)
;+		(cardinality 1 1)
;+		(inverse-slot is_present_in)
		(create-accessor read-write))
	(single-slot departure
		(type INSTANCE)
;+		(allowed-classes Destination)
;+		(cardinality 1 1)
;+		(inverse-slot can_go_to)
		(create-accessor read-write))
	(single-slot has_activities_kids
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot rating
		(type INTEGER)
		(range 0 5)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot popularity
		(type INTEGER)
		(range 1 10)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot is_present_in
		(type INSTANCE)
;+		(allowed-classes Destination)
;+		(inverse-slot has_climate)
		(create-accessor read-write))
	(single-slot is_in
		(type INSTANCE)
;+		(allowed-classes Destination)
;+		(cardinality 1 1)
;+		(inverse-slot accomodations_are)
		(create-accessor read-write))
	(single-slot has_war
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot name_continent
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot can_be_reached
		(type INSTANCE)
;+		(allowed-classes Transport)
;+		(inverse-slot arrival)
		(create-accessor read-write))
	(single-slot type_hotel
		(type SYMBOL)
		(allowed-values Luxury Budget Regular)
		(default Regular)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot ia-viatges_Class20007
		(type SYMBOL)
;+		(allowed-parents)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot can_go_to
		(type INSTANCE)
;+		(allowed-classes Transport)
;+		(inverse-slot departure)
		(create-accessor read-write))
	(single-slot is_in_continent
		(type INSTANCE)
;+		(allowed-classes Continent)
;+		(cardinality 1 1)
;+		(inverse-slot has_destinations)
		(create-accessor read-write))
	(single-slot arrival
		(type INSTANCE)
;+		(allowed-classes Destination)
;+		(cardinality 1 1)
;+		(inverse-slot can_be_reached)
		(create-accessor read-write))
	(multislot has_destinations
		(type INSTANCE)
;+		(allowed-classes Destination)
;+		(inverse-slot is_in_continent)
		(create-accessor read-write))
	(single-slot has_ebola
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot type_dest_is
		(type INSTANCE)
;+		(allowed-classes TypeDestination)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot type_dest
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot poi_are
		(type INSTANCE)
;+		(allowed-classes PointOfInterest)
;+		(inverse-slot poi_is_in)
		(create-accessor read-write))
	(single-slot name_accom
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot has_pool
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot name_cliamte
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot inverse_of_destinations_are
		(type INSTANCE)
;+		(allowed-classes TypeDestination)
		(create-accessor read-write))
	(multislot type_city
		(type SYMBOL)
		(allowed-values BigEuropeanCity MediterraneanCity ScandinavianCity)
		(create-accessor read-write))
	(single-slot far_from_city
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot type_destination_is
		(type INSTANCE)
;+		(allowed-classes TypeDestination)
;+		(cardinality 1 1)
;+		(inverse-slot destinations_are)
		(create-accessor read-write))
	(single-slot poi_is_in
		(type INSTANCE)
;+		(allowed-classes Destination)
;+		(cardinality 1 1)
;+		(inverse-slot poi_are)
		(create-accessor read-write))
	(single-slot is_youth_hostel
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Accomodation
	(is-a USER)
	(role concrete)
	(single-slot rating
		(type INTEGER)
		(range 0 5)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot is_in
		(type INSTANCE)
;+		(allowed-classes Destination)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot name_accom
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Hostel
	(is-a Accomodation)
	(role concrete)
	(single-slot is_youth_hostel
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Camping
	(is-a Accomodation)
	(role concrete)
	(single-slot has_activities_kids
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot far_from_city
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot has_pool
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Hotel
	(is-a Accomodation)
	(role concrete)
	(single-slot type_hotel
		(type SYMBOL)
		(allowed-values Luxury Budget Regular)
		(default Regular)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Destination
	(is-a USER)
	(role concrete)
	(multislot inverse_of_destinations_are
		(type INSTANCE)
;+		(allowed-classes TypeDestination)
		(create-accessor read-write))
	(multislot can_be_reached
		(type INSTANCE)
;+		(allowed-classes Transport)
		(create-accessor read-write))
	(single-slot popularity
		(type INTEGER)
		(range 1 10)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot name_city
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot poi_are
		(type INSTANCE)
;+		(allowed-classes PointOfInterest)
		(create-accessor read-write))
	(single-slot type_destination_is
		(type INSTANCE)
;+		(allowed-classes TypeDestination)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot has_climate
		(type INSTANCE)
;+		(allowed-classes Clima)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot accomodations_are
		(type INSTANCE)
;+		(allowed-classes Accomodation)
		(create-accessor read-write))
	(multislot can_go_to
		(type INSTANCE)
;+		(allowed-classes Transport)
		(create-accessor read-write))
	(single-slot is_in_continent
		(type INSTANCE)
;+		(allowed-classes Continent)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass City
	(is-a Destination)
	(role concrete))

(defclass Mountain
	(is-a Destination)
	(role concrete))

(defclass Town
	(is-a Destination)
	(role concrete))

(defclass PointOfInterest
	(is-a USER)
	(role concrete)
	(single-slot name_poi
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot poi_is_in
		(type INSTANCE)
;+		(allowed-classes Destination)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Cultural
	(is-a PointOfInterest)
	(role concrete))

(defclass Museum
	(is-a Cultural)
	(role concrete))

(defclass Theatre
	(is-a Cultural)
	(role concrete))

(defclass Leisure "Relaxation"
	(is-a PointOfInterest)
	(role concrete))

(defclass Beach
	(is-a Leisure)
	(role concrete))

(defclass Spa
	(is-a Leisure)
	(role concrete))

(defclass Nightlife
	(is-a PointOfInterest)
	(role concrete))

(defclass Club
	(is-a Nightlife)
	(role concrete))

(defclass Sport
	(is-a PointOfInterest)
	(role concrete))

(defclass Event
	(is-a Sport)
	(role concrete))

(defclass TuristPoint
	(is-a PointOfInterest)
	(role concrete))

(defclass Building
	(is-a TuristPoint)
	(role concrete))

(defclass Park
	(is-a TuristPoint)
	(role concrete))

(defclass FamiliarPlace
	(is-a PointOfInterest)
	(role concrete))

(defclass Transport
	(is-a USER)
	(role concrete)
	(single-slot arrival
		(type INSTANCE)
;+		(allowed-classes Destination)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot departure
		(type INSTANCE)
;+		(allowed-classes Destination)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Bus
	(is-a Transport)
	(role concrete))

(defclass Plane
	(is-a Transport)
	(role concrete))

(defclass Train
	(is-a Transport)
	(role concrete))

(defclass Boat
	(is-a Transport)
	(role concrete))

(defclass TypeDestination
	(is-a USER)
	(role concrete)
	(multislot destinations_are
		(type INSTANCE)
;+		(allowed-classes Destination)
		(create-accessor read-write))
	(single-slot name_type_dest
;+		(comment "Ex: Gran Ciutat Europea")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Continent
	(is-a USER)
	(role concrete)
	(multislot has_destinations
		(type INSTANCE)
;+		(allowed-classes Destination)
		(create-accessor read-write))
	(single-slot name_continent
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Clima
	(is-a USER)
	(role concrete)
	(single-slot name_cliamte
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot is_present_in
		(type INSTANCE)
;+		(allowed-classes Destination)
		(create-accessor read-write)))

;;-------------------------------------------------------------------------------------------------------------
;;                    INSTANCIES
;;-------------------------------------------------------------------------------------------------------------

;; Aqui va el .pins

; Thu Dec 04 16:47:46 CET 2014
; 
;+ (version "3.4.8")
;+ (build "Build 629")

(definstances instances

([ia-viatges_Class0] of  City

	(has_climate [ia-viatges_Class10006])
	(is_in_continent [ia-viatges_Class3])
	(name_city "Barcelona")
	(popularity 10)
	(type_destination_is [ia-viatges_Class20004]))

([ia-viatges_Class1] of  Continent

	(name_continent "Europe"))

([ia-viatges_Class10001] of  Clima
)

([ia-viatges_Class10004] of  Clima

	(name_cliamte "Tropical"))

([ia-viatges_Class10005] of  Clima

	(name_cliamte "Mediterrani"))

([ia-viatges_Class10006] of  Clima

	(is_present_in [ia-viatges_Class0])
	(name_cliamte "Escandinau"))

([ia-viatges_Class10007] of  Clima

	(name_cliamte "Equatorial"))

([ia-viatges_Class10008] of  Clima

	(name_cliamte "Alta_Muntanya"))

([ia-viatges_Class2] of  Continent

	(name_continent "Africa"))

([ia-viatges_Class20004] of  TypeDestination

	(destinations_are [ia-viatges_Class0])
	(name_type_dest "ciutat_mediterranea"))

([ia-viatges_Class3] of  Continent

	(has_destinations [ia-viatges_Class0])
	(name_continent "Asia"))

([ia-viatges_Class4] of  Continent

	(name_continent "Oceania"))

([ia-viatges_Class5] of  Continent

	(name_continent "NorthAmerica"))

([ia-viatges_Class6] of  Continent

	(name_continent "SouthAmerica"))


)

;;; Fi del codi generat per Protege -------------------
;;; ---------------------------------------------------

;;; Inici de la solucio implementada

;;; Declaracio de classes propies

;;; Es crea una classe para las recomanacions per a poder fer llistes de recomenacions i tractarles millor

(defclass DestinacionsVisitades
    (is-a USER)
    (role concrete)
    (slot numero-dies
        (type INTEGER)
        (create-accessor read-write))
    ; Ciutat/Poble que correspon
    (slot desti
        (type INSTANCE)
        (create-accessor read-write))
    (slot puntuacio
        (type INTEGER)
        (create-accessor read-write))
    ; quines preferencies s'han complert
    (multislot justificacions
        (type STRING)
        (create-accessor read-write))
    ; pois que visitarem
    (multislot pois
        (type INSTANCE)
        (create-accessor read-write))
    (slot cost
        (type INTEGER)
        (create-accessor read-write))
)


(defclass Viatje
    (is-a USER)
    (role concrete)
    ;; Llocs visitats
    (multislot destins-visitats
        (type INSTANCE)
        (create-accessor read-write))
    ;ELS SEGUENTS SLOTS SON UN RESUM DE CADA DESTINACIO
    ; puntuacio derivada dels llocs visitats
    (slot puntuacio
        (type INTEGER)
        (create-accessor read-write))
    ; Motius dels llocs visitats
    (multislot justificacions
        (type STRING)
        (create-accessor read-write))
    ; Derived cost of visited places
    (slot cost
        (type INTEGER)
        (create-accessor read-write))

    ;; NOT YET
    ; List of used transports. not used now
    ;(multislot transports
    ;    (type INSTANCE)
    ;    (create-accessor read-write))
)


;;; Fi declaracio classes propies

;;; Main will have a multislot of 2 Trip instances

;;; Declaracio de moduls ----------------------------

;;; Modul principal d'utilitats, indiquem que exportem tot
(defmodule MAIN (export ?ALL))

;;; Modul de recopilacio de dades del usuari
(defmodule recopilacio-usuari
    (import MAIN ?ALL)
    (export ?ALL)
)

;;; Modul de recopilacio de restriccions
(defmodule recopilacio-restriccions
    (import MAIN ?ALL)
    (import recopilacio-usuari deftemplate ?ALL)
    (export ?ALL)
)

(defmodule recopilacio-prefs
    (import MAIN ?ALL)
    (import recopilacio-usuari deftemplate ?ALL)
    (import recopilacio-restriccions deftemplate ?ALL)
    (export ?ALL)
)

;;; Modul de filtrat i procesat del contingut adequat del usuari
(defmodule processat-data
    (import MAIN ?ALL)
    (import recopilacio-usuari deftemplate ?ALL)
    (import recopilacio-restriccions deftemplate ?ALL)
    (import recopilacio-prefs deftemplate ?ALL)
    (export ?ALL)
)

;;; Modul de generacio de solucions
(defmodule genera-data
    (import MAIN ?ALL)
    (export ?ALL)
)

;;; Modul de presentacio de resultats
(defmodule presentacio
    (import MAIN ?ALL)
    (export ?ALL)
)

;;; Fi declaracio de modulos ------------------------

;;; Declaracio de missatges ---------------------------

;; Imprime los datos de un contenido
(defmessage-handler MAIN::Viatje imprimir ()
    (printout t "Imprimint viatje")
)

;; Imprimir el dia
(defmessage-handler MAIN::DestinacionsVisitades imprimir ()
    (printout "Imprimint destinacions visitades")
)
    

;;; Fin declaracion de messages -----------------------


;;; Declaracio de templates. Son com structs per guardar coses

;; Template per guardar l'informacio de l'usuari
(deftemplate MAIN::Usuari
    (slot nom (type STRING))
    (slot edat (type INTEGER) (default -1))
    (slot num-pers (type INTEGER) (default -1))
    ;; Familia adolescents, Familia nens petits, FALSE
    (slot familia (type SYMBOL) (default desconegut))
    ;; Alt, Normal , Baix
    (slot nivell-cult (type SYMBOL) (default desconegut))
    ;; Boda, fin de curso, 
    (slot tipus-viatge (type SYMBOL) (default desconegut))
    ;; descans, Cultural, romantic, diversion
    (slot objectiu-viatge (type SYMBOL) (default desconegut))
)

;;; Template per les restriccions del usuari
(deftemplate MAIN::restriccions
;;Deprecated
;;    (slot min-dies (type INTEGER) (default -1)) ;;; primer
;;    (slot max-dies (type INTEGER) (default -1)) ;;; segon
    (slot num-ciutats (type INTEGER) (default -1))
    (slot num-dies-ciutat (type INTEGER) (default -1))
    (slot pressupost (type INTEGER) (default -1))
    (multislot rest-transport (type INSTANCE)) ;;;el que no agafes
    (slot min-qualitat-allotjament (type INTEGER) (default -1)) ;; Minim estrelles del allotjament
)

;;; Template per les preferencies del usuari
(deftemplate MAIN::preferencies
    (slot popularitat (type SYMBOL) (default desconegut)) ;; Necessari?
    (slot ratio-qual-diners (type SYMBOL) (default desconegut))
    (slot preferencia-llocs-exotics (type SYMBOL) (default desconegut))
    (slot pref-continent (type INSTANCE))
    (slot pref-clima (type SYMBOL) (default desconegut))
    ;; Not used so far
    ;;(slot pref-ciutat (type SYMBOL) (default desconegut))
)

;;; Fi declaracio templates -----------------------

;;; Declaracio de funcios ------------------------

;;; Funcio per obtenir el minim valor d'una llista numerica
(deffunction minim-valor ($?lista)
    (bind ?minim 100000000000)
    (progn$ (?curr $?lista)
        (if (< ?curr ?minim) then
            (bind ?minim ?curr)
        )
		)
    ?minim
)

;;; funcio per fer preguntes generals
(deffunction pregunta-general (?pregunta)
    (format t "%s " ?pregunta)
    (bind ?resposta (read))
    (while (not (lexemep ?resposta)) do
        (format t "%s " ?pregunta)
        (bind ?resposta (read))
    )
    ?resposta
)

;;; Funcio per una pregunta general general con una serie de respostes admeses
(deffunction MAIN::pregunta-opcions (?question $?allowed-values)
   (format t "%s "?question)
   (progn$ (?curr-value $?allowed-values)
        (format t "[%s]" ?curr-value)
    )
   (printout t ": ")
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (format t "%s "?question)
      (progn$ (?curr-value $?allowed-values)
        (format t "[%s]" ?curr-value)
      )
      (printout t ": ")
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer
)
   
;;; Funcio per fer una pregunta de tipus si/no
(deffunction MAIN::pregunta-si-no (?question)
   (bind ?response (pregunta-opcions ?question si no))
   (if (or (eq ?response si) (eq ?response s))
       then TRUE 
       else FALSE)
)

;;; Funcio per fer una pregunta de resposta numerica unica
(deffunction MAIN::pregunta-numerica (?pregunta ?rangini ?rangfi)
    (format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
    (bind ?resposta (read))
    (while (not(and(>= ?resposta ?rangini)(<= ?resposta ?rangfi))) do
        (format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
        (bind ?resposta (read))
    )
    ?resposta
)

;;; Funcio para hacer pregunta con index de respostas possibles
(deffunction MAIN::pregunta-index (?pregunta $?valors-possibles)
    (bind ?linia (format nil "%s" ?pregunta))
    (printout t ?linia crlf)
    (progn$ (?var ?valors-possibles) 
            (bind ?linia (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linia crlf)
    )
    (bind ?resposta (pregunta-numerica "Tria una opcio:" 1 (length$ ?valors-possibles)))
    ?resposta
)

;;; Funcio para hacer una pregunta multi-resposta con indexs
(deffunction pregunta-multi (?pregunta $?valors-possibles)
    (bind ?linia (format nil "%s" ?pregunta))
    (printout t ?linia crlf)
    (progn$ (?var ?valors-possibles) 
            (bind ?linia (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linia crlf)
    )
    (format t "%s" "Indica els numeros separats per espai: ")
    (bind ?resp (readline))
    (bind ?numeros (str-explode ?resp))
    (bind $?llista (create$ ))
    (progn$ (?var ?numeros) 
        (if (and (integerp ?var) (and (>= ?var 1) (<= ?var (length$ ?valors-possibles))))
            then 
                (if (not (member$ ?var ?llista))
                    then (bind ?llista (insert$ ?llista (+ (length$ ?llista) 1) ?var))
                )
        ) 
    )
    ?llista
)

;;; Fi declaracio de funcions


;;; Declaracio de regles i fets ---------------------

;; Primera regla que s'executa
(defrule MAIN::initialRule "Regla inicial"
    (declare (salience 10))
    =>
    (printout t "====================================================================" crlf)
    (printout t "=  Sistema de recomanacio de viatjes al fin del mundo y mas alla  =" crlf)
    (printout t "====================================================================" crlf)
    (printout t crlf)   
    (printout t "¡Benvingut al sistema de recomenacio de viatges. A continuacio se li formularan unes preguntes per poder recomenarli viatjes." crlf)
    (printout t crlf)
    (focus recopilacio-usuari)
)

;; Modul recopilacio

(defrule recopilacio-usuari::establir-nom "Estableix el nom de l'usuari"
    (not (Usuari))
    =>
    (bind ?nom (pregunta-general "Com et dius? "))
    (assert (Usuari (nom ?nom)))
)

(defrule recopilacio-usuari::establir-numpers "Estableix el nombre de persones que faran el viatge"
    ?u <- (Usuari (num-pers ?num))
    (test (< ?num 0))
    =>
    (bind ?e (pregunta-numerica "Quantes persones faran el viatge?" 1 10))
    (modify ?u (num-pers ?e))
)

;; check if this works, should be asked after numpers
(defrule recopilacio-usuari::familia "Estableix si viatja amb familia"
    ?u <- (Usuari (familia desconegut))
    =>
    (bind ?numFills (pregunta-numerica "Quants viatjants son menors?" 0 10))
    (if (> ?numFills 0) then
        (bind ?llista (create$))
        (bind ?i 0)

        (while (< ?i ?numFills) do
            (bind ?e (pregunta-numerica "Edat del fill" 0 30))
            (bind ?llista (insert$ ?llista 1 ?e))
            (bind ?i (+ 1 ?i))
        )

        (bind ?minimEdat (minim-valor ?llista))
        ;; Menys de 10 anys, nen, else, adolescents
        (if (< ?minimEdat 10) then
            (modify ?u (familia nens))
        else
            (modify ?u (familia adolescents))
        )
    else
        (modify ?u (familia FALSE))
    )
)

(defrule recopilacio-usuari::establir-edat "Estableix l'edat del usuari"
    ?u <- (Usuari (edat ?edat))
    (test (< ?edat 0))
    =>
    (bind ?e (pregunta-numerica "¿Quants anys tens? " 1 110))
    (modify ?u (edat ?e))
)

(defrule recopilacio-usuari::establir-nivellcult "Estableix el nivell cultural del usuari"
    ?u <- (Usuari (nivell-cult desconegut))
    =>
    (bind ?e (pregunta-opcions "Quin interes tens en la cultura?" alt normal baix))
    (modify ?u (nivell-cult ?e))
)

(defrule recopilacio-usuari::establir-tipusviatge "Estableix el tipus de viatge del usuari"
    ?u <- (Usuari (tipus-viatge desconegut))
    =>
    (bind ?e (pregunta-index "El teu viatge es tracta d'una celebracio especial?" boda "viatge de fi de curs" no))
    (switch ?e
        (case 1 then
            (modify ?u (tipus-viatge boda))
        )
        (case 2 then
            (modify ?u (tipus-viatge fi-curs))
        )
        (case 3 then
            (modify ?u (tipus-viatge FALSE))
        )
    )
)


(defrule recopilacio-usuari::establir-objectiu "Estableix l'objectiu del viatge"
    ?u <- (Usuari (objectiu-viatge desconegut))
    =>
    (bind ?e (pregunta-opcions "Quin es l'objectiu del viatge? " diversio romantic cultural descans))
    (modify ?u (objectiu-viatge ?e))
)


(defrule recopilacio-usuari::pasar-a-restriccions "Pasa a la recopilacio de restriccions"
    (declare (salience 10))
    ?u <- (Usuari (edat ?e) (num-pers ?n) (familia ~desconegut) (nivell-cult ~desconegut) (tipus-viatge ~desconegut) (objectiu-viatge ~desconegut)) ;Posar condicio per passar a preferencies
    (test (> ?e 0))
    (test (> ?n 0))
    =>
    (printout t "Passant a recopilacio-restriccions" crlf)
    (focus recopilacio-restriccions)
)

;-----------------------------;
; FUNCIONS MODUL RESTRICCIONS ;
;-----------------------------;

;;Deprecated
;(defrule recopilacio-restriccions::min-dies "Nombre minim de dies que voldriem que dures el viatge"
;    ?u <- (restriccions (min-dies -1))
;    =>
;    (bind ?e (pregunta-numerica "Quin es el nombre minim de dies que t'agradaria que dures el viatge?"))
;    (modify ?u (min-dies ?e))
;)
;
;
;(defrule recopilacio-restriccions::max-dies "Nombre minim de dies que voldriem que dures el viatge"
;    ?q <- (restriccions (min-dies ?d))
;    ?u <- (restriccions (max-dies -1))
;    test(> ?d -1)
;    =>
;    (bind ?e (pregunta-numerica "Quin es el nombre maxim de dies que t'agradaria que dures el viatge?" 0 9999))
;    (modify ?u (max-dies ?e))
;)

(deffacts recopilacio-restriccions::fets-inicials "Fets inicials de restriccions"
    (num-ciutats ask)
    (rest-transport ask)
    (restriccions)
)

(defrule recopilacio-restriccions::num-ciutats "Nombre de ciutats que hauria de tenir el viatge"
    ?u <- (restriccions (num-ciutats -1))
    =>
    (bind ?e (pregunta-numerica "Quin es el nombre de ciutats que t'agradaria visitar?" 1 15))
    (modify ?u (num-ciutats ?e))
)

(defrule recopilacio-restriccions::num-dies-ciutats "Nombre de dies minim que t'agradaria estar a cada ciutat"
    ?u <- (restriccions (num-dies-ciutat -1))
    =>
    (bind ?e (pregunta-numerica "Quants dies et voldires passar en aquelles ciutats?" 1 20))
    (modify ?u (num-dies-ciutat ?e))
)

(defrule recopilacio-restriccions::pressupost "Pressupost del qual disposa l'usuari"
    ?u <- (restriccions (pressupost -1))
    =>
    (bind ?e (pregunta-numerica "De quin pressupost disposes?" 0 5000))
    (modify ?u (pressupost ?e))
)

(defrule recopilacio-restriccions::rest-transport
	?fet <- (rest-transport ask)
	?re <- (preferencies)
	=>
	(bind ?r pregunta-opcions "Hi ha algun transport que no es pugui utilitzar?" Baixell Avio Tren)
	(switch ?r
        (case 1 then
            
        )
        (case 2 then
            
        )
        (case 3 then
            ;; Put instances of the prohivited class here
        )
    )
)

(defrule recopilacio-restriccions::min-qualitat-allotjament
    ?u <- (restriccions (min-qualitat-allotjament -1))
    =>
    (bind ?e (pregunta-numerica "Quantes estrelles han de tenir els hotels com a mínim" 1 5))
    (modify ?u (min-qualitat-allotjament ?e))
)


(defrule recopilacio-restriccions::pasar-a-preferencies "Pasa de la recopilacio de restriccions de preferencies"
    (declare (salience 10))
    ;; Falta posar rest-transport
    ?u <- (restriccions (num-ciutats ?n) (num-dies-ciutat ?c) (pressupost ?p) (min-qualitat-allotjament ?a)) 
    (test (> ?n 0))
    (test (> ?c 0))
    (test (> ?p 0))
    (test (> ?a 0))
    =>
    (printout t "passant a preferencies" clrf)
    (focus recopilacio-prefs)
)

;-----------------------------;
; FUNCIONS MODUL PREFERENCIES ;
;-----------------------------;

(defrule recopilacio-prefs::select-popularitat 
	?u <- (preferencies (popularitat desconegut))
	=>
	(bind ?a pregunta-si-no "Li agradaria viatjar a ciutats que son populars entre els nostres clients?")
	(if (eq ?a TRUE) then (modify ?u (popularitat alta)) else (modify ?u (popularitat baixa)))
)

(defrule recopilacio-prefs::ratio-qual-diners "Pregunta per la preferencia de major qualitat sobre menys pressupost"
    ?u <- (preferencies (ratio-qual-diners desconegut))
    =>
    (bind ?e (pregunta-opcions "Quina importancia dones a la qualitat sobre el pressupost?" baixa mitjana alta))
    (switch ?e
        (case 1 then
            (modify ?u (ratio-qual-diners baixa))
        )
        (case 2 then
            (modify ?u (ratio-qual-diners mitjana))
        )
        (case 3 then
            (modify ?u (ratio-qual-diners alta))
        )
    )
)


(defrule recopilacio-prefs::preferencia-llocs-exotics
    ?u <- (preferencies (preferencia-llocs-exotics desconegut))
    =>
    (bind ?e (pregunta-si-no "Preferiries anar a llocs exotics?"))
    (switch ?e
        (case TRUE then
            (modify ?u (preferencia-llocs-exotics TRUE))
        )
        (case FALSE then
            (modify ?u (preferencia-llocs-exotics FALSE))
        )
    )
)

;(defrule recopilacio-prefs::pref-continent

;)

;(defrule recopilacio-prefs::pref-clima
 
;)

;(defrule recopilacio-prefs::pasar-a-processat

;)

;--------------------------;
; FUNCIONS MODUL PROCESSAT ;
;--------------------------;

;; exemple

;  (defrule procesado::anadir-peliculas "Se añade todas las peliculas, luego se filtran"
;    ?hecho <- (formato Pelicula)
;    =>
;    (bind $?lista (find-all-instances ((?inst Pelicula)) TRUE))
;    (progn$ (?curr-con ?lista)
;      (make-instance (gensym) of Recomendacion (contenido ?curr-con) (puntuacion (send ?curr-con get-puntuacion)))
;    )	
;    (retract ?hecho)
;  )


;; CIUTATS
(defrule processat-data::afegir-ciutats "S'afageixen totes les ciutats"
  ; Tipus ha de ser una regla preguntada anteriorment sobr eles preferencies
	?fet <- (tipus City)
	=>
	(bind $?llista (find-all-instances ((?inst City)) TRUE))
	(progn$ (?curr ?llista)
		(make-instance (gensym) of DestinacionsVisitades (desti ?curr) (puntacio 0))
	)	
	(retract ?fet)
)


;; POBLES
(defrule processat-data::afegir-pobles "S'afageixen totes les pobles"
	?fet <- (tipus Town)
	=>
	(bind $?llista (find-all-instances ((?inst Town)) TRUE))
	(progn$ (?curr ?llista)
		(make-instance (gensym) of DestinacionsVisitades (desti ?curr) (puntacio 0))
	)	
	(retract ?fet)
)

;; MUNTANYES
(defrule processat-data::afegir-muntanyes "S'afageixen totes les muntanyes"
	?fet <- (tipus Mountain)
	=>
	(bind $?llista (find-all-instances ((?inst Mountain)) TRUE))
	(progn$ (?curr ?llista)
		(make-instance (gensym) of DestinacionsVisitades (desti ?curr) (puntacio 0))
	)	
	(retract ?fet)
)




;; Valorar popularitat
(defrule processat-data::valorar-popularitat "Es valorara la popularitat del lloc"
    (preferencies (popularitat ?popDesitjada))
    ?dest <- (object (is-a Destination) (popularity ?pop))
    ?destVisitades <-(object (is-a DestinacionsVisitades) (puntuacio ?punt) (justificacions $?just))
    (test (eq (instance-name ?dest) (instance-name ?destVisitades)))
    (not (valorat-popularitat ?dest))
    =>
    (if (eq ?popDesitjada ?pop) then
        (bind ?p (+ ?p 100))
        (bind $?just (insert$ $?just (+ (length$ $?just) 1) "L'usuari vols una popularitat TODO add which"))
    )

    (send ?destVisitades put-puntuacio ?punt)
    (send ?destVisitades put-justificacions $?just)
    (assert (valorar-popularitat ?dest))
)




;; Filtrar allotjaments per qualtiat
(defrule processat-data::filtrar-qualitat-allotjament "Es filtraran els allotjaments que no tinguin prou qualitat"
    ;; Qualitat is numeric
    (restriccions (min-qualitat-allotjament ?minQualitat))
    ?dest <- (object (is-a Destination) (accomodations_are $?acoms))
    ?destVisitades <- (object (is-a DestinacionsVisitades))
    (test (eq (instance-name ?dest) (instance-name ?destVisitades)))
    (not (filtrat-qualitat ?dest))
    =>
    (progn$ (?curr-acom $?acoms) ;Iterar per totes les accomodations
        (bind ?qual (send ?curr-acom get-quality))
        (if (< ?qual ?minQualitat) then
            (send ?curr-acom delete)
        )
    )
)

