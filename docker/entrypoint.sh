#! /bin/bash
cd lnprototest || exit

if [ "$LN_IMPL" == "ldk" ]; then
  RUNNER="ldk_lnprototest.Runner"
elif [ "$LN_IMPL" == "clightning" ]; then
  RUNNER="lnprototest.clightning.Runner"
fi

for i in range{0..5};
do
  if make check PYTEST_ARGS="--runner=$RUNNER -n8 --dist=loadfile --log-cli-level=DEBUG"; then
    echo "iteration $i succeeded"
  else
    echo "iteration $i failed"
    exit 1
  fi
done
