for /R %%f in (*.svg) do ("C:\Program Files\Inkscape\inkscape.exe" -f "%%f" -A "%%~pf\%%~nf.pdf")