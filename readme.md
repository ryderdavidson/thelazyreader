# The Lazy Reader

An automatic text summarization web application written in prolog for Cal Poly Pomona CS3520 Symbolic programming class.

# Installation

## Install SWI-Prolog

https://www.swi-prolog.org/download/stable

## Clone this repository

```bash
git clone https://github.com/KnowikiApps/thelazyreader.git
```

## Install the WordNet prolog pack

```bash
swipl
```
```prolog
?- pack_install(wordnet).
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

http://localhost:5000