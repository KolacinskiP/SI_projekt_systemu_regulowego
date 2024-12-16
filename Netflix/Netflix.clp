;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot runtime (default clear))
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule choose-drama-comedy ""

   (logical (start))

   =>

   (assert (UI-state (display StartQuestion)
                     (relation-asserted Drama-Comedy)
                     (response Drama)
                     (valid-answers Drama Comedy Both))))
   
(defrule choose-scifi-supernatural ""

   (logical (Drama-Comedy Drama))

   =>

   (assert (UI-state (display SciFiSuperNaturalQuestion)
                     (relation-asserted scifi-supernatural)
                     (response No)
                     (valid-answers No Yes))))

(defrule choose-questionable-morals ""

   (logical (Drama-Comedy Comedy))

   =>

   (assert (UI-state (display MoralsQuestion)
                     (relation-asserted questionable-morals)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule choose-town-prison ""

   (logical (Drama-Comedy Both))

   =>

   (assert (UI-state (display TownPrisonQuestion)
                     (relation-asserted town-prison)
                     (response Town)
                     (valid-answers Town Prison))))
   
(defrule choose-politics ""

   (logical (scifi-supernatural No))

   =>

   (assert (UI-state (display PoliticsQuestion)
                     (relation-asserted politics)
                     (response No)
                     (valid-answers No Yes))))
                     
(defrule choose-gore ""

   (logical (scifi-supernatural Yes))

   =>

   (assert (UI-state (display GoreQuestion)
                     (relation-asserted gore)
                     (response No)
                     (valid-answers No Yes))))
                     
(defrule choose-british ""

   (logical (gore No))

   =>

   (assert (UI-state (display BritishQuestion)
                     (relation-asserted british)
                     (response No)
                     (valid-answers No Yes))))
                     
(defrule choose-zombies ""

   (logical (gore Yes))

   =>

   (assert (UI-state (display ZombiesQuestion)
                     (relation-asserted zombies)
                     (response No)
                     (valid-answers No Yes))))      
                     
(defrule choose-crying ""

   (logical (politics No))

   =>

   (assert (UI-state (display CryingQuestion)
                     (relation-asserted crying)
                     (response No)
                     (valid-answers No Yes))))                     
                     
(defrule choose-action ""

   (logical (politics Yes))

   =>

   (assert (UI-state (display ActionQuestion)
                     (relation-asserted action)
                     (response No)
                     (valid-answers No Yes))))                                 
                     
(defrule choose-strong-female ""

   (logical (questionable-morals No))

   =>

   (assert (UI-state (display StrongFemaleshQuestion)
                     (relation-asserted strong-female)
                     (response No)
                     (valid-answers No Yes))))           
                     
(defrule choose-friends-family ""

   (logical (questionable-morals Yes))

   =>

   (assert (UI-state (display FriendsFamilyQuestion)
                     (relation-asserted friends-family)
                     (response Friends)
                     (valid-answers Friends Family))))      
                     
(defrule choose-workplace-humor ""

   (logical (strong-female No))

   =>

   (assert (UI-state (display WorkplaceHumorQuestion)
                     (relation-asserted workplace-humor)
                     (response No)
                     (valid-answers No Yes))))              
                     
(defrule choose-franco-and-rogen ""

   (logical (workplace-humor No))

   =>

   (assert (UI-state (display FrancoAndRogenQuestion)
                     (relation-asserted franco-and-rogen)
                     (response No)
                     (valid-answers No Yes))))
                     
(defrule choose-bar-cafe ""

   (logical (franco-and-rogen No))

   =>

   (assert (UI-state (display BarCafeQuestion)
                     (relation-asserted bar-cafe)
                     (response Bar)
                     (valid-answers Bar Cafe))))
                     
(defrule choose-drugs ""

   (logical (franco-and-rogen No))

   =>

   (assert (UI-state (display DrugsQuestion)
                     (relation-asserted drugs)
                     (response No)
                     (valid-answers No Yes))))

(defrule choose-drugs ""

   (logical (strong-female Yes))

   =>

   (assert (UI-state (display DrugsQuestion)
                     (relation-asserted drugs)
                     (response No)
                     (valid-answers No Yes))))
                     
(defrule choose-football ""

   (logical (crying Yes))

   =>

   (assert (UI-state (display FootballQuestion)
                     (relation-asserted football)
                     (response No)
                     (valid-answers No Yes))))
                     
(defrule choose-crime ""

   (logical (crying No))

   =>

   (assert (UI-state (display CrimeQuestion)
                     (relation-asserted crime)
                     (response No)
                     (valid-answers No Yes))))
                     
(defrule choose-hospitals ""

   (logical (football No))

   =>

   (assert (UI-state (display HospitalsQuestion)
                     (relation-asserted hospitals)
                     (response No)
                     (valid-answers No Yes))))
                     
(defrule choose-tina-amy ""

   (logical (football No))

   =>

   (assert (UI-state (display TinaAmyQuestion)
                     (relation-asserted tina-amy)
                     (response Tina)
                     (valid-answers Tina Amy))))
                     
(defrule choose-tina-amy ""

   (logical (drugs No))

   =>

   (assert (UI-state (display TinaAmyQuestion)
                     (relation-asserted tina-amy)
                     (response Tina)
                     (valid-answers Tina Amy))))
                     
(defrule choose-criminals ""

   (logical (crime Yes))

   =>

   (assert (UI-state (display CriminalsQuestion)
                     (relation-asserted criminals)
                     (response No)
                     (valid-answers No Yes))))
                     
(defrule choose-romance ""

   (logical (action No))

   =>

   (assert (UI-state (display RomanceQuestion)
                     (relation-asserted romance)
                     (response No)
                     (valid-answers No Yes))))
                     
(defrule choose-optimistic-cynical ""

   (logical (romance No))

   =>

   (assert (UI-state (display OptimisticCynicalQuestion)
                     (relation-asserted optimistic-cynical)
                     (response Optimistic)
                     (valid-answers Optimistic Cynical))))
                     
(defrule choose-meth ""

   (logical (crime No))

   =>

   (assert (UI-state (display MethQuestion)
                     (relation-asserted meth)
                     (response No)
                     (valid-answers No Yes))))
                     
(defrule choose-forensics-psychology ""

   (logical (criminals No))

   =>

   (assert (UI-state (display ForensicsPsychologyQuestion)
                     (relation-asserted forensic-psychology)
                     (response Forensics)
                     (valid-answers Forensics Psychology))))
                     
(defrule choose-vampires ""

   (logical (zombies No))

   =>

   (assert (UI-state (display VampiresQuestion)
                     (relation-asserted vampires)
                     (response No)
                     (valid-answers No Yes))))

;;;****************
;;;* END RULES *
;;;****************

(defrule Prison-end ""

   (logical (town-prison Prison))
   
   =>

   (assert (UI-state (display OITNB)
                     (runtime RuntimeOITNB)
                     (state final))))

(defrule Town-end ""

   (logical (town-prison Town))
   
   =>

   (assert (UI-state (display GilmoreGirls)
                     (runtime RuntimeGilmoreGirls)
                     (state final))))
                     
(defrule Friends-end ""

   (logical (friends-family Friends))
   
   =>

   (assert (UI-state (display Sunny)
                     (runtime RuntimeSunny)
                     (state final))))
                     
(defrule workplace-humor-yes-end ""

   (logical (workplace-humor Yes))
   
   =>

   (assert (UI-state (display TheOffice)
                     (runtime RuntimeTheOffice)
                     (state final))))
                     
(defrule british-yes-end ""

   (logical (british Yes))
   
   =>

   (assert (UI-state (display DrWho)
                     (runtime RuntimeDrWho)
                     (state final))))
                     
(defrule british-no-end ""

   (logical (british No))
   
   =>

   (assert (UI-state (display Lost)
                     (runtime RuntimeLost)
                     (state final))))
                     
(defrule action-yes-end ""

   (logical (action No))
   
   =>

   (assert (UI-state (display 24)
                     (runtime Runtime24)
                     (state final))))
                     
(defrule drugs-yes-end ""

   (logical (drugs Yes))
   
   =>

   (assert (UI-state (display Weeds)
                     (runtime RuntimeWeeds)
                     (state final))))
                     
(defrule amy-end ""

   (logical (tina-amy Amy))
   
   =>

   (assert (UI-state (display Parks&Rec)
                     (runtime RuntimeParks&Rec)
                     (state final))))
                     
(defrule tina-end ""

   (logical (tina-amy Tina))
   
   =>

   (assert (UI-state (display 30Rock)
                     (runtime Runtime30Rock)
                     (state final))))
                     
(defrule football-yes-end ""

   (logical (football Yes))
   
   =>

   (assert (UI-state (display Friday)
                     (runtime RuntimeFriday)
                     (state final))))
                     
(defrule hospitals-no-end ""

   (logical (hospitals No))
   
   =>

   (assert (UI-state (display Parenthood)
                     (runtime RuntimeParenthood)
                     (state final))))
                     
(defrule hospitals-yes-end ""

   (logical (hospitals Yes))
   
   =>

   (assert (UI-state (display GraysAnatomy)
                     (runtime RuntimeGraysAnatomy)
                     (state final))))
                     
(defrule criminals-yes-end ""

   (logical (criminals Yes))
   
   =>

   (assert (UI-state (display Dexter)
                     (runtime RuntimeDexter)
                     (state final))))
                     
(defrule romance-yes-end ""

   (logical (romance Yes))
   
   =>

   (assert (UI-state (display Scandal)
                     (runtime RuntimeScandal)
                     (state final))))
                     
(defrule meth-no-end ""

   (logical (meth No))
   
   =>

   (assert (UI-state (display MadMen)
                     (runtime RuntimeMadMen)
                     (state final))))
                     
(defrule meth-yes-end ""

   (logical (meth yes))
   
   =>

   (assert (UI-state (display BreakingBad)
                     (runtime RuntimeBreakingBad)
                     (state final))))
                     
(defrule franco-and-rogen-yes-end ""

   (logical (franco-and-rogen Yes))
   
   =>

   (assert (UI-state (display Freaks&Geeks)
                     (runtime RuntimeFreaks&Geeks)
                     (state final))))
                     
(defrule zombies-yes-end ""

   (logical (zombies Yes))
   
   =>

   (assert (UI-state (display TheWalkingDead)
                     (runtime RuntimeTheWalkingDead)
                     (state final))))
                     
(defrule vampires-no-end ""

   (logical (vampires No))
   
   =>

   (assert (UI-state (display Supernatural)
                     (runtime RuntimeSupernatural)
                     (state final))))
                     
(defrule vampires-yes-end ""

   (logical (vampires Yes))
   
   =>

   (assert (UI-state (display TheVampireDiaries)
                     (runtime RuntimeTheVampireDiaries)
                     (state final))))
                     
(defrule optimistic-end ""

   (logical (optimistic-cynical Optimistic))
   
   =>

   (assert (UI-state (display TheWestWing)
                     (runtime RuntimeTheWestWing)
                     (state final))))
                     
(defrule cynical-end ""

   (logical (optimistic-cynical Cynical))
   
   =>

   (assert (UI-state (display HouseOfCards)
                     (runtime RuntimeHouseOfCards)
                     (state final))))
                     
(defrule bar-end ""

   (logical (bar-cafe Bar))
   
   =>

   (assert (UI-state (display HowIMetYourMother)
                     (runtime RuntimeHowIMetYourMother)
                     (state final))))
                     
(defrule cafe-end ""

   (logical (bar-cafe Cafe))
   
   =>

   (assert (UI-state (display Friends)
                     (runtime RuntimeFriends)
                     (state final))))
                     
(defrule forensics-end ""

   (logical (forensics-psychology Forensics))
   
   =>

   (assert (UI-state (display CISMiami)
                     (runtime RuntimeCISMiami)
                     (state final))))
                     
(defrule psychology-end ""

   (logical (forensics-psychology Psychology))
   
   =>

   (assert (UI-state (display CriminalMinds)
                     (runtime RuntimeCriminalMinds)
                     (state final))))
                     
(defrule NOTHING ""

   (declare (salience -10))
  
   (logical (UI-state (id ?id)))
   
   (state-list (current ?id))
     
   =>
  
   (assert (UI-state (display ERROR)
                     (state final))))
                     
;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   
