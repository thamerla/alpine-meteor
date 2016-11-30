# Alpine meteor

Utilizes [Alpine Linux](https://alpinelinux.org/) to provide a [Docker](https://www.docker.com/) image just tiny enough to run a Meteor-based application.

## Tags

`:latest`

`:1.4.3`

Tag is just a Meteor version that the image was prepared for. If your application was bundled using the same version, you may be sure that the build will go smoothly. Otherwise, compatibility issues may occur.

## What's included?

This is an ultra minimal image. Only packages essential to build a Meteor application image are added. Bash is not included (only POSIX-compatible shell is installed). PhantomJS or other packages (and their install scripts) that you may find useful are not included either.

## Usage

**Note**: Due to Docker's limitations, only one way of building is supported. However, you may use either a tarball or a directory. Just make sure it's put inside the `.build` folder. Bear in mind that a directory has a higer priority.

For a use case, see [this repository](https://github.com/nonyy/siteace).

### Recommended build steps:

- Ensure that the application bundle is inside `.build` directory. The following command may be used to generate the bundle:

  `meteor build --directory --server-only --architecture os.linux.x86_64 .build`

- Create a Dockerfile with the following text inside:

  `FROM nonyy/alpine-meteor`

- **(Optional)** If the build is done inside the source code directory, it's recommended to add the following `.dockerignore` to speed up the process, ignoring all the files except the bundle:

  ```
  *
  !.build
  ```

- Build using the following command:

  `docker build -t NAME .`

  where NAME is the image name you want to use
- Test using the following commands:

  ```
  docker run -d --name mongo mvertes/alpine-mongo:3.2.10-3
  docker run -d --link mongo:db --name meteor -p 3000:80 NAME
  ```

  where NAME is the image name you want to use.  You may use the official mongo image or any other implementation you find useful.

  **Note**: As different Meteor versions may support different mongo versions - please make sure the correct one is used... or that the correct README is read. Run options may be overwritten using the -e parameter to the run command.

## Acknowledgements

Heavily influenced by [Martin Bucko's alpine-meteor image](https://github.com/Treecom/alpine-meteor). Thanks for the inspiration!
