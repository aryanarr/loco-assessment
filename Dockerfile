FROM python:3.9 AS stage-1

WORKDIR /app

COPY flask/ .

RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.9-slim

WORKDIR /app

COPY --from=stage-1 /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/

COPY --from=stage-1 /app /app

EXPOSE 80

ENTRYPOINT ["python", "app.py"]
