SUBCIRCUIT_DIR := ${HOME}/Library/Application Support/LTspice/lib/sym

.PHONY: bootstrap
bootstrap:
	git submodule init
	git submodule update 


.PHONY: install
install: bootstrap
	find ./ -name '*.lib' -exec cp -prv '{}' '${SUBCIRCUIT_DIR}' ';'

.PHONY: clean
clean:
	rm -rf LTspice-parts
