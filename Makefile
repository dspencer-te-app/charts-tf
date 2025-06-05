APPLY_FLAGS 	:= -auto-approve

.PHONY: all install init plan apply

all: init lint plan

install: apply

clean: destroy

lint: fmt

fmt:
	@terraform $@

destroy:
	@terraform $@ $(APPLY_FLAGS)

plan:
	@terraform $@

init:
	@terraform $@

apply:
	@terraform $@ $(APPLY_FLAGS)
