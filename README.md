# Emacs config
### Configuration
In a **FIRST** run you should build and install irony server:
```sh
M-x: irony-install-server
```
For cmake project you should run (For support local includes):

```sh
$ cd <project_root>
$ mkdir build && cd build
$ cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
$ cp compile_commands.json ../compile_commands.json
```
For customize puild command for project you should to create in project root forlder **.dir-locals.el** file. And write down to this file the command for compilation. For example:
```lisp
((nil . ((projectile-project-compilation-cmd . "rm -fR build bin && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && cd .. && make -C build -j8"))))
```
