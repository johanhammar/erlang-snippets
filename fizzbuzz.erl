-module(fizzbuzz).

-export([fb1/1]).
-export([fb2/1]).

fb1(N) when is_integer(N) -> fizzbuzzer1(N);
fb1(L) when is_list(L) -> lists:map(fun fizzbuzzer1/1, L).

fb2(N) when is_integer(N) -> fizzbuzzer2(N);
fb2(L) when is_list(L) -> lists:map(fun fizzbuzzer2/1, L).

fb3(N) when is_integer(N) -> fizzbuzzer2(N);
fb3(L) when is_list(L) -> lists:map(fun fizzbuzzer2/1, L).

%% If
fizzbuzzer1(N) ->
	if 
		N rem 3 =:= 0, N rem 5 =:= 0 ->
			io:format("fizzbuzz~n");
		N rem 3 =:= 0 ->
			io:format("fizz~n");
		N rem 5 =:= 0 ->
			io:format("buzz~n");
		true -> 
			io:format("~p~n", [N])
	end.

%% Pattern matching - "Port" of % http://alan.dipert.org/post/172774481/fizzbuzz-in-scala-and-clojure
fizzbuzzer2(N) ->
	case {N rem 3, N rem 5} of
		{0,0} -> io:format("fizzbuzz~n");
		{0,_} -> io:format("fizz~n");
		{_,0} -> io:format("buzz~n");
		{_,_} -> io:format("~p~n", [N])
	end.

% Guards
fizzbuzzer3(N) when N rem 3 == 0, N rem 5 == 0 -> io:format("fizzbuzz").
fizzbuzzer3(N) when N rem 3 == 0 -> io:format("fizz").
fizzbuzzer3(N) when N rem 5 == 0 -> io:format("buzz").
fizzbuzzer3(N) -> io:format(N).
