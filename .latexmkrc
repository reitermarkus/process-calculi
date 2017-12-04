$pdflatex = 'xelatex -synctex=1 -interaction=nonstopmode';
@generated_exts = (@generated_exts, 'synctex.gz');
@generated_exts = (@generated_exts, 'nav');
@generated_exts = (@generated_exts, 'snm');

@default_files = ('presentation.tex');
