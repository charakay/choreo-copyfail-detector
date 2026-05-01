# Use a lightweight Python base image
FROM python:3.11-slim

# Set the working directory
WORKDIR /scripts

# Fixed: use the actual filename from the repo
COPY cve_2026_31431_detector.py .

# Create a standard, unprivileged user with UID in 10000-20000 range
RUN useradd -ms /bin/bash -u 10001 choreouser

# Numeric UID required by CKV_CHOREO_1
USER 10001

# Execute the script when the container runs
ENTRYPOINT ["python3", "/scripts/cve_2026_31431_detector.py"]
