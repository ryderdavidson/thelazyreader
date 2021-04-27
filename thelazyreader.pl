:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).

:- http_handler(root(thelazyreader), homepage, []).
:- http_handler('/summary', summarypage, []).

server(Port) :-
  http_server(http_dispatch, [port(Port)]).

homepage(_Request) :-
  format('Content-type: text/html~n~n'),
  print_html([
    '<html>',
      '<head>',
        '<title>',
          'The Lazy Reader',
        '</title>',
      '</head>',
      '<body>',
        '<h1>', 'The Lazy Reader', '</h1>',
        '<p>', 'Summarize any text!', '</p>',
        '<form id="articleform" action="/summary">',
          '<textarea rows="4" cols="50">', 'Copy your text here...','</textarea>',
          '<br>','<br>',
          '<input type = "submit" value = "Summarize" />',
        '</form>',
      '</body>',
    '</html>'
  ]).

  summarypage(_Request) :-
    format('Content-type: text/html~n~n'),
    print_html([
    '<html>',
      '<head>',
        '<title>',
          'The Lazy Reader',
        '</title>',
      '</head>',
      '<body>',
        '<h1>', 'Text Summary', '</h1>',
        '<p>', 'This is where the summary will go!', '</p>',
        '<a href="/thelazyreader">', 'Summarize again', '</a>',
      '</body>',
    '</html>'
    ]).