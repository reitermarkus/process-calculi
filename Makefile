TARGET = presentation
CLEAN_TARGETS = $(filter-out $(TARGET).tex, $(wildcard $(TARGET).*))

all: $(TARGET).pdf

$(TARGET).pdf: $(TARGET).tex
	latexmk -quiet $(WATCH) -f -pdf -pdflatex="xelatex -synctex=1 -interaction=nonstopmode" -use-make $(TARGET).tex

.PHONY: watch

watch: clean
watch: WATCH=-pvc
watch: $(TARGET).pdf

.PHONY: clean

clean:
	$(RM) $(CLEAN_TARGETS)

.PHONY: open

open:
	$(if ($(OS), Windows_NT), explorer, open) $(TARGET).pdf
