
#
#
#
#
all: help

help: misc.help
	@echo "bye"


clean: eb.zip.clean
	find ./ -name "*~" -delete

clean.purge: clean py.venv.clean




#
# PYTHON VIRTUAL ENV
#
py-venv-name=ve3
py.venv.create:
	@python3 -m virtualenv $(py-venv-name)
	@echo
	@echo ToDo: 
	@echo $ source $(py-venv-name)/bin/activate
	@echo $	deactivate
py.venv.clean:
	@rm -rf $(py-venv-name)

py-src-dir=src/main/w3
py.pip.req:
	pip install -r $(py-src-dir)/requirements.txt
py.pip.req.freeze:
	pip freeze > $(py-src-dir)/requirements.txt
py.run:
	python $(py-src-dir)/app.py

#
# 
#
eb-zip=eb.zip
eb.zip:
	zip -r $(eb-zip) . -x \*.git\* -x \*$(py-venv-name)\*
eb.zip.clean:
	rm -rf $(eb-zip)

#
#
#



#
# EB CLI
#
eb-region=us-east-2
eb-app-name=application-name
eb.init.dock:
	eb init -p docker $(eb-app-name)
eb.init.python:
	eb init -p python $(eb-app-name) --region $(eb-region)


#
# Docker 
#
dock-name=py-dock-amzn
dock.build:
	docker build -t $(dock-name) .

dock.run:
	docker run -it -p 3000:8080 $(dock-name)


#
# misc
#
misc.help:
	@echo
	@echo
	@echo MISC
	@echo
	@echo .ebextensions : elastic beanstalk extension
	@echo .gitignore : 
	@echo .ebignore  :
	@echo .dockerignore : 
	@echo
