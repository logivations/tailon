BUILD ?= prod

frontend:
	cd frontend && $(MAKE) clean ; $(MAKE) BUILD=$(BUILD)

frontend-watch:
	cd frontend && $(MAKE) BUILD=$(BUILD)

docker-build:
	sudo docker build -t gvalkov/tailon .

README.md:
	ed $@ <<< $$'/BEGIN HELP/+2,/END HELP/-2d\n/BEGIN HELP/+1r !./tailon --help 2>&1\n,w'
	sed -i 's/[ \t]*$$//' $@


.PHONY: frontend frontend-watch docker-build README.md