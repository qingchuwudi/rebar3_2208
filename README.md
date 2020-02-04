## test_script

A test repo OTP application for [bin/START upgrade VERSION failed when using sys.config.src and vm.args.src #2208](https://github.com/erlang/rebar3/issues/2208)

## Get repos

```bash
git clone https://github.com/qingchuwudi/test_script

```

download rebar3:

```bash
cd test_script
wget https://s3.amazonaws.com/rebar3/rebar3 && chmod +x ./rebar3
```

## Environment

```bash
export TEST_SCRIPT_NODE_NAME=hello_2208
export TEST_CONF="\"hello_conf\""
```

## Old Version

package:

```bash
git checkout 0.1.0
rebar3 as prod tar
```

run:

```bash
mkdir /tmp/test_script
tar xzf `pwd`/_build/prod/rel/test_script/test_script-0.1.0.tar.gz -C /tmp/test_script/
/tmp/test_script/bin/test_script start
```

check:
```bash
$ /tmp/test_script/bin/test_script versions
Installed versions:
* 0.1.0 permanent
```

## New Version

package:

```bash
git checkout 0.1.1
rebar3 as prod release
rebar3 as prod appup generate --previous_version 0.1.0
rebar3 as prod relup tar
```

install (or upgrade):

```bash
cp `pwd`/_build/prod/rel/test_script/test_script-0.1.1.tar.gz /tmp/test_script/releases/
/tmp/test_script/bin/test_script install 0.1.1
```

check:
```bash
$ /tmp/test_script/bin/test_script versions
Installed versions:
* 0.1.1 permanent
* 0.1.0 old
```





_ _ _
