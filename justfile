install:
    pnpm install

slidev SLIDE: install
    pnpm -F {{SLIDE}} run dev

format SLIDE: install
    pnpm -F {{SLIDE}} run format

new SLIDE:
    cp -r slides/template/ slides/{{SLIDE}}

build: install
    mkdir -p dist
    # ls | while read line ; do pnpm -F "$line" run build --base "/$line" -o "../../dist/$line" ; done
    pnpm -r run build
