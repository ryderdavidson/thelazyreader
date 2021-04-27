:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).

:- http_handler(root(thelazyreader), homepage, []).

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
        '<p>', 'Copy and paste article text in the form below.', '</p>',
        '<form id="articleform">',
          '<textarea rows="4" cols="50">','</textarea>',
          '<br>','<br>',
          '<input type = "submit" value = "Summarize" />',
        '</form>',
      '</body>',
    '</html>'
  ]).