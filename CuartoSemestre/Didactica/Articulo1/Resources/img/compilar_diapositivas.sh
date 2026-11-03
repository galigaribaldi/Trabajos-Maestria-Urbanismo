#!/usr/bin/env bash
# =============================================================================
#  compilar_diapositivas.sh — Compila las diapositivas TikZ (standalone 16:9)
#  y exporta cada una a PNG 1920×1080 junto a su carpeta tikz/.
#
#  Uso (desde cualquier carpeta):
#    bash compilar_diapositivas.sh                 # todas
#    bash compilar_diapositivas.sh Dinamica3/Fase2 # solo una fase
#    bash compilar_diapositivas.sh Dinamica3/Fase2/tikz/Dinamica3_Fase2_Diapositiva1.tex
#
#  Los archivos auxiliares se generan en /tmp/tikz_build (fuera del repo).
# =============================================================================
set -euo pipefail

BASE="$(cd "$(dirname "$0")" && pwd)"
BUILD=/tmp/tikz_build
mkdir -p "$BUILD"

objetivo="${1:-.}"
case "$objetivo" in /*) ;; *) objetivo="$BASE/$objetivo" ;; esac

if [[ -f "$objetivo" ]]; then
  archivos=("$objetivo")
else
  archivos=()
  while IFS= read -r f; do archivos+=("$f"); done \
    < <(find "$objetivo" -path '*/tikz/*.tex' | sort)
fi

for tex in "${archivos[@]}"; do
  nombre="$(basename "$tex" .tex)"
  destino="$(dirname "$(dirname "$tex")")/$nombre"
  printf '→ %s ... ' "$nombre"
  if pdflatex -interaction=nonstopmode -halt-on-error \
       -output-directory="$BUILD" "$tex" > "$BUILD/$nombre.log.txt" 2>&1; then
    pdftoppm -png -scale-to-x 1920 -scale-to-y 1080 -singlefile \
      "$BUILD/$nombre.pdf" "$destino"
    echo "ok (${destino#"$BASE"/}.png)"
  else
    echo "ERROR (ver $BUILD/$nombre.log.txt)"
  fi
done
