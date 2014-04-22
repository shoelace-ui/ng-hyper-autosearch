STYLUS = node_modules/.bin/stylus
JADE = node_modules/.bin/jade
COMPONENT = node_modules/.bin/component

SRC_JS_FILES = $(shell find src -name "*.js" -type f | sort)
DIST_JS_FILES = $(patsubst src/%,dist/%,$(SRC_JS_FILES))

SRC_STYL_FILES = $(shell find src -name "*.styl" -type f | sort)
DIST_CSS = $(patsubst src/%,dist/%,$(SRC_STYL_FILES:.styl=.css))

SRC_JADE_FILES = $(shell find src -name "*.jade" -type f | sort)
DIST_HTML_FILES = $(patsubst src/%,dist/%,$(SRC_JADE_FILES:.jade=.html))

dir_guard=@mkdir -p $(@D)

all: dist

clean:
	@rm -rf dist

node_modules: package.json
	@npm install

build: \
	node_modules \
	dist
	$(dir_guard)
	@$(COMPONENT) build
	@touch $@

dist: \
	node_modules \
	$(DIST_JS_FILES) \
	$(DIST_CSS_FILES) \
	$(DIST_HTML_FILES)
	@touch $@

$(DIST_JS_FILES): dist/%.js: src/%.js
	$(dir_guard)
	@cp $< $@

$(DIST_CSS_FILES): dist/%.css: src/%.styl
	$(dir_guard)
	@$(STYLUS) -I node_modules < $< > $@

$(DIST_HTML_FILES): dist/%.html: src/%.jade
	$(dir_guard)
	@$(JADE) < $< > $@

.PHONY: \
	all \
	clean

