FROM jenkins/jnlp-slave

ENV CONDA_HOME="/opt/miniconda" \
    PATH="/opt/miniconda/bin:$PATH"

USER root
RUN wget -q https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda*.sh -b -p $CONDA_HOME && \
    rm Miniconda*.sh

RUN conda update -y conda && \
    pip install --no-cache-dir virtualenv && \
    conda install -c conda-forge pylint-django && \
    conda clean --all -y

USER jenkins
