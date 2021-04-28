# Arch Linux MX Keyring

Repository for the Arch Linux MX keyring package.

## Addition/Removal/Update of a packaging key

1. Add your keyid as a pull-request to this repository to the packager-keyids file
    Add the keyid to `packager-keyids` file, following this
       format: full size keyid, a tab, nickname.

## Keyring release

1. bump the version in the Makefile
2. Run update-keys
4. git add the new .asc file in the packager directory.
4. Commit everything as 'Update keyring'
5. Create a new tag ```git tag -s $(date +"%Y%m%d")```
6. Push changes
7. Upload the source tarball with ```make dist upload```
8. Update the package
