LTSPICE_APP = /Applications/LTspice.app
LTSPICE_DIR := ${HOME}/Library/Application\ Support/LTspice
LIB_DIR := ${LTSPICE_DIR}/lib

${LTSPICE_DIR}:
	open ${LTSPICE_APP}
	sleep 5

.PHONY: bootstrap 
bootstrap: ${LTSPICE_DIR} 
	git submodule init
	git submodule update 


.PHONY: install
install: bootstrap
	rsync -nairP LTspiceXVII/lib ${LTSPICE_DIR}
	rsync -nairP LTSpice-parts/parts ${LTSPICE_DIR}/lib/sub
	# find ./LTSpice-parts -name '*.lib' -exec cp -prv '{}' '${LIB_DIR}' ';'
	# find ./LTSpice-parts -name '*.mod' -exec cp -prv '{}' '${LIB_DIR}' ';'

	# find ./LTspiceXVII/lib/cmp -name 'standard.*' -exec cp -prv '{}' '${CMP_DIR}' ';'
	# find ./LTspiceXVII/lib/sub -name '*.sub' -exec cp -prv '{}' '${sub_DIR}' ';'
	# find ./LTspiceXVII/lib -name '*.lib' -exec cp -prv '{}' '${SUB_DIR}' ';'

.PHONY: clean
clean:
	rm -rf ${LTSPICE_DIR}
	-rm -rf LTspice-parts
	-rm -rf LTspiceXVII
