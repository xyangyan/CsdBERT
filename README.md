# CsdBERT
Codes for "A Contrastive Self-distillation BERT with Kernel Alignment-Based Inference", published in ICCS 2023.

## Requirements

We recommend using Anaconda for setting up the environment of experiments:

```bash
conda create -n csdbert python=3.8.8
conda activate csdbert
conda install pytorch==1.8.1 cudatoolkit=11.1 -c pytorch -c conda-forge
pip install -r requirements.txt
```

## Downstream task datasets

The GLUE task datasets can be downloaded from the [**GLUE leaderboard**](https://gluebenchmark.com/tasks).

The ELUE task datasets can be downloaded from the [**ELUE leaderboard**](http://eluebenchmark.fastnlp.top/#/landing).

**Please see our paper for more details!**

## Contact

If you have any problems, raise an issue or contact [Yangyan Xu](mailto:2071156850@qq.com).

## Citation

If you find this repo helpful, we'd appreciate it a lot if you can cite the corresponding paper:

```
@inproceedings{xu2023contrastive,
  title={A Contrastive Self-distillation BERT with Kernel Alignment-Based Inference},
  author={Xu, Yangyan and Yuan, Fangfang and Cao, Cong and Su, Majing and Lu, Yuhai and Liu, Yanbing},
  booktitle={International Conference on Computational Science},
  pages={553--565},
  year={2023},
  organization={Springer}
}
```
