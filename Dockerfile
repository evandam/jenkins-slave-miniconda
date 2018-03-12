FROM jenkins/jnlp-slave

ENV CONDA_HOME="/opt/miniconda" \
    PATH="/opt/miniconda/bin:$PATH"

USER root
RUN wget -q -O miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash miniconda.sh -b -p $CONDA_HOME && \
    conda update -y conda && \
    conda clean --all -y && \
    chmod -R 777 $CONDA_HOME && \
    rm miniconda.sh
    
USER jenkins
