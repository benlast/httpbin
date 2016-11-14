FROM mobify/python:3.5

ENV GUNICORN_WORKERS=16

ADD . /httpbin

RUN pip install gunicorn && \
    pip install /httpbin

EXPOSE 8080

CMD gunicorn -w "$GUNICORN_WORKERS" -b 0.0.0.0:8080 httpbin:app
