%%% ------------------------------------------------------------------
%%% Licensed under the Apache License, Version 2.0 (the 'License');
%%%  you may not use this file except in compliance with the License.
%%%  You may obtain a copy of the License at
%%%
%%%      http://www.apache.org/licenses/LICENSE-2.0
%%%
%%% Copyright (c) 2020 qingchuwudi <bypf2009@vip.qq.com>
%%%
%%%  Unless required by applicable law or agreed to in writing, software
%%%  distributed under the License is distributed on an 'AS IS' BASIS,
%%%  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%%%  See the License for the specific language governing permissions and
%%%  limitations under the License.
%%%
%%% @doc
%%% @author  qingchuwudi
%%% @copyright 2020 qingchuwudi
%%% @end
%%% created|changed : 2020-02-04 11:26
%%% coding : utf-8
%%% ------------------------------------------------------------------
-module(test_script).
-author("qingchuwudi").

-export([start_link/0, loop/0]).

start_link() ->
    Pid = spawn_link(?MODULE, loop, []),
    {ok, Pid}.

loop() ->
    receive
    after 100 ->
        {ok, "hello_conf"} = application:get_env(test_script, test_conf),
        ?MODULE:loop()
    end.

