.PHONY: bootstrap deploy backup restore health

bootstrap:
\tbash bootstrap/bootstrap.sh

deploy:
\tbash deployment/deploy.sh

backup:
\tbash backup/backup.sh

restore:
\t@echo "Usage: make restore FILE=/path/to/backup.tar.gz"
\tbash restore/restore.sh $(FILE)

health:
\tbash monitoring/healthcheck.sh
