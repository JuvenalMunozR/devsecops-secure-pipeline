# DevSecOps Secure Pipeline

## Overview

This repository implements a security-focused CI/CD pipeline for a containerized Python application.

The project demonstrates how security controls can be integrated into the software delivery lifecycle using:

- GitHub Actions
- Bandit for SAST
- Docker
- Trivy for container image vulnerability scanning
- GitHub Actions artifacts for security reports
- Automated security gates

## Pipeline Architecture

```text
Developer
    │
    ▼
Pull Request / Push
    │
    ▼
GitHub Actions
    │
    ├── Bandit SAST
    │
    ├── Docker Build
    │
    ├── Trivy Vulnerability Scan
    │
    ├── Security Reports
    │      ├── Bandit Report
    │      └── Trivy Report
    │
    └── Security Gate
           │
           └── HIGH / CRITICAL

## Security Controls

### Bandit

Bandit performs static application security testing against the Python application located in `app/`.

The pipeline uses Bandit `1.9.4`.

The generated report is uploaded as a GitHub Actions artifact.

### Trivy

Trivy scans the Docker image for known vulnerabilities.

The pipeline uses Trivy `0.74.0` and limits the scanner to vulnerability detection.

The security policy evaluates:

- HIGH vulnerabilities
- CRITICAL vulnerabilities
- Vulnerabilities with available fixes

Unfixed vulnerabilities are reported but excluded from the security gate.

### Security Gate

The pipeline fails when a HIGH or CRITICAL vulnerability with an available fix is detected.

This separates vulnerability visibility from the enforcement policy.

## Container

The application is packaged as a Docker image based on Python 3.12 slim.

The container:

- Uses a non-root user (`appuser`)
- Installs dependencies from `requirements.txt`
- Exposes port `5000`
- Runs the Flask application

## Local Validation

The pipeline components can also be validated locally before being executed in GitHub Actions.

### Bandit

```bash
bandit -r app/ -f txt
```

### Docker Build

```bash
docker build -t devsecops-app:v2 .
```

### Trivy Security Gate

```bash
trivy image \
  --scanners vuln \
  --severity HIGH,CRITICAL \
  --ignore-unfixed \
  --exit-code 1 \
  devsecops-app:v2
```

## Repository Structure

devsecops-secure-pipeline/
├── .github/
│   └── workflows/
│       └── trivy-scan.yml
├── app/
│   └── app.py
├── docs/
├── reports/
├── study/
├── .dockerignore
├── .gitignore
├── Dockerfile
├── README.md
└── requirements.txt

## Documentation

Detailed technical documentation is available in the `docs/` directory.

The documentation covers:

- Laboratory setup
- Manual Trivy scanning
- GitHub Actions
- Docker image scanning
- Bandit SAST
- Docker hardening

The `study/` directory contains technical study notes and validated learning material produced during the development of the project.

## Related Project

This project builds on the Linux and DevSecOps foundations developed in:

[DevSecOps Linux Lab](https://github.com/JuvenalMunozR/devsecops-linux-lab)

The Linux lab provides the foundation for the environment, tools, security practices, and operational knowledge used by this repository.