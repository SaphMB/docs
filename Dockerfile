FROM python
RUN apt-get update
RUN apt-get install -y graphviz
RUN pip install mkdocs-material
RUN pip install mkdocs-render-swagger-plugin
RUN pip install mkdocs-i18n
ADD ./ /src/
WORKDIR /src
RUN cd docs; for dot in *.dot; do dot -Kdot -Tpng <$dot >$(echo $dot|sed 's/\.dot/.\png/'); done
EXPOSE 8000
CMD mkdocs serve -a 0.0.0.0:8000
