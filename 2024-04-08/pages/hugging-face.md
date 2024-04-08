```yml
layout: section
```

# Hugging Face Intro

---

# Hugging Face Intro

> Where all of the "Open" Models weights get uploaded

<v-clicks>

- _Models_, hosting the latest state-of-the-art models for NLP, vision, and audio tasks
- _Datasets_, featuring a wide variety of data for different domains and modalities..
- _Spaces_, interactive apps for demonstrating ML models directly in your browser.
- _Collections_, Groups of the above 3 types

</v-clicks>

---

```yml
layout: section
```

# Hugging Face Models

---

## Hugging Face Models

[Mistral-7B Example](https://huggingface.co/mistralai/Mistral-7B-Instruct-v0.2)

![DeepLoop Hugging Face Model](/DeepLoop-model.png)

---

```yml
layout: default
```

### Hugging Face Models

Using Models with Hugging Face Python Library

```python
from huggingface_hub import from_pretrained_keras

model = from_pretrained_keras("funlab/DeepLoop-H9-100M")
```

---

```yml
layout: section
```

# Hugging Face Datasets

---

```yml
layout: image
image: /HF-DataSet.png
backgroundSize: contain
```

---

```yml
layout: image
image: /deeploop-ds.png
backgroundSize: contain
```

---

### Hugging Face Datasets

How to download the rows directly with the API

```bash
curl -X GET \
     "https://datasets-server.huggingface.co/rows?dataset=sujet-ai%2FSujet-Finance-Instruct-177k&config=default&split=train&offset=0&length=100"
```

Using Datasets with Hugging Face Python Library

```python
from datasets import load_dataset

dataset = load_dataset("funlab/hg19_HindIII_anchor_bed")
```

---

```yml
layout: section
```

# Hugging Face Spaces

---

```yml
layout: iframe
url: https://cohereforai-c4ai-command-r-plus.hf.space
backgroundSize: contain
```

---

```yml
layout: iframe
url: https://funlab-deeploop.hf.space
```

# DeepLoop Space

---

# DeepLoop Space Code

- Uses Streamlit, Gradio, or Docker

```python
import streamlit as st
from predict_chromosome import predict_and_write


st.title("DeepLoop")
st.write("Looking for some example data?")
st.write("https://huggingface.co/datasets/funlab/HiCorr_test_data")
st.write("Use hg19, HindIII, chr11, CPGZ and LoopDenoise for the Demo data")

# ...
training_set = st.selectbox("Select Training Set", ["CPGZ", "H9"], index=0)
depth = st.selectbox("Select Depth", ["LoopDenoise", "50M", "101K"], index=0)
```

---

# DeepLoop Space Code

- Goal was to Demonstrate using the models

```python
# Load the model from hugging face
from huggingface_hub import from_pretrained_keras

model = from_pretrained_keras(f"funlab/DeepLoop-{training_set}-{depth}")
```

- Downloading the Datasets

```py
from huggingface_hub import snapshot_download

HiCorr_data = snapshot_download(HiCorr_data_hf_repo, repo_type="dataset")

anchors = snapshot_download(
    repo_id=f"funlab/{genome}_{digestion_enzyme}_anchor_bed", repo_type="dataset"
)
```

---

# DeepLoop Space Code

Using the actual function from DeepLoop

```py {all|1|6-19|all}
from predict_chromosome import predict_and_write

if st.button("Run Deeploop", type="primary"):
    denoised_anchor_to_anchor = None
    with st.spinner("Running the model"):
        denoised_anchor_to_anchor = predict_and_write(
            model,
            full_matrix_dir=HiCorr_data + f"/anchor_2_anchor.loop.{chromosome}",
            input_name=HiCorr_data + f"/anchor_2_anchor.loop.{chromosome}.p_val",
            outdir=prefix,
            anchor_dir=anchors,
            chromosome=chromosome,
            small_matrix_size=128,
            step_size=128,
            dummy=5,
            # max_dist,
            val_cols=["obs", "exp", "pval"],
            # keep_zeros,
        )

    st.success("Done!")
```

---

```yml
layout: iframe-right
url: https://funlab-deeploop.hf.space
```

## Using Spaces

### Embedding Spaces

```html
<iframe
  src="https://funlab-deeploop.hf.space"
  frameborder="0"
  width="850"
  height="450"
></iframe>
```

### Running as Docker images

```bash
docker run -it -p 7860:7860 \
	--platform=linux/amd64 \
	registry.hf.space/funlab-deeploop:latest \
	streamlit run app.py
```

---

```yml
layout: section
```

# Hugging Face Collections

---

```yml
layout: image
image: '/deeploop-collection.png'
backgroundSize: 80%
```

# DeepLoop Collection
