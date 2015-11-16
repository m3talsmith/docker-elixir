FROM m3talsmith/esl-erlang:latest

MAINTAINER m3talsmith <m3talsmith@gmail.com>

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Download, build, test, and install elixir
RUN mkdir /dbuild
RUN git clone https://github.com/elixir-lang/elixir /dbuild/elixir
WORKDIR /dbuild/elixir
RUN git checkout v1.1.1
RUN make clean test install

# Clean up the build
WORKDIR /
RUN rm -rf /dbuild

CMD ["iex"]
