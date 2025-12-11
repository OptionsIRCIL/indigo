<table role="presentation" border="0" cellspacing="0" width="100%">
    <tr>
        <td>
            <img width=128 height=128 src="graphics/logo/display.svg" alt="Options Indigo logo"/>
        </td>
        <td>
            <h1>Indigo Community Navigation Software</h1>
            <p><i>Daisy Codenys, Jack Parrish, Angelina Toste (Frontend Developers)</i></p>
            <p><i>Joseph Melancon,  Cade Wasti (Backend Developers)</i></p>
            <p><i>Kyle Holter Vogel (Project Manager, Options IRCIL Employee)</i></p>
            <p><i>University of North Dakota, Fall 2025 to Spring 2026</i></p>
            <p><i>Additional Contributors included in THANKS.md</i></p>
        </td>
    </tr>
</table>
<hr/>

Indigo is a server application which provides reliable and secure access to a centralized consumer database.

Indigo is primarily designed for use on an on-premises server, only accessible within a local network.

## Installation

The preferred environment to serve Indigo is within a virtual machine running Debian Linux.

### Production

TODO: Write instructions on production deployment.

### Testing

Within your testing environment, install the GitHub Runner.

TODO: Add instructions on installing the GitHub Runner.

## For Developers

### Dependencies

- [Docker](https://www.docker.com/) or [Podman](https://podman.io/)
- [Git](https://git-scm.com/)
- [GitHub CLI](https://cli.github.com/)

An working internet connection is also required to install additional dependencies from the following online services.

- [Alpine Linux Repositories](https://pkgs.alpinelinux.org/packages)
- [GitHub](https://github.com/)
- [GitHub Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)
- [npm](https://www.npmjs.com/)

### Contributing

Indigo is not open to contributions at this time.

If that were to change, the way to contribute is as follows.

```sh
git clone --recurse-submodules https://github.com/OptionsIRCIL/indigo
cd indigo
git log
```

### Running Nightly Builds

```sh
gh auth login
gh run download
docker load < image.tar.gz
docker run OptionsIRCIL/indigo
```
