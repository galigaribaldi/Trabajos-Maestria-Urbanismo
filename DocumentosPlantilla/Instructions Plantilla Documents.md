# Instrucciones — Plantillas de Documentos

**Maestría en Urbanismo · UNAM – FES Acatlán | Documentos oficiales Apimetro**

---

## Plantillas disponibles

### Documentos académicos (UNAM)

Hay cuatro plantillas de documentos. Elige según el tipo de entregable y las indicaciones del profesor:

| Comando Make | Carpeta plantilla | Portada | TOC | Índ. figuras | Palabras clave |
|---|---|---|---|---|---|
| `EnsayosConPortada` | `Ensayos/ConPortada` | Institucional con escudos | Sí | Sí | No |
| `EnsayosSinPortada` | `Ensayos/SinPortada` | — (encabezado inline) | Sí | Sí | No |
| `ArticulosConPortada` | `Articulos/ConPortada` | Minimalista | No | No | No |
| `ArticulosSinPortada` | `Articulos/SinPortada` | — (encabezado inline) | No | No | Sí (subrayadas) |

### Documentos oficiales Apimetro

| Comando Make | Carpeta plantilla | Uso típico | Colores disponibles |
|---|---|---|---|
| `nueva-carta` o `ApimetroDoc` | `DocumentosPlantilla/Apimetro` | Cartas, oficios, contratos, autorizaciones | `Apimetro` (default), `Negro` |

---

## Crear un nuevo documento

Desde la raíz del repositorio ejecuta el comando correspondiente con la ruta destino:

```bash
# Ensayo con portada institucional
make EnsayosConPortada DIR=TercerSemestre/NombreMateria/NombreEnsayo

# Ensayo sin portada (con índices)
make EnsayosSinPortada DIR=TercerSemestre/NombreMateria/NombreEnsayo

# Artículo con portada minimalista
make ArticulosConPortada DIR=TercerSemestre/NombreMateria/NombreArticulo

# Artículo sin portada (con palabras clave)
make ArticulosSinPortada DIR=TercerSemestre/NombreMateria/NombreArticulo
```

El comando copia la plantilla completa al destino y muestra los pasos siguientes.
**No sobreescribe** si ya existe un `main.tex` en la ruta indicada.

---

## Personalizar el documento

Abre `main.tex` y edita únicamente el bloque `PERSONALIZACIÓN`:

### Ensayos y Artículos con Portada

```latex
\newcommand{\TituloEnsayo}{Mi título}
\newcommand{\SubtituloEnsayo}{Mi subtítulo}
\newcommand{\Autor}{Hernán Galileo Cabrera Garibaldi}
\newcommand{\Materia}{Nombre de la Materia}
\newcommand{\ProfesorAsignado}{Nombre del Profesor}
\newcommand{\Semestre}{2026-2}
\newcommand{\FechaEntrega}{Abril 2026}
```

### Artículo sin Portada (palabras clave)

```latex
\newcommand{\TituloArticulo}{Mi título}
\newcommand{\MateriaCorta}{Materia — Semestre 2026-2}
\newcommand{\PalabrasClave}{%
  \uline{término 1},\ \uline{término 2},\ \uline{término 3}%
}
```

Cada palabra clave va dentro de `\uline{}` y separada por comas.

---

## Compilar

```bash
make Document DIR=<ruta/al/documento>
```

Ejecuta automáticamente: `pdflatex → bibtex → pdflatex → pdflatex`.
El PDF resultante se genera en `<ruta>/main.pdf`.

---

## Estructura de archivos de cada plantilla

```
NombreDocumento/
├── main.tex              ← Editar solo PERSONALIZACIÓN
├── referencias.bib       ← Añadir entradas BibTeX aquí
├── Latex/
│   ├── Comands.tex       ← Paleta de colores, encabezados, comandos
│   └── Portada.tex       ← Solo en plantillas con portada
└── secciones/
    ├── 1-Introduccion.tex
    ├── 2-Desarrollo.tex
    └── 3-Conclusiones.tex
```

Agrega más secciones creando archivos `4-NombreSeccion.tex` y referenciándolos con `\input{secciones/4-NombreSeccion}` en `main.tex`.

---

## Personalizar colores

En `Latex/Comands.tex`, sección `PALETA DE COLORES`:

```latex
\definecolor{ColorPrincipal}{RGB}{0, 56, 147}    % Azul UNAM — cambia aquí
\definecolor{ColorAcento}   {RGB}{244, 180, 0}   % Oro UNAM  — cambia aquí
```

---

## Comandos disponibles en el cuerpo del documento

| Comando | Uso | Resultado |
|---|---|---|
| `\fuentefigura{Texto}` | Debajo de figura | *Fuente: Texto* en pequeño |
| `\termino{palabra}` | Primera aparición de término | *palabra* en cursiva |
| `\citaclave{Texto}` | Cita o definición destacada | Bloque de cita en azul cursiva |
| `\pendiente{Nota}` | Recordatorio de revisión | Nota al margen en rojo |
| `\uline{texto}` | Palabras clave (solo SinPortada) | texto subrayado |

Abreviaturas predefinidas: `\cdmx`, `\zmvm`, `\unam`, `\gis`.

---

## Imágenes

Las imágenes se buscan en:
1. `img/` — carpeta local del documento
2. `../../../Img/` — carpeta compartida en la raíz del proyecto (escudos UNAM/FES)

Coloca tus figuras en `img/` y referencialas sin ruta:
```latex
\includegraphics[width=0.75\textwidth]{nombre_figura.png}
```

---

## Limpiar auxiliares LaTeX

```bash
make limpiar                      # Todo el proyecto
make limpiar-dir DIR=<ruta>       # Solo una carpeta
```

Elimina: `.aux`, `.log`, `.out`, `.toc`, `.lof`, `.bbl`, `.blg`, `.synctex.gz`.

---

## Plantilla Apimetro — documentos oficiales

Para cartas membretadas, contratos, oficios y autorizaciones con la identidad visual de Apimetro.

### Crear un nuevo documento

```bash
make nueva-carta DIR=Extracurriculares/Apimetro-docs/NombreDocumento
# equivalente explícito:
make ApimetroDoc DIR=Extracurriculares/Apimetro-docs/NombreDocumento COLOR=Apimetro
```

### Compilar

```bash
make Document DIR=<ruta> COLOR=Apimetro   # color turquesa + naranja (default)
make Document DIR=<ruta> COLOR=Negro      # versión formal blanco y negro
```

### Personalizar (`main.tex`)

```latex
\newcommand{\TituloDoc}{Título del documento}      % encabezado pág 2+
\newcommand{\FolioDoc}{APM-2026-001}               % folio correlativo
\newcommand{\FechaDoc}{Ciudad de México, agosto de 2026}
\newcommand{\FirmanteName}{Cabrera Garibaldi Hernán Galileo}
\newcommand{\FirmanteCargo}{Fundador y Desarrollador}
\newcommand{\ContactoEmail}{galigaribaldi0@gmail.com}
\newcommand{\ContactoWeb}{apimetro.dev}
```

### Comandos disponibles en el cuerpo

| Comando | Resultado |
|---|---|
| `\DatosDestinatario{nombre}{cargo}{org}` | Bloque de destinatario |
| `\Asunto{texto}` | Línea de asunto en negritas |
| `\Saludo{Estimado/a ...}` | Párrafo de apertura |
| `\FirmaBloque{nombre}{cargo}` | Bloque de firma único |
| `\SeccionCarta{título}` | Separador de sección interno |
| `\RefDoc{APM-2026-XX}` | Folio estilizado en turquesa |

Para **firma de dos partes** (acuerdos bilaterales) usar `minipage` directamente:

```latex
\noindent
\begin{minipage}[t]{0.48\textwidth}
  {\color{ColorPrincipal}\rule{\linewidth}{0.6pt}}\\[0.2cm]
  \textbf{Nombre parte A} \\ {\small Cargo} \\ {\small\color{ColorAcento}Apimetro}
\end{minipage}
\hfill
\begin{minipage}[t]{0.48\textwidth}
  {\color{ColorPrincipal}\rule{\linewidth}{0.6pt}}\\[0.2cm]
  \textbf{Nombre parte B} \\ {\small Cargo} \\ {\small\color{ColorAcento}Organización}
\end{minipage}
```

### Estructura de archivos

```
NombreDocumento/
├── main.tex
├── Latex/
│   ├── Comands.tex
│   ├── Membrete.tex
│   ├── color-config.tex
│   └── Colores/
│       ├── Apimetro.tex   ← turquesa RGB(0,188,212) + naranja RGB(230,81,0)
│       └── Negro.tex
├── img/logo.png
└── secciones/
    └── Carta-Ejemplo.tex  ← renombrar por el contenido real
```

### Documento de referencia

`Extracurriculares/Apimetro-docs/Carta-colaboracion/` — Folio APM-2026-100.
Carta de autorización de uso comercial para Tony Quezada (Metro Experto), con Anexo I de pago vía GitHub Sponsors.
