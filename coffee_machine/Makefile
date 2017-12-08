LTS := coffee_machine_1.lts coffee_machine_2.lts

all: $(LTS)

.PRECIOUS: %.lps
%.lps: %.mcrl2
	mcrl22lps -nfTv $^ $@
	lpsuntime -v $@ $(patsubst %.lps, %u.lps, $@)
	lpsrealelm -v --max=11 $(patsubst %.lps, %u.lps, $@) $(patsubst %.lps, %r.lps, $@)

%.lts: %.lps
	lps2lts -v $^ $@

.PHONY: graph
graph: $(LTS)
	trap 'kill -TERM 0' INT; for lts in $^; do ltsgraph "$$lts" & done; wait

.PHONY: bisim
bisim: $(LTS)
	ltscompare --equivalence=bisim --tau=insert_coin,choose_coffee,choose_tea,pour_tea,pour_coffee $^

.PHONY: clean
clean:
	$(RM) *.lps *.lts
