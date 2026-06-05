SHELL:=/bin/bash
DESKTOPVERSION:="26_5_2"
DESKTOPCHECKSUM:="5c72c3c62f89014a636e23ff1e605e529cb193062741a80a3907ec3806f63990"

default:
	true

build: validate-build-deps submodule-update download-desktop-version verify-desktop-version build-jsword build-step prepare-oci-context build-container

build-container:
	bash scripts/build-container.sh

build-jsword:
	bash scripts/build-jsword.sh

build-step:
	bash scripts/build-step.sh

clean: clean-build clean-oci-context

clean-build:
	bash scripts/clean-build.sh

clean-oci-context:
	bash scripts/clean-oci-context.sh

download-desktop-version:
	export DESKTOPVERSION="$(DESKTOPVERSION)"; \
	bash scripts/download-desktop-version.sh

export-webxml:
	bash scripts/export-webxml.sh

prepare-oci-context:
	bash scripts/prepare-oci-context.sh

run-container:
	bash scripts/run-container.sh

save-image:
	bash scripts/save-image.sh

submodule-update:
	bash scripts/submodule-update.sh

validate-build-deps:
	bash scripts/validate-build-deps.sh

verify-desktop-version:
	export DESKTOPCHECKSUM="$(DESKTOPCHECKSUM)"; \
		bash scripts/verify-desktop-version.sh
