import os

def cargar_nodos_por_tipo(carpeta):
    """
    Carga nodos desde los archivos .csv en la carpeta dada, basándose en una lista predefinida de nombres de archivos.
    """
    # Lista de archivos esperados
    archivos_esperados = {
        "forum": "forum.csv",
        "post": "post.csv",
        "tagClass": "tagClass.csv",
        "person": "person.csv",
        "organisation": "organisation.csv",
        "comment": "comment.csv",
        "place": "place.csv",
        "tag": "tag.csv"
    }

    tipos_nodos = {}
    
    # Cargar los nodos solo de los archivos esperados
    for tipo, nombre_archivo in archivos_esperados.items():
        ruta_archivo = os.path.join(carpeta, nombre_archivo)
        if os.path.exists(ruta_archivo):  # Verificar si el archivo existe
            with open(ruta_archivo, 'r') as f:
                nodos = {line.strip() for line in f.readlines()}  # Leer nodos y eliminar duplicados
                tipos_nodos[tipo] = nodos
        else:
            print(f"Advertencia: No se encontró el archivo {nombre_archivo} en la carpeta {carpeta}")
    
    return tipos_nodos

def transformar_a_qm(archivo_entrada, archivo_salida, carpeta_nodos):
    """
    Transforma el archivo de relaciones al formato .qm incluyendo nodos y relaciones.
    """
    # Cargar nodos por tipo desde los archivos CSV
    tipos_nodos = cargar_nodos_por_tipo(carpeta_nodos)
    nodos = set()  # Conjunto para todos los nodos encontrados en las relaciones
    relaciones = []
    conteo_aristas = {}  # Diccionario para contar las aristas por tipo

    # Leer el archivo de entrada de relaciones
    with open(archivo_entrada, 'r') as f:
        lineas = f.readlines()

    # Procesar cada línea del archivo de relaciones
    for linea in lineas:
        linea = linea.strip()
        partes = linea.split(',')
        if len(partes) == 3:
            nodo1, relacion, nodo2 = partes
            nodos.add(nodo1)
            nodos.add(nodo2)
            relaciones.append(f"{nodo1}->{nodo2} :{relacion}")
            
            # Incrementar el conteo para este tipo de relación
            if relacion not in conteo_aristas:
                conteo_aristas[relacion] = 0
            conteo_aristas[relacion] += 1

    # Crear el archivo de salida .qm
    with open(archivo_salida, 'w') as f:
        # Escribir los nodos al inicio
        for nodo in sorted(nodos):  # Ordenar para mantener consistencia
            tipo = next((t for t, ns in tipos_nodos.items() if nodo in ns), "Unknown")
            f.write(f"{nodo} :{tipo} name:\"{nodo}\"\n")

        f.write("\n")  # Línea vacía entre nodos y relaciones
        
        # Escribir las relaciones
        for relacion in relaciones:
            f.write(f"{relacion}\n")

    # Imprimir el conteo de cada tipo de arista
    print("\nConteo de aristas por tipo:")
    for relacion, conteo in conteo_aristas.items():
        print(f"Tipo de relación '{relacion}': {conteo} aristas")

# Parámetros
carpeta_nodos = "./resultados"  # Ruta a la carpeta con archivos .csv de nodos
archivo_entrada = "edges.txt"  # Archivo de entrada con las relaciones
archivo_salida = "scale_factor_1.qm"   # Archivo de salida en formato .qm

# Ejecutar la transformación
transformar_a_qm(archivo_entrada, archivo_salida, carpeta_nodos)
