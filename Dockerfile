From node:18.2.0 as builder
COPY dockerexample /dockerexample

WORKDIR /dockerexample

RUN npm install 
RUN $(npm bin)/ng build


FROM nginx 

COPY --from=builder /dockerexample/dist/* /usr/share/nginx/html/

EXPOSE 80