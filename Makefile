.PHONY: install

install:
ifeq ($(LAMMPS_DIR),)
	@echo "LAMMPS_DIR variable must be set, but it is empty. Exiting."
	@exit 1
endif
ifeq ("$(wildcard $(LAMMPS_DIR))","")
	@echo "LAMMPS_DIR=$(LAMMPS_DIR) does not exist. Exiting."
	@exit 1
endif
	rsync -av examples ${LAMMPS_DIR}/
	rsync -av src ${LAMMPS_DIR}/
	rsync -av lib ${LAMMPS_DIR}/

