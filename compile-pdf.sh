#!/usr/bin/fish

# Should compile various pdf files and copy them to the /web/ folder (or a subfolder)

cd olopgaver

for d in (ls)
    cd $d
    echo "Compiling olopgaver-$d.tex"
    latex -interaction=batchmode olopgaver-{$d}.tex >/dev/null
    dvips -q olopgaver-{$d}.dvi
    ps2pdf olopgaver-{$d}.ps
    cd ..
end

cd ../uni
for d in (ls)
    cd $d
    for f in (ls | grep ".tex")
        set n (basename -s ".tex" $f)
        echo "Compiling $f"
        latex -interaction=batchmode $f >/dev/null
	dvips -q {$n}.dvi
	ps2pdf {$n}.ps
    end
    cd ..
end

cd ../../cv
echo "Compiling cv.tex"
latex -interaction=batchmode cv.tex >/dev/null
dvips -q cv.dvi
ps2pdf cv.ps
cp cv.pdf ../web/sstoltze-cv.pdf

cd ../uni/live

for d in (ls)
    cd $d
    echo "Compiling $d.tex"
    latex -interaction=batchmode {$d}.tex >/dev/null
    dvips -q {$d.}dvi
    ps2pdf {$d}.ps
    cp {$d}.pdf ../../../web/uni/pdf/
    cd ..
end

cd ../ncg/notes
echo "Compiling topologisk-k-teori.tex"
pdflatex topologisk-k-teori.tex >/dev/null
cp topologisk-k-teori.pdf ../../../web/uni/pdf/

true
