FROM ubuntu:latest
MAINTAINER Minh Nhut "nmnhut.work@gmail.com"

# Cập nhật và cài đặt các phụ thuộc cần thiết
RUN apt update -y && \
    apt install -y python3-pip python3-dev build-essential python3-venv

# Tạo môi trường ảo
RUN python3 -m venv /flask_app/venv

# Sao chép mã nguồn vào container
ADD . /flask_app

# Thiết lập thư mục làm việc
WORKDIR /flask_app

# Cài đặt các phụ thuộc từ requirements.txt
RUN /flask_app/venv/bin/pip install -r requirements.txt

# Thiết lập lệnh khởi động cho ứng dụng
ENTRYPOINT ["/flask_app/venv/bin/python"]
CMD ["flask_docker.py"]
