
check: runtest-exists
	@export status=0;\
	runtest --status --all --tool=bap || status=1; done;\
	exit $$status

runtest-exists:
	@if runtest -version >/dev/null 2>&1; then :; \
	else echo "Please, install runtest (dejagnu)"; exit 1; fi

veri: runtest-exists
	@export status=0;\
	runtest --status --all --tool=veri || status=1; \
	exit $$status

mc: runtest-exists
	@export status=0;\
	runtest --status --all --tool=mc || status=1; \
	exit $$status

primus: runtest-exists
	@export status=0;\
	runtest --status --all --tool=primus || status=1; \
	exit $$status

clean:
	rm -f *.log *.sum
