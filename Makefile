.PHONY: bootstrap deploy backup restore health

bootstrap:
	bash bootstrap/bootstrap.sh

deploy:
	bash deployment/deploy.sh

backup:
	bash backup/backup.sh

restore:
	bash restore/restore.sh $(FILE)

health:
	bash monitoring/healthcheck.sh
