LTS := coffee_machine_1.lts coffee_machine_2.lts

PROPERTIES_MCF := $(wildcard properties/*.mcf)
PROPERTIES_PBES := $(patsubst %.mcf, %.coffee_machine_1.pbes, $(PROPERTIES_MCF)) $(patsubst %.mcf, %.coffee_machine_2.pbes, $(PROPERTIES_MCF))

all: $(LTS) $(PROPERTIES_PBES)

.PRECIOUS: %.lps
%.lps: %.mcrl2
	mcrl22lps -v $^ $@

%.lts: %.lps
	lps2lts -v $^ $@

.PHONY: graph
graph: $(LTS)
	trap 'kill -TERM 0' INT; for lts in $^; do ltsgraph "$$lts" & done; wait

.PHONY: bisim
bisim: $(LTS)
	ltscompare --equivalence=bisim --tau=insert_coin,choose_coffee,choose_tea,pour_tea,pour_coffee $^

%.coffee_machine_1.pbes: coffee_machine_1.lps
	lps2pbes -f $(patsubst %.coffee_machine_1.pbes, %.mcf, $@) $^ $@

%.coffee_machine_2.pbes: coffee_machine_2.lps
	lps2pbes -f $(patsubst %.coffee_machine_2.pbes, %.mcf, $@) $^ $@

.PHONY: properties
properties: $(PROPERTIES_PBES)
	for property in $^; do pbes2bool -v "$$property"; done

.PHONY: clean
clean:
	$(RM) *.lps *.lts */*.pbes
