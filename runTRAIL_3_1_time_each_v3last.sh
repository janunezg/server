#!/bin/bash

# URL del endpoint
BASE_URL="http://localhost:1234/query"

# Lista de pruebas  completas a ejecutar
PATTERNS=(





"MATCH (p20956)=[ALL TRAILS ?p1 (:likes)|:replyOf{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (m2597159)=[ALL TRAILS ?p1 (:replyOf)|:replyOf{1,5}]=>(?y) RETURN COUNT(?p1)"


"MATCH (m2597159)=[ALL TRAILS ?p1 (:replyOf){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (tc7)=[ALL TRAILS ?p1 (:isSubclassOf){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p32)=[ALL TRAILS ?p1 (:knows){1,5}]=>(?y) RETURN COUNT(?p1)"

"MATCH (m2597159)=[ALL TRAILS ?p1 (:replyOf){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (tc7)=[ALL TRAILS ?p1 (:isSubclassOf){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p32)=[ALL TRAILS ?p1 (:knows){0,5}]=>(?y) RETURN COUNT(?p1)"


"MATCH (f6)=[ALL TRAILS ?p1 (:hasModerator)/:knows{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (t6)=[ALL TRAILS ?p1 (:hasType)/:isSubclassOf{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (tc7)=[ALL TRAILS ?p1 (:isSubclassOf)/:isSubclassOf{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p32)=[ALL TRAILS ?p1 (:knows)/:knows{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes)/:replyOf{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (m2597159)=[ALL TRAILS ?p1 (:replyOf)/:replyOf{1,5}]=>(?y) RETURN COUNT(?p1)"



"MATCH (p8)=[ALL TRAILS ?p1 (:studyAt | :knows){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p8)=[ALL TRAILS ?p1 (:studyAt | :hasInterest){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (m2597148)=[ALL TRAILS ?p1 (:hasCreator | :isLocatedIn){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p8)=[ALL TRAILS ?p1 (:studyAt | :isLocatedIn){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p9)=[ALL TRAILS ?p1 (:workAt | :studyAt){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (m2597159)=[ALL TRAILS ?p1 (:replyOf | :hasCreator){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (m2597159)=[ALL TRAILS ?p1 (:replyOf | :isLocatedIn){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p9)=[ALL TRAILS ?p1 (:workAt | :isLocatedIn){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (f54)=[ALL TRAILS ?p1 (:hasMember | :hasModerator){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (f6)=[ALL TRAILS ?p1 (:hasModerator | :containerOf){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p9)=[ALL TRAILS ?p1 (:workAt | :hasInterest){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (f54)=[ALL TRAILS ?p1 (:hasMember | :containerOf){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes | :studyAt){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes | :workAt){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes | :hasInterest){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes | :isLocatedIn){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p56)=[ALL TRAILS ?p1 (:hasInterest | :knows){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes | :knows){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p9)=[ALL TRAILS ?p1 (:workAt | :knows){1,5}]=>(?y) RETURN COUNT(?p1)"


"MATCH (p8)=[ALL TRAILS ?p1 (:studyAt | :knows)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (p8)=[ALL TRAILS ?p1 (:studyAt | :hasInterest)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (m2597148)=[ALL TRAILS ?p1 (:hasCreator | :isLocatedIn)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (p8)=[ALL TRAILS ?p1 (:studyAt | :isLocatedIn)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (p9)=[ALL TRAILS ?p1 (:workAt | :studyAt)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (m2597159)=[ALL TRAILS ?p1 (:replyOf | :hasCreator)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (m2597159)=[ALL TRAILS ?p1 (:replyOf | :isLocatedIn)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (p9)=[ALL TRAILS ?p1 (:workAt | :isLocatedIn)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (f54)=[ALL TRAILS ?p1 (:hasMember | :hasModerator)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (f6)=[ALL TRAILS ?p1 (:hasModerator | :containerOf)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (p9)=[ALL TRAILS ?p1 (:workAt | :hasInterest)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (f54)=[ALL TRAILS ?p1 (:hasMember | :containerOf)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes | :studyAt)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes | :workAt)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes | :hasInterest)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes | :isLocatedIn)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (p56)=[ALL TRAILS ?p1 (:hasInterest | :knows)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes | :knows)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (p9)=[ALL TRAILS ?p1 (:workAt | :knows)?]=>(?y) RETURN COUNT(?p1)"


"MATCH (p8)=[ALL TRAILS ?p1 (:studyAt | :knows){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p8)=[ALL TRAILS ?p1 (:studyAt | :hasInterest){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (m2597148)=[ALL TRAILS ?p1 (:hasCreator | :isLocatedIn){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p8)=[ALL TRAILS ?p1 (:studyAt | :isLocatedIn){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p9)=[ALL TRAILS ?p1 (:workAt | :studyAt){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (m2597159)=[ALL TRAILS ?p1 (:replyOf | :hasCreator){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (m2597159)=[ALL TRAILS ?p1 (:replyOf | :isLocatedIn){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p9)=[ALL TRAILS ?p1 (:workAt | :isLocatedIn){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (f54)=[ALL TRAILS ?p1 (:hasMember | :hasModerator){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (f6)=[ALL TRAILS ?p1 (:hasModerator | :containerOf){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p9)=[ALL TRAILS ?p1 (:workAt | :hasInterest){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (f54)=[ALL TRAILS ?p1 (:hasMember | :containerOf){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes | :studyAt){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes | :workAt){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes | :hasInterest){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes | :isLocatedIn){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p56)=[ALL TRAILS ?p1 (:hasInterest | :knows){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes | :knows){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p9)=[ALL TRAILS ?p1 (:workAt | :knows){0,5}]=>(?y) RETURN COUNT(?p1)"

)
#recuerda que * es {0,4} y + es {1,5}
# Ejecutar las consultas

for PATTERN in "${PATTERNS[@]}"; do
    # Ejecutar la consulta
    RESPONSE=$(curl -s -X POST "$BASE_URL" -d "$PATTERN")
    
    # Imprimir respuesta para cada consulta (opcional)
    # echo -e "Consulta ejecutada:\n$PATTERN\nRespuesta:\n$RESPONSE\n"
done

# Confirmar que todas las consultas se completaron
echo "Todas las consultas se ejecutaron correctamente."
