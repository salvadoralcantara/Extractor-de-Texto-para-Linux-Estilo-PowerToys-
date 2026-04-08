# Extractor de Texto OCR para Linux (Estilo PowerToys)

Este script permite seleccionar un área de la pantalla, extraer el texto mediante OCR y copiarlo automáticamente al portapapeles. Optimizado para **Linux Mint (Cinnamon/X11)** y distribuciones basadas en Ubuntu/Debian.

## 1. Instalar dependencias

Abre tu terminal y ejecuta el siguiente comando para instalar las herramientas necesarias:

```bash
sudo apt update && sudo apt install maim tesseract-ocr tesseract-ocr-spa tesseract-ocr-eng xclip imagemagick libnotify-bin -y
```
## 2. Clona el Script
Crea un archivo llamado extractor.sh con el script de este repositorio o clonalo directamente.

## 3. Hacerlo ejecutable
Otórgale permisos de ejecución al archivo con este comando:

```bash
chmod +x extractor.sh
```

## 4. Configurar el Atajo de Teclado
Para usarlo con una combinación de teclas (ejemplo: Super + Shift + T):

Ve a Configuración del sistema > Teclado > Atajos.

Selecciona Atajos personalizados > Añadir atajo personalizado.

En Nombre ej: escribe Extractor de Texto.

En Comando: escribe la ruta absoluta de tu script, por ejemplo: /home/TU_USUARIO/extractor-texto-linux/extractor.sh 

Haz clic en la sección "Combinaciones de teclas" y presiona las teclas que prefieras.

Tip de uso
Márgenes: Al seleccionar el texto con el ratón, deja un pequeño espacio libre alrededor de las letras. No las recortes al ras para que el sistema reconozca bien los símbolos, paréntesis y comillas.
