# Python Hello-World - Containerization & CI/CD Pipeline

This repository contains a simple Python "Hello World" application that is fully containerized and integrated with a Continuous Integration/Continuous Deployment (CI/CD) pipeline. Every push to the `task-python-hello-world` branch triggers an automated build and push to Docker Hub.

## 🚀 Project Overview

The objective of this assignment was to automate the lifecycle of a Python application. Using GitHub Actions, to established a workflow that ensures code quality via linting and automatically deploys a fresh container image to a public registry.

## 🏗️ Implementation Details

### 1. Containerization
The application is packaged using a **Dockerfile** based on the official Python 3.9-slim image.
- **Base Image:** `python:3.9-slim` for a minimal, lightweight environment.
- **Working Directory:** All application files are managed in the `/app` directory.
- **Port:** The application is configured to communicate on port `3000`.

### 2. CI/CD Pipeline (GitHub Actions)
The automation logic is defined in `.github/workflows/docker-build.yml`. The pipeline runs automatically on every push to the **main** branch.

**Workflow Steps:**
1. **Checkout Code:** Retrieves the latest source code from the repository.
2. **Lint/Test:** Sets up a Python environment and runs basic checks (e.g., `flake8` or `pytest`) to ensure the code is functional.
3. **Login to Docker Hub:** Authenticates securely using GitHub Repository Secrets (`DOCKER_USERNAME` and `DOCKER_PASSWORD`).
4. **Build & Push:** Packages the Docker image and uploads it to the registry.

### 3. Image Tagging Strategy
To maintain versioning and traceability, every build generates two tags:
- **`:latest`**: Always points to the most recent successful build. Use this for the most up-to-date version.
- **`:${{ github.sha }}`**: This uses the **Git Commit SHA** (a unique unique identifier for that specific push). This allows us to track exactly which code version is inside a container, making rollbacks and debugging much easier.

---

## 🔗 Deliverables & Links

- **Docker Hub Repository:** [View my image on Docker Hub](https://hub.docker.com/repository/docker/kehindemasuud/python-hello-world/general)
- **CI/CD Workflow:** `.github/workflows/docker-build.yml`
- **Application Config:** `Dockerfile`

---

## 🚦 Running Locally

To pull and run this Python container on your local machine:

```bash
# Pull the latest image
docker pull YOUR_DOCKER_USERNAME/python-hello-world:latest

# Run the container on port 3000
docker run -p 3000:3000 YOUR_DOCKER_USERNAME/python-hello-world:latest
