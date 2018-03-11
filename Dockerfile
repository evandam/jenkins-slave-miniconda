FROM jenkins/jnlp-slave

ENV PATH="$HOME/miniconda/bin:$PATH"

COPY Miniconda3-latest-Linux-x86_64.sh .
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda && \
    rm Miniconda3-latest-Linux-x86_64.sh

RUN conda update -y conda && \
    conda clean --all -y
