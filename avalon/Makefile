.PHONY: menu
menu:
	@printf 'validate: validates the stuff\n'
	@printf 'menu: this menu\n'


.PHONY: validate
validate:
	@printf '==> Validating Compose files (.dclintrc)\n'
	@docker run -t --rm -v ${PWD}:/app zavoloklom/dclint $$(echo files/compose/*)
	@printf '==> Validating Markdown files (.markdownlint.yaml)\n'
	@markdownlint-cli2 "**/*.md" "#node_modules"
ifeq (0,1)
	@# Ansible lint can't even find the existing parted module.
	@printf '\n==> Validating Ansible files\n'
	@ansible-lint .
endif
	@printf '\nAll validations passed\n'

