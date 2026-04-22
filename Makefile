# =============================================================================
# Makefile — Compilación y scaffolding de documentos académicos de Maestría
# UNAM — Maestría en Urbanismo, FES Acatlán
#
# ─── COMPILACIÓN (requiere main.tex ya existente) ────────────────────────────
#   make Document     DIR=<ruta>   → compila ensayo/artículo en <ruta>
#   make Presentacion DIR=<ruta>   → compila presentación Beamer en <ruta>
#
# ─── SCAFFOLDING — crea documento nuevo desde plantilla ──────────────────────
#   make EnsayosConPortada    DIR=<ruta>  → ensayo con portada institucional
#   make EnsayosSinPortada    DIR=<ruta>  → ensayo sin portada (con TOC e índices)
#   make ArticulosConPortada  DIR=<ruta>  → artículo con portada minimalista
#   make ArticulosSinPortada  DIR=<ruta>  → artículo sin portada (con palabras clave)
#   make nueva-presentacion   DIR=<ruta>  → presentación Beamer UNAM
#
# ─── ALIASES DE MATERIAS CONOCIDAS ───────────────────────────────────────────
#   make desarrollo            → compila Ensayo_Humedales
#   make pres-humedales        → compila Presentacion_Humedales
#   make sociologia            → compila SociologiaUrbana (si existe)
#
# ─── UTILIDADES ──────────────────────────────────────────────────────────────
#   make limpiar               → borra auxiliares LaTeX en todo el proyecto
#   make limpiar-dir DIR=<ruta>→ borra auxiliares solo en <ruta>
# =============================================================================

MOTOR  := pdflatex
BIBTEX := bibtex
FLAGS  := -interaction=nonstopmode -halt-on-error

# Plantillas base — documentos
PLANTILLA_ENSAYO_CON_PORTADA  := DocumentosPlantilla/Ensayos/ConPortada
PLANTILLA_ENSAYO_SIN_PORTADA  := DocumentosPlantilla/Ensayos/SinPortada
PLANTILLA_ARTICULO_CON_PORTADA := DocumentosPlantilla/Articulos/ConPortada
PLANTILLA_ARTICULO_SIN_PORTADA := DocumentosPlantilla/Articulos/SinPortada

# Plantilla base — presentaciones
PLANTILLA_BEAMER := PresentacionPlantilla

# Rutas conocidas
DIR_DUS_HUMEDALES      := TercerSemestre/DesarrolloUrbanoSostenible/Ensayo_Humedales
DIR_DUS_PRES_HUMEDALES := TercerSemestre/DesarrolloUrbanoSostenible/Presentacion_Humedales
DIR_SOCIOLOGIA         := TercerSemestre/SociologiaUrbana

# Variable de ruta arbitraria (override con DIR=...)
DIR ?=

.PHONY: all Document Presentacion \
        EnsayosConPortada EnsayosSinPortada \
        ArticulosConPortada ArticulosSinPortada \
        nuevo-ensayo nueva-presentacion \
        desarrollo pres-humedales sociologia \
        limpiar limpiar-dir _compile _scaffold

# =============================================================================
# ALIASES — materias conocidas
# =============================================================================

all: desarrollo

desarrollo:
	@echo "========================================================"
	@echo " Compilando: Desarrollo Urbano Sostenible — Ensayo Humedales"
	@echo "========================================================"
	$(MAKE) Document DIR=$(DIR_DUS_HUMEDALES)

pres-humedales:
	@echo "========================================================"
	@echo " Compilando: Presentación Humedales"
	@echo "========================================================"
	$(MAKE) Presentacion DIR=$(DIR_DUS_PRES_HUMEDALES)

sociologia:
	@echo "========================================================"
	@echo " Compilando: Sociología Urbana"
	@echo "========================================================"
	@if [ -f "$(DIR_SOCIOLOGIA)/main.tex" ]; then \
	    $(MAKE) Document DIR=$(DIR_SOCIOLOGIA); \
	else \
	    echo "[AVISO] No se encontró main.tex en $(DIR_SOCIOLOGIA). Omitiendo."; \
	fi

# =============================================================================
# COMPILACIÓN — pdflatex → bibtex → pdflatex × 2
# =============================================================================

Document:
ifndef DIR
	$(error Debes indicar la carpeta: make Document DIR=<ruta>)
endif
	@$(MAKE) _compile DIR=$(DIR) TIPO=Ensayo

Presentacion:
ifndef DIR
	$(error Debes indicar la carpeta: make Presentacion DIR=<ruta>)
endif
	@$(MAKE) _compile DIR=$(DIR) TIPO=Presentacion

_compile:
	@if [ ! -f "$(DIR)/main.tex" ]; then \
	    echo "[ERROR] No existe $(DIR)/main.tex"; \
	    echo "        Usa 'make nuevo-ensayo DIR=$(DIR)' o 'make nueva-presentacion DIR=$(DIR)' primero."; \
	    exit 1; \
	fi
	@echo "--- [$(TIPO)] Pasada 1/3: pdflatex ---"
	cd $(DIR) && $(MOTOR) $(FLAGS) main.tex
	@echo "--- [$(TIPO)] Pasada BibTeX ---"
	cd $(DIR) && $(BIBTEX) main || true
	@echo "--- [$(TIPO)] Pasada 2/3: pdflatex ---"
	cd $(DIR) && $(MOTOR) $(FLAGS) main.tex
	@echo "--- [$(TIPO)] Pasada 3/3: pdflatex ---"
	cd $(DIR) && $(MOTOR) $(FLAGS) main.tex
	@echo ">>> PDF generado: $(DIR)/main.pdf"

# =============================================================================
# SCAFFOLDING — copia la plantilla en DIR (no sobreescribe si ya existe main.tex)
# =============================================================================

EnsayosConPortada:
ifndef DIR
	$(error Debes indicar la carpeta destino: make EnsayosConPortada DIR=<ruta>)
endif
	@$(MAKE) _scaffold PLANTILLA=$(PLANTILLA_ENSAYO_CON_PORTADA) DIR=$(DIR) TIPO=Ensayo

EnsayosSinPortada:
ifndef DIR
	$(error Debes indicar la carpeta destino: make EnsayosSinPortada DIR=<ruta>)
endif
	@$(MAKE) _scaffold PLANTILLA=$(PLANTILLA_ENSAYO_SIN_PORTADA) DIR=$(DIR) TIPO=Ensayo

ArticulosConPortada:
ifndef DIR
	$(error Debes indicar la carpeta destino: make ArticulosConPortada DIR=<ruta>)
endif
	@$(MAKE) _scaffold PLANTILLA=$(PLANTILLA_ARTICULO_CON_PORTADA) DIR=$(DIR) TIPO=Articulo

ArticulosSinPortada:
ifndef DIR
	$(error Debes indicar la carpeta destino: make ArticulosSinPortada DIR=<ruta>)
endif
	@$(MAKE) _scaffold PLANTILLA=$(PLANTILLA_ARTICULO_SIN_PORTADA) DIR=$(DIR) TIPO=Articulo

# Alias heredado (apunta a EnsayosConPortada por compatibilidad)
nuevo-ensayo:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nuevo-ensayo DIR=<ruta>)
endif
	@$(MAKE) EnsayosConPortada DIR=$(DIR)

nueva-presentacion:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nueva-presentacion DIR=<ruta>)
endif
	@$(MAKE) _scaffold PLANTILLA=$(PLANTILLA_BEAMER) DIR=$(DIR) TIPO=Presentacion

_scaffold:
	@if [ -f "$(DIR)/main.tex" ]; then \
	    echo "[AVISO] $(DIR)/main.tex ya existe — no se sobreescribe."; \
	    echo "        Borra el directorio o elige otro nombre si quieres empezar de cero."; \
	    exit 1; \
	fi
	@echo ">>> Creando $(TIPO) en: $(DIR)"
	mkdir -p "$(DIR)"
	cp -r $(PLANTILLA)/. "$(DIR)/"
	@echo ">>> Plantilla copiada. Próximos pasos:"
	@echo "    1. Edita el bloque PERSONALIZACIÓN en $(DIR)/main.tex"
	@if [ "$(TIPO)" = "Presentacion" ]; then \
	    echo "    2. Edita los colores en $(DIR)/Latex/BeamerTheme.tex"; \
	    echo "    3. Escribe tus slides en $(DIR)/secciones/"; \
	else \
	    echo "    2. Edita los colores en $(DIR)/Latex/Comands.tex"; \
	    echo "    3. Escribe tu contenido en $(DIR)/secciones/"; \
	fi
	@echo "    4. Compila con: make $(if $(filter Presentacion,$(TIPO)),Presentacion,Document) DIR=$(DIR)"

# =============================================================================
# LIMPIEZA
# =============================================================================

limpiar:
	@echo "Limpiando archivos auxiliares de LaTeX en todo el proyecto..."
	find . -not -path './.git/*' -type f \( \
	    -name '*.aux' -o -name '*.log' -o -name '*.out' -o \
	    -name '*.toc' -o -name '*.lof' -o -name '*.bbl' -o -name '*.blg' -o \
	    -name '*.synctex.gz' -o -name '*.fls' -o -name '*.fdb_latexmk' -o \
	    -name '*.bcf' -o -name '*.run.xml' -o -name '*.nav' -o \
	    -name '*.snm' -o -name '*.vrb' \
	\) -delete
	@echo "Limpieza completada."

limpiar-dir:
ifndef DIR
	$(error Debes indicar la carpeta: make limpiar-dir DIR=<ruta>)
endif
	@echo "Limpiando auxiliares en: $(DIR)"
	find "$(DIR)" -type f \( \
	    -name '*.aux' -o -name '*.log' -o -name '*.out' -o \
	    -name '*.toc' -o -name '*.lof' -o -name '*.bbl' -o -name '*.blg' -o \
	    -name '*.synctex.gz' -o -name '*.fls' -o -name '*.fdb_latexmk' -o \
	    -name '*.bcf' -o -name '*.run.xml' -o -name '*.nav' -o \
	    -name '*.snm' -o -name '*.vrb' \
	\) -delete
	@echo "Limpieza de $(DIR) completada."
