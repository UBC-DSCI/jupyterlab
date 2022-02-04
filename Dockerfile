FROM continuumio/miniconda3

RUN conda install -y --quiet \
    jupyter \
    jupyterlab
RUN mkdir -p /opt/notebooks

EXPOSE 8888

USER root

COPY start-notebook.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/start-notebook.sh
ENTRYPOINT ["/usr/local/bin/start-notebook.sh"]
