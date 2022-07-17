FROM python:3.8-bullseye
ENV HOME=/opt/orca
RUN mkdir -p $HOME
RUN apt-get update
RUN apt-get install -y pip && pip install --upgrade pip
RUN pip install pipenv
COPY candie/src/* $HOME/
RUN cd $HOME && touch app.db && pipenv install
RUN useradd -d $HOME -s /bin/bash orca
RUN chown -R orca $HOME
WORKDIR $HOME
USER orca
CMD  ["./run_app.sh"]