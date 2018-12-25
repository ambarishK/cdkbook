TARGETS := chapter3.md index.md

SUBDIRS := code

all: ${SUBDIRS} ${TARGETS}

clean:
	@rm chapter3.md index.md

%.md : %.i.md createMarkdown.groovy
	@groovy createMarkdown.groovy $< > $@

install:
	@cp ${TARGETS} live/.
	@cp code/*.code.md live/code/.

$(SUBDIRS):
	@$(MAKE) -C $@

