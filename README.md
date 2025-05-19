#  vProfile - Multi-Tier Java Web Application (Dockerized)

`vProfile` is a sample **multi-tier enterprise Java web application** built with Spring, JSP, and MySQL. This project demonstrates how to containerize and orchestrate such an application using **Docker**, **Docker Compose**, and optionally **Vagrant** for local development and simulation.

It serves as a great example for DevOps practice, CI/CD workflows, container orchestration, and infrastructure automation.

---

##  Application Overview

The `vProfile` app simulates a real-world online banking or account management system. It consists of:

- A **Java Spring MVC** backend served over **Apache Tomcat**
- A **MySQL** database to manage user accounts and transactions
- A **Memcached** caching layer for performance optimization
- A **RabbitMQ** message broker for async processing (e.g. email events)
- An **Nginx** reverse proxy handling frontend traffic and load balancing

---

## Project Structure

```
.
├── Docker-files/
│   ├── app/              # Dockerfile for building the Java WAR with Tomcat
│   ├── db/               # SQL dump and init script
│   └── web/              # Nginx config and Dockerfile
├── docker-compose.yml    # Docker Compose orchestration file
├── src/                  # Java source code and application.properties
├── vagrant/
│   └── windowsAndMacIntel/
│       ├── Vagrantfile   # Local VM setup (Ubuntu)
├── .gitignore
└── README.md
```

---

##  Getting Started

###  Prerequisites

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Vagrant](https://www.vagrantup.com/) (optional, for virtualized local setup)
- [VirtualBox](https://www.virtualbox.org/) (for running the VM)

---

###  Provision a Local Dev VM (Optional)

This project provides a Vagrantfile for spinning up an Ubuntu VM with Docker support:

```bash
cd vagrant/windowsAndMacIntel
vagrant up
vagrant ssh
cd /vagrant
```

---

###  Build & Push Docker Images

```bash
docker compose build
docker tag vprofile-app bebo998/vprofile-app:latest
docker tag vpro-nginx bebo998/vpro-nginx:latest

docker push bebo998/vprofile-app:latest
docker push bebo998/vpro-nginx:latest
```

---

### Run the Full Stack

```bash
docker compose up -d
```

Access the app at: `http://localhost` or your VM’s IP address on port `80`.

---

## Stack Summary

| Service         | Description                     | Port |
|----------------|----------------------------------|------|
| `vprodb`        | MySQL database for accounts      | 3306 |
| `vprocache01`   | Memcached caching layer          | 11211|
| `vpromq01`      | RabbitMQ message broker          | 5672 / 15672 |
| `vprofile-app`  | Java app on Tomcat (Spring MVC)  | 8080 |
| `vpro-nginx`    | Nginx reverse proxy (frontend)   | 80   |

---

## Notes

- `application.properties` contains all service configurations (DB, cache, MQ).
- The database auto-loads SQL data from `init.sql` and `db_backup.sql`.
- The Java WAR is built using a **multi-stage Dockerfile** (`maven → tomcat`).
- Nginx proxies HTTP requests to the Java backend (`vprofile-app`).

---

## Why Multi-Stage Docker Build?

Multi-stage builds keep your final image **lightweight and production-ready**.  
You compile the app in one stage (`maven`), and copy only the built `.war` into a clean Tomcat container — without bundling the Maven environment.

---

## 💡 Use Case

This project is perfect for:

- DevOps/Docker practice
- Interview prep or home labs
- CI/CD pipeline testing
- Infrastructure automation workshops

---

## 📜 License

This project is for educational and demonstrational purposes only.
