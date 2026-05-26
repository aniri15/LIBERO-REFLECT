#!/usr/bin/env bash
# Environment setup inside LIBERO-REFLECT (also sourced from MAE third_party/libero_env.sh).
set -euo pipefail

LIBERO_REFLECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

_libero_reflect_write_config() {
  local config_dir="$1"
  local pkg_root="$2"
  mkdir -p "${config_dir}"
  cat > "${config_dir}/config.yaml" <<EOF
benchmark_root: ${pkg_root}
bddl_files: ${pkg_root}/bddl_files
init_states: ${pkg_root}/init_files
datasets: ${pkg_root}/../datasets
assets: ${pkg_root}/assets
EOF
}

setup_libero_reflect_env() {
  local benchmark="${1:-libero}"
  local standard_home="${LIBERO_REFLECT_ROOT}/standard"
  local reflect_home="${LIBERO_REFLECT_ROOT}/reflect"

  case "${benchmark}" in
    libero|libero_standard)
      export LIBERO_BENCHMARK="libero"
      export LIBERO_REFLECT_ROOT="${LIBERO_REFLECT_ROOT}"
      export LIBERO_PATH="${standard_home}"
      export LIBERO_HOME="${standard_home}"
      export LIBERO_CONFIG_PATH="${standard_home}/.libero_config"
      _libero_reflect_write_config "${LIBERO_CONFIG_PATH}" "${standard_home}/libero/libero"
      ;;
    libero_reflect|libero_pro)
      export LIBERO_BENCHMARK="libero_reflect"
      export LIBERO_REFLECT_ROOT="${LIBERO_REFLECT_ROOT}"
      export LIBERO_PATH="${reflect_home}"
      export LIBERO_HOME="${reflect_home}"
      export LIBERO_PRO_HOME="${reflect_home}"
      export LIBERO_CONFIG_PATH="${reflect_home}/libero_config"
      _libero_reflect_write_config "${LIBERO_CONFIG_PATH}" "${reflect_home}/libero/libero"
      export LIBERO_PRO_EVAL_CONFIG="${LIBERO_PRO_EVAL_CONFIG:-${reflect_home}/evaluation_config_swap.yaml}"
      ;;
    *)
      echo "setup_libero_reflect_env: unsupported benchmark '${benchmark}'" >&2
      return 1
      ;;
  esac
}
