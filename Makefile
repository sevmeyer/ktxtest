# File names

srcValid := $(sort $(wildcard src/valid/*/*.json))
ktxValid := $(patsubst src/%.json, ktx/%.ktx, $(srcValid))

srcInvalid := $(sort $(wildcard src/invalid/*/*.json))
ktxInvalid := $(patsubst src/%.json, ktx/%.ktx, $(srcInvalid))


# Default rule to make all files

.PHONY: all
all: $(ktxValid) $(ktxInvalid)


# Conversion rules

ktx/valid/%.ktx: src/valid/%.json
	@ echo $@
	@ ktxjuggle --log WARNING $< $@

ktx/invalid/%.ktx: src/invalid/%.json
	@ echo $@
	@ ktxjuggle --log WARNING --noalign $< $@
