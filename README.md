# Trabajos de Maestría en Urbanismo

**Hernán Galileo Cabrera Garibaldi**
Programa de Maestría y Doctorado en Urbanismo — FES Acatlán, UNAM
Semestre 2026-2

---

## Descripción

Repositorio de documentos académicos del programa de Maestría en Urbanismo. Contiene ensayos, artículos y presentaciones organizados por semestre y materia, junto con un sistema de plantillas LaTeX reutilizables y un `Makefile` para compilar y crear nuevos documentos con un solo comando.

---

## Requisitos

- **TeX Live** (o MiKTeX) con `pdflatex` y `bibtex`
- **Make** (`make --version`)
- Editor recomendado: VS Code con extensión LaTeX Workshop, o cualquier editor con soporte `.tex`

---

## Estructura del repositorio

```
Trabajos-Maestria-Urbanismo/
│
├── Makefile                          ← Comandos de compilación y scaffolding
├── Img/                              ← Escudos y logos institucionales compartidos
│   ├── UNAM_crest_blue.pdf
│   ├── UNAM_crest_black.pdf
│   ├── escudo-fes-azul.png
│   └── escudo-fes-negro.jpg
│
├── DocumentosPlantilla/              ← Plantillas de documentos
│   ├── Ensayos/
│   │   ├── ConPortada/               ← Ensayo con portada institucional
│   │   └── SinPortada/               ← Ensayo sin portada (con TOC e índices)
│   ├── Articulos/
│   │   ├── ConPortada/               ← Artículo con portada minimalista
│   │   └── SinPortada/               ← Artículo sin portada (con palabras clave)
│   └── Instructions Plantilla Documents.md
│
├── PresentacionPlantilla/            ← Plantilla Beamer UNAM
│   ├── main.tex
│   ├── Latex/BeamerTheme.tex
│   ├── secciones/
│   └── Instructions Plantilla Presentacion.md
│
└── TercerSemestre/                   ← Trabajos por semestre
    └── DesarrolloUrbanoSostenible/
        ├── Ensayo_Humedales/
        └── Presentacion_Humedales/
```

---

## Inicio rápido — Crear un documento nuevo

Todos los comandos se ejecutan desde la raíz del repositorio con `DIR=` apuntando a donde quieres crear el documento:

```bash
# Ensayo con portada institucional (escudos UNAM/FES, TOC, índice de figuras)
make EnsayosConPortada DIR=TercerSemestre/MiMateria/NombreEnsayo

# Ensayo sin portada (encabezado inline, TOC, índice de figuras)
make EnsayosSinPortada DIR=TercerSemestre/MiMateria/NombreEnsayo

# Artículo con portada minimalista (sin TOC ni índices)
make ArticulosConPortada DIR=TercerSemestre/MiMateria/NombreArticulo

# Artículo sin portada con palabras clave (sin TOC ni índices)
make ArticulosSinPortada DIR=TercerSemestre/MiMateria/NombreArticulo

# Presentación Beamer UNAM
make nueva-presentacion DIR=TercerSemestre/MiMateria/NombrePresentacion
```

---

## Compilar documentos existentes

```bash
# Compilar un ensayo o artículo
make Document DIR=TercerSemestre/MiMateria/MiDocumento

# Compilar una presentación
make Presentacion DIR=TercerSemestre/MiMateria/MiPresentacion

# Alias para trabajos conocidos
make desarrollo          # Ensayo_Humedales (Desarrollo Urbano Sostenible)
make pres-humedales      # Presentacion_Humedales
```

La compilación sigue el ciclo completo: `pdflatex → bibtex → pdflatex → pdflatex`. El PDF resultante queda en `<DIR>/main.pdf`.

---

## Limpiar auxiliares LaTeX

```bash
make limpiar                   # Todo el proyecto
make limpiar-dir DIR=<ruta>    # Solo una carpeta
```

---

## Plantillas de documentos

Cada plantilla tiene el mismo patrón de uso:

1. Crear el documento con el comando `make` correspondiente
2. Editar el bloque `PERSONALIZACIÓN` al inicio de `main.tex`
3. Escribir el contenido en `secciones/`
4. Agregar referencias en `referencias.bib`
5. Compilar con `make Document DIR=<ruta>`

### Comparativa de plantillas

| Plantilla | Portada | TOC | Índice figuras | Palabras clave | Resumen |
|---|---|---|---|---|---|
| Ensayo ConPortada | Institucional + escudos | Sí | Sí | No | No |
| Ensayo SinPortada | — (encabezado inline) | Sí | Sí | No | Sí |
| Artículo ConPortada | Minimalista | No | No | No | No |
| Artículo SinPortada | — (encabezado inline) | No | No | Sí | No |

---

## Plantilla de Presentaciones

Basada en Beamer con tema Madrid y paleta UNAM (azul `RGB 0,56,147` y oro `RGB 244,180,0`).

Incluye portada con escudos institucionales, transiciones automáticas de sección, pie de página personalizado y los siguientes tipos de diapositiva listos para usar:

- Dos columnas + bloque de dato clave
- Objetivos numerados (01 / 02 / 03)
- Tres bloques horizontales comparativos
- Tabla con `tabularx` y `booktabs`
- Una figura + bullets
- Dos imágenes con texto explicativo
- Tres imágenes con texto explicativo
- Cita destacada centrada
- Mensaje clave con banda lateral (frame plain)
- Diagrama de flujo con TikZ
- Síntesis block + alertblock
- Frame de cierre / Gracias
- Bibliografía con `allowframebreaks`

Ver el catálogo completo en `PresentacionPlantilla/Instructions Plantilla Presentacion.md`.

---

## Recursos compartidos (`Img/`)

La carpeta `Img/` en la raíz contiene los escudos institucionales disponibles para todas las plantillas:

| Archivo | Uso recomendado |
|---|---|
| `UNAM_crest_blue.pdf` | Portadas de presentaciones (fondo claro) |
| `UNAM_crest_black.pdf` | Portadas de ensayos (impresión) |
| `escudo-fes-azul.png` | Portadas de presentaciones |
| `escudo-fes-negro.jpg` | Portadas de ensayos (impresión) |

Las plantillas los referencian automáticamente vía `\graphicspath` — no es necesario copiar los archivos a cada documento.

---

## Trabajos del semestre

### Tercer Semestre — Desarrollo Urbano Sostenible

| Trabajo | Ruta | Estado |
|---|---|---|
| Ensayo: Humedales Urbanos | `TercerSemestre/DesarrolloUrbanoSostenible/Ensayo_Humedales` | Terminado |
| Presentación: Humedales | `TercerSemestre/DesarrolloUrbanoSostenible/Presentacion_Humedales` | En proceso |
