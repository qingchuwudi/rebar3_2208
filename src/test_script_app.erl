%%%-------------------------------------------------------------------
%% @doc test_script public API
%% @end
%%%-------------------------------------------------------------------

-module(test_script_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    test_script_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
