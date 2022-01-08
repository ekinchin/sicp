install:
	raco pkg install sicp
	raco pkg install review

test:
	raco test chapters

lint:
	@echo "check codestyle"
	@(for f in $$(find chapters -name '*.rkt'); do raco review $$f; done)

.PHONY: test
