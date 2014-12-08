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


; Sun Dec 07 22:25:00 CET 2014
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

; Sun Dec 07 22:25:01 CET 2014
; 
;+ (version "3.4.8")
;+ (build "Build 629")

([MAIN::ia-viatges_Class0] of  TypeDestination

	(destinations_are [MAIN::ia-viatges_Class30034])
	(name_type_dest "gran_ciutat_europea"))

([MAIN::ia-viatges_Class1] of  Continent

	(has_destinations
		[MAIN::ia-viatges_Class30022]
		[MAIN::ia-viatges_Class30040])
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
		[MAIN::ia-viatges_Class30055])
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
		[MAIN::ia-viatges_Class30049])
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

	(has_climate [MAIN::ia-viatges_Class10008])
	(is_in_continent [MAIN::ia-viatges_Class2])
	(name_city "Culturia")
	(poi_are
		[MAIN::ia-viatges_Class30009]
		[MAIN::ia-viatges_Class20002]
		[MAIN::ia-viatges_Class30013]
		[MAIN::ia-viatges_Class30014]
		[MAIN::ia-viatges_Class30015])
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
		[MAIN::ia-viatges_Class30048])
	(has_climate [MAIN::ia-viatges_Class10007])
	(is_in_continent [MAIN::ia-viatges_Class2])
	(name_city "UltraLuxe")
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
		[MAIN::ia-viatges_Class30051])
	(has_climate [MAIN::ia-viatges_Class10007])
	(is_in_continent [MAIN::ia-viatges_Class5])
	(name_city "ReasonableLux")
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
	(has_climate [MAIN::ia-viatges_Class10006])
	(is_in_continent [MAIN::ia-viatges_Class4])
	(name_city "AverageJoe")
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
	(has_climate [MAIN::ia-viatges_Class10005])
	(is_in_continent [MAIN::ia-viatges_Class4])
	(name_city "StudentsDestination")
	(poi_are
		[MAIN::ia-viatges_Class30058]
		[MAIN::ia-viatges_Class30059]
		[MAIN::ia-viatges_Class30060])
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
    (printout t "Fi de")
    (printout t (instance-name ?self) crlf)
)

;; Imprimir destinacio visitada
(defmessage-handler MAIN::DestinacioVisitada imprimir ()
    (printout t "Desti:")
    (printout t (send ?self:desti get-name_city))
    (printout t "   Hotel: ")
    (printout t ?self:nom-hotel crlf)
    (printout t "   Visites:")
    (progn$ (?curr-poi ?self:pois)
        (printout t (send ?curr-poi get-name_poi))
        (printout t ",")
    )
    (printout t crlf)
    (progn$ (?curr-just ?self:justificacions)
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

;; Funcio per retornar l'element de maxima puntuacio

;;; Funcion que retorna el elemento con puntuacion maxima
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
    (bind ?e (pregunta-index "Quin es l'objectiu del viatge? " diversio romantic cultural descans))
    (switch ?e 
        (case 1 then 
            (modify ?u (objectiu-viatge diversio))
        )
        (case 2 then 
            (modify ?u (objectiu-viatge romantic))
        )
        (case 3 then 
            (modify ?u (objectiu-viatge cultural))
        )
        (case 4 then 
            (modify ?u (objectiu-viatge descans))
        )
    )
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
    (bind ?e (pregunta-numerica "De quin pressupost disposes?" 0 5000))
    (modify ?u (pressupost ?e))
)

(defrule recopilacio-restriccions::rest-transport "Pregunta transports"
    ?fet <- (rest-transport ask) 
    ;;?re <- (restriccions)
    =>
    (bind ?r (pregunta-index "Hi ha algun transport que no puguis utilitzar?" vaixell avio tren))
    (switch ?r
        (case 1 then
            (assert (rest-transport vaixell))
        )
        (case 2 then
            (assert (rest-transport avio))
        )
        (case 3 then
            (assert (rest-transport tren))
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
    (printout t "DEBUG - passant a preferencies" crlf)
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
    ?u <- (Usuari (nivell-cult ?cult) (objectiu-viatge ?obj))
    ?dest <- (object (is-a Destination) (poi_are $?pois))
    ?destVisitades <-(object (is-a DestinacioVisitada) (desti ?nom-visitat) (pois $?visitat-pois))
    (test (eq (instance-name ?dest) (instance-name ?nom-visitat)))
    (test (eq ?cult alt))
    (test (not (eq ?obj diversio)))
    (not (afegit-cult ?dest))
    =>
    (bind $?cult-pois (find-all-instances ((?inst Cultural)) TRUE))
    (progn$ (?curr ?cult-pois)
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (send ?destVisitades put-pois $?visitat-pois)
    (assert (afegit-cult ?dest))
)


;; Afegir pois
(defrule processat-data::afegir-diversio "Safegeixen pois Diversio (Leisure)"
    ?u <- (Usuari (objectiu-viatge ?obj))
    ?dest <- (object (is-a Destination) (poi_are $?pois))
    ?destVisitades <-(object (is-a DestinacioVisitada) (desti ?nom-visitat) (pois $?visitat-pois))
    (test (and (eq (instance-name ?dest) (instance-name ?nom-visitat)) (eq ?obj diversio)))
    (not (afegit-diversio ?dest))
    =>
    (bind $?all-pois (find-all-instances ((?inst Leisure)) TRUE))
    (progn$ (?curr ?all-pois)
        (if (member$ ?curr ?pois) then
            (bind $?visitat-pois (insert$ $?visitat-pois (+ (length$ $?visitat-pois) 1) ?curr))
        )
    )
    (send ?destVisitades put-pois $?visitat-pois)
    (assert (afegit-diversio ?dest))
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

;; Filtrar 
;(defrule processat-data::filtrar-pois "es filtraran les pois no desitjades"
;    
;
;
;
;)

(defrule recopilacio-prefs::passar-a-generacio
    (declare (salience -10)) ; TODO should be changed
    =>
    (printout t "DEBUG - passant a generacio" crlf)
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
    (while (and (not (eq (length$ $?llista) 0)) (< (length $?resultat) 30)) do
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
    =>
    (bind $?llista (create$ ))
    (bind $?llista (insert$ $?llista (+ (length $?llista) 1) (make-instance Viatge1 of Viatge)))
    (bind $?llista (insert$ $?llista (+ (length $?llista) 1) (make-instance Viatge2 of Viatge)))

    (bind ?ind-viatge 1)
    (while (<= ?ind-viatge 2) do
        ;; seleccionem el primer viatje
        (bind ?viatge (nth$ ?ind-viatge $?llista))

        ;; Presupost gastat
        (bind ?pressupost-gastat 0)

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
                (if ( <= ( + ?pressupost-gastat ( * ?preu-per-nit ?dies-ciutat)) ?pressupost) then
                    (bind ?found TRUE)
                    (bind ?pressupost-gastat (+ ?pressupost-gastat (* ?preu-per-nit ?dies-ciutat)))
                    (send ?destiVisitat put-nom-hotel (send ?curr-accom get-name_accom))
                    (send ?destiVisitat put-numero-dies ?dies-ciutat)
                    ;; Ok, anem a agafar pois
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
    (printout t "DEBUG - IMPRIMINT RESPOSTES" crlf)
    (format t "%s, aquesta es la recomanacio, esperem que li agradi!" ?nom)
    (printout t crlf)
    (progn$ (?curr $?viatges)
        (printout t (send ?curr imprimir))
    )
    (assert (final))
)
