# DeepLoop Issues overview

---

## DeepLoop lack of versions

```txt {all|8} title=requirements.txt
# base requirements
numpy
scipy
pandas
tqdm
matplotlib
opencv-python
tensorflow==2.3.1

# visualization requirements
cooler
jupyter
# if planning to use HiGlass please refer to  the Python and Jupyter docs (https://docs.higlass.io/jupyter.html)
higlass-python
```

- They don't have to be locked down but a "lock" file of some sorts is important for reproduction.

---

# The clues

- Trained Models and reference files
- Test data
- Example Test Run
- Notebook for Training new models
- Example for using with Cooler
- Need to install HiCoor

---

# Trained Models and reference files

```
DeepLoop_models/
DeepLoop_models/H9_trained/
DeepLoop_models/H9_trained/LoopDenoise.json
DeepLoop_models/H9_trained/LoopDenoise.h5
DeepLoop_models/H9_trained/100M.json
DeepLoop_models/H9_trained/100M.h5
DeepLoop_models/CPGZ_trained/
DeepLoop_models/CPGZ_trained/LoopDenoise.json
DeepLoop_models/CPGZ_trained/LoopDenoise.h5
DeepLoop_models/CPGZ_trained/80k.json
DeepLoop_models/CPGZ_trained/80k.h5
...
DeepLoop_models/ref/hg19_DPNII_anchor_bed/chr9.bed
DeepLoop_models/ref/hg19_DPNII_anchor_bed/chrX.bed
DeepLoop_models/ref/hg19_DPNII_anchor_bed/chrY.bed
DeepLoop_models/ref/hg19_HindIII_anchor_bed/
DeepLoop_models/ref/hg19_HindIII_anchor_bed/chr10.bed
DeepLoop_models/ref/hg19_HindIII_anchor_bed/chr11.bed
...
```

- They're well organized!

---

```yml
src: ./hugging-face.md
```

---

## Run instructions

```bash
HiCorr_path=<Path to HiCorr_output>
DeepLoop_outPath=
chr=chr11
python3 DeepLoop/prediction/predict_chromosome.py --full_matrix_dir $HiCorr_path/ \
                                              --input_name anchor_2_anchor.loop.$chr.p_val \
                                              --h5_file DeepLoop/DeepLoop_models/CPGZ_trained/LoopDenoise.h5 \
                                              --out_dir $DeepLoop_outPath/ \
                                              --anchor_dir DeepLoop/DeepLoop_models/ref/hg19_HindIII_anchor_bed/ \
                                              --chromosome $chr \
                                              --small_matrix_size 128 \
                                              --step_size 128 \
                                              --dummy 5 \
                                              --val_cols obs exp pval
```

---

## DeepLoop require HiCorr, please install HiCorr first

```bash
git clone https://github.com/shanshan950/HiCorr.git
cd HiCorr/
chmod 755 HiCorr
chmod -R 755 bin/*
```

---

## 👇 HiCorr on HindIII enzyme Hi-C

Download the code from this repository, "bin/HindIII/"
Download the reference files for HindIII (mm10/hg19 genome build)

```bash
wget http://hiview.case.edu/ssz20/tmp.HiCorr.ref/HindIII_HiCorr_ref.tar.gz
tar -xvf HindIII_HiCorr_ref.tar.gz
```

Check the preprocessing for micor-C data (mapping, fragments filter, outs are cis and trans 500bp fragment loops)
Run HiCorr on HindIII Hi-C data:

```bash
bash HiCorr_HindIII.sh HindIII_HiCorr_ref/ bin/HindIII/ <frag_loop.name.cis> <frag_loop.name.trans> <outputname> <hg19/mm10>
   # specify the path of downloaded unzipped reference file and scripts
   # input two fragment loop files genrated from preprocessing step
   # specifiy outputname prefix
   # specify genome build, the provided reference only include hg19 and mm10
```
