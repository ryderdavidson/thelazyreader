:- setenv('WNDB', 'wordnet').
:- use_module(library(wn)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).
:- consult(parser).

:- http_handler('/', homepage, []).
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
          '<textarea name="txt" placeholder="Copy your text here..." rows="4" cols="50">','</textarea>',
          '<br>','<br>',
          '<input type = "submit" value = "Summarize" />',
        '</form>',
      '</body>',
    '</html>'
  ]).

summarypage(Request) :-
  http_parameters(Request, [txt(Txt, [ optional(true) ])]),
  parse_string(Txt, ParsedTxt),
  flatten(ParsedTxt, FlatTxt),
  atomics_to_string(FlatTxt, ' ', Paragraph),
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
      '<p>', Paragraph, '</p>',
      '<a href="/">', 'Summarize again', '</a>',
    '</body>',
  '</html>'
  ]).
