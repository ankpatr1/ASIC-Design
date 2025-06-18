🚦 Traffic Light FSM – Simulation & Waveform Viewing

This project implements a Verilog based finite state machine (FSM) to control a 4-way traffic light system. Simulation is done using i verilog, and waveform visualization is handled via GTKWave in Docker.

✅ Prerequisites
--------------------------------
XQuartz – X11 server for macOS
Homebrew – macOS package manager
Docker Desktop – for running GTKWave in a container

1. Install Homebrew (if not installed)
   
  " /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

2. Install XQuartz
   brew install --cask xquartz

3. Then start it
   open -a XQuartz

4. Once open, allow local network access:
   
   xhost + 127.0.0.1

5. Install Docker Desktop

Download & install from: https://www.docker.com/products/docker-desktop

Then start it:
open -a Docker

6. Pull GTKWave Docker Image

docker pull hdlc/gtkwave

7. Navigate to Your Project Folder

cd /Users/ankitapatra/Documents/program/my_proj/ASIC/traffic_light_fsm
ls
chmod +x run.sh
./run.sh
xhost + 127.0.0.1
docker run --rm \
  -e DISPLAY=host.docker.internal:0 \
  -v $PWD:/data \
  hdlc/gtkwave gtkwave /data/dump.vcd


 ✅ Output

- GTKWave window opens.
- You can drag & drop signals (clk, rst, ns_light, etc.) to the waveform panel to analyze the FSM operation.

## 📹 Screen Recording

> This project includes a screen recording (`.mov` file) showing the traffic light FSM in action.

Due to GitHub's file size limits, you must download it manually:

[➡️ Click here to download the screen recording](./Screen%20Recording%202025-06-17%20at%205.55.57%E2%80%AFpm.mov)





   
