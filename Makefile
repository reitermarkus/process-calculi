TARGET = presentation

all: $(TARGET).pdf

$(TARGET).pdf: $(TARGET).tex
	latexmk -quiet $(WATCH) -f -pdf -pdflatex="xelatex -synctex=1 -interaction=nonstopmode" -use-make $(TARGET).tex

.PHONY: watch

watch: WATCH=-pvc
watch: $(TARGET).pdf

.PHONY: clean

clean:
	latexmk -CA
