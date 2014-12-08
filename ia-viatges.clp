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

; Mon Dec 08 20:06:18 CET 2014
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
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot is_present_in
		(type INSTANCE)
;+		(allowed-classes Destination)
;+		(inverse-slot has_climate)
		(create-accessor read-write))
	(single-slot price_per_night
		(type INTEGER)
;+		(cardinality 1 1)
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
	(single-slot name_climate
		(type STRING)
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
	(single-slot price_per_night
		(type INTEGER)
;+		(cardinality 1 1)
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

(defclass Destination
	(is-a USER)
	(role concrete)
	(multislot can_be_reached
		(type INSTANCE)
;+		(allowed-classes Transport)
		(create-accessor read-write))
	(multislot inverse_of_destinations_are
		(type INSTANCE)
;+		(allowed-classes TypeDestination)
		(create-accessor read-write))
	(single-slot popularity
		(type STRING)
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
	(multislot can_go_to
		(type INSTANCE)
;+		(allowed-classes Transport)
		(create-accessor read-write))
	(multislot accomodations_are
		(type INSTANCE)
;+		(allowed-classes Accomodation)
		(create-accessor read-write))
	(single-slot has_climate
		(type INSTANCE)
;+		(allowed-classes Clima)
;+		(cardinality 1 1)
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

(defclass Leisure "Relaxation"
	(is-a PointOfInterest)
	(role concrete))

(defclass Nightlife
	(is-a PointOfInterest)
	(role concrete))

(defclass Sport
	(is-a PointOfInterest)
	(role concrete))

(defclass TuristPoint
	(is-a PointOfInterest)
	(role concrete))

(defclass FamiliarPlace
	(is-a PointOfInterest)
	(role concrete))

(defclass Spa
	(is-a PointOfInterest)
	(role concrete))

(defclass Beach
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

(defclass Plane
	(is-a Transport)
	(role concrete))

(defclass Boat
	(is-a Transport)
	(role concrete))

(defclass Train
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
	(multislot is_present_in
		(type INSTANCE)
;+		(allowed-classes Destination)
		(create-accessor read-write))
	(single-slot name_climate
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

;;-------------------------------------------------------------------------------------------------------------
;;                    INSTANCIES
;;-------------------------------------------------------------------------------------------------------------


(definstances instances

; Mon Dec 08 20:06:18 CET 2014
; 
;+ (version "3.4.8")
;+ (build "Build 629")

([MAIN::ia-viatges_Class0] of  TypeDestination

	(destinations_are [MAIN::ia-viatges_Class30034])
	(name_type_dest "gran_ciutat_europea"))

([MAIN::ia-viatges_Class1] of  Continent

	(has_destinations
		[MAIN::ia-viatges_Class30022]
		[MAIN::ia-viatges_Class30040]
		[MAIN::ia-viatges_Class40045])
	(name_continent "Europe"))

([MAIN::ia-viatges_Class10000] of  Accomodation

	(name_accom "Hotel Arts")
	(price_per_night 1300)
	(rating 5))

([MAIN::ia-viatges_Class10004] of  Clima

	(is_present_in [MAIN::ia-viatges_Class30034])
	(name_climate "Tropical"))

([MAIN::ia-viatges_Class10005] of  Clima

	(is_present_in
		[MAIN::ia-viatges_Class30028]
		[MAIN::ia-viatges_Class30055]
		[MAIN::ia-viatges_Class40045])
	(name_climate "Mediterrani"))

([MAIN::ia-viatges_Class10006] of  Clima

	(is_present_in
		[MAIN::ia-viatges_Class30052]
		[MAIN::ia-viatges_Class30061])
	(name_climate "Escandinau"))

([MAIN::ia-viatges_Class10007] of  Clima

	(is_present_in
		[MAIN::ia-viatges_Class30016]
		[MAIN::ia-viatges_Class30046]
		[MAIN::ia-viatges_Class30049])
	(name_climate "Equatorial"))

([MAIN::ia-viatges_Class10008] of  Clima

	(is_present_in
		[MAIN::ia-viatges_Class30008]
		[MAIN::ia-viatges_Class30022]
		[MAIN::ia-viatges_Class30040])
	(name_climate "Alta_Muntanya"))

([MAIN::ia-viatges_Class2] of  Continent

	(has_destinations
		[MAIN::ia-viatges_Class30008]
		[MAIN::ia-viatges_Class30016]
		[MAIN::ia-viatges_Class30046])
	(name_continent "Africa"))

([MAIN::ia-viatges_Class20000] of  Nightlife

	(name_poi "JartyPard")
	(poi_is_in [MAIN::ia-viatges_Class30055]))

([MAIN::ia-viatges_Class20001] of  Accomodation

	(name_accom "EuroPark")
	(price_per_night 200)
	(rating 3))

([MAIN::ia-viatges_Class20002] of  Cultural

	(name_poi "Sagrada Familia")
	(poi_is_in [MAIN::ia-viatges_Class30008]))

([MAIN::ia-viatges_Class20004] of  TypeDestination

	(destinations_are
		[MAIN::ia-viatges_Class30008]
		[MAIN::ia-viatges_Class30016]
		[MAIN::ia-viatges_Class30049]
		[MAIN::ia-viatges_Class40045])
	(name_type_dest "ciutat_mediterranea"))

([MAIN::ia-viatges_Class3] of  Continent

	(has_destinations [MAIN::ia-viatges_Class30034])
	(name_continent "Asia"))

([MAIN::ia-viatges_Class30001] of  TypeDestination

	(destinations_are
		[MAIN::ia-viatges_Class30022]
		[MAIN::ia-viatges_Class30040]
		[MAIN::ia-viatges_Class30046]
		[MAIN::ia-viatges_Class30055])
	(name_type_dest "ciutat_tropical"))

([MAIN::ia-viatges_Class30002] of  TypeDestination

	(destinations_are
		[MAIN::ia-viatges_Class30028]
		[MAIN::ia-viatges_Class30052]
		[MAIN::ia-viatges_Class30061])
	(name_type_dest "ciutat_arida"))

([MAIN::ia-viatges_Class30008] of  City

	(accomodations_are
		[MAIN::ia-viatges_Class40002]
		[MAIN::ia-viatges_Class40003]
		[MAIN::ia-viatges_Class40004]
		[MAIN::ia-viatges_Class40021]
		[MAIN::ia-viatges_Class40022])
	(can_be_reached [MAIN::ia-viatges_Class40046])
	(can_go_to
		[MAIN::ia-viatges_Class40060]
		[MAIN::ia-viatges_Class40081])
	(has_climate [MAIN::ia-viatges_Class10008])
	(is_in_continent [MAIN::ia-viatges_Class2])
	(name_city "Culturia")
	(poi_are
		[MAIN::ia-viatges_Class30009]
		[MAIN::ia-viatges_Class20002]
		[MAIN::ia-viatges_Class30013]
		[MAIN::ia-viatges_Class30014]
		[MAIN::ia-viatges_Class30015]
		[MAIN::ia-viatges_Class40023]
		[MAIN::ia-viatges_Class40024])
	(popularity "alta")
	(type_destination_is [MAIN::ia-viatges_Class20004]))

([MAIN::ia-viatges_Class30009] of  Cultural

	(name_poi "caerPoi")
	(poi_is_in [MAIN::ia-viatges_Class30008]))

([MAIN::ia-viatges_Class30010] of  Sport

	(name_poi "caerSport"))

([MAIN::ia-viatges_Class30013] of  Cultural

	(name_poi "fallPoi")
	(poi_is_in [MAIN::ia-viatges_Class30008]))

([MAIN::ia-viatges_Class30014] of  Cultural

	(name_poi "gluor")
	(poi_is_in [MAIN::ia-viatges_Class30008]))

([MAIN::ia-viatges_Class30015] of  Cultural

	(name_poi "museumClub")
	(poi_is_in [MAIN::ia-viatges_Class30008]))

([MAIN::ia-viatges_Class30016] of  City

	(accomodations_are
		[MAIN::ia-viatges_Class40005]
		[MAIN::ia-viatges_Class40025]
		[MAIN::ia-viatges_Class40026]
		[MAIN::ia-viatges_Class40027])
	(can_be_reached
		[MAIN::ia-viatges_Class40047]
		[MAIN::ia-viatges_Class40080])
	(can_go_to
		[MAIN::ia-viatges_Class40061]
		[MAIN::ia-viatges_Class40082])
	(has_climate [MAIN::ia-viatges_Class10007])
	(is_in_continent [MAIN::ia-viatges_Class2])
	(name_city "Bail")
	(poi_are
		[MAIN::ia-viatges_Class30017]
		[MAIN::ia-viatges_Class30018]
		[MAIN::ia-viatges_Class30019]
		[MAIN::ia-viatges_Class30020]
		[MAIN::ia-viatges_Class30021])
	(popularity "baixa")
	(type_destination_is [MAIN::ia-viatges_Class20004]))

([MAIN::ia-viatges_Class30017] of  Nightlife

	(name_poi "DiscoRave")
	(poi_is_in [MAIN::ia-viatges_Class30016]))

([MAIN::ia-viatges_Class30018] of  Leisure

	(name_poi "TangoDJ")
	(poi_is_in [MAIN::ia-viatges_Class30016]))

([MAIN::ia-viatges_Class30019] of  Nightlife

	(name_poi "CopaCabana")
	(poi_is_in [MAIN::ia-viatges_Class30016]))

([MAIN::ia-viatges_Class30020] of  Nightlife

	(name_poi "Razzmatazz")
	(poi_is_in [MAIN::ia-viatges_Class30016]))

([MAIN::ia-viatges_Class30021] of  Nightlife

	(name_poi "HardcoreHall")
	(poi_is_in [MAIN::ia-viatges_Class30016]))

([MAIN::ia-viatges_Class30022] of  City

	(accomodations_are
		[MAIN::ia-viatges_Class40006]
		[MAIN::ia-viatges_Class40028]
		[MAIN::ia-viatges_Class40029]
		[MAIN::ia-viatges_Class40030])
	(can_be_reached [MAIN::ia-viatges_Class40048])
	(can_go_to
		[MAIN::ia-viatges_Class40062]
		[MAIN::ia-viatges_Class40083])
	(has_climate [MAIN::ia-viatges_Class10008])
	(is_in_continent [MAIN::ia-viatges_Class1])
	(name_city "Asgard")
	(poi_are
		[MAIN::ia-viatges_Class30023]
		[MAIN::ia-viatges_Class30024]
		[MAIN::ia-viatges_Class30025]
		[MAIN::ia-viatges_Class30026]
		[MAIN::ia-viatges_Class30027])
	(popularity "alta")
	(type_destination_is [MAIN::ia-viatges_Class30001]))

([MAIN::ia-viatges_Class30023] of  Leisure

	(name_poi "TermalWaters")
	(poi_is_in [MAIN::ia-viatges_Class30022]))

([MAIN::ia-viatges_Class30024] of  Leisure

	(name_poi "SpaZone")
	(poi_is_in [MAIN::ia-viatges_Class30022]))

([MAIN::ia-viatges_Class30025] of  Leisure

	(name_poi "ContextFreeLeisure")
	(poi_is_in [MAIN::ia-viatges_Class30022]))

([MAIN::ia-viatges_Class30026] of  Leisure

	(name_poi "OdinsHall")
	(poi_is_in [MAIN::ia-viatges_Class30022]))

([MAIN::ia-viatges_Class30027] of  Leisure

	(name_poi "ThorTable")
	(poi_is_in [MAIN::ia-viatges_Class30022]))

([MAIN::ia-viatges_Class30028] of  City

	(accomodations_are
		[MAIN::ia-viatges_Class40007]
		[MAIN::ia-viatges_Class40008]
		[MAIN::ia-viatges_Class40031]
		[MAIN::ia-viatges_Class40032])
	(can_be_reached
		[MAIN::ia-viatges_Class40049]
		[MAIN::ia-viatges_Class40083])
	(can_go_to [MAIN::ia-viatges_Class40063])
	(has_climate [MAIN::ia-viatges_Class10005])
	(is_in_continent [MAIN::ia-viatges_Class4])
	(name_city "CartoonNetwork")
	(poi_are
		[MAIN::ia-viatges_Class30029]
		[MAIN::ia-viatges_Class30030]
		[MAIN::ia-viatges_Class30031]
		[MAIN::ia-viatges_Class30032]
		[MAIN::ia-viatges_Class30033])
	(popularity "baixa")
	(type_destination_is [MAIN::ia-viatges_Class30002]))

([MAIN::ia-viatges_Class30029] of  FamiliarPlace

	(name_poi "BoingCinema")
	(poi_is_in [MAIN::ia-viatges_Class30028]))

([MAIN::ia-viatges_Class30030] of  FamiliarPlace

	(name_poi "Imaginarium")
	(poi_is_in [MAIN::ia-viatges_Class30028]))

([MAIN::ia-viatges_Class30031] of  FamiliarPlace

	(name_poi "LazyTown")
	(poi_is_in [MAIN::ia-viatges_Class30028]))

([MAIN::ia-viatges_Class30032] of  FamiliarPlace

	(name_poi "Drim")
	(poi_is_in [MAIN::ia-viatges_Class30028]))

([MAIN::ia-viatges_Class30033] of  FamiliarPlace

	(name_poi "TriangleFerroviari")
	(poi_is_in [MAIN::ia-viatges_Class30028]))

([MAIN::ia-viatges_Class30034] of  City

	(accomodations_are
		[MAIN::ia-viatges_Class40010]
		[MAIN::ia-viatges_Class40033]
		[MAIN::ia-viatges_Class40034]
		[MAIN::ia-viatges_Class40035])
	(can_be_reached
		[MAIN::ia-viatges_Class40050]
		[MAIN::ia-viatges_Class40079])
	(can_go_to [MAIN::ia-viatges_Class40064])
	(has_climate [MAIN::ia-viatges_Class10004])
	(is_in_continent [MAIN::ia-viatges_Class3])
	(name_city "Climbistan")
	(poi_are
		[MAIN::ia-viatges_Class30035]
		[MAIN::ia-viatges_Class30036]
		[MAIN::ia-viatges_Class30037]
		[MAIN::ia-viatges_Class30038]
		[MAIN::ia-viatges_Class30039])
	(popularity "alta")
	(type_destination_is [MAIN::ia-viatges_Class0]))

([MAIN::ia-viatges_Class30035] of  Sport

	(name_poi "Rocodrom")
	(poi_is_in [MAIN::ia-viatges_Class30034]))

([MAIN::ia-viatges_Class30036] of  Sport

	(name_poi "EasySkiTracks")
	(poi_is_in [MAIN::ia-viatges_Class30034]))

([MAIN::ia-viatges_Class30037] of  Sport

	(name_poi "MediumSkiTrack")
	(poi_is_in [MAIN::ia-viatges_Class30034]))

([MAIN::ia-viatges_Class30038] of  Sport

	(name_poi "HardSkiTrack")
	(poi_is_in [MAIN::ia-viatges_Class30034]))

([MAIN::ia-viatges_Class30039] of  Sport

	(name_poi "ParachutePoint")
	(poi_is_in [MAIN::ia-viatges_Class30034]))

([MAIN::ia-viatges_Class30040] of  City

	(accomodations_are
		[MAIN::ia-viatges_Class40009]
		[MAIN::ia-viatges_Class40036]
		[MAIN::ia-viatges_Class40037]
		[MAIN::ia-viatges_Class40038]
		[MAIN::ia-viatges_Class40039]
		[MAIN::ia-viatges_Class40040])
	(can_be_reached
		[MAIN::ia-viatges_Class40051]
		[MAIN::ia-viatges_Class40059])
	(can_go_to
		[MAIN::ia-viatges_Class40065]
		[MAIN::ia-viatges_Class40079]
		[MAIN::ia-viatges_Class40080])
	(has_climate [MAIN::ia-viatges_Class10008])
	(is_in_continent [MAIN::ia-viatges_Class1])
	(name_city "Korotkevich")
	(poi_are
		[MAIN::ia-viatges_Class30041]
		[MAIN::ia-viatges_Class30042]
		[MAIN::ia-viatges_Class30043]
		[MAIN::ia-viatges_Class30044]
		[MAIN::ia-viatges_Class30045])
	(popularity "baixa")
	(type_destination_is [MAIN::ia-viatges_Class30001]))

([MAIN::ia-viatges_Class30041] of  TuristPoint

	(name_poi "MaxFlow")
	(poi_is_in [MAIN::ia-viatges_Class30040]))

([MAIN::ia-viatges_Class30042] of  TuristPoint

	(name_poi "ConvexHull")
	(poi_is_in [MAIN::ia-viatges_Class30040]))

([MAIN::ia-viatges_Class30043] of  TuristPoint

	(name_poi "SuffixArray")
	(poi_is_in [MAIN::ia-viatges_Class30040]))

([MAIN::ia-viatges_Class30044] of  TuristPoint

	(name_poi "HopcroftKarp")
	(poi_is_in [MAIN::ia-viatges_Class30040]))

([MAIN::ia-viatges_Class30045] of  TuristPoint

	(name_poi "PollardRho")
	(poi_is_in [MAIN::ia-viatges_Class30040]))

([MAIN::ia-viatges_Class30046] of  City

	(accomodations_are
		[MAIN::ia-viatges_Class30047]
		[MAIN::ia-viatges_Class30048]
		[MAIN::ia-viatges_Class40041]
		[MAIN::ia-viatges_Class40042])
	(can_be_reached
		[MAIN::ia-viatges_Class40052]
		[MAIN::ia-viatges_Class40082])
	(can_go_to [MAIN::ia-viatges_Class40077])
	(has_climate [MAIN::ia-viatges_Class10007])
	(is_in_continent [MAIN::ia-viatges_Class2])
	(name_city "UltraLuxe")
	(poi_are
		[MAIN::ia-viatges_Class40011]
		[MAIN::ia-viatges_Class40012]
		[MAIN::ia-viatges_Class40013]
		[MAIN::ia-viatges_Class40014]
		[MAIN::ia-viatges_Class40015])
	(popularity "alta")
	(type_destination_is [MAIN::ia-viatges_Class30001]))

([MAIN::ia-viatges_Class30047] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30046])
	(name_accom "DollarsHotel")
	(price_per_night 4000)
	(rating 5))

([MAIN::ia-viatges_Class30048] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30046])
	(name_accom "MoreDollarsHotel")
	(price_per_night 6000)
	(rating 5))

([MAIN::ia-viatges_Class30049] of  City

	(accomodations_are
		[MAIN::ia-viatges_Class30050]
		[MAIN::ia-viatges_Class30051]
		[MAIN::ia-viatges_Class40043])
	(can_be_reached
		[MAIN::ia-viatges_Class40053]
		[MAIN::ia-viatges_Class40058]
		[MAIN::ia-viatges_Class40081])
	(can_go_to [MAIN::ia-viatges_Class40066])
	(has_climate [MAIN::ia-viatges_Class10007])
	(is_in_continent [MAIN::ia-viatges_Class5])
	(name_city "ReasonableLux")
	(poi_are
		[MAIN::ia-viatges_Class40016]
		[MAIN::ia-viatges_Class40017])
	(popularity "alta")
	(type_destination_is [MAIN::ia-viatges_Class20004]))

([MAIN::ia-viatges_Class30050] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30049])
	(name_accom "YuppiesHouse")
	(price_per_night 2000)
	(rating 4))

([MAIN::ia-viatges_Class30051] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30049])
	(name_accom "ButSalHotel")
	(price_per_night 1500)
	(rating 4))

([MAIN::ia-viatges_Class30052] of  City

	(accomodations_are
		[MAIN::ia-viatges_Class30053]
		[MAIN::ia-viatges_Class30054])
	(can_be_reached
		[MAIN::ia-viatges_Class40078]
		[MAIN::ia-viatges_Class40084])
	(can_go_to [MAIN::ia-viatges_Class40067])
	(has_climate [MAIN::ia-viatges_Class10006])
	(is_in_continent [MAIN::ia-viatges_Class4])
	(name_city "AverageJoe")
	(poi_are
		[MAIN::ia-viatges_Class40018]
		[MAIN::ia-viatges_Class40019]
		[MAIN::ia-viatges_Class40020])
	(popularity "baixa")
	(type_destination_is [MAIN::ia-viatges_Class30002]))

([MAIN::ia-viatges_Class30053] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30052])
	(name_accom "NormalHotel")
	(price_per_night 400)
	(rating 3))

([MAIN::ia-viatges_Class30054] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30052])
	(name_accom "AverageHotel")
	(price_per_night 350)
	(rating 3))

([MAIN::ia-viatges_Class30055] of  City

	(accomodations_are
		[MAIN::ia-viatges_Class30056]
		[MAIN::ia-viatges_Class30057])
	(can_be_reached
		[MAIN::ia-viatges_Class40057]
		[MAIN::ia-viatges_Class40085])
	(can_go_to
		[MAIN::ia-viatges_Class40069]
		[MAIN::ia-viatges_Class40084])
	(has_climate [MAIN::ia-viatges_Class10005])
	(is_in_continent [MAIN::ia-viatges_Class4])
	(name_city "StudentsDestination")
	(poi_are
		[MAIN::ia-viatges_Class30058]
		[MAIN::ia-viatges_Class30059]
		[MAIN::ia-viatges_Class30060]
		[MAIN::ia-viatges_Class20000]
		[MAIN::ia-viatges_Class40001])
	(popularity "alta")
	(type_destination_is [MAIN::ia-viatges_Class30001]))

([MAIN::ia-viatges_Class30056] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30055])
	(name_accom "Hostel")
	(price_per_night 50)
	(rating 1))

([MAIN::ia-viatges_Class30057] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30055])
	(name_accom "SleepWithARoach")
	(price_per_night 25)
	(rating 1))

([MAIN::ia-viatges_Class30058] of  Nightlife

	(name_poi "PotShop")
	(poi_is_in [MAIN::ia-viatges_Class30055]))

([MAIN::ia-viatges_Class30059] of  Nightlife

	(name_poi "DarkPassions")
	(poi_is_in [MAIN::ia-viatges_Class30055]))

([MAIN::ia-viatges_Class30060] of  Sport

	(name_poi "Footballer")
	(poi_is_in [MAIN::ia-viatges_Class30055]))

([MAIN::ia-viatges_Class30061] of  City

	(accomodations_are
		[MAIN::ia-viatges_Class30062]
		[MAIN::ia-viatges_Class30063]
		[MAIN::ia-viatges_Class30064]
		[MAIN::ia-viatges_Class30065]
		[MAIN::ia-viatges_Class30066])
	(can_be_reached [MAIN::ia-viatges_Class40054])
	(can_go_to
		[MAIN::ia-viatges_Class40068]
		[MAIN::ia-viatges_Class40085])
	(has_climate [MAIN::ia-viatges_Class10006])
	(is_in_continent [MAIN::ia-viatges_Class5])
	(name_city "LandOfEverybody")
	(poi_are
		[MAIN::ia-viatges_Class30067]
		[MAIN::ia-viatges_Class30068]
		[MAIN::ia-viatges_Class30069]
		[MAIN::ia-viatges_Class30070]
		[MAIN::ia-viatges_Class30071]
		[MAIN::ia-viatges_Class30072])
	(popularity "alta")
	(type_destination_is [MAIN::ia-viatges_Class30002]))

([MAIN::ia-viatges_Class30062] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30061])
	(name_accom "EverybodyWhoIsRich")
	(price_per_night 5000)
	(rating 5))

([MAIN::ia-viatges_Class30063] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30061])
	(name_accom "EverybodyWhoHasMonnaie")
	(price_per_night 3500)
	(rating 4))

([MAIN::ia-viatges_Class30064] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30061])
	(name_accom "EverybodyWithSomeCash")
	(price_per_night 2000)
	(rating 3))

([MAIN::ia-viatges_Class30065] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30061])
	(name_accom "EverybodyWithACoin")
	(price_per_night 800)
	(rating 2))

([MAIN::ia-viatges_Class30066] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30061])
	(name_accom "Everybody, Literally")
	(price_per_night 1)
	(rating 1))

([MAIN::ia-viatges_Class30067] of  Cultural

	(name_poi "CulturalStuff")
	(poi_is_in [MAIN::ia-viatges_Class30061]))

([MAIN::ia-viatges_Class30068] of  FamiliarPlace

	(name_poi "PutYourKidHere")
	(poi_is_in [MAIN::ia-viatges_Class30061]))

([MAIN::ia-viatges_Class30069] of  Leisure

	(name_poi "Sleep")
	(poi_is_in [MAIN::ia-viatges_Class30061]))

([MAIN::ia-viatges_Class30070] of  Nightlife

	(name_poi "PartyHere")
	(poi_is_in [MAIN::ia-viatges_Class30061]))

([MAIN::ia-viatges_Class30071] of  Sport

	(name_poi "RunAndClimb")
	(poi_is_in [MAIN::ia-viatges_Class30061]))

([MAIN::ia-viatges_Class30072] of  TuristPoint

	(name_poi "TakeAPhoto")
	(poi_is_in [MAIN::ia-viatges_Class30061]))

([MAIN::ia-viatges_Class4] of  Continent

	(has_destinations
		[MAIN::ia-viatges_Class30028]
		[MAIN::ia-viatges_Class30052]
		[MAIN::ia-viatges_Class30055])
	(name_continent "Oceania"))

([MAIN::ia-viatges_Class40001] of  Nightlife

	(name_poi "SkipLectures")
	(poi_is_in [MAIN::ia-viatges_Class30055]))

([MAIN::ia-viatges_Class40002] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30008])
	(name_accom "Hipstel")
	(price_per_night 200)
	(rating 3))

([MAIN::ia-viatges_Class40003] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30008])
	(name_accom "Hopstel")
	(price_per_night 2000)
	(rating 5))

([MAIN::ia-viatges_Class40004] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30008])
	(name_accom "PastaGlasses")
	(price_per_night 30)
	(rating 2))

([MAIN::ia-viatges_Class40005] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30016])
	(name_accom "SweetDreams")
	(price_per_night 550)
	(rating 3))

([MAIN::ia-viatges_Class40006] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30022])
	(name_accom "Valhalla")
	(price_per_night 1337)
	(rating 5))

([MAIN::ia-viatges_Class40007] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30028])
	(name_accom "TreeHouse")
	(price_per_night 220)
	(rating 3))

([MAIN::ia-viatges_Class40008] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30028])
	(name_accom "Underground")
	(price_per_night 2000)
	(rating 5))

([MAIN::ia-viatges_Class40009] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30040])
	(name_accom "Google")
	(price_per_night 5000)
	(rating 5))

([MAIN::ia-viatges_Class40010] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30034])
	(name_accom "NBAHotel")
	(price_per_night 1500)
	(rating 3))

([MAIN::ia-viatges_Class40011] of  Cultural

	(name_poi "GoldStatue")
	(poi_is_in [MAIN::ia-viatges_Class30046]))

([MAIN::ia-viatges_Class40012] of  FamiliarPlace

	(name_poi "CaviarForKids")
	(poi_is_in [MAIN::ia-viatges_Class30046]))

([MAIN::ia-viatges_Class40013] of  Sport

	(name_poi "MidgetTossing")
	(poi_is_in [MAIN::ia-viatges_Class30046]))

([MAIN::ia-viatges_Class40014] of  Beach

	(name_poi "BeachWithGuards")
	(poi_is_in [MAIN::ia-viatges_Class30046]))

([MAIN::ia-viatges_Class40015] of  TuristPoint

	(name_poi "ThatchersGrave")
	(poi_is_in [MAIN::ia-viatges_Class30046]))

([MAIN::ia-viatges_Class40016] of  Beach

	(name_poi "GoldenBeach")
	(poi_is_in [MAIN::ia-viatges_Class30049]))

([MAIN::ia-viatges_Class40017] of  Spa

	(name_poi "AsianSpa")
	(poi_is_in [MAIN::ia-viatges_Class30049]))

([MAIN::ia-viatges_Class40018] of  Beach

	(name_poi "BarcelonetaLike")
	(poi_is_in [MAIN::ia-viatges_Class30052]))

([MAIN::ia-viatges_Class40019] of  Spa

	(name_poi "SpaWihtoutBubbles")
	(poi_is_in [MAIN::ia-viatges_Class30052]))

([MAIN::ia-viatges_Class40020] of  Leisure

	(name_poi "JustRelax")
	(poi_is_in [MAIN::ia-viatges_Class30052]))

([MAIN::ia-viatges_Class40021] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30008])
	(name_accom "ScultureHotel")
	(price_per_night 6000)
	(rating 5))

([MAIN::ia-viatges_Class40022] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30008])
	(name_accom "PaintingArtBuilding")
	(price_per_night 3500)
	(rating 4))

([MAIN::ia-viatges_Class40023] of  FamiliarPlace

	(name_poi "HipsterineForKids")
	(poi_is_in [MAIN::ia-viatges_Class30008]))

([MAIN::ia-viatges_Class40024] of  Nightlife

	(name_poi "CultureParty")
	(poi_is_in [MAIN::ia-viatges_Class30008]))

([MAIN::ia-viatges_Class40025] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30016])
	(name_accom "Bailout")
	(price_per_night 50)
	(rating 1))

([MAIN::ia-viatges_Class40026] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30016])
	(name_accom "TeaParty")
	(price_per_night 3500)
	(rating 4))

([MAIN::ia-viatges_Class40027] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30016])
	(name_accom "Woodstein")
	(price_per_night 5500)
	(rating 5))

([MAIN::ia-viatges_Class40028] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30022])
	(name_accom "HijosDeCain")
	(price_per_night 25)
	(rating 1))

([MAIN::ia-viatges_Class40029] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30022])
	(name_accom "Hammerfall")
	(price_per_night 4300)
	(rating 4))

([MAIN::ia-viatges_Class40030] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30022])
	(name_accom "Manowar")
	(price_per_night 125)
	(rating 2))

([MAIN::ia-viatges_Class40031] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30028])
	(name_accom "DextersLab")
	(price_per_night 1200)
	(rating 4))

([MAIN::ia-viatges_Class40032] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30028])
	(name_accom "RegularHotel")
	(price_per_night 220)
	(rating 2))

([MAIN::ia-viatges_Class40033] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30034])
	(name_accom "Montserratel")
	(price_per_night 2000)
	(rating 4))

([MAIN::ia-viatges_Class40034] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30034])
	(name_accom "RiverHotel")
	(price_per_night 5500)
	(rating 5))

([MAIN::ia-viatges_Class40035] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30034])
	(name_accom "Juvenile")
	(price_per_night 25)
	(rating 1))

([MAIN::ia-viatges_Class40036] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30040])
	(name_accom "Mitrichev")
	(price_per_night 2200)
	(rating 4))

([MAIN::ia-viatges_Class40037] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30040])
	(name_accom "Roura")
	(price_per_night 4500)
	(rating 5))

([MAIN::ia-viatges_Class40038] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30040])
	(name_accom "Gennadys")
	(price_per_night 550)
	(rating 3))

([MAIN::ia-viatges_Class40039] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30040]))

([MAIN::ia-viatges_Class40040] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30040])
	(name_accom "MrGrr")
	(price_per_night 25)
	(rating 1))

([MAIN::ia-viatges_Class40041] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30046])
	(name_accom "AbuDabiPalace")
	(price_per_night 15000)
	(rating 5))

([MAIN::ia-viatges_Class40042] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30046])
	(name_accom "BotinsPlace")
	(price_per_night 16000)
	(rating 5))

([MAIN::ia-viatges_Class40043] of  Accomodation

	(is_in [MAIN::ia-viatges_Class30049])
	(name_accom "WolfBeg")
	(price_per_night 1900)
	(rating 4))

([MAIN::ia-viatges_Class40045] of  City

	(can_be_reached
		[MAIN::ia-viatges_Class40060]
		[MAIN::ia-viatges_Class40061]
		[MAIN::ia-viatges_Class40062]
		[MAIN::ia-viatges_Class40063]
		[MAIN::ia-viatges_Class40064]
		[MAIN::ia-viatges_Class40065]
		[MAIN::ia-viatges_Class40066]
		[MAIN::ia-viatges_Class40067]
		[MAIN::ia-viatges_Class40068]
		[MAIN::ia-viatges_Class40069]
		[MAIN::ia-viatges_Class40077])
	(can_go_to
		[MAIN::ia-viatges_Class40046]
		[MAIN::ia-viatges_Class40047]
		[MAIN::ia-viatges_Class40048]
		[MAIN::ia-viatges_Class40049]
		[MAIN::ia-viatges_Class40050]
		[MAIN::ia-viatges_Class40051]
		[MAIN::ia-viatges_Class40052]
		[MAIN::ia-viatges_Class40053]
		[MAIN::ia-viatges_Class40054]
		[MAIN::ia-viatges_Class40055]
		[MAIN::ia-viatges_Class40057]
		[MAIN::ia-viatges_Class40058]
		[MAIN::ia-viatges_Class40059]
		[MAIN::ia-viatges_Class40078])
	(has_climate [MAIN::ia-viatges_Class10005])
	(is_in_continent [MAIN::ia-viatges_Class1])
	(name_city "Barcelona")
	(poi_are
		[MAIN::ia-viatges_Class40075]
		[MAIN::ia-viatges_Class40076])
	(popularity "alta")
	(type_destination_is [MAIN::ia-viatges_Class20004]))

([MAIN::ia-viatges_Class40046] of  Plane

	(arrival [MAIN::ia-viatges_Class30008])
	(departure [MAIN::ia-viatges_Class40045]))

([MAIN::ia-viatges_Class40047] of  Plane

	(arrival [MAIN::ia-viatges_Class30016])
	(departure [MAIN::ia-viatges_Class40045]))

([MAIN::ia-viatges_Class40048] of  Plane

	(arrival [MAIN::ia-viatges_Class30022])
	(departure [MAIN::ia-viatges_Class40045]))

([MAIN::ia-viatges_Class40049] of  Plane

	(arrival [MAIN::ia-viatges_Class30028])
	(departure [MAIN::ia-viatges_Class40045]))

([MAIN::ia-viatges_Class40050] of  Plane

	(arrival [MAIN::ia-viatges_Class30034])
	(departure [MAIN::ia-viatges_Class40045]))

([MAIN::ia-viatges_Class40051] of  Plane

	(arrival [MAIN::ia-viatges_Class30040])
	(departure [MAIN::ia-viatges_Class40045]))

([MAIN::ia-viatges_Class40052] of  Plane

	(arrival [MAIN::ia-viatges_Class30046])
	(departure [MAIN::ia-viatges_Class40045]))

([MAIN::ia-viatges_Class40053] of  Plane

	(arrival [MAIN::ia-viatges_Class30049])
	(departure [MAIN::ia-viatges_Class40045]))

([MAIN::ia-viatges_Class40054] of  Plane

	(arrival [MAIN::ia-viatges_Class30061])
	(departure [MAIN::ia-viatges_Class40045]))

([MAIN::ia-viatges_Class40055] of  Plane

	(departure [MAIN::ia-viatges_Class40045]))

([MAIN::ia-viatges_Class40057] of  Plane

	(arrival [MAIN::ia-viatges_Class30055])
	(departure [MAIN::ia-viatges_Class40045]))

([MAIN::ia-viatges_Class40058] of  Train

	(arrival [MAIN::ia-viatges_Class30049])
	(departure [MAIN::ia-viatges_Class40045]))

([MAIN::ia-viatges_Class40059] of  Boat

	(arrival [MAIN::ia-viatges_Class30040])
	(departure [MAIN::ia-viatges_Class40045]))

([MAIN::ia-viatges_Class40060] of  Plane

	(arrival [MAIN::ia-viatges_Class40045])
	(departure [MAIN::ia-viatges_Class30008]))

([MAIN::ia-viatges_Class40061] of  Plane

	(arrival [MAIN::ia-viatges_Class40045])
	(departure [MAIN::ia-viatges_Class30016]))

([MAIN::ia-viatges_Class40062] of  Plane

	(arrival [MAIN::ia-viatges_Class40045])
	(departure [MAIN::ia-viatges_Class30022]))

([MAIN::ia-viatges_Class40063] of  Plane

	(arrival [MAIN::ia-viatges_Class40045])
	(departure [MAIN::ia-viatges_Class30028]))

([MAIN::ia-viatges_Class40064] of  Plane

	(arrival [MAIN::ia-viatges_Class40045])
	(departure [MAIN::ia-viatges_Class30034]))

([MAIN::ia-viatges_Class40065] of  Plane

	(arrival [MAIN::ia-viatges_Class40045])
	(departure [MAIN::ia-viatges_Class30040]))

([MAIN::ia-viatges_Class40066] of  Plane

	(arrival [MAIN::ia-viatges_Class40045])
	(departure [MAIN::ia-viatges_Class30049]))

([MAIN::ia-viatges_Class40067] of  Plane

	(arrival [MAIN::ia-viatges_Class40045])
	(departure [MAIN::ia-viatges_Class30052]))

([MAIN::ia-viatges_Class40068] of  Plane

	(arrival [MAIN::ia-viatges_Class40045])
	(departure [MAIN::ia-viatges_Class30061]))

([MAIN::ia-viatges_Class40069] of  Plane

	(arrival [MAIN::ia-viatges_Class40045])
	(departure [MAIN::ia-viatges_Class30055]))

([MAIN::ia-viatges_Class40070] of  Accomodation

	(name_accom "BarnaCaro")
	(price_per_night 5400)
	(rating 5))

([MAIN::ia-viatges_Class40071] of  Accomodation

	(name_accom "Barnal")
	(price_per_night 4400)
	(rating 4))

([MAIN::ia-viatges_Class40072] of  Accomodation

	(name_accom "Barnarato")
	(price_per_night 3300)
	(rating 3))

([MAIN::ia-viatges_Class40073] of  Accomodation

	(name_accom "BarnaTirao")
	(price_per_night 3300)
	(rating 3))

([MAIN::ia-viatges_Class40074] of  Accomodation

	(name_accom "BarnaCutrillo")
	(price_per_night 2200)
	(rating 2))

([MAIN::ia-viatges_Class40075] of  TuristPoint

	(name_poi "Sagrada Familia")
	(poi_is_in [MAIN::ia-viatges_Class40045]))

([MAIN::ia-viatges_Class40076] of  TuristPoint

	(name_poi "Satanica Familia")
	(poi_is_in [MAIN::ia-viatges_Class40045]))

([MAIN::ia-viatges_Class40077] of  Plane

	(arrival [MAIN::ia-viatges_Class40045])
	(departure [MAIN::ia-viatges_Class30046]))

([MAIN::ia-viatges_Class40078] of  Plane

	(arrival [MAIN::ia-viatges_Class30052])
	(departure [MAIN::ia-viatges_Class40045]))

([MAIN::ia-viatges_Class40079] of  Boat

	(arrival [MAIN::ia-viatges_Class30034])
	(departure [MAIN::ia-viatges_Class30040]))

([MAIN::ia-viatges_Class40080] of  Train

	(arrival [MAIN::ia-viatges_Class30016])
	(departure [MAIN::ia-viatges_Class30040]))

([MAIN::ia-viatges_Class40081] of  Boat

	(arrival [MAIN::ia-viatges_Class30049])
	(departure [MAIN::ia-viatges_Class30008]))

([MAIN::ia-viatges_Class40082] of  Train

	(arrival [MAIN::ia-viatges_Class30046])
	(departure [MAIN::ia-viatges_Class30016]))

([MAIN::ia-viatges_Class40083] of  Train

	(arrival [MAIN::ia-viatges_Class30028])
	(departure [MAIN::ia-viatges_Class30022]))

([MAIN::ia-viatges_Class40084] of  Boat

	(arrival [MAIN::ia-viatges_Class30052])
	(departure [MAIN::ia-viatges_Class30055]))

([MAIN::ia-viatges_Class40085] of  Train

	(arrival [MAIN::ia-viatges_Class30055])
	(departure [MAIN::ia-viatges_Class30061]))

([MAIN::ia-viatges_Class5] of  Continent

	(has_destinations
		[MAIN::ia-viatges_Class30061]
		[MAIN::ia-viatges_Class30049])
	(name_continent "NorthAmerica"))

([MAIN::ia-viatges_Class6] of  Continent

	(name_continent "SouthAmerica"))

)

;;; Fi del codi generat per Protege -------------------
;;; ---------------------------------------------------

;;; Inici de la solucio implementada

;;; Declaracio de classes propies

;;; Es crea una classe para las recomanacions per a poder fer llistes de recomenacions i tractarles millor

(defclass DestinacioVisitada
    (is-a USER)
    (role concrete)
    (slot numero-dies
        (type INTEGER)
        (create-accessor read-write))
    (slot nom-hotel
        (type STRING)
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
    ;; transport amb el que s'hi arriba
    (slot transport-arribar
        (type STRING)
        (create-accessor read-write))
)


(defclass Viatge
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
    ; List of used transports
    (multislot transports
        (type INSTANCE)
        (create-accessor read-write))
    ;; indica el tranport per tornar
    (slot transport-tornada
        (type STRING)
        (create-accessor read-write))
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
(defmodule generacio
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
(defmessage-handler MAIN::Viatge imprimir ()
    (if (eq (length (send ?self get-destins-visitats)) 0) then 
        (printout t (instance-name ?self) crlf)
        (printout t "No s'ha trobat cap viatge per a les condicons que ha posat." crlf)
        (printout t "Fi de")
        (printout t (instance-name ?self) crlf)
        else
        (printout t (instance-name ?self) crlf)
        (printout t "Cost del viatge: ")
        (printout t ?self:cost crlf)
        (bind ?sum 0)
        (progn$ (?desti (send ?self get-destins-visitats))
           (bind ?sum (+ ?sum (send ?desti get-numero-dies)))
        ) 
        (printout t "Durada del viatge: ")
        (printout t ?sum " dies" crlf)
        (printout t "Destinacions: " crlf)
        (progn$ (?desti (send ?self get-destins-visitats))
           (printout t (send ?desti imprimir))
        ) 
        ;; TRANSPORT
        (printout t "Transports agafats: ")
        (bind ?prev-nom "Origen")
        ;; iterem pels destins visitats
        (progn$ (?desti (send ?self get-destins-visitats))
            ;; check if this works
            (bind ?next-nom (send (send ?desti get-desti) get-name_city))
            (bind ?transp (send ?desti get-transport-arribar))
            (printout t ?prev-nom)
            (printout t " -> " )
            (printout t ?next-nom)
            (printout t " amb ")
            (printout t ?transp crlf)
            (bind ?prev-nom ?next-nom)
        )
        ;; imprimir la tornada
        (printout t ?prev-nom)
        (printout t " -> Origen amb " )
        (printout t ?self:transport-tornada crlf)
        ;; FI TRANSPORT 

        (printout t "Fi de")
        (printout t (instance-name ?self) crlf)
    )
)

;; Imprimir destinacio visitada
(defmessage-handler MAIN::DestinacioVisitada imprimir ()
    (printout t "Desti:")
    (printout t (send ?self:desti get-name_city) crlf)
    (printout t "   Hotel: ")
    (printout t ?self:nom-hotel crlf)
    (printout t "   Visites:")
    (progn$ (?curr-poi ?self:pois)
        (printout t (send ?curr-poi get-name_poi))
        (printout t ",")
    )
    (printout t crlf)
    (printout t "   Justificacions:" crlf)
    (progn$ (?curr-just ?self:justificacions)
        (printout t "   ")
        (printout t ?curr-just crlf)
    )
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
    (slot num-ciutats (type INTEGER) (default -1)) ;; cota superior
    (slot num-dies-ciutat (type INTEGER) (default -1))
    (slot pressupost (type INTEGER) (default -1))
    (slot rest-transport (type SYMBOL) (default desconegut)) ;;;el que no agafes
    (slot min-qualitat-allotjament (type INTEGER) (default -1)) ;; Minim estrelles del allotjament
)

;;; Template per les preferencies del usuari
(deftemplate MAIN::preferencies
    (slot popularitat (type SYMBOL) (default desconegut)) ;; Necessari?
    (slot ratio-qual-diners (type SYMBOL) (default desconegut))
    (slot preferencia-llocs-exotics (type SYMBOL) (default desconegut))
    (slot pref-continent (type INSTANCE))
    (slot pref-clima (type SYMBOL) (default desconegut))
)

;; Template per la llista de destins
(deftemplate MAIN::llista-destins
    (multislot destins (type INSTANCE))
)

;; Template per la llista destins ordenada
(deftemplate MAIN::llista-destins-ordenada
    (multislot destins (type INSTANCE))
)

;; Template per la llista de viatges
(deftemplate MAIN::llista-viatges
    (multislot viatges (type INSTANCE))
)

;;; Fi declaracio templates -----------------------

;;; Declaracio de funcios ------------------------



; Funcio per veure si es pot arribar de l'origen al desti
; si es pot, diu quin transport es. Sino, diu FALSE
(deffunction pot-arribar (?origen-visitat ?desti-visitat)
    ;(bind ?origen-visitat (send ?origen get-desti))
    ;(bind ?desti-visitat (send ?desti get-desti))
    (bind ?result FALSE)

    ; obtenir tot
    (bind $?vaixells (find-all-instances ((?inst Boat)) TRUE))
    (bind $?trens (find-all-instances ((?inst Train)) TRUE))
    (bind $?avions (find-all-instances ((?inst Plane)) TRUE))

    ; obtenir anar i tornar
    (bind $?transports-anar (send ?origen-visitat get-can_go_to))
    (bind $?transports-arribat (send ?desti-visitat get-can_be_reached))
    (progn$ (?curr-trans $?transports-anar)
        (if (member$ ?curr-trans $?transports-arribat) then
            (if (member$ (instance-name ?curr-trans) $?vaixells) then
                (bind ?result "vaixell")
            )
            (if (member$ (instance-name ?curr-trans) $?trens) then
                (bind ?result "tren")
            )
            (if (member$ (instance-name ?curr-trans) $?avions) then
                (bind ?result "avio") 
            )
        )
    )
    ; provar al reves
    (if (eq ?result FALSE) then
        (progn$ (?curr-trans $?transports-anar)
            (bind $?transports-anar (send ?desti-visitat get-can_go_to))
            (bind $?transports-arribat (send ?origen-visitat get-can_be_reached))
            (if (member$ ?curr-trans $?transports-arribat) then
                (if (member$ (instance-name ?curr-trans) $?vaixells) then
                    (bind ?result "vaixell")
                )
                (if (member$ (instance-name ?curr-trans) $?trens) then
                    (bind ?result "tren")
                )
                (if (member$ (instance-name ?curr-trans) $?avions) then
                    (bind ?result "avio") 
                )
            )
        )
    )
    ?result
)

;;; Funcion que retorna l'element amb puntuacio maxima
(deffunction maxima-puntuacio ($?llista)
    (bind ?maxim -1000000)
    (bind ?element nil)
    (progn$ (?curr $?llista)
        (bind ?punt (send ?curr get-puntuacio))
        (if (> ?punt ?maxim) then 
            (bind ?maxim ?punt)
            (bind ?element ?curr)
        )
    )
    ?element
)

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
    (printout t "=   Sistema de recomanacio de viatjes al fin del mundo y mas alla  =" crlf)
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
            (bind ?e (pregunta-numerica "Edat del menor" 0 30))
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
    (bind ?e (pregunta-si-no "Tens interes en la cultura?"))
    (switch ?e
        (case TRUE then
            (modify ?u (nivell-cult alt))
        )
        (case FALSE then
            (modify ?u (nivell-cult baix))
        )
    )
)

(defrule recopilacio-usuari::establir-tipusviatge "Estableix el tipus de viatge del usuari"
    ?u <- (Usuari (tipus-viatge desconegut))
    =>
    (bind ?e (pregunta-index "El teu viatge es tracta d'una celebracio especial?" casament "viatge de fi de curs" no))
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
    ?u <- (Usuari (objectiu-viatge desconegut) (tipus-viatge ?tipus))
    =>
    (if (eq ?tipus FALSE) then 
        (bind ?e (pregunta-index "Quin es l'objectiu del viatge? " diversio romantic descans turisme))
        (switch ?e 
            (case 1 then 
                (modify ?u (objectiu-viatge diversio))
            )
            (case 2 then 
                (modify ?u (objectiu-viatge romantic))
            )
            (case 3 then 
                (modify ?u (objectiu-viatge descans))
            )
            (case 4 then
                (modify ?u (objectiu-viatge turisme))
            )
        )
        else (modify ?u (objectiu-viatge FALSE))
    )
)


(defrule recopilacio-usuari::pasar-a-restriccions "Pasa a la recopilacio de restriccions"
    (declare (salience 10))
    ?u <- (Usuari (edat ?e) (num-pers ?n) (familia ~desconegut) (nivell-cult ~desconegut) (tipus-viatge ~desconegut) (objectiu-viatge ~desconegut)) ;Posar condicio per passar a preferencies
    (test (> ?e 0))
    (test (> ?n 0))
    =>
    (printout t "Passant a recopilacio de restriccions..." crlf)
    (focus recopilacio-restriccions)
)

;---------------------------;
; REGLES MODUL RESTRICCIONS ;
;---------------------------;

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
    (tipus-desti ask)
    (restriccions)
)

(defrule recopilacio-restriccions::tipus-desti "Selecciona el tipus de desti"
    ?fet <- (tipus-desti ask)
    =>
    (retract ?fet)
    (bind ?e (pregunta-index "Quin tipus de destinacio voldries?" ciutat poble muntanya))
    (switch ?e
        (case 1 then
            (assert (tipus-desti ciutat))
        )
        (case 2 then
            (assert (tipus-desti poble))
        )
        (case 3 then
            (assert (tipus-desti muntanya))
        )
    )
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
    (bind ?e (pregunta-numerica "De quin pressupost disposes?" 0 50000))
    (modify ?u (pressupost ?e))
)

(defrule recopilacio-restriccions::rest-transport "Pregunta transports"
    ?fet <- (rest-transport ask) 
    ?u <- (restriccions (rest-transport desconegut))
    ;;?re <- (restriccions)

    =>
    (bind ?r (pregunta-index "Hi ha algun transport que no puguis utilitzar?" vaixell avio tren cap))
    (switch ?r
        (case 1 then
            (assert (rest-transport vaixell))
            (modify ?u (rest-transport vaixell))
        )
        (case 2 then
            (assert (rest-transport avio))
            (modify ?u (rest-transport avio))
        )
        (case 3 then
            (assert (rest-transport tren))
            (modify ?u (rest-transport tren))
        )
        (case 4 then 
            (assert (rest-transport FALSE))
            (modify ?u (rest-transport FALSE))
        )
    )
    (retract ?fet)
)

(defrule recopilacio-restriccions::min-qualitat-allotjament
    ?u <- (restriccions (min-qualitat-allotjament -1))
    =>
    (bind ?e (pregunta-numerica "Quantes estrelles han de tenir els hotels com a mínim" 1 5))
    (modify ?u (min-qualitat-allotjament ?e))
)


(defrule recopilacio-restriccions::pasar-a-preferencies "Pasa de la recopilacio de restriccions de preferencies"
    (declare (salience 10))
    (rest-transport ~ask)
    (tipus-desti ~ask)
    ?u <- (restriccions (num-ciutats ?n) (num-dies-ciutat ?c) (pressupost ?p) (min-qualitat-allotjament ?a))
    (test (> ?n 0))
    (test (> ?c 0))
    (test (> ?p 0))
    (test (> ?a 0))
    =>
    (printout t "Passant a recopilacio de preferencies..." crlf)
    (focus recopilacio-prefs)
)

;---------------------------;
; REGLES MODUL PREFERENCIES ;
;---------------------------;

(deffacts recopilacio-prefs::fets-inicials "Fets inicials de preferencies"
    (pref-clima ask)
    (pref-continent ask)
    (preferencies)
)

(defrule recopilacio-prefs::select-popularitat 
    ?u <- (preferencies (popularitat desconegut))
    =>
    (bind ?a pregunta-si-no "Li agradaria viatjar a ciutats que son populars entre els nostres clients?")
    (if (eq ?a TRUE) then (modify ?u (popularitat alta)) else (modify ?u (popularitat baixa)))
)

(defrule recopilacio-prefs::ratio-qual-diners "Pregunta per la preferencia de major qualitat sobre menys pressupost"
    ?u <- (preferencies (ratio-qual-diners desconegut))
    =>
    (bind ?e (pregunta-index "Quina importancia dones a la qualitat sobre el pressupost?" baixa mitjana alta))
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

;;dynamic question, adapts based on content of the ontology
(defrule recopilacio-prefs::pref-clima
    ?hecho <- (pref-clima ask)
    ?pref <- (preferencies)
    =>
    ;; get all the names of the instances of Clima
    (bind $?obj-clima (find-all-instances ((?inst Clima)) TRUE))
    (bind $?nom-clima (create$ ))
    (loop-for-count (?i 1 (length$ $?obj-clima)) do
        (bind ?curr-obj (nth$ ?i ?obj-clima))
        (bind ?curr-nom (send ?curr-obj get-name_climate))
        (bind $?nom-clima(insert$ $?nom-clima (+ (length$ $?nom-clima) 1) ?curr-nom))
    )
    (bind ?escogido (pregunta-index "Esculli el clima que prefereix: " $?nom-clima))

    ;;bind the obj choosen to the answer and pass it to prefs
    (bind ?respuesta (nth$ ?escogido ?obj-clima))
    (retract ?hecho)
    (assert (pref-clima TRUE))
    (modify ?pref (pref-clima ?respuesta))
)

(defrule recopilacio-prefs::pref-continent
    ?hecho <- (pref-continent ask)
    ?pref <- (preferencies)
    =>
    (bind $?obj-cont (find-all-instances ((?inst Continent)) TRUE))
    (bind $?nom-cont (create$ ))
    (loop-for-count (?i 1 (length$ $?obj-cont)) do
        (bind ?curr-obj (nth$ ?i ?obj-cont))
        (bind ?curr-nom (send ?curr-obj get-name_continent))
        (bind $?nom-cont(insert$ $?nom-cont (+ (length$ $?nom-cont) 1) ?curr-nom))
    )
    (bind ?escogido (pregunta-index "Esculli el continent que prefereix: " $?nom-cont))

    (bind ?respuesta (nth$ ?escogido ?obj-cont))
    (retract ?hecho)
    (assert (pref-continent TRUE))
    (modify ?pref (pref-continent ?respuesta))
)

(defrule recopilacio-prefs::pasar-a-processat
    (declare (salience 10)) 
    (preferencies (pref-clima ~ask) (preferencia-llocs-exotics ~desconegut) (ratio-qual-diners ~desconegut) (popularitat ~desconegut))
    (pref-continent ~ask)
    =>
    (printout t "Processant les dades..." crlf)
    (focus processat-data)
)

;------------------------;
; REGLES MODUL PROCESSAT ;
;------------------------;

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
    ?fet <- (tipus-desti ciutat)
    =>
    (bind $?llista (find-all-instances ((?inst City)) TRUE))
    (progn$ (?curr ?llista)
        (make-instance (gensym) of DestinacioVisitada (desti ?curr) (puntuacio 0))
    )   
    (retract ?fet)
)


;; POBLES
(defrule processat-data::afegir-pobles "S'afageixen totes les pobles"
    ?fet <- (tipus-desti poble)
    =>
    (bind $?llista (find-all-instances ((?inst Town)) TRUE))
    (progn$ (?curr ?llista)
        (make-instance (gensym) of DestinacioVisitada (desti ?curr) (puntuacio 0))
    )   
    (retract ?fet)
)

;; MUNTANYES
(defrule processat-data::afegir-muntanyes "S'afageixen totes les muntanyes"
    ?fet <- (tipus-desti muntanya)
    =>
    (bind $?llista (find-all-instances ((?inst Mountain)) TRUE))
    (progn$ (?curr ?llista)
        (make-instance (gensym) of DestinacioVisitada (desti ?curr) (puntuacio 0))
    )   
    (retract ?fet)
)

;; Afegir pois
(defrule processat-data::afegir-cult "Safegeixen pois culturals"
    ?u <- (Usuari (nivell-cult ?cult) (objectiu-viatge ?obj) (tipus-viatge ?tipus))
    ?dest <- (object (is-a Destination) (poi_are $?pois))
    ?destVisitades <-(object (is-a DestinacioVisitada) (desti ?nom-visitat) (pois $?visitat-pois) (justificacions $?just))
    (test (eq (instance-name ?dest) (instance-name ?nom-visitat)))
    (test (eq ?cult alt))
    (test (and (not (eq ?obj diversio)) (eq ?tipus FALSE)))
    (not (afegit-cult ?dest))
    =>
    (bind $?cult-pois (find-all-instances ((?inst Cultural)) TRUE))
    (progn$ (?curr ?cult-pois)
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (bind $?just (insert$ $?just (+ (length$ $?just) 1) "Es visiten els llocs esmentats donat que l'uauari te interes en la cultura."))
    (send ?destVisitades put-pois $?visitat-pois)
    (assert (afegit-cult ?dest))
)

(defrule processat-data::afegir-boda "Safegeixen pois si el tipus viatge es casament"
    ?u <- (Usuari (tipus-viatge ?tipus))
    ?dest <- (object (is-a Destination) (poi_are $?pois))
    ?destVisitades <-(object (is-a DestinacioVisitada) (desti ?nom-visitat) (pois $?visitat-pois) (justificacions $?just))
    (test (and (eq (instance-name ?dest) (instance-name ?nom-visitat)) (eq ?tipus boda)))
    (not (afegit-boda ?dest))
    =>
    (bind $?all-pois (find-all-instances ((?inst Nightlife)) TRUE))
    (progn$ (?curr ?all-pois)
        ;; check if member of list of all Leisures is in the pois of Destination
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (bind $?all-pois (find-all-instances ((?inst Beach)) TRUE))
    (progn$ (?curr ?all-pois)
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (bind $?all-pois (find-all-instances ((?inst Leisure)) TRUE))
    (progn$ (?curr ?all-pois)
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (bind $?just (insert$ $?just (+ (length$ $?just) 1) "Es visiten els llocs esmentats donat que el viatge es un casament."))
    (send ?destVisitades put-pois $?visitat-pois)
    (assert (afegit-boda ?dest))
)

(defrule processat-data::afegir-fidecurs "Safegeixen pois si el tipus viatge es fidecurs"
    ?u <- (Usuari (tipus-viatge ?tipus))
    ?dest <- (object (is-a Destination) (poi_are $?pois))
    ?destVisitades <-(object (is-a DestinacioVisitada) (desti ?nom-visitat) (pois $?visitat-pois) (justificacions $?just))
    (test (and (eq (instance-name ?dest) (instance-name ?nom-visitat)) (eq ?tipus fi-curs)))
    (not (afegit-ficurs ?dest))
    =>
    (bind $?all-pois (find-all-instances ((?inst Nightlife)) TRUE))
    (progn$ (?curr ?all-pois)
        ;; check if member of list of all Leisures is in the pois of Destination
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (bind $?all-pois (find-all-instances ((?inst TuristPoint)) TRUE))
    (progn$ (?curr ?all-pois)
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (bind $?just (insert$ $?just (+ (length$ $?just) 1) "Es visiten els llocs esmentats donat que el viatge es un viatge de fi de curs."))
    (send ?destVisitades put-pois $?visitat-pois)
    (assert (afegit-ficurs ?dest))
)

;; Afegir pois
(defrule processat-data::afegir-diversio "Safegeixen pois Diversio (Leisure)"
    ?u <- (Usuari (objectiu-viatge ?obj))
    ?dest <- (object (is-a Destination) (poi_are $?pois))
    ?destVisitades <-(object (is-a DestinacioVisitada) (desti ?nom-visitat) (pois $?visitat-pois) (justificacions $?just))
    (test (and (eq (instance-name ?dest) (instance-name ?nom-visitat)) (eq ?obj diversio)))
    (not (afegit-diversio ?dest))
    =>
    (bind $?all-pois (find-all-instances ((?inst Leisure)) TRUE))
    (progn$ (?curr ?all-pois)
        ;; check if member of list of all Leisures is in the pois of Destination
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (bind $?all-pois (find-all-instances ((?inst Nightlife)) TRUE))
    (progn$ (?curr ?all-pois)
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (bind $?just (insert$ $?just (+ (length$ $?just) 1) "Es visiten els llocs esmentats donat que l'objectiu del viatge es diversio."))
    (send ?destVisitades put-pois $?visitat-pois)
    (assert (afegit-diversio ?dest))
)

(defrule processat-data::afegir-romantic "Safegeixen pois Romantic"
    ?u <- (Usuari (objectiu-viatge ?obj))
    ?dest <- (object (is-a Destination) (poi_are $?pois))
    ?destVisitades <-(object (is-a DestinacioVisitada) (desti ?nom-visitat) (pois $?visitat-pois) (justificacions $?just))
    (test (and (eq (instance-name ?dest) (instance-name ?nom-visitat)) (eq ?obj romantic)))
    (not (afegit-romantic ?dest))
    =>
    (bind $?all-pois (find-all-instances ((?inst Leisure)) TRUE))
    (progn$ (?curr ?all-pois)
        ;; check if member of list of all Leisures is in the pois of Destination
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (bind $?all-pois (find-all-instances ((?inst Beach)) TRUE))
    (progn$ (?curr ?all-pois)
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (bind $?just (insert$ $?just (+ (length$ $?just) 1) "Es visiten els llocs esmentats donat que es un viatge romantic."))
    (send ?destVisitades put-pois $?visitat-pois)
    (assert (afegit-romantic ?dest))
)

(defrule processat-data::afegir-descans "Safegeixen pois descans"
    ?u <- (Usuari (objectiu-viatge ?obj))
    ?dest <- (object (is-a Destination) (poi_are $?pois))
    ?destVisitades <-(object (is-a DestinacioVisitada) (desti ?nom-visitat) (pois $?visitat-pois) (justificacions $?just))
    (test (and (eq (instance-name ?dest) (instance-name ?nom-visitat)) (eq ?obj descans)))
    (not (afegit-descans ?dest))
    =>
    (bind $?all-pois (find-all-instances ((?inst Spa)) TRUE))
    (progn$ (?curr ?all-pois)
        ;; check if member of list of all Leisures is in the pois of Destination
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (bind $?all-pois (find-all-instances ((?inst Beach)) TRUE))
    (progn$ (?curr ?all-pois)
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (bind $?just (insert$ $?just (+ (length$ $?just) 1) "Es visiten els llocs esmentats donat que es vol descansar al viatge."))
    (send ?destVisitades put-pois $?visitat-pois)
    (assert (afegit-descans ?dest))
)

(defrule processat-data::afegir-turisme "Safegeixen pois turisme"
    ?u <- (Usuari (objectiu-viatge ?obj))
    ?dest <- (object (is-a Destination) (poi_are $?pois))
    ?destVisitades <-(object (is-a DestinacioVisitada) (desti ?nom-visitat) (pois $?visitat-pois) (justificacions $?just))
    (test (and (eq (instance-name ?dest) (instance-name ?nom-visitat)) (eq ?obj turisme)))
    (not (afegit-turisme ?dest))
    =>
    (bind $?all-pois (find-all-instances ((?inst TuristPoint)) TRUE))
    (progn$ (?curr ?all-pois)
        ;; check if member of list of all Leisures is in the pois of Destination
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (bind $?just (insert$ $?just (+ (length$ $?just) 1) "Es visiten els llocs esmentats donat que es vol fer turisme."))
    (send ?destVisitades put-pois $?visitat-pois)
    (assert (afegit-turisme ?dest))
)

(defrule processat-data::afegir-familiar-nens "Safegeixen pois familiars"
    ?u <- (Usuari (familia ?obj))
    ?dest <- (object (is-a Destination) (poi_are $?pois))
    ?destVisitades <-(object (is-a DestinacioVisitada) (desti ?nom-visitat) (pois $?visitat-pois) (justificacions $?just))
    (test (and (eq (instance-name ?dest) (instance-name ?nom-visitat)) (eq ?obj nens)))
    (not (afegit-familiar-nens ?dest))
    =>
    (bind $?all-pois (find-all-instances ((?inst FamiliarPlace)) TRUE))
    (progn$ (?curr ?all-pois)
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (bind $?all-pois (find-all-instances ((?inst TuristPoint)) TRUE))
    (progn$ (?curr ?all-pois)
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (bind $?just (insert$ $?just (+ (length$ $?just) 1) "Es visiten els llocs esmentats donat que l'usuari viatja amb nens."))
    (send ?destVisitades put-pois $?visitat-pois)
    (assert (afegit-familiar-nens ?dest))
)

(defrule processat-data::afegir-familiar-adolescents "Safegeixen pois familiars amb adolescents"
    ?u <- (Usuari (familia ?obj))
    ?dest <- (object (is-a Destination) (poi_are $?pois))
    ?destVisitades <-(object (is-a DestinacioVisitada) (desti ?nom-visitat) (pois $?visitat-pois) (justificacions $?just))
    (test (and (eq (instance-name ?dest) (instance-name ?nom-visitat)) (eq ?obj adolescents)))
    (not (afegit-familiar-adolescents ?dest))
    =>
    (bind $?all-pois (find-all-instances ((?inst FamiliarPlace)) TRUE))
    (progn$ (?curr ?all-pois)
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (bind $?all-pois (find-all-instances ((?inst Sport)) TRUE))
    (progn$ (?curr ?all-pois)
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (bind $?just (insert$ $?just (+ (length$ $?just) 1) "Es visiten els llocs esmentats donat que l'usuari viatja amb adolescents."))
    (send ?destVisitades put-pois $?visitat-pois)
    (assert (afegit-familiar-adolescents ?dest))
)

;; Valorar popularitat
(defrule processat-data::valorar-popularitat "Es valorara la popularitat del lloc"
    (preferencies (popularitat ?popDesitjada))
    ?dest <- (object (is-a Destination) (popularity ?pop))
    ?destVisitades <-(object (is-a DestinacioVisitada) (desti ?nom-visitat) (puntuacio ?punt) (justificacions $?just))
    (test (eq (instance-name ?dest) (instance-name ?nom-visitat)))
    (not (valorat-popularitat ?dest))
    =>
    (bind ?auxpop "alta")
    (if (eq ?popDesitjada baixa) then
        (bind ?auxpop "baixa")
    )
    (if (eq ?auxpop ?pop) then
        (bind ?punt (+ ?punt 100))
        (bind $?just (insert$ $?just (+ (length$ $?just) 1) "L'usuari vol una popularitat alta"))
    )
    (send ?destVisitades put-puntuacio ?punt)
    (send ?destVisitades put-justificacions $?just)
    (assert (valorat-popularitat ?dest))
)

(defrule processat-data::valorar-continent 
    (preferencies (pref-continent ?contDesitjat))
    ?dest <- (object (is-a Destination) (is_in_continent ?cont))
    ?dest-visitada <- (object (is-a DestinacioVisitada) (desti ?nom-visitat) (puntuacio ?punt) (justificacions $?just))
    (test (eq (instance-name ?dest) (instance-name ?nom-visitat)))
    (not (valorat-cont ?dest))
    =>
    (if (eq ?cont ?contDesitjat) then
        (bind ?punt (+ ?punt 100))
        (bind $?just (insert$ $?just (+ (length$ $?just) 1) "Es puja la puntuacio del continent preferit."))
    )
    (assert (valorat-cont ?dest))
    (send ?dest-visitada put-puntuacio ?punt)
    (send ?dest-visitada put-justificacions $?just)
)

(defrule processat-data::valorar-clima
    (preferencies (pref-clima ?climaDesitjat))
    ?dest <- (object (is-a Destination) (has_climate ?clima))
    ?dest-visitada <- (object (is-a DestinacioVisitada) (desti ?nom-visitat) (puntuacio ?punt) (justificacions $?just))
    (test (eq (instance-name ?dest) (instance-name ?nom-visitat)))
    (not (valorat-clima ?dest))
    =>
    (if (eq ?clima ?climaDesitjat) then
        (bind ?punt (+ ?punt 100))
        (bind $?just (insert$ $?just (+ (length$ $?just) 1) "Es puja la puntuacio de destinacions amb clima preferit."))
    )
    (assert (valorat-clima ?dest))
    (send ?dest-visitada put-puntuacio ?punt)
    (send ?dest-visitada put-justificacions $?just)
)

(defrule processat-data::valorar-llocs-exotics
    (preferencies (preferencia-llocs-exotics ?exoticDesitjat))
    ?dest <- (object (is-a Destination) (is_in_continent ?cont))
    ?dest-visitada <- (object (is-a DestinacioVisitada) (desti ?nom-visitat) (puntuacio ?punt) (justificacions $?just))
    (test (eq (instance-name ?dest) (instance-name ?nom-visitat)))
    (not (valorat-llocs-exotics ?dest))
    =>
    (if (and (eq ?exoticDesitjat TRUE) (not (eq (send ?cont get-name_continent) "Europe"))) then
        (bind ?punt (+ ?punt 50))
        (bind $?just (insert$ $?just (+ (length$ $?just) 1) "Es puja la puntuacio de destinacions exotiques."))
    )
    (assert (valorat-llocs-exotics ?dest))
    (send ?dest-visitada put-puntuacio ?punt)
    (send ?dest-visitada put-justificacions $?just)
)

;; Filtrar allotjaments per qualtiat
(defrule processat-data::filtrar-qualitat-allotjament "Es filtraran els allotjaments que no tinguin prou qualitat"
    ;; Qualitat is numeric
    (restriccions (min-qualitat-allotjament ?minQualitat))
    ?dest <- (object (is-a Destination) (accomodations_are $?acoms))
    ?dest-visitada <- (object (is-a DestinacioVisitada) (desti ?nom-visitat) (puntuacio ?p))
    (test (eq (instance-name ?dest) (instance-name ?nom-visitat)))
    (not (filtrat-qualitat ?dest))
    =>
    (bind $?deleted (create$))
    (progn$ (?curr-acom $?acoms) ;Iterar per totes les accomodations
        (bind ?nom (send ?curr-acom get-name_accom))
        (bind ?qual (send ?curr-acom get-rating))
        (if (< ?qual ?minQualitat) then
            (send ?curr-acom delete)
            (bind $?deleted (insert$ $?deleted (+ (length$ $?deleted) 1) ?curr-acom))
        )
    )

    ;; now delete from acoms
    (progn$ (?curr $?deleted)
        (bind $?acoms (delete-member$ $?acoms ?curr))
    )
    (assert (filtrat-qualitat ?dest))
    (send ?dest put-accomodations_are $?acoms)
)

;; Filtrar transports
(defrule processat-data::filtrar-transports "Es filtraran els transports que no es puguin utilitzar"
    ;; Qualitat is numeric
    (restriccions (rest-transport ?transport))
    ?dest <- (object (is-a Destination) (can_go_to $?go_to) (can_be_reached $?reached))
    ?dest-visitada <- (object (is-a DestinacioVisitada) (desti ?nom-visitat) (puntuacio ?p))
    (test (eq (instance-name ?dest) (instance-name ?nom-visitat)))
    (not (filtrat-transp ?dest))
    =>
    (bind $?transports (create$))

    (if (eq ?transport vaixell) then
        (bind $?transports (find-all-instances ((?inst Boat)) TRUE))
    )
    (if (eq ?transport avio) then
        (bind $?transports (find-all-instances ((?inst Plane)) TRUE))
    )
    (if (eq ?transport tren) then
        (bind $?transports (find-all-instances ((?inst Train)) TRUE))
    )

    (progn$ (?curr-trans $?transports) ;Iterar per totes les accomodations
        (if (member$ ?curr-trans $?go_to) then
            (bind $?go_to (delete-member$ $?go_to ?curr-trans))
        )
        (if (member$ ?curr-trans $?reached) then
            (bind $?reached (delete-member$ $?reached ?curr-trans))
        )
    )

    (assert (filtrat-transp ?dest))
    (send ?dest put-can_go_to $?go_to)
    (send ?dest put-can_be_reached $?reached)
)

(defrule processat-data::filtrar-pois "es filtra per limitar el numero de pois"
    (restriccions (num-dies-ciutat ?dies-ciutat))
    ?dest<- (object (is-a DestinacioVisitada) (pois $?pois))
    (not (filtrat-pois ?dest))
    =>
    (bind ?limit (* ?dies-ciutat 3))
    (while (> (length$ $?pois) ?limit)
      (bind ?elem (nth$ (random 1 (length$ $?pois)) $?pois))
      (bind $?pois (delete-member$ $?pois ?elem))
    )
    (assert (filtrat-pois ?dest))
    (send ?dest put-pois $?pois)
)

(defrule recopilacio-prefs::passar-a-generacio
    (declare (salience -10)) ; TODO should be changed
    =>
    (printout t "Generant solucions..." crlf)
    (focus generacio)
)

;------------------;
; REGLES GENERACIO ;
;------------------;

(defrule generacio::crea-llista-destins "Es crea una llista de destins"
    (not (llista-destins))
    =>
    (assert (llista-destins))
)


(defrule generacio::afegir-desti "afegeix un desti la llista de destins"
    (declare (salience 10))
    ?rec <- (object (is-a DestinacioVisitada))
    ?hecho <- (llista-destins (destins $?llista))
    (test (not (member$ ?rec $?llista)))
    =>
    (bind $?llista (insert$ $?llista (+ (length$ $?llista) 1) ?rec))
    (modify ?hecho (destins $?llista))
)

;; Crear llista destins ordenada

(defrule generacio::crea-llista-ordenada "Es crea la llista de destins ordenada"
    (not (llista-destins-ordenada))
    (llista-destins (destins $?llista))
    =>
    (bind $?resultat (create$))
    (while (not (eq (length$ $?llista ) 0)) do
        ;(bind ?curr (nth$ 1 $?llista))
        (bind ?curr (maxima-puntuacio $?llista))
        (bind $?llista (delete-member$ $?llista ?curr))
        (bind $?resultat (insert$ $?resultat (+ (length$ $?resultat) 1) ?curr))
    )
    (assert (llista-destins-ordenada (destins $?resultat)))
)

;; fix this
(defrule generacio::crea-viatges "Es crean els viatges"
    (not (llista-viatges))
    (llista-destins-ordenada (destins $?destins-disponibles))
    (restriccions (pressupost ?pressupost) (num-ciutats ?num-ciutats) (num-dies-ciutat ?dies-ciutat))
    (Usuari (num-pers ?num-pers))
    =>
    (bind $?llista (create$ ))
    (bind $?llista (insert$ $?llista (+ (length $?llista) 1) (make-instance Viatge1 of Viatge)))
    (bind $?llista (insert$ $?llista (+ (length $?llista) 1) (make-instance Viatge2 of Viatge)))


    ;;; CIUTAT D'ORIGEN SEMPRE ES BARCELONA
    
    (bind ?ciutat-barcelona (nth$ 1 (find-instance ((?inst City)) (eq ?inst:name_city "Barcelona"))))
    (bind ?ciutat-culturia  (nth$ 1 (find-instance ((?inst City)) (eq ?inst:name_city "Culturia"))))

    (bind ?estat (pot-arribar ?ciutat-barcelona ?ciutat-culturia))
    (printout t "Pot anar: ")
    (printout t ?estat crlf)
    ;;;


    (bind ?ind-viatge 1)
    ;; Per cada viatge...
    (while (<= ?ind-viatge 2) do
        ;; seleccionem el viatje
        (bind ?viatge (nth$ ?ind-viatge $?llista))

        ;; Presupost gastat
        (bind ?pressupost-gastat 0)

        ;; ciutat original
        (bind ?origen ?ciutat-barcelona)
        (bind ?prev-ciutat ?ciutat-barcelona)


        ; Destins a seleccionar
        (bind $?destins-sel (create$ ))
        (while (and (< (length$ $?destins-sel) ?num-ciutats) (> (length$ $?destins-disponibles) 0)) do
            ; seleccionem el primer desti
            (bind ?destiVisitat (nth$ 1 $?destins-disponibles))
            (bind ?desti (send ?destiVisitat get-desti))
            (bind $?accoms (send ?desti get-accomodations_are))
            ; de totes les acomodations, pillarem la primera
            (bind ?found FALSE)
            (bind ?i 1)
            (while ( and (<= ?i (length$ $?accoms)) (eq ?found FALSE)) do
                (bind ?curr-accom (nth$ ?i $?accoms)) 
                (bind ?preu-per-nit (send ?curr-accom get-price_per_night))
                (bind ?nou-preu ( * ( * ?preu-per-nit ?num-pers) ?dies-ciutat))
                ;; Comprovar pressupost
                (if ( <= ( + ?pressupost-gastat ?nou-preu) ?pressupost) then
                    ;; COMPROVACIO TRANSPORTS
                    ; de la anterior ciutat a aquesta
                    (bind ?transp-mig (pot-arribar ?prev-ciutat ?desti))
                    ; d'aquesta a l'origen
                    (bind ?transp-final (pot-arribar ?desti ?origen))
                    ;; Ara, comprovar que de l'antrior ciutat podem anar a aquesta, i d'aquesta a l'origen
                    (if (and (not (eq ?transp-mig FALSE)) (not (eq ?transp-final FALSE))) then
                        
                        ;; assignem transport utilitzar
                        (send ?destiVisitat put-transport-arribar ?transp-mig) 
                        ;; assignem el transport final
                        (send ?viatge put-transport-tornada ?transp-final)
                        ;; actualitzem la previa ciutat
                        (bind ?prev-ciutat ?desti)

                        (bind ?found TRUE)
                        (bind ?pressupost-gastat (+ ?pressupost-gastat ?nou-preu))
                        (send ?destiVisitat put-nom-hotel (send ?curr-accom get-name_accom))
                        (send ?destiVisitat put-numero-dies ?dies-ciutat)

                    )

                    ;; FI TRANSPORTS

                    ;; UNCOMMENT THIS IF WANT TO DISABLE TRANSPORTS
                    ;(bind ?found TRUE)
                    ;(bind ?pressupost-gastat (+ ?pressupost-gastat ?nou-preu))
                    ;(send ?destiVisitat put-nom-hotel (send ?curr-accom get-name_accom))
                    ;(send ?destiVisitat put-numero-dies ?dies-ciutat)
                    ;; Ok, anem a agafar pois
                    ;; END DISABLE TRANSPORTS
                )
                (bind ?i (+ ?i 1))
            )

            (if (eq ?found TRUE) then
                ; seleccionem un desti random
                ;(bind ?rand-desti (nth$ (random 1 (length$ $?destins-disponibles)) $?destins-disponibles))

                ; afegin el desti seleccionat a la llista de destins seleccionats
                (bind $?destins-sel (insert$ $?destins-sel (+ (length$ $?destins-sel) 1) ?destiVisitat))

            )
            ; eliminem el desti de la llista
            (bind $?destins-disponibles (delete-member$ $?destins-disponibles ?destiVisitat))
        )
        ;; asignem els destins seleccionats al viatge
        (send ?viatge put-destins-visitats $?destins-sel)
        (send ?viatge put-cost ?pressupost-gastat)
        (bind ?ind-viatge (+ ?ind-viatge 1)) 
    )
    (assert (llista-viatges (viatges $?llista)))
)

(defrule generacio::passar-a-presentacio "Pasa al modul presentacio"
    (declare (salience -1))
    (llista-destins)
    (llista-viatges)
    =>
    (focus presentacio)
)

;--------------------;
; REGLES PRESENTACIO ;
;--------------------;


(defrule presentacio::imprimir-resposta "Imprimeix el resultat"
    (llista-viatges (viatges $?viatges))
    (Usuari (nom ?nom))
    (not (final))
    =>
    (printout t "Imprimint respostes..." crlf)
    (format t "%s, aquesta es la recomanacio, esperem que li agradi!" ?nom)
    (printout t crlf)
    (progn$ (?curr $?viatges)
        (printout t (send ?curr imprimir))
    )
    (assert (final))
)
