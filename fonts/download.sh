#!/usr/bin/env sh

kaigen_fonts="KaiGenGothicJP-Bold-Italic.ttf
KaiGenGothicJP-Bold.ttf
KaiGenGothicJP-Regular-Italic.ttf
KaiGenGothicJP-Regular.ttf
RobotoMono-Bold.ttf
RobotoMono-BoldItalic.ttf
RobotoMono-Italic.ttf
RobotoMono-Regular.ttf"

kaigen_url=https://github.com/chloerei/asciidoctor-pdf-cjk-kai_gen_gothic/releases/download/v0.1.0-fonts/

for font in $kaigen_fonts
do
  curl -LO "$kaigen_url$font"
done

noto_url=https://github.com/asciidoctor/asciidoctor-pdf/raw/v1.6.1/data/fonts/notoemoji-subset.ttf
curl -LO "$noto_url"
