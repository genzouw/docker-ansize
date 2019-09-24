# Docker Ansize

## Description

Convert image to text(ascii art).

![](https://docs.google.com/uc?id=1NACdNccAXZjxpq0xP95EDWIhLF89n65w)

## Requirements

* [Docker](https://www.docker.com)

## Installation

**Unnecessary**

## Usage

```bash
# Print
$ cat any-image.jpg | docker run -i --rm genzouw/ansize

# Save to file
$ cat any-image.jpg | docker run -i --rm genzouw/ansize > ansize.txt

$ cat ansize.txt
```

**It is recommended to set "alias".**

```bash
$ echo "alias ansize='docker run -i --rm genzouw/ansize'" >> ~/.bashrc

$ cat any-image.jpg | ansize
```

## Relase Note

| date       | version | note           |
| ---        | ---     | ---            |
| 2019-09-24 | 1.0.0   | first release. |


## License

This software is released under the MIT License, see LICENSE.


## Contribution


## Author Information

[genzouw](https://genzouw.com)

* Twitter   : @genzouw ( https://twitter.com/genzouw )
* Facebook  : genzouw ( https://www.facebook.com/genzouw )
* LinkedIn  : genzouw ( https://www.linkedin.com/in/genzouw/ )
* Gmail     : genzouw@gmail.com
