# Trabajos Maestría Urbanismo — UNAM FES Acatlán

Repositorio de entregables académicos de la Maestría en Urbanismo (UNAM, FES Acatlán).
Todos los documentos se escriben en LaTeX (pdflatex + bibtex) y se compilan con un Makefile centralizado.

## Estructura del proyecto

```
├── Makefile                          ← scaffolding, compilación y limpieza
├── Img/                              ← escudos institucionales compartidos
│   ├── UNAM_crest_blue.pdf           ← presentaciones Beamer
│   ├── UNAM_crest_black.pdf          ← portadas de ensayos/artículos
│   ├── escudo-fes-azul.png
│   └── escudo-fes-negro.jpg
├── DocumentosPlantilla/              ← 4 plantillas de documentos + RegistroDiff
│   ├── Ensayos/ConPortada/
│   ├── Ensayos/SinPortada/
│   ├── Articulos/ConPortada/
│   ├── Articulos/SinPortada/
│   └── Articulos/RegistroDiff/
├── PresentacionPlantilla/            ← Beamer 16:9 tema UNAM
├── InfografiaPlantilla/              ← TikZ 1 página (A4/A3/landscape)
└── TercerSemestre/                   ← trabajos del semestre 2026-2
```

## Comandos Makefile principales

### Crear documento nuevo desde plantilla
```bash
make EnsayosConPortada    DIR=<ruta> [COLOR=Tema]
make EnsayosSinPortada    DIR=<ruta> [COLOR=Tema]
make ArticulosConPortada  DIR=<ruta> [COLOR=Tema]
make ArticulosSinPortada  DIR=<ruta> [COLOR=Tema]
make RegistroDiffDoc      DIR=<ruta> [COLOR=Tema]
make nueva-presentacion   DIR=<ruta> [COLOR=Tema]
make nueva-infografia     DIR=<ruta> [COLOR=Tema]
```

Aliases rápidos: `make nuevo-ensayo DIR=<ruta>`, `make nuevo-ensayo-teal DIR=<ruta>`, etc.

### Compilar
```bash
make Document     DIR=<ruta> [COLOR=Tema]   # pdflatex → bibtex → pdflatex × 2
make Presentacion DIR=<ruta> [COLOR=Tema]
make Infografia   DIR=<ruta> [COLOR=Tema]
```

### Limpiar
```bash
make limpiar                    # todo el proyecto
make limpiar-dir DIR=<ruta>     # solo una carpeta
```

## Paleta de colores (sistema unificado)

Temas disponibles: `Institucional` | `Teal` | `VerdeOlivo` | `Purpura` | `Rojo` | `VerdeEsmeralda`

Mecanismo: `main.tex` → `Latex/color-config.tex` → `Latex/Colores/<Tema>.tex`

## Convenciones importantes

### Git
- Rama principal: `main`. Los trabajos nuevos se crean en ramas desde `DEV`.
- `.gitignore` excluye `*.pdf` salvo `docs/assets/*.pdf` e `Img/*.pdf`.
- No hacer `git commit`, `git push`, `rm` o `rm -rf` sin confirmación explícita del usuario.
- No agregar `Co-Authored-By` en commits sin pedir permiso primero.

### Flujo de trabajo
- **Siempre presentar un plan** antes de escribir o modificar archivos. Esperar aprobación explícita.
- **Operaciones destructivas** (`rm`, `git filter-repo`, `git reset --hard`, `git push --force`): describir consecuencias y obtener doble confirmación.
- No ejecutar acciones de más — el consumo de tokens es un recurso limitado del usuario.

### LaTeX
- No usar `\pause` en Beamer por defecto (dejarlo comentado).
- `\AtBeginSection`: saltarse la sección 1 (contador `secciones`).
- Orden de paquetes: `inputenc` → `fontenc` → `babel` → ... → `hyperref` siempre al final.
- `headheight`: siempre 25pt con `\addtolength{\topmargin}{-10pt}`.
- Usar `\clearpage` entre secciones con figuras (no `\newpage`).
- No usar `\\` para separar párrafos — usar líneas en blanco.
- Escribir UTF-8 directo (`á`, `é`, `ñ`), no secuencias de escape.
- En Beamer con babel-spanish: usar `$53\,\text{\%}$` dentro de blocks, nunca `$53\,\%$`.
- `\includegraphics` en frames placeholder: siempre comentado con alertblock de reemplazo.

### Escudos institucionales
Los escudos viven en `Img/` y se referencian sin ruta gracias a `\graphicspath{{img/}{../../../Img/}}` en cada `Comands.tex`.
- Presentaciones: `UNAM_crest_blue.pdf` + `escudo-fes-azul.png`
- Ensayos/Artículos con portada: `UNAM_crest_black.pdf` + `escudo-fes-negro.jpg`
