.PHONY: deploy service all

all: build deploy service

deploy:
	sudo k3s kubectl apply -f */deployment.yml

service:
	sudo k3s kubectl apply -f */service.yml

build: XXX
	sudo k3s ctr images import <(nix build .#$^)

setup: $(PWD)/.git/hooks

$(PWD)/.git/hooks: $(PWD)/.githooks/*
	ln -sf $^ $@
