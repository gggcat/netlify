FROM zzzcat/dispshell:node12

WORKDIR /netlify-work

RUN npm -g config set optional false && \
    npm config ls && \
    npm install -g netlify-cli && \
    echo "*** INSTALLED: netlify-cli ***"

COPY entrypoint.sh .
ENTRYPOINT ["bash", "entrypoint.sh"]
CMD ["site"]