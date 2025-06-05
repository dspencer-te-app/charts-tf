.PHONY: all install init plan apply

all: init lint plan

install: apply

clean: destroy

lint: fmt

fmt:
	@terraform $@

destroy:
	@terraform $@

plan:
	@terraform $@

init:
	@terraform $@

apply:
	@terraform $@
