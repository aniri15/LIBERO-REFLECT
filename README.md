# LIBERO-REFLECT

Standalone benchmark bundle for MAE self-evaluation: **standard LIBERO** plus **reflect (swap) perturbations**.

This repository is consumed by [MAE Self-Evaluation Framework for VLA](https://github.com/) via a symlink at `third_party/LIBERO-REFLECT`.

## Layout

```
LIBERO-REFLECT/
├── standard/          # upstream-style LIBERO (spatial/object/goal/10)
├── reflect/           # swap + other OOD perturbations
│   ├── libero/
│   ├── libero_ood/
│   ├── perturbation.py
│   ├── generated_configs/
│   └── evaluation_config_swap.yaml
├── model_configs/     # eval YAML copies used by OpenVLA / OpenVLA-OFT launchers
└── libero_env.sh
```

## Benchmark modes (MAE framework)

| Mode | Directory | Description |
|------|-----------|-------------|
| `libero` | `standard/` | Standard LIBERO suites |
| `libero_reflect` | `reflect/` | Swap / OOD perturbations |

## Install with MAE framework

```bash
git clone <LIBERO-REFLECT_REPO_URL> ../LIBERO-REFLECT
cd MAE_Self_Evaluation_Framework_for_VLA
bash third_party/setup_libero_reflect.sh
```

If cloned elsewhere, set `LIBERO_REFLECT_ROOT=/path/to/LIBERO-REFLECT` before running the setup script.

## Config paths

- Files under `reflect/` use paths relative to `reflect/` (e.g. `libero/libero/bddl_files`).
- Files under `model_configs/` use MAE-framework paths from model dirs (e.g. `../third_party/LIBERO-REFLECT/reflect/...` when `cd openvla`).
