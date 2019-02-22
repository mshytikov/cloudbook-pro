SHELL := /bin/bash
INSTANCE := $(shell uname)
INFRASTRUCTURE := "./cloudbook-pro/gcloud/infrastructure"
gcloud := dgcp gcloud

default: readme

readme:
	echo $$(uname)
	cat README.md


cloudbook-pro-create:
	cd $(INFRASTRUCTURE) && \
	$(gcloud) deployment-manager deployments create $$CLOUDBOOK_PRO_DEPLOYMENT \
		--config cloudbook-pro.yml

cloudbook-pro-update:
	cd $(INFRASTRUCTURE) && \
		$(gcloud) deployment-manager deployments update $$CLOUDBOOK_PRO_DEPLOYMENT \
		--config cloudbook-pro.yml

cloudbook-pro-delete:
	$(gcloud) deployment-manager deployments delete $$CLOUDBOOK_PRO_DEPLOYMENT

cloudbook-pro-show:
	$(gcloud) compute instances list	--filter=$$CLOUDBOOK_PRO_DEPLOYMENT
	$(gcloud) deployment-manager deployments list \
		--filter=$$CLOUDBOOK_PRO_DEPLOYMENT

cloudbook-pro-set-machine-type:
	cd $(INFRASTRUCTURE) && \
		sed -i '' -E "s/(.*machine_type:).*/\1 $(machine_type)/" cloudbook-pro.yml

cloudbook-pro-scale: | cloudbook-pro-set-machine-type cloudbook-pro-update

dvim-setup:
	mkdir -p ~/dvim
	docker build -t mshytikov/dvim:$$UID --build-arg UID=$$UID ./docker/dvim/local

dotfiles-setup:
	mkdir -p ~/bin
	stow --target ~/bin -v  bin
	stow --adopt --dir=dotfiles --target ~ -v bash
	stow --adopt --dir=dotfiles --target ~ -v git
	stow --adopt --dir=dotfiles --target ~ -v tmux
	# Make backup to git stash for original dotfiles files
	git diff --quiet dotfiles || git stash push -- dotfiles

macbook-pro-setup:
	brew ls --versions tmux            || brew install tmux
	brew ls --versions stow            || brew install stow
	brew ls --versions git             || brew install git
	brew ls --versions coreutils       || brew install coreutils
	brew ls --versions bash-completion || brew install bash-completion
	brew ls --versions jq              || brew install jq

cloudbook-pro-docker-setup:
	which docker || cloudbook-pro/docker/setup

cloudbook-pro-tmux-setup:
	which tmux || cloudbook-pro/tmux/setup

cloudbook-pro-setup: | cloudbook-pro-tmux-setup cloudbook-pro-docker-setup
	sudo apt-get install git
	sudo apt-get install htop
	sudo apt-get install stow
	sudo apt-get install jq

secrets-setup:
	mkdir -p $$MYBASH_SECRETS_DIR
	mkdir -p $$MYBASH_SECRETS_DIR/gcp
	mkdir -p $$MYBASH_SECRETS_DIR/mybash
	echo "Hello World" > $$MYBASH_SECRETS_DIR/mybash/hello
	chmod 700 $$MYBASH_SECRETS_DIR

instance-setup:
ifeq ($(INSTANCE), Darwin)
instance-setup: | macbook-pro-setup  dotfiles-setup dvim-setup
else
instance-setup: | cloudbook-pro-setup dotfiles-setup dvim-setup
endif
