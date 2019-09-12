srcFiles := $(sort $(wildcard src/*/*/*.json))
ktxFiles := $(patsubst src/%.json, ktx/%.ktx, $(srcFiles))

# Default rule to make all files
.PHONY: all
all: $(ktxFiles)

# Conversion rule
ktx/%.ktx: src/%.json
	@ echo $@
	@ ktxjuggle --log WARNING $< $@
