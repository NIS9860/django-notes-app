FROM python:3.9

WORKDIR /d1/d11

COPY requirements.txt /d1/d11

RUN pip install -r requirements.txt

COPY . /d1/d11

RUN chmod +x /d1/d11/entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/d1/d11/entrypoint.sh"]
