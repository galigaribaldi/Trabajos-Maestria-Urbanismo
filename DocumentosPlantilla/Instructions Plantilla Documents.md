# Instrucciones — Plantillas de Documentos Académicos

**Maestría en Urbanismo · UNAM – FES Acatlán**

---

## Plantillas disponibles

Hay cuatro plantillas de documentos. Elige según el tipo de entregable y las indicaciones del profesor:

| Comando Make | Carpeta plantilla | Portada | TOC | Índ. figuras | Palabras clave |
|---|---|---|---|---|---|
| `EnsayosConPortada` | `Ensayos/ConPortada` | Institucional con escudos | Sí | Sí | No |
| `EnsayosSinPortada` | `Ensayos/SinPortada` | — (encabezado inline) | Sí | Sí | No |
| `ArticulosConPortada` | `Articulos/ConPortada` | Minimalista | No | No | No |
| `ArticulosSinPortada` | `Articulos/SinPortada` | — (encabezado inline) | No | No | Sí (subrayadas) |

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
