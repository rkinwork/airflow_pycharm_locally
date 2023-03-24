dev_image:
	@echo "$$(cat ./Dockerfile)\nENTRYPOINT [\"\"]" | docker build -f - . -t airflow-pycharm

start_dev:
	docker compose -f docker-compose-dev.yaml up

stop_dev:
	docker compose -f docker-compose-dev.yaml down --remove-orphans

rebuilt_dev:
	docker compose -f docker-compose-dev.yaml build

run_tests:
	docker compose -f docker-compose-dev.yaml run tests
