# pdf-tools

Runs in Docker so you don't have to worry about all the dependencies:

- ImageMagick
- Ghostscript
- Ghostscript-Fonts
- PDFTk

## Usage
docker-compose.yml
```
  pdf_shrink:
    image: ykorzikowski/shrink-pdf
    restart: on-failure
    volumes:
    - ~/pdf_in:/pdf
    - ~/pdf_out:/out

```
