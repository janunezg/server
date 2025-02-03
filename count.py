from collections import defaultdict
import statistics
import os
import csv
from openpyxl import Workbook

file_name = "edges.txt"
output_file_name = "resultados_personalizados.txt"
output_csv_dir = "csv's"
overview_excel_name = "overview2.xlsx"

# Crear carpeta para guardar CSVs
os.makedirs(output_csv_dir, exist_ok=True)

# Diccionarios para almacenar conteos
relationship_data = defaultdict(lambda: defaultdict(lambda: defaultdict(int)))

# Procesar el archivo
with open(file_name, 'r') as file:
    for line in file:
        parts = line.strip().split(',')
        if len(parts) >= 2:
            origin, relation, target = parts[0], parts[1], parts[2]

            # Contar relaciones salientes y entrantes
            relationship_data[relation]['outgoing'][origin] += 1
            relationship_data[relation]['incoming'][target] += 1

# Tabla resumen
overview_table = []

# Función para calcular y escribir resultados personalizados
def analyze_and_write(label, data, file, csv_writer=None, direction=""):
    if not data:
        file.write(f"No se encontraron datos para '{label}'.\n")
        return

    # Ordenar nodos por sus valores
    sorted_nodes = sorted(data.items(), key=lambda x: x[1], reverse=True)

    # Identificar top 3 nodos con más conexiones
    top_nodes = sorted_nodes[:3]
    top_nodes_set = {node for node, _ in top_nodes}

    # Calcular el promedio y encontrar nodos cercanos
    avg_value = sum(data.values()) / len(data)
    avg_nodes = sorted((node for node in data if node not in top_nodes_set), 
                       key=lambda x: abs(data[x] - avg_value))[:3]
    avg_nodes_set = set(avg_nodes)

    # Calcular la mediana y encontrar nodos cercanos
    median_value = statistics.median(data.values())
    median_nodes = sorted((node for node in data if node not in top_nodes_set and node not in avg_nodes_set), 
                          key=lambda x: abs(data[x] - median_value))[:3]
    median_nodes_set = set(median_nodes)

    # Nodos con valores más bajos pero debajo de la mediana
    low_nodes = [node for node, value in sorted_nodes if node not in top_nodes_set and node not in avg_nodes_set and node not in median_nodes_set and value <= median_value][:3]

    # Calcular dispersión
    std_dev = statistics.stdev(data.values()) if len(data) > 1 else 0
    range_value = max(data.values()) - min(data.values())

    file.write(f"\n{label} - Analisis:\n")
    file.write("=" * 40 + "\n")

    # Escribir nodos top
    file.write("Top 3 nodos con más conexiones:\n")
    for node, value in top_nodes:
        file.write(f"  - {node}: {value} conexiones\n")

    # Escribir nodos cercanos al promedio
    file.write("\n3 nodos cercanos al promedio:\n")
    for node in avg_nodes:
        file.write(f"  - {node}: {data[node]} conexiones\n")

    # Escribir nodos cercanos a la mediana
    file.write("\n3 nodos cercanos a la mediana:\n")
    for node in median_nodes:
        file.write(f"  - {node}: {data[node]} conexiones\n")

    # Escribir nodos con valores bajos por debajo de la mediana
    file.write("\n3 nodos en la parte baja de la mediana:\n")
    for node in low_nodes:
        file.write(f"  - {node}: {data[node]} conexiones\n")

    # Escribir estadísticas de dispersión
    file.write("\nEstadísticas de dispersión:\n")
    file.write(f"  - Desviación estándar: {std_dev:.2f}\n")
    file.write(f"  - Rango: {range_value}\n")

    file.write("=" * 80 + "\n")

    # Escribir CSV si el escritor está definido
    if csv_writer:
        csv_writer.writerow(["Nodo", "Conexiones"])
        csv_writer.writerows(sorted_nodes)

    # Agregar a la tabla resumen
    overview_table.append([
        label.split(' ')[-1],  # Etiqueta
        direction,            # Dirección (Entrante o Saliente)
        ", ".join([node for node, _ in top_nodes]),
        ", ".join(median_nodes),
        ", ".join(low_nodes),
        ", ".join(avg_nodes),
        f"{std_dev:.2f}"
    ])

# Abrir archivo de salida para escribir los resultados
with open(output_file_name, 'w') as output_file:
    # Calcular estadísticas para cada relación y escribir al archivo
    for relation, counts in relationship_data.items():
        output_file.write(f"\nRelacion: {relation}\n")
        output_file.write("-" * 40 + "\n")

        # Crear archivo CSV para la relación
        csv_file_path = os.path.join(output_csv_dir, f"{relation}.csv")
        with open(csv_file_path, 'w', newline='') as csv_file:
            csv_writer = csv.writer(csv_file)

            output_file.write("Estadisticas para nodos con conexiones salientes:\n")
            analyze_and_write(f"Salientes de {relation}", counts['outgoing'], output_file, csv_writer, direction="Saliente")

            output_file.write("Estadisticas para nodos con conexiones entrantes:\n")
            analyze_and_write(f"Entrantes de {relation}", counts['incoming'], output_file, csv_writer, direction="Entrante")

# Escribir tabla resumen en Excel
wb = Workbook()
ws = wb.active
ws.title = "Overview"

# Agregar encabezados
ws.append(["Etiqueta", "Direccion", "Maximo", "Mediana", "Minimo", "Promedio", "Desviacion Estandar"])

# Agregar datos
for row in overview_table:
    ws.append(row)

# Guardar el archivo Excel
wb.save(overview_excel_name)

print(f"Los resultados han sido exportados a '{output_file_name}'.")
print(f"Los archivos CSV han sido guardados en la carpeta '{output_csv_dir}'.")
print(f"La tabla resumen ha sido exportada a '{overview_excel_name}'.")
