When editing "jswitch.tex" PLEASE make sure your line endings are LF only (Unix style).

The whole document is written in LaTeX.

# Linux
## Ubuntu

### Required packages
```bash
sudo apt-get install \
  texlive-latex-recommended \
  texlive-latex-extra \
  texlive-fonts-recommended \
  texlive-pictures
```

### Build documents
Build all documents:
```bash
make
```

Build JSwitch IP manual:
```bash
make jswitch.pdf
```

Build JSwitch presentation:
```bash
make jswitch_beamer.pdf
```

# Windows
To build this under windows, you first of all need Cygwin (64-bit version) for Windows,
which you can get here: https://cygwin.com/install.html

To get a PDF you need at least the packages:
  bash  (shell used for scripting, you already might have that installed)
  make  (to drive the build process)
  git   (needed to produce the date for the document and to get access to the sources in general)
  texlive-collection-latex
  texlive-collection-latexextra
  texlive-collection-latexrecommended
  xfig  (you need the fig2dev executable to convert .fig files into .png files)

To modify or create ".fig" files, which contain the diagrams which are used
in the documentation you need to get xfig running.

I had success under windows by using the cygwin64 package xorg-server as X11 Server:

Install the Cygwin64 packages
  xorg-server
  xinit

Start Cygwin64 X Server with
   setsid XWin -multiwindow 1>xwin.log 2>&1 &

Check with "ps" that X Server is running:
   $ ps
      PID    PPID    PGID     WINPID   TTY         UID    STIME COMMAND
     2307     589    2307       2928  pty0     1049722 16:49:11 /usr/bin/ps
     2298       1    2298       1120  ?        1049722 16:48:09 /usr/bin/XWin        <-- OK
      589     588     589       5024  pty0     1049722 13:07:05 /usr/bin/bash
      588       1     588       3160  ?        1049722 13:07:05 /usr/bin/mintty

Start xfig with
   DISPLAY=':0.0' setsid xfig 1>/dev/null 2>&1 &
