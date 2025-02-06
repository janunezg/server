#!/bin/bash

# URL del endpoint
BASE_URL="http://localhost:1234/query"

# Lista de pruebas  completas a ejecutar
PATTERNS=(


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
