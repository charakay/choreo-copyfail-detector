# Use a lightweight Python base image
FROM python:3.11-slim

# Set the working directory
WORKDIR /scripts

# Copy the detector script into the container
COPY detect_copyfail.py .

# Create a standard, unprivileged user. 
# This is critical to simulate an actual attacker's starting point.
# Create a standard, unprivileged user with a specific UID in the 10000-20000 range.
RUN useradd -ms /bin/bash -u 10001 choreouser

# Use numeric UID — required by CKV_CHOREO_1
USER 10001

# Execute the script when the container runs
ENTRYPOINT ["python3", "/scripts/cve_2026_31431_detector.py"]
