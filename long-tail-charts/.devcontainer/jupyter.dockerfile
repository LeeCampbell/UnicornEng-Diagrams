FROM quay.io/jupyter/minimal-notebook:python-3.12.9

COPY --chown=${NB_UID}:${NB_GID} ./jupyter.requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir --requirement /tmp/requirements.txt && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"