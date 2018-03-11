FROM jenkins/jnlp-slave

ENV PATH="$HOME/miniconda/bin:$PATH"

RUN wget -q https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda*.sh -b -p $HOME/miniconda && \
    rm Miniconda*.sh

RUN conda update -y conda && \
    pip install --no-cache-dir virtualenv && \
    conda clean --all -y
