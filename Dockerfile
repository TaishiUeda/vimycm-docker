ARG BASE_IMG=ubuntu:18.04
FROM ${BASE_IMG} AS vim_added
ARG USER_NAME=vimycm
# avoid to be asked time zone.
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN sudo apt update && sudo apt install -y tzdata

#install vim
USER ${USER_NAME}
WORKDIR /home/${USER_NAME}
RUN mkdir vim_resources
WORKDIR /home/${USER_NAME}/vim_resources
COPY --chown=${USER_NAME}:developer install_vim.bash ./install_vim.bash
RUN bash install_vim.bash
ENV TERM=xterm-256color

#install vim's plugins
FROM vim_added AS plugin_installed
ARG USER_NAME=vimycm
ENV DEBIAN_FRONTEND=noninteractive
COPY --chown=${USER_NAME}:developer install_plugins.bash ./install_plugins.bash
COPY --chown=${USER_NAME}:developer .vimrc ./.vimrc
RUN bash install_plugins.bash
#install cmake
COPY --chown=${USER_NAME}:developer install_cmake.bash ./install_cmake.bash
RUN bash install_cmake.bash
#install ycm
COPY --chown=${USER_NAME}:developer install_ycm.bash ./install_ycm.bash
RUN bash install_ycm.bash

#install rtag service
FROM plugin_installed AS rtag_installed
ARG USER_NAME=vimycm
ENV DEBIAN_FRONTEND=noninteractive
COPY --chown=${USER_NAME}:developer install_rtags.bash ./install_rtags.bash
RUN bash install_rtags.bash

WORKDIR /home/${USER_NAME}
RUN rm -r vim_resources

