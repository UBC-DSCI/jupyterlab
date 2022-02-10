FROM continuumio/miniconda3

# Install Jupyter, JupterLab, R & the IRkernel
RUN conda install --yes --quiet --channel conda-forge \
    jupyter \
    jupyterlab \
    r-base=4.1.1 \
    r-irkernel

# Install JupyterLab Git Extension
RUN pip install jupyterlab-git

# Create working directory for mounting volumes
RUN mkdir -p /opt/notebooks

# Make port 8888 available for JupyterLab
EXPOSE 8888

# Install Git, the nano-tiny text editor and less (needed for R help)
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    git \
    nano-tiny \
    less

# Copy JupyterLab start-up script into container
COPY start-notebook.sh /usr/local/bin/

# Change permission of startup script and execute it
RUN chmod +x /usr/local/bin/start-notebook.sh
ENTRYPOINT ["/usr/local/bin/start-notebook.sh"]

# Switch to staring in directory where volumes will be mounted
WORKDIR "/opt/notebooks"
