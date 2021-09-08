# vmtk-build

Build VMTK via GitHub Actions

Build VTK, ITK and VMTK automatically on push. On release, add tar.gz
archives to the release.

## Ubuntu 20.04 (Focal)

To use you need to install a suitable python. APT packages are
`libpython3.8` or `libpython3.9`.

You also need to install OpenGL etc packages (libopengl0, libglx0,
libxt6).

So:

```
apt-get install libpython3.8 libopengl0 libglx0 libxt6
```



