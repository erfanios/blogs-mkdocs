# Docker Disk Usage – How to Find Out What’s Taking Space

If your Docker data directory is taking up unexpected space (e.g. 1.7 TB), here’s how you can quickly check what's using it.

---

## 🔍 1. Show Docker Image Sizes

List all Docker images with their size:

```bash
docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"
```

---

## 📊 2. Summary of Space Usage

Get a high-level overview of space used by:

- Images
- Containers
- Volumes
- Build cache

```bash
docker system df
```

---

## 🧱 3. Check Disk Usage in Overlay2 (or similar)

If Docker uses `overlay2` (default), check which directories use most space:

```bash
du -h --max-depth=1 /mnt/toshiba_drive/docker-data/overlay2 | sort -hr | head -n 20
```

> Replace `/mnt/toshiba_drive/docker-data` with your actual Docker data root if different.

---

## 🧹 4. Clean Up Unused Data

To safely clean up all unused containers, images, volumes, and caches:

```bash
docker system prune -a --volumes
```

> ⚠️ WARNING: This will delete all unused resources. Useful for reclaiming space.

---

## 🔍 5. Preview Before Cleanup

To see details before removing anything:

```bash
docker system df -v
```

This will show which images, containers, and volumes are taking space and whether they’re in use.

---

## ✅ Tip

After cleanup, run `docker system df` again to compare space usage before/after.

