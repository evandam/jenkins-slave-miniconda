FROM jenkins/jnlp-slave

ENV CONDA_HOME="/opt/miniconda" \
    PATH="/opt/miniconda/bin:$PATH"

USER root
RUN wget -q https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    bash miniconda.sh -b -p $CONDA_HOME && \
    rm miniconda.sh

RUN conda update -y conda && \
    pip install --no-cache-dir virtualenv && \
    conda install -c conda-forge pylint-django && \
    chmod -R 777 $CONDA_HOME && \
    conda clean --all -y

USER jenkins
