help:
	@grep -E '^[^:]+:.*?## .*$$' $(MAKEFILE_LIST) | grep -v grep | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' | sort

run: ## run jekyll serve 
	bundle exec jekyll serve

new-post: ## create new post
	bundle exec jekyll post "My new post"

new-draft: ## create new draft 
	bundle exec jekyll draft "My new draft"
