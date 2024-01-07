FROM python:3.8
WORKDIR /app

COPY . /app/

# Cài đặt các dependencies và gói build essentials
RUN apt-get update \
    && apt-get install -y build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Cập nhật pip
RUN pip install --upgrade pip

# Cài đặt requirements.txt
RUN pip install -r requirements.txt

# Mở cổng 3000
EXPOSE 3000

# Chạy ứng dụng Flask
CMD ["python", "./server.py"]
