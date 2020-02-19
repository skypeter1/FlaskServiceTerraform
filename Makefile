cnf ?= config.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

# .PHONY: docker docker-run docker-shell docker-test clean