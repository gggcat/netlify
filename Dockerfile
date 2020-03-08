FROM zzzcat/dispshell:node12

WORKDIR /netlify-work

RUN npm -g config set optional false && \
    npm config ls && \
    npm install -g netlify-cli

COPY netlify.sh .
CMD ["bash", "netlify.sh"]
