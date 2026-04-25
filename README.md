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
- **gh CLI** — solo para publicar releases (`gh auth login` antes del primer uso)
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

Todos los comandos se ejecutan desde la raíz del repositorio con `DIR=` apuntando a donde quieres crear el documento.

### Documentos (ensayos y artículos)

```bash
# Ensayo con portada institucional (escudos UNAM/FES, TOC, índice de figuras)
make EnsayosConPortada DIR=TercerSemestre/MiMateria/NombreEnsayo

# Ensayo sin portada (encabezado inline, TOC, índice de figuras)
make EnsayosSinPortada DIR=TercerSemestre/MiMateria/NombreEnsayo

# Artículo con portada minimalista (sin TOC ni índices)
make ArticulosConPortada DIR=TercerSemestre/MiMateria/NombreArticulo

# Artículo sin portada con palabras clave (sin TOC ni índices)
make ArticulosSinPortada DIR=TercerSemestre/MiMateria/NombreArticulo

# Cualquier documento con un color específico (opcional)
make EnsayosConPortada DIR=TercerSemestre/MiMateria/NombreEnsayo COLOR=Teal
```

### Presentaciones — variantes de color

```bash
make nueva-presentacion          DIR=TercerSemestre/MiMateria/NombrePres   # Azul UNAM (default)
make nueva-presentacion-teal     DIR=TercerSemestre/MiMateria/NombrePres   # Verde azulado
make nueva-presentacion-olivo    DIR=TercerSemestre/MiMateria/NombrePres   # Verde olivo
make nueva-presentacion-purpura  DIR=TercerSemestre/MiMateria/NombrePres   # Púrpura
make nueva-presentacion-rojo     DIR=TercerSemestre/MiMateria/NombrePres   # Rojo
```

---

## Compilar documentos existentes

```bash
# Compilar un ensayo o artículo (color por defecto del documento)
make Document DIR=TercerSemestre/MiMateria/MiDocumento

# Compilar con un color distinto sin modificar el archivo
make Document DIR=TercerSemestre/MiMateria/MiDocumento COLOR=Purpura

# Compilar una presentación
make Presentacion DIR=TercerSemestre/MiMateria/MiPresentacion

# Compilar una presentación en otro color
make Presentacion DIR=TercerSemestre/MiMateria/MiPresentacion COLOR=Teal

# Alias para trabajos conocidos
make desarrollo          # Ensayo_Humedales
make pres-humedales      # Presentacion_Humedales
make pres-movilidad      # Movilidad_Sustentable_Presentacion
```

La compilación sigue el ciclo completo: `pdflatex → bibtex → pdflatex → pdflatex`. El PDF resultante queda en `<DIR>/main.pdf`.

---

## GitHub Releases — publicar PDFs

Los PDFs finales se distribuyen como **GitHub Releases**. Cada release lleva un tag que identifica unívocamente el semestre, la materia, el tipo de documento y el tema.

### Estructura del tag

```
v{AÑO}-{S}-{MAT}-{TIPO}-{TEMA}[-r{N}]
```

| Segmento | Descripción | Ejemplos |
|----------|-------------|---------|
| `{AÑO}` | Año del semestre | `2026` |
| `{S}` | Semestre dentro del año | `1`, `2` |
| `{MAT}` | Abreviatura de materia (ver tabla) | `dsma`, `urbs`, `dsu` |
| `{TIPO}` | Tipo de documento | `ens`, `pres`, `art`, `mapa`, `col` |
| `{TEMA}` | Slug del tema en kebab-case | `humedales`, `movilidad` |
| `[-r{N}]` | Revisión post-entrega (opcional) | `-r2`, `-r3` |

#### Abreviaturas de materias

| Código | Materia |
|--------|---------|
| `dsma` | Desarrollo Sostenible del Medio Ambiente |
| `urbs` | Desarrollo Urbano Sostenible |
| `dsu`  | Desarrollo Sustentable en el Urbanismo |

#### Tipos de documento

| Código | Tipo |
|--------|------|
| `ens`  | Ensayo |
| `pres` | Presentación |
| `art`  | Artículo |
| `mapa` | Mapa / Cartografía |
| `col`  | Coloquio |

> **Regla de revisiones:** el tag sin sufijo es la entrega original. Si hay una corrección posterior, se crea un nuevo release con `-r2`, `-r3`, etc. **Nunca** se reutiliza ni sobreescribe un tag existente.

---

### Publicar un release

#### Aliases prefabricados (3er semestre 2026-2)

Compilan el PDF y lo publican en un solo comando. Requieren `gh auth login` activo.

```bash
make release-ens-humedales    # → v2026-2-dsma-ens-humedales
make release-pres-humedales   # → v2026-2-urbs-pres-humedales
make release-pres-movilidad   # → v2026-2-dsu-pres-movilidad
```

Para publicar con un color distinto al default:

```bash
make release-pres-movilidad COLOR=Teal
```

#### Release genérico (documentos futuros)

```bash
make release \
    DIR=TercerSemestre/MiMateria/MiDocumento \
    TAG=v2026-2-dsu-ens-tema \
    TITULO="Título completo del documento" \
    TIPO=Document          # Document | Presentacion
```

#### Flujo interno del release

1. Compila el PDF completo (`pdflatex → bibtex → pdflatex × 2`)
2. Copia `main.pdf` como `<TAG>.pdf` dentro de la carpeta del documento
3. Ejecuta `gh release create <TAG> <TAG>.pdf --title "..." --notes "..."`
4. Elimina el PDF temporal (el `main.pdf` original permanece)

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

## Temas de color

Todos los documentos y presentaciones soportan 5 temas de color. El tema se puede cambiar de dos maneras:

**Permanente** — edita `Latex/color-config.tex` dentro del documento:
```latex
\providecommand{\ColorTema}{Purpura}   % opciones: Institucional | Teal | VerdeOlivo | Purpura | Rojo
```

**Por compilación** — sin tocar el archivo:
```bash
make Document     DIR=<ruta> COLOR=VerdeOlivo
make Presentacion DIR=<ruta> COLOR=Rojo
```

| Tema | ColorPrincipal | ColorAcento | Uso sugerido |
|---|---|---|---|
| `Institucional` | Azul UNAM `RGB 0,56,147` | Oro UNAM `RGB 244,180,0` | Todos los entregables (default) |
| `Teal` | Verde azulado `RGB 0,105,92` | Ámbar `RGB 255,171,0` | Medio ambiente, geografía |
| `VerdeOlivo` | Verde olivo `RGB 56,87,35` | Ocre `RGB 188,143,60` | Historia urbana, patrimonio |
| `Purpura` | Púrpura `RGB 106,27,154` | Dorado `RGB 255,196,0` | Economía, política pública |
| `Rojo` | Rojo `RGB 183,28,28` | Dorado `RGB 255,196,0` | Derecho urbano, normatividad |

---

## Plantilla de Presentaciones

Basada en Beamer con tema Madrid. El frametitle muestra la sección activa como etiqueta pequeña dentro de la barra de color, y el acento dorado separa visualmente los elementos.

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

| Trabajo | Ruta | Tag de release | Estado |
|---------|------|----------------|--------|
| Ensayo: Humedales Urbanos y Movilidad | `TercerSemestre/DesarrolloUrbanoSostenible/Ensayo_Humedales` | `v2026-2-dsma-ens-humedales` | Terminado |
| Presentación: Humedales Urbanos y Movilidad | `TercerSemestre/DesarrolloUrbanoSostenible/Presentacion_Humedales` | `v2026-2-urbs-pres-humedales` | Terminada |
| Presentación: Movilidad Sustentable | `TercerSemestre/DesarrolloUrbanoSostenible/Movilidad_Sustentable_Presentacion` | `v2026-2-dsu-pres-movilidad` | Terminada |
