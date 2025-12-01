#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

# Run Django migrations
echo "Running migrations..."
python manage.py migrate

# Start Gunicorn
echo "Starting Gunicorn..."
exec gunicorn course_service.wsgi:application --bind 0.0.0.0:$PORT
