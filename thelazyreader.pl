:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).

:- http_handler(root(thelazyreader), homepage, []).

server(Port) :-
  http_server(http_dispatch, [port(Port)]).

homepage(_Request) :-
  reply_html_page(title('The Lazy Reader'),[h1('The Lazy Reader')]).