.PHONY: all clean build push publish

all: clean build push publish

prev: clean build preview

clean:
	jupyter-book clean .

build:
	jupyter-book build .

push:
	git add .
	git commit -m "Build and publish site"
	git push

preview:
	python3 -m http.server --directory _build/html

publish:
	ghp-import -n -p -f _build/html