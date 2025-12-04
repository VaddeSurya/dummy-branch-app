FROM python:3.10-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose port
EXPOSE 8000

# Run the app (you may need to adjust this if main file is different)
CMD ["gunicorn", "-b", "0.0.0.0:8000", "wsgi:app"]
