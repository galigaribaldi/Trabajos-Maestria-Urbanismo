# =============================================================================
# Makefile — Compilación de documentos académicos de Maestría
# Organizado por Semestre y Materias
#
# USO:
#   make                          → Compila todo el Tercer Semestre
#   make all                      → Ídem
#   make desarrollo               → Solo Desarrollo Urbano Sostenible / Ensayo Humedales
#   make DIR=<ruta> compile       → Compila cualquier carpeta con main.tex
#   make limpiar                  → Borra archivos auxiliares de LaTeX
#
# EJEMPLO con parámetro de ruta:
#   make DIR=TercerSemestre/DesarrolloUrbanoSostenible/Ensayo_Humedales compile
# =============================================================================

MOTOR  := pdflatex
BIBTEX := bibtex
FLAGS  := -interaction=nonstopmode -halt-on-error

# --- Rutas conocidas por semestre/materia ---
DIR_DUS_HUMEDALES := TercerSemestre/DesarrolloUrbanoSostenible/Ensayo_Humedales
DIR_SOCIOLOGIA    := TercerSemestre/SociologiaUrbano

# Variable para compilar ruta arbitraria (override con DIR=...)
DIR ?=

# =============================================================================
# Objetivo principal
# =============================================================================
.PHONY: all desarrollo sociologia compile limpiar

all: desarrollo

# =============================================================================
# Tercer Semestre — Materias conocidas
# =============================================================================

desarrollo:
	@echo "========================================================"
	@echo " Compilando: Desarrollo Urbano Sostenible — Ensayo Humedales"
	@echo "========================================================"
	$(MAKE) DIR=$(DIR_DUS_HUMEDALES) compile
	@echo ">>> Ensayo Humedales compilado correctamente."

sociologia:
	@echo "========================================================"
	@echo " Compilando: Sociología Urbana"
	@echo "========================================================"
	@if [ -f "$(DIR_SOCIOLOGIA)/main.tex" ]; then \
	    $(MAKE) DIR=$(DIR_SOCIOLOGIA) compile; \
	    echo ">>> Sociología Urbana compilada correctamente."; \
	else \
	    echo "[AVISO] No se encontró main.tex en $(DIR_SOCIOLOGIA). Omitiendo."; \
	fi

# =============================================================================
# Compilador genérico — requiere: make DIR=<carpeta_con_main.tex> compile
# Ejecuta: pdflatex → bibtex → pdflatex → pdflatex
# =============================================================================
compile:
ifndef DIR
	$(error "Debes indicar la carpeta: make DIR=<ruta> compile")
endif
	@if [ ! -f "$(DIR)/main.tex" ]; then \
	    echo "[ERROR] No existe $(DIR)/main.tex"; exit 1; \
	fi
	@echo "--- Pasada 1/3: pdflatex ---"
	cd $(DIR) && $(MOTOR) $(FLAGS) main.tex
	@echo "--- Pasada BibTeX ---"
	cd $(DIR) && $(BIBTEX) main || true
	@echo "--- Pasada 2/3: pdflatex ---"
	cd $(DIR) && $(MOTOR) $(FLAGS) main.tex
	@echo "--- Pasada 3/3: pdflatex ---"
	cd $(DIR) && $(MOTOR) $(FLAGS) main.tex
	@echo ">>> PDF generado en: $(DIR)/main.pdf"

# =============================================================================
# Limpieza de archivos auxiliares de LaTeX
# =============================================================================
limpiar:
	@echo "Limpiando archivos auxiliares de LaTeX..."
	find . -type f \( \
	    -name '*.aux' -o -name '*.log' -o -name '*.out' -o \
	    -name '*.toc' -o -name '*.bbl' -o -name '*.blg' -o \
	    -name '*.synctex.gz' -o -name '*.fls' -o -name '*.fdb_latexmk' \
	\) -delete
	@echo "Limpieza completada."
