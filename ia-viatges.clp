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

;;-------------------------------------------------------------------------------------------------------------
;;                    INSTANCIES
;;-------------------------------------------------------------------------------------------------------------

;; Aqui va el .pins


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
(defmodule process-data
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
    (slot num-dies (type INTEGER))
    (slot num-ciutats (type INTEGER))
    (slot num-dies-ciutat (type INTEGER))
    (slot presupost (type INTEGER))
    (multislot rest-transport (type INSTANCE))
    (slot min-quaitat-allotjament (type INSTANCE))
)

;;; Template per les preferencies del usuari
(deftemplate MAIN::preferencies
    (slot ratio-qual-diners (type INTEGER))
    (slot preferencia-llocs-exotics (type INTEGER))
    (slot pref-continent (type INSTANCE))
    (slot pref-clima (type SYMBOL))
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
    (bind ?resposta (pregunta-numerica "Escoge una opción:" 1 (length$ ?valors-possibles)))
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
    (printout t "=  Sistema de recomanacio de viatjes al fin del mundo y mas allá  =" crlf)
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
    (bind ?e (pregunta-opcions "Tens interes en la cultura?" alt normal baix))
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
    (focus recopilacio-restriccions)
)
