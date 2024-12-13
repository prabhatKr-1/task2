# sysopctl

`sysopctl` is a custom Linux command-line utility designed for managing system resources and tasks efficiently. This repository contains the `sysopctl` script and its accompanying manual.

## Features
- Service management (list, start, stop services)
- Display system load
- Check disk usage
- Monitor real-time process activity
- Analyze logs
- Backup files from a specified path

## Installation

1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/yourusername/sysopctl.git
   ```

2. Navigate to the directory:
   ```bash
   cd sysopctl
   ```

3. Grant execute permissions to the `sysopctl` script:
   ```bash
   chmod +x sysopctl
   ```

4. Move the script to a directory in your `PATH` for global access:
   ```bash
   sudo mv sysopctl /usr/local/bin/
   ```

5. Install the manual file :
   ```bash
   sudo cp sysopctl.8 /usr/share/man/man8/
   sudo mandb
   ```
## Implementing sysopctl in local system along with its manual
![Implementing sysopctl](screenshots/s1.png)

Implementing Manual 
![Manual](screenshots/man2.png)

Viewing manual 
![Viewing manual](screenshots/man3.png)

## Usage with screenshots
Run the `sysopctl` command with the desired options and commands:

### Display Version
```bash
sysopctl --version
```
![Version](screenshots/s1.png)

### Display Help
```bash
sysopctl --help
```
![Help command](screenshots/s2.png)

### Part 1:
- List running services:
  ```bash
  sysopctl service list
  ```
  ![Service List](screenshots/s3.png)
  
- System Load
```bash
sysopctl system load
```
![Help command](screenshots/s4.png)
### Part 2:
- Start a service:
  ```bash
  sysopctl service start <service-name>
  ```
- Stop a service:
  ```bash
  sysopctl service stop <service-name>
  ```
  ![Services](screenshots/s5.png)

- Disk Usage
```bash
sysopctl disk usage
```
![Disk Usage](screenshots/disk%20usage.png)

### Part 3
- Monitor System Processes
```bash
sysopctl process monitor
```
![Process monitoring 1](screenshots/s61.png)
![Process monitoring 2](screenshots/s62.png)
- Analyze System Logs
```bash
sysopctl logs analyze
```
![System logs](screenshots/s7.png)

- Backup Files
```bash
sysopctl backup <path-to-backup>
```
![Backup](screenshots/s8.png)


---------------------------------------------------------!! THANK YOU !!----------------------------------------------------------
