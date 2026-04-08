#!/bin/bash

# 1. Define la ruta temporal
screenshot_path="/tmp/screenshot.png"

# 2. Toma la captura de la zona seleccionada
maim -s "$screenshot_path"

# Verifica si se canceló la captura
if [ ! -s "$screenshot_path" ]; then
    exit 1
fi

# 3. LA MAGIA: Preprocesar la imagen para Tesseract
# Aumentamos el tamano al 300%, lo pasamos a escala de grises y añadimos 
# -normalize para mejorar el contraste de símbolos como los paréntesis.
mogrify -resize 300% -type Grayscale -normalize "$screenshot_path"

# 4. Extraer el texto (Usamos español e inglés combinados para mayor precisión)
# Añadimos tr -d '\f' para eliminar el simbolo extraño "␌" que Tesseract pone al final
texto_extraido=$(tesseract "$screenshot_path" stdout -l spa+eng 2>/dev/null | tr -d '\f')

# Verifica si se extrajo algo
if [ -z "$texto_extraido" ]; then
    notify-send -t 3000 "Extractor" "Error: No se pudo extraer texto del área."
    exit 1
fi

# 5. Copia al portapapeles eliminando espacios en blanco extra al final
# Cambiamos "echo" por "printf" para que no agregue un salto de linea en blanco al pegarlo
printf "%s" "$texto_extraido" | xclip -selection clipboard

# 6. Notificar exito
notify-send -t 3000 "Extractor de Texto" "Texto copiado con éxito al portapapeles."
