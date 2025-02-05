#!/bin/bash

# URL del endpoint
BASE_URL="http://localhost:1234/query"

# Lista de pruebas  completas a ejecutar
PATTERNS=(


"MATCH (m2597159)=[ALL TRAILS ?p1 (:replyOf {0,5})/:hasTag]=>(?y) RETURN COUNT(?p1)"



"MATCH (m2597148)=[ALL TRAILS ?p1 (:hasCreator)/:knows{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (f54)=[ALL TRAILS ?p1 (:hasMember)/:knows{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (f6)=[ALL TRAILS ?p1 (:hasModerator)/:knows{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (t6)=[ALL TRAILS ?p1 (:hasType)/:isSubclassOf{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (tc7)=[ALL TRAILS ?p1 (:isSubclassOf)/:isSubclassOf{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p32)=[ALL TRAILS ?p1 (:knows)/:knows{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes)/:replyOf{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (m2597159)=[ALL TRAILS ?p1 (:replyOf)/:replyOf{1,5}]=>(?y) RETURN COUNT(?p1)"


"MATCH (m2597148)=[ALL TRAILS ?p1 (:hasCreator)/:knows{0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (f54)=[ALL TRAILS ?p1 (:hasMember)/:knows{0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (f6)=[ALL TRAILS ?p1 (:hasModerator)/:knows{0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (t6)=[ALL TRAILS ?p1 (:hasType)/:isSubclassOf{0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (tc7)=[ALL TRAILS ?p1 (:isSubclassOf)/:isSubclassOf{0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p32)=[ALL TRAILS ?p1 (:knows)/:knows{0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes)/:replyOf{0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (m2597159)=[ALL TRAILS ?p1 (:replyOf)/:replyOf{0,5}]=>(?y) RETURN COUNT(?p1)"


"MATCH (f60)=[ALL TRAILS ?p1 (:containerOf)|:replyOf{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (m2597148)=[ALL TRAILS ?p1 (:hasCreator)|:knows{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (f54)=[ALL TRAILS ?p1 (:hasMember)|:knows{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (f6)=[ALL TRAILS ?p1 (:hasModerator)|:knows{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (t6)=[ALL TRAILS ?p1 (:hasType)|:isSubclassOf{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (tc7)=[ALL TRAILS ?p1 (:isSubclassOf)|:isSubclassOf{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p32)=[ALL TRAILS ?p1 (:knows)|:knows{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes)|:replyOf{1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (m2597159)=[ALL TRAILS ?p1 (:replyOf)|:replyOf{1,5}]=>(?y) RETURN COUNT(?p1)"


"MATCH (m2597159)=[ALL TRAILS ?p1 (:replyOf){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (tc7)=[ALL TRAILS ?p1 (:isSubclassOf){1,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p32)=[ALL TRAILS ?p1 (:knows){1,5}]=>(?y) RETURN COUNT(?p1)"

"MATCH (m2597159)=[ALL TRAILS ?p1 (:replyOf){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (tc7)=[ALL TRAILS ?p1 (:isSubclassOf){0,5}]=>(?y) RETURN COUNT(?p1)"
"MATCH (p32)=[ALL TRAILS ?p1 (:knows){0,5}]=>(?y) RETURN COUNT(?p1)"

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
