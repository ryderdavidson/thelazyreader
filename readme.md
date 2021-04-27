# The Lazy Reader

An automatic text summarization web application written in prolog for Cal Poly Pomona CS3520 Symbolic programming class.

# Installation

## Install SWI-Prolog

https://www.swi-prolog.org/download/stable

## Clone this repository

```bash
git clone https://github.com/KnowikiApps/thelazyreader.git
```

# Running the application

Navigate your terminal emulator to the `thelazyreader` project directory

```bash
swipl thelazyreader.pl
```

Start the server:

```prolog
?- server(5000).
```

Open your browser to:

http://localhost:5000/thelazyreader