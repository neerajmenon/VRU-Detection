# Use the official Ubuntu 20.04 image as the base image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

# Install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    software-properties-common \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    python3.9 \
    python3.9-dev \
    python3-pip \
    python3.9-distutils \
    build-essential \
    libopencv-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libv4l-dev \
    libxvidcore-dev \
    libx264-dev \
    libgtk-3-dev \
    libatlas-base-dev \
    gfortran \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set Python 3.9 as the default Python version
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1

# Upgrade pip
RUN python3.9 -m pip install --upgrade pip

# Install numpy first
RUN python3.9 -m pip install numpy

# Install required Python packages
RUN python3.9 -m pip install \
    certifi==2023.7.22 \
    charset-normalizer==3.2.0 \
    contourpy==1.1.1 \
    cvzone==1.5.6 \
    cycler==0.11.0 \
    filelock==3.12.4 \
    filterpy==1.4.5 \
    fonttools==4.42.1 \
    idna==3.4 \
    imageio==2.31.4 \
    Jinja2==3.1.2 \
    kiwisolver==1.4.5 \
    lazy_loader==0.3 \
    MarkupSafe==2.1.3 \
    matplotlib==3.8.0 \
    mpmath==1.3.0 \
    networkx==3.1 \
    opencv-python==4.8.0.76 \
    packaging==23.1 \
    pandas==2.1.1 \
    Pillow==10.0.1 \
    psutil==5.9.5 \
    py-cpuinfo==9.0.0 \
    pyparsing==3.1.1 \
    python-dateutil==2.8.2 \
    pytz==2023.3.post1 \
    PyWavelets==1.4.1 \
    PyYAML==6.0.1 \
    requests==2.31.0 \
    scikit-image==0.21.0 \
    scipy==1.11.3 \
    seaborn==0.12.2 \
    six==1.16.0 \
    sympy==1.12 \
    tifffile==2023.9.26 \
    torch==2.0.1 \
    torchvision==0.15.2 \
    tqdm==4.66.1 \
    typing_extensions==4.8.0 \
    tzdata==2023.3 \
    ultralytics==8.0.188 \
    urllib3==2.0.5

# Copy the main.py script into the container
COPY main.py /app/main.py

# Set the working directory
WORKDIR /app

# Command to run your application
CMD ["python3.9", "main.py"]