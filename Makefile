TAG = 1.0.0

all: lint build

apply:
	terraform apply -auto-approve -input=false tfplan

build: changelog
	terraform-docs markdown .  --recursive --output-file README.md

changelog:
	docker run --quiet --rm --volume "${PWD}:/mnt/source" --workdir /mnt/source ghcr.io/cbdq-io/gitchangelog > CHANGELOG.md

destroy:
	terraform destroy -auto-approve -input=false

lint:
	terraform fmt -check -diff -recursive
	terraform init
	terraform validate
	tflint --recursive

plan:
	terraform init -reconfigure
	terraform plan -out=tfplan

tag:
	@echo $(TAG)
