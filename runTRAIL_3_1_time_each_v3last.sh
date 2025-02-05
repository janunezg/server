#!/bin/bash

# URL del endpoint
BASE_URL="http://localhost:1234/query"

# Lista de pruebas  completas a ejecutar
PATTERNS=(


"MATCH (m2597148)=[ALL TRAILS ?p1 (:hasCreator ?)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (f60)=[ALL TRAILS ?p1 (:containerOf ?)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (p56)=[ALL TRAILS ?p1 (:hasInterest ?)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (f54)=[ALL TRAILS ?p1 (:hasMember ?)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (f6)=[ALL TRAILS ?p1 (:hasModerator ?)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (f389)=[ALL TRAILS ?p1 (:hasTag ?)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (t6)=[ALL TRAILS ?p1 (:hasType ?)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (m2597148)=[ALL TRAILS ?p1 (:isLocatedIn ?)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (pL6)=[ALL TRAILS ?p1 (:isPartOf ?)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (tc7)=[ALL TRAILS ?p1 (:isSubclassOf ?)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (p32)=[ALL TRAILS ?p1 (:knows ?)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (p20956)=[ALL TRAILS ?p1 (:likes ?)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (m2597159)=[ALL TRAILS ?p1 (:replyOf ?)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (p8)=[ALL TRAILS ?p1 (:studyAt ?)?]=>(?y) RETURN COUNT(?p1)"
"MATCH (p9)=[ALL TRAILS ?p1 (:workAt ?)?]=>(?y) RETURN COUNT(?p1)"





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
