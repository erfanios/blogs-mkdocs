# MacBook Pro (Late 2013) Thermal & Performance Optimization Guide

**Hardware:** MacBook Pro 15-inch (Late 2013, `MacBookPro11,3` - Dual Graphics)  
**OS:** macOS Sonoma via OpenCore Legacy Patcher (OCLP 2.4.1)  
**Goal:** Prevent CPU thermal spikes during script/compilation execution (`make`, shell scripts) by disabling Turbo Boost and unlocking direct NVRAM modifications.

---

## 1. Problem Statement
Executing multi-threaded tasks like `make` or heavy terminal scripts causes Intel Haswell CPUs to immediately boost to maximum Turbo Frequencies (3.3+ GHz), leading to severe thermal throttling, high fan noise, and rapid battery drain. 

Directly setting `boot-args` via Terminal previously threw an error:
```text
Error setting variable - 'boot-args': (iokit/common) not permitted.
```
This occurs because OpenCore's default System Integrity Protection (SIP) configuration protects NVRAM variables from being modified within macOS.

---

## 2. Step 1: Unlock NVRAM Write Access in OCLP

1. Launch the **OpenCore Legacy Patcher** application.
2. Click on **Settings** (bottom right/center).
3. Switch to the **Security** tab.
4. Under **System Integrity Protection**, enable the check box:
   - `[x] ALLOW_UNRESTRICTED_NVRAM`
5. Click **Return** to go back to the main menu.
6. Click **Build and Install OpenCore**.
7. Click **Install to disk**, select your internal SSD (e.g., `Samsung SSD 990 EVO Plus`), and choose the `EFI` partition.
8. **Reboot the Mac** for the updated EFI configuration to take effect.

---

## 3. Step 2: Apply Boot Arguments via Terminal

After rebooting, open **Terminal** (`/Applications/Utilities/Terminal.app`) and run one of the following commands:

### Option A: Disable CPU Turbo Boost Only (Recommended)
Keeps both Intel Iris Pro and NVIDIA GeForce GT 750M functional, but caps CPU at base clock (2.3 GHz):
```bash
sudo nvram boot-args="msr_disable_turbo=1"
```

### Option B: Disable CPU Turbo Boost AND Disable NVIDIA dGPU
Forces the system to run purely on Intel Iris Pro for maximum battery life and lowest heat:
```bash
sudo nvram boot-args="msr_disable_turbo=1 -wegnoegpu"
```

---

## 4. Parameter Reference

| Flag | Description |
| :--- | :--- |
| `msr_disable_turbo=1` | Disables Intel Turbo Boost globally at boot level. Reduces thermal load and fan noise during high CPU workloads. |
| `-wegnoegpu` | Instructs WhateverGreen to disable the discrete NVIDIA GPU (`GT 750M`), running the system on Intel Iris Pro only. |

---

## 5. How to Revert

To restore default macOS power and GPU management settings:

1. **Via Terminal:**
   ```bash
   sudo nvram -d boot-args
   ```
   *(Then restart your Mac).*

2. **Via Hardware NVRAM Reset:**
   - Turn off the Mac.
   - Power on and immediately hold `Command (⌘) + Option (Alt) + P + R` for ~20 seconds until you hear the chime a second time.
