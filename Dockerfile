FROM timbru31/ruby-node

WORKDIR /app

COPY Gemfile Gemfile.lock ./
COPY package.json yarn.lock ./

COPY . ./

RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
    libpq-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN bundle install
RUN yarn install
RUN SECRET_KEY_BASE=dummy OLD_AWS_SECRET_ACCESS_KEY=dummy OLD_AWS_ACCESS_KEY_ID=dummy  RAILS_ENV=production NODE_ENV=production rails assets:precompile

ENV RAILS_ENV=production 
ENV NODE_ENV=production

COPY run-all.sh /usr/bin/
RUN chmod +x /usr/bin/run-all.sh
ENTRYPOINT ["run-all.sh"]
EXPOSE 3000

RUN rails test


CMD ["rails", "s", "-b", "0.0.0.0"]