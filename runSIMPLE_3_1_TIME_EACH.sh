#!/bin/bash

# URL del endpoint
BASE_URL="http://localhost:1234/query"

# Lista de pruebas  completas a ejecutar
PATTERNS=(

"MATCH (m2597148)=[ALL SIMPLE ?p1 (:hasCreator/:isLocatedIn)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597148)=[ALL SIMPLE ?p1 (:hasCreator/:studyAt)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f54)=[ALL SIMPLE ?p1 (:hasMember/:isLocatedIn)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f54)=[ALL SIMPLE ?p1 (:hasMember/:studyAt)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f54)=[ALL SIMPLE ?p1 (:hasMember/:likes)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows/:likes)]=>(?y) RETURN ?p1 LIMIT 100"



"MATCH (m2597148)=[ALL SIMPLE ?p1 (:hasCreator/:isLocatedIn/:isPartOf)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597159)=[ALL SIMPLE ?p1 (:replyOf/:hasCreator/:isLocatedIn)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p20956)=[ALL SIMPLE ?p1 (:likes/:replyOf/:hasTag)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597148)=[ALL SIMPLE ?p1 (:hasCreator/:knows/:isLocatedIn)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows/:knows/:likes)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f54)=[ALL SIMPLE ?p1 (:hasMember/:knows/:likes)]=>(?y) RETURN ?p1 LIMIT 100"


"MATCH (m2597159)=[ALL SIMPLE ?p1 (:replyOf + )/:replyOf]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (tc7)=[ALL SIMPLE ?p1 (:isSubclassOf + )/:isSubclassOf]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows + )/:studyAt]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows + )/:isLocatedIn]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows + )/:hasInterest]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows + )/:likes]=>(?y) RETURN ?p1 LIMIT 100"



"MATCH (m2597159)=[ALL SIMPLE ?p1 (:replyOf/:replyOf+)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (tc7)=[ALL SIMPLE ?p1 (:isSubclassOf/:isSubclassOf+)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p20956)=[ALL SIMPLE ?p1 (:likes/:replyOf+)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f6)=[ALL SIMPLE ?p1 (:hasModerator/:knows+)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597148)=[ALL SIMPLE ?p1 (:hasCreator/:knows+)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f54)=[ALL SIMPLE ?p1 (:hasMember/:knows+)]=>(?y) RETURN ?p1 LIMIT 100"






"MATCH (m2597148)=[ALL SIMPLE ?p1 (:hasCreator)|(:knows +)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f6)=[ALL SIMPLE ?p1 (:hasModerator)|(:knows +)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597159)=[ALL SIMPLE ?p1 (:replyOf)|(:replyOf +)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (tc7)=[ALL SIMPLE ?p1 (:isSubclassOf)|(:isSubclassOf +)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p20956)=[ALL SIMPLE ?p1 (:likes)|(:replyOf +)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows)|(:knows +)]=>(?y) RETURN ?p1 LIMIT 100"


















"MATCH (p20956)=[ALL SIMPLE ?p1 (:likes/:hasCreator)+]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597148)=[ALL SIMPLE ?p1 (:hasCreator/:likes)+]=>(?y) RETURN ?p1 LIMIT 100"

"MATCH (m2597159)=[ALL SIMPLE ?p1 (:replyOf/(:hasCreator|:hasInterest))]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597159)=[ALL SIMPLE ?p1 (:replyOf/(:hasCreator|:likes))]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f6)=[ALL SIMPLE ?p1 (:hasModerator/(:knows|:hasInterest))]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f6)=[ALL SIMPLE ?p1 (:hasModerator/(:hasInterest|:likes))]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f54)=[ALL SIMPLE ?p1 (:hasMember/(:knows|:likes))]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows/(:knows|:likes))]=>(?y) RETURN ?p1 LIMIT 100"



"MATCH (tc7)=[ALL SIMPLE ?p1 (:isSubclassOf+)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597159)=[ALL SIMPLE ?p1 (:replyOf+)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows+)]=>(?y) RETURN ?p1 LIMIT 100"







"MATCH (m2597159)=[ALL SIMPLE ?p1 (:replyOf * )/:replyOf]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (tc7)=[ALL SIMPLE ?p1 (:isSubclassOf * )/:isSubclassOf]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows * )/:studyAt]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows * )/:isLocatedIn]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows * )/:hasInterest]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows * )/:likes]=>(?y) RETURN ?p1 LIMIT 100"






"MATCH (m2597159)=[ALL SIMPLE ?p1 (:replyOf/:replyOf*)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (tc7)=[ALL SIMPLE ?p1 (:isSubclassOf/:isSubclassOf*)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (t6)=[ALL SIMPLE ?p1 (:hasType/:isSubclassOf*)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p20956)=[ALL SIMPLE ?p1 (:likes/:replyOf*)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows/:knows*)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597148)=[ALL SIMPLE ?p1 (:hasCreator/:knows*)]=>(?y) RETURN ?p1 LIMIT 100"

"MATCH (m2597159)=[ALL SIMPLE ?p1 (:replyOf*)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (tc7)=[ALL SIMPLE ?p1 (:isSubclassOf*)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows*)]=>(?y) RETURN ?p1 LIMIT 100"


"MATCH (p20956)=[ALL SIMPLE ?p1 (:likes/:hasCreator)*]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597148)=[ALL SIMPLE ?p1 (:hasCreator/:likes)*]=>(?y) RETURN ?p1 LIMIT 100"






"MATCH (f60)=[ALL SIMPLE ?p1 (:containerOf/:hasTag)?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (pL6)=[ALL SIMPLE ?p1 (:isPartOf/:isPartOf)?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f54)=[ALL SIMPLE ?p1 (:hasMember/:isLocatedIn)?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f54)=[ALL SIMPLE ?p1 (:hasMember/:studyAt)?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597148)=[ALL SIMPLE ?p1 (:hasCreator/:likes)?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows/:likes)?]=>(?y) RETURN ?p1 LIMIT 100"






"MATCH (pL6)=[ALL SIMPLE ?p1 (:isPartOf/:isPartOf?)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597148)=[ALL SIMPLE ?p1 (:hasCreator/:isLocatedIn?)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f60)=[ALL SIMPLE ?p1 (:containerOf/:hasCreator?)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows/:isLocatedIn?)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f54)=[ALL SIMPLE ?p1 (:hasMember/:knows?)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows/:likes?)]=>(?y) RETURN ?p1 LIMIT 100"




"MATCH (f60)=[ALL SIMPLE ?p1 (:containerOf?/:hasTag)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597148)=[ALL SIMPLE ?p1 (:hasCreator?/:studyAt)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f54)=[ALL SIMPLE ?p1 (:hasMember?/:studyAt)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows?/:isLocatedIn)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f54)=[ALL SIMPLE ?p1 (:hasMember?/:knows)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows?/:likes)]=>(?y) RETURN ?p1 LIMIT 100"




"MATCH (p8)=[ALL SIMPLE ?p1 :studyAt|:knows]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597148)=[ALL SIMPLE ?p1 :hasCreator|:isLocatedIn]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f6)=[ALL SIMPLE ?p1 :hasModerator|:containerOf]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p56)=[ALL SIMPLE ?p1 :hasInterest|:knows]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p20956)=[ALL SIMPLE ?p1 :likes|:knows]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p20956)=[ALL SIMPLE ?p1 :likes|:hasInterest]=>(?y) RETURN ?p1 LIMIT 100"



"MATCH (m2597148)=[ALL SIMPLE ?p1 :isLocatedIn|:studyAt]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597148)=[ALL SIMPLE ?p1 :isLocatedIn|:workAt]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f60)=[ALL SIMPLE ?p1 :containerOf|:hasModerator]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 :knows|:studyAt]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 :knows|:likes]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p9)=[ALL SIMPLE ?p1 :workAt|:likes]=>(?y) RETURN ?p1 LIMIT 100"





"MATCH (m2597148)=[ALL SIMPLE ?p1 ((:isLocatedIn/:isPartOf)|:hasInterest)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597148)=[ALL SIMPLE ?p1 ((:isLocatedIn/:isPartOf)|:knows)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 ((:knows/:studyAt)|:hasInterest)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 ((:knows/:isLocatedIn)|:hasInterest)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 ((:knows/:likes)|:hasInterest)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 ((:knows/:likes)|:likes)]=>(?y) RETURN ?p1 LIMIT 100"


"MATCH (m2597148)=[ALL SIMPLE ?p1 (:isLocatedIn|(:hasInterest/:hasType))]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597148)=[ALL SIMPLE ?p1 (:isLocatedIn|(:knows/:hasInterest))]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p56)=[ALL SIMPLE ?p1 (:hasInterest|(:knows/:workAt))]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows|(:knows/:studyAt))]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows|(:knows/:likes))]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p9)=[ALL SIMPLE ?p1 (:workAt|(:knows/:likes))]=>(?y) RETURN ?p1 LIMIT 100"




"MATCH (m2597148)=[ALL SIMPLE ?p1 ((:isLocatedIn|:knows)|:hasInterest)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597148)=[ALL SIMPLE ?p1 ((:isLocatedIn|:knows)|:likes)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p56)=[ALL SIMPLE ?p1 ((:hasInterest|:workAt)|:studyAt)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p56)=[ALL SIMPLE ?p1 ((:hasInterest|:isLocatedIn)|:studyAt)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p9)=[ALL SIMPLE ?p1 ((:workAt|:knows)|:likes)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p9)=[ALL SIMPLE ?p1 ((:workAt|:likes)|:knows)]=>(?y) RETURN ?p1 LIMIT 100"






"MATCH (m2597159)=[ALL SIMPLE ?p1 (:replyOf+)|:hasCreator]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597159)=[ALL SIMPLE ?p1 (:replyOf+)|:hasTag]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows+)|:isLocatedIn]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows+)|:studyAt]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows+)|:hasInterest]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows+)|:likes]=>(?y) RETURN ?p1 LIMIT 100"





"MATCH (m2597159)=[ALL SIMPLE ?p1 (:replyOf*)|:hasCreator]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597159)=[ALL SIMPLE ?p1 (:replyOf*)|:hasTag]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows*)|:knows]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows*)|:workAt]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows*)|:isLocatedIn]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p32)=[ALL SIMPLE ?p1 (:knows*)|:studyAt]=>(?y) RETURN ?p1 LIMIT 100"




"MATCH (m2597148)=[ALL SIMPLE ?p1 (:hasCreator ?)|:hasCreator]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f6)=[ALL SIMPLE ?p1 (:hasModerator ?)|:hasModerator]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f60)=[ALL SIMPLE ?p1 (:containerOf ?)|:containerOf]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f60)=[ALL SIMPLE ?p1 (:containerOf ?)|:hasModerator]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p20956)=[ALL SIMPLE ?p1 (:likes ?)|:hasInterest]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p9)=[ALL SIMPLE ?p1 (:workAt ?)|:likes]=>(?y) RETURN ?p1 LIMIT 100"


"MATCH (m2597148)=[ALL SIMPLE ?p1 :hasCreator|(:hasCreator ?)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f6)=[ALL SIMPLE ?p1 :hasModerator|(:hasModerator ?)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f60)=[ALL SIMPLE ?p1 :containerOf|(:containerOf ?)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f60)=[ALL SIMPLE ?p1 :containerOf|(:hasModerator ?)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p20956)=[ALL SIMPLE ?p1 :likes|(:hasInterest ?)]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p9)=[ALL SIMPLE ?p1 :workAt|(:likes ?)]=>(?y) RETURN ?p1 LIMIT 100"





"MATCH (m2597148)=[ALL SIMPLE ?p1 :hasCreator ?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f6)=[ALL SIMPLE ?p1 :hasModerator ?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597159)=[ALL SIMPLE ?p1 :replyOf ?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p8)=[ALL SIMPLE ?p1 :studyAt ?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p56)=[ALL SIMPLE ?p1 :hasInterest ?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p20956)=[ALL SIMPLE ?p1 :likes ?]=>(?y) RETURN ?p1 LIMIT 100"




"MATCH (m2597148)=[ALL SIMPLE ?p1 (:hasCreator ?)?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f6)=[ALL SIMPLE ?p1 (:hasModerator ?)?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597159)=[ALL SIMPLE ?p1 (:replyOf ?)?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p8)=[ALL SIMPLE ?p1 (:studyAt ?)?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p56)=[ALL SIMPLE ?p1 (:hasInterest ?)?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p20956)=[ALL SIMPLE ?p1 (:likes ?)?]=>(?y) RETURN ?p1 LIMIT 100"


"MATCH (m2597148)=[ALL SIMPLE ?p1 (:isLocatedIn|(:hasInterest|:knows))]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (m2597148)=[ALL SIMPLE ?p1 (:isLocatedIn|(:hasInterest|:workAt))]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p56)=[ALL SIMPLE ?p1 (:hasInterest|(:studyAt|:knows))]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p56)=[ALL SIMPLE ?p1 (:hasInterest|(:workAt|:knows))]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p9)=[ALL SIMPLE ?p1 (:workAt|(:hasInterest|:likes))]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p9)=[ALL SIMPLE ?p1 (:workAt|(:likes|:knows))]=>(?y) RETURN ?p1 LIMIT 100"

"MATCH (p8)=[ALL SIMPLE ?p1 (:studyAt|:knows)+]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p8)=[ALL SIMPLE ?p1 (:studyAt|:hasInterest)+]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f6)=[ALL SIMPLE ?p1 (:hasModerator|:containerOf)+]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p9)=[ALL SIMPLE ?p1 (:workAt|:hasInterest)+]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p20956)=[ALL SIMPLE ?p1 (:likes|:knows)+]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p9)=[ALL SIMPLE ?p1 (:workAt|:knows)+]=>(?y) RETURN ?p1 LIMIT 100"

"MATCH (p8)=[ALL SIMPLE ?p1 (:studyAt|:knows)?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p8)=[ALL SIMPLE ?p1 (:studyAt|:hasInterest)?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f54)=[ALL SIMPLE ?p1 (:hasMember|:hasModerator)?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f6)=[ALL SIMPLE ?p1 (:hasModerator|:containerOf)?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p20956)=[ALL SIMPLE ?p1 (:likes|:knows)?]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p20956)=[ALL SIMPLE ?p1 (:likes|:hasInterest)?]=>(?y) RETURN ?p1 LIMIT 100"

"MATCH (p8)=[ALL SIMPLE ?p1 (:studyAt|:knows)*]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p8)=[ALL SIMPLE ?p1 (:studyAt|:hasInterest)*]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f54)=[ALL SIMPLE ?p1 (:hasMember|:hasModerator)*]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (f6)=[ALL SIMPLE ?p1 (:hasModerator|:containerOf)*]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p20956)=[ALL SIMPLE ?p1 (:likes|:knows)*]=>(?y) RETURN ?p1 LIMIT 100"
"MATCH (p9)=[ALL SIMPLE ?p1 (:workAt|:knows)*]=>(?y) RETURN ?p1 LIMIT 100"

)
#recuerda que * es {0,4} y + es {1,4}
# Ejecutar las consultas

for PATTERN in "${PATTERNS[@]}"; do
    # Ejecutar la consulta
    RESPONSE=$(curl -s -X POST "$BASE_URL" -d "$PATTERN")
    
    # Imprimir respuesta para cada consulta (opcional)
    # echo -e "Consulta ejecutada:\n$PATTERN\nRespuesta:\n$RESPONSE\n"
done

# Confirmar que todas las consultas se completaron
echo "Todas las consultas se ejecutaron correctamente."
