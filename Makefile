all:
	cd srcs; docker compose up --build -d
stop:
	cd srcs; docker compose down