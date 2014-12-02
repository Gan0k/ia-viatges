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
        (create-acessor read-write))
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

    ; Llista de llocs visitats 
    (multislot destins-visitats
        (type INSTANCE)
        (create-accessor read-write))
)


;;; Fi declaracio classes propies

;;; Main will have a multislot of 2 Trip instances

;;; Declaracio de moduls ----------------------------

;;; Modul principal d'utilitats, indiquem que exportem tot
(defmodule MAIN (export ?ALL))

;;; Modul de recopilacio de dades del usuari
(defmodule recopilarcio-usr
    (import MAIN ?ALL)
    (export ?ALL)
)

(defmodule recopilacio-prefs
    (import MAIN ?ALL)
    (import recopilacio-usr deftemplate ?ALL)
    (export ?ALL)
)

;;; Modul de filtrat i procesat del contingut adequat del usuari
(defmodule process-data
    (import MAIN ?ALL)
    (import recopilacio-usr deftemplate ?ALL)
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
(defmessage-handler MAIN::Contenido imprimir ()
    (format t "Titulo: %s %n" ?self:titulo)
    (format t "Formato: %s" (class ?self))
    (printout t crlf)
    (format t "Anyo: %d" ?self:anyo)
    (printout t crlf)
    (printout t "País: ")
    (progn$ (?curr-pais (send ?self get-hecha_en))
        (format t "%s " (send ?curr-pais get-nacionalidad))
    )
    (printout t crlf)
    (format t "Idioma: %s" (send ?self:en_idioma get-idioma))   
    (printout t crlf)
    (format t "Duración: %d" ?self:duracion)
    (printout t crlf)
    (format t "Edad mínima recomendada: %d" ?self:clasificacion_edades)
    (printout t crlf)
    (format t "Puntuación de los usuarios: %d" ?self:puntuacion)
    (printout t crlf)
)

(defmessage-handler MAIN::Recomendacion imprimir ()
    (printout t "-----------------------------------" crlf)
    (printout t (send ?self:contenido imprimir))
    (printout t crlf)
    (format t "Nivel de recomendación: %d %n" ?self:puntuacion)
    (printout t "Justificación: " crlf)
    (progn$ (?curr-just ?self:justificaciones)
        (printout t ?curr-just crlf)
    )
    (printout t crlf)
    (printout t "-----------------------------------" crlf)
)

(defmessage-handler MAIN::Dia imprimir ()
    (printout t "============================================" crlf)
    (printout t (instance-name ?self) crlf)
    (bind $?recs ?self:recomendaciones)
    (progn$ (?curr-rec $?recs)
        (printout t (send ?curr-rec imprimir))
    )
    (printout t "============================================" crlf)
)
    

;;; Fin declaracion de messages -----------------------


;;; Declaracio de templates. Son com structs per guardar coses

;; Template per guardar l'informacio de l'usuari
(deftemplate MAIN::Usuari
    (slot nom (type STRING))
    (slot sexe (type SYMBOL) (default desconegut))
    (slot edat (type INTEGER) (default -1))
    (slot familia (type SYMBOL) (default desconegut))
)

;;; Fi declaracio templates -----------------------




;;; Declaracion de reglas y hechos

;;; Declaracion de reglas y hechos ---------------------

;; Primera regla que s'executa
(defrule MAIN::initialRule "Regla inicial"
    (declare (salience 10))
    =>
    (printout t "====================================================================" crlf)
    (printout t "=  Sistema de recomendacio de viatjes al fin del mundo y mas allá  =" crlf)
    (printout t "====================================================================" crlf)
    (printout t crlf)   
    (printout t "¡Benvingut al sistema de recomenacio de viatges. A continuacio se li formularan unes preguntes per poder recomenarli viatjes." crlf)
    (printout t crlf)
    (focus recopilacio-usr)
)

;; Modul recopilacio
(defrule recopilacio-usr::establir-nom "Estableix el nom de l'usuari"
    (not (Usuari))
    =>
    (bind ?nom (pregunta-general "Com et dius? "))
    (assert (Usuari (nom ?nom)))
)



