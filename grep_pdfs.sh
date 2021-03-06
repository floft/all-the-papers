#!/bin/bash
#
# Use pdfgrep to search through all the PDFs to find those that relate to both
# GANs and something transfer learning related
#
dir='pdfs'
outdir='grep'

#
# GAN Terms
#  - generative adversarial net(s)
#  - generative adversarial network(s)
#  - GAN(s)
#
# TL-Related Terms
#  - transfer learning
#  - domain adaptation
#  - domain generalization
#  - multi(-)task learning
#  - multi(-)domain learning
#  - self(-)taught learning
#  - co(-)variate shift
#  - sample(-)selection bias
#  - life(-)long learning
#  - inductive transfer
#  - inductive bias
#
# Generative-Related Terms
#  - image generation / generation of images / image synthesis
#  - super(-)resolution
#  - image completion
#  - semantic segmentation
#  - style transfer (maybe a form of adaptation?)
#  - generation -- should indicate use for any generative thing (images, samples, ...)

# Only do the first three pages so we'll hopefully remove all the ones that are
# only from citations that may not actually be related to GANs or TL
mkdir -p "$outdir"
pdfgrep --cache -Z -P -r --page-range=1-3 --include="*.pdf" "([Gg]enerative [Aa]dversarial|GANs|\ GAN[\ ,\.-])" "$dir" > "$outdir"/gan.txt
pdfgrep --cache -Z -P -r -i --page-range=1-3 -o --include="*.pdf" "(transfer learning|domain adaptation|domain generalization|multi[-\ ]?task learning|multi[-\ ]?domain learning|self[-\ ]taught learning|co-?variate shift|sample[-\ ]selection bias|life[-\ ]long learning|inductive bias)" "$dir" > "$outdir"/tl.txt
pdfgrep --cache -Z -P -r -i --page-range=1-3 -o --include="*.pdf" "(image generation|generation of images|image synthesis|super[-\ ]resolution|image completion|semantic segmentation|style transfer|generation|synthesis)" "$dir" > "$outdir"/generative.txt
