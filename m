Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C01658043D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 20:59:44 +0200 (CEST)
Received: from localhost ([::1]:55800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG3Is-00040I-NL
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 14:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG3G7-0000qg-4i
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:56:51 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG3G4-0003XW-08
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:56:50 -0400
Received: by mail-pj1-x1033.google.com with SMTP id e1so768659pjl.1
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 11:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3QnBE6gU+PZeYzAJlNP8Gg3DB0B2F20MMpccXPMaPc0=;
 b=xwMHpTKOm4d09h/asw49YbnunH9xMLSZ4uJNuPkO01eHJj4jtoKeqDQicF8x3+yHkJ
 LoVOFchlgOXR186eCAegLrKwKTjlnmSl6yZqpoO5TRXSMiP896G8BPbyMhd7C6ggfo5x
 Np/bybRWI8xzZjMxtRMcLrncpfXX5s8GiaLk8QZq74LoovARxry4OYxW2cF+pQqjprS5
 JA5vK84aG5JZRiVXdttTPdWgXzu+wa4cMObsntdgaOHUE4lMKAgeQO7zMfT0cc6hrnpX
 oD9uW0WD0jZ9EpbB9vGgo7MMpRsU7XKxNA7R5f5APrrGBVgiYdYm+E5VUGfq0dPvmQfD
 Y6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3QnBE6gU+PZeYzAJlNP8Gg3DB0B2F20MMpccXPMaPc0=;
 b=7QAsqmFc1E+5XFJiiRwEL80rGtdCmEkeX1uQwqyDf0Ir5FNkofC4XiVq9JtalCQMMB
 jUAjfaaLhvREt+r73Y6pvn6IyrexhyFnd4je6wjHK+O2+dVYkneNK12Z25tWMLsOJCMR
 kH02ngBUQgomSBSmtdBRN8brBnbX6rN3tuL+DLdxlexRmEFMpXYepZh/VJjC3qibyV2m
 duvS0Chi6KjhCzR+07p2dIgOss7uG5dXBcQ0Kl5YLU3qBgXEH+mVKb3tjcI4jI1lP6VQ
 T5tj8dZdlwTWv+Zijjwo+iQln27Z8yyl5dg0JwbI8F8WEgAGtQYVAEzmEGYeQuyYrpMK
 w19g==
X-Gm-Message-State: AJIora9OR4n5s6CJEGBA1+DdH+6wl8ucQWgNKrdPPZ7bkip9CWHm/WOl
 40e361b7Zsc51d22tp2IWsYqVA==
X-Google-Smtp-Source: AGRyM1vWlyqhq2AbzaLofSEvu4ELOs/VdWksftoyXpt3jHmOsEh/oFKCS/ZNyqakRtIOESG+hWai1A==
X-Received: by 2002:a17:902:76c7:b0:16c:a4b6:e4cd with SMTP id
 j7-20020a17090276c700b0016ca4b6e4cdmr13690223plt.107.1658775405999; 
 Mon, 25 Jul 2022 11:56:45 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:30c1:2484:a853:233d?
 ([2602:ae:1549:801:30c1:2484:a853:233d])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a6567c1000000b00415e47f82e7sm8638440pgs.60.2022.07.25.11.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 11:56:45 -0700 (PDT)
Message-ID: <86a6fcad-c48a-7a75-5976-aa1a29706b28@linaro.org>
Date: Mon, 25 Jul 2022 11:56:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 01/13] tests: refresh to latest libvirt-ci module
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>
References: <20220725140520.515340-1-alex.bennee@linaro.org>
 <20220725140520.515340-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220725140520.515340-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/25/22 07:05, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> Notable changes:
> 
>    - libvirt-ci source tree was re-arranged, so the script we
>      run now lives in a bin/ sub-dir

It would have been nice to keep the submodule update plus the bin/ sub-dir change in one 
patch, and the generated file updates in a separate patch.  But I won't insist.

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
>    - opensuse 15.2 is replaced by opensuse 15.3
> 
>    - libslirp is temporarily dropped on opensuse as the
>      libslirp-version.h is broken
> 
>       https://bugzilla.opensuse.org/show_bug.cgi?id=1201551
> 
>    - The incorrectly named python3-virtualenv module was
>      changed to python3-venv, but most distros don't need
>      any package as 'venv' is a standard part of python
> 
>    - glibc-static was renamed to libc-static, to reflect
>      fact that it isn't going to be glibc on all distros
> 
>    - The cmocka/json-c deps that were manually added to
>      the centos dockerfile and are now consistently added
>      to all targets
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20220722130431.2319019-2-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/cirrus/freebsd-12.vars                   | 3 +--
>   .gitlab-ci.d/cirrus/freebsd-13.vars                   | 3 +--
>   .gitlab-ci.d/cirrus/macos-11.vars                     | 4 ++--
>   tests/docker/dockerfiles/alpine.docker                | 4 +++-
>   tests/docker/dockerfiles/centos8.docker               | 6 +++---
>   tests/docker/dockerfiles/debian-amd64.docker          | 2 ++
>   tests/docker/dockerfiles/debian-arm64-cross.docker    | 2 ++
>   tests/docker/dockerfiles/debian-armel-cross.docker    | 2 ++
>   tests/docker/dockerfiles/debian-armhf-cross.docker    | 2 ++
>   tests/docker/dockerfiles/debian-mips64el-cross.docker | 2 ++
>   tests/docker/dockerfiles/debian-mipsel-cross.docker   | 2 ++
>   tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 2 ++
>   tests/docker/dockerfiles/debian-s390x-cross.docker    | 2 ++
>   tests/docker/dockerfiles/fedora.docker                | 3 ++-
>   tests/docker/dockerfiles/opensuse-leap.docker         | 7 ++++---
>   tests/docker/dockerfiles/ubuntu2004.docker            | 2 ++
>   tests/lcitool/libvirt-ci                              | 2 +-
>   tests/lcitool/projects/qemu.yml                       | 6 ++++--
>   tests/lcitool/refresh                                 | 4 ++--
>   19 files changed, 41 insertions(+), 19 deletions(-)
> 
> diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
> index f59263731f..8fa5a320e9 100644
> --- a/.gitlab-ci.d/cirrus/freebsd-12.vars
> +++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
> @@ -1,5 +1,4 @@
>   # THIS FILE WAS AUTO-GENERATED
> -# ... and then edited to fix py39, pending proper lcitool update.
>   #
>   #  $ lcitool variables freebsd-12 qemu
>   #
> @@ -12,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
>   NINJA='/usr/local/bin/ninja'
>   PACKAGING_COMMAND='pkg'
>   PIP3='/usr/local/bin/pip-3.8'
> -PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-virtualenv py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
> +PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
>   PYPI_PKGS=''
>   PYTHON='/usr/local/bin/python3'
> diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
> index 40fc961398..8ed7e33a77 100644
> --- a/.gitlab-ci.d/cirrus/freebsd-13.vars
> +++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
> @@ -1,5 +1,4 @@
>   # THIS FILE WAS AUTO-GENERATED
> -# ... and then edited to fix py39, pending proper lcitool update.
>   #
>   #  $ lcitool variables freebsd-13 qemu
>   #
> @@ -12,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
>   NINJA='/usr/local/bin/ninja'
>   PACKAGING_COMMAND='pkg'
>   PIP3='/usr/local/bin/pip-3.8'
> -PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-virtualenv py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
> +PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
>   PYPI_PKGS=''
>   PYTHON='/usr/local/bin/python3'
> diff --git a/.gitlab-ci.d/cirrus/macos-11.vars b/.gitlab-ci.d/cirrus/macos-11.vars
> index cfe9181fd4..bec6e862d4 100644
> --- a/.gitlab-ci.d/cirrus/macos-11.vars
> +++ b/.gitlab-ci.d/cirrus/macos-11.vars
> @@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
>   NINJA='/usr/local/bin/ninja'
>   PACKAGING_COMMAND='brew'
>   PIP3='/usr/local/bin/pip3'
> -PKGS='bash bc bzip2 capstone ccache ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
> -PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme virtualenv'
> +PKGS='bash bc bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
> +PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme'
>   PYTHON='/usr/local/bin/python3'
> diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
> index 3f4c0f95cb..806cb19f17 100644
> --- a/tests/docker/dockerfiles/alpine.docker
> +++ b/tests/docker/dockerfiles/alpine.docker
> @@ -21,6 +21,7 @@ RUN apk update && \
>           cdrkit \
>           ceph-dev \
>           clang \
> +        cmocka-dev \
>           ctags \
>           curl-dev \
>           cyrus-sasl-dev \
> @@ -39,6 +40,7 @@ RUN apk update && \
>           glib-static \
>           gnutls-dev \
>           gtk+3.0-dev \
> +        json-c-dev \
>           libaio-dev \
>           libbpf-dev \
>           libcap-ng-dev \
> @@ -64,6 +66,7 @@ RUN apk update && \
>           mesa-dev \
>           meson \
>           multipath-tools \
> +        musl-dev \
>           ncurses-dev \
>           ndctl-dev \
>           net-tools \
> @@ -81,7 +84,6 @@ RUN apk update && \
>           py3-pip \
>           py3-sphinx \
>           py3-sphinx_rtd_theme \
> -        py3-virtualenv \
>           py3-yaml \
>           python3 \
>           rpm2cpio \
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
> index 10618bfa83..3c29883332 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -6,11 +6,12 @@
>   
>   FROM quay.io/centos/centos:stream8
>   
> -RUN dnf update -y && \
> +RUN dnf distro-sync -y && \
>       dnf install 'dnf-command(config-manager)' -y && \
>       dnf config-manager --set-enabled -y powertools && \
>       dnf install -y centos-release-advanced-virtualization && \
>       dnf install -y epel-release && \
> +    dnf install -y epel-next-release && \
>       dnf install -y \
>           SDL2-devel \
>           alsa-lib-devel \
> @@ -45,6 +46,7 @@ RUN dnf update -y && \
>           gtk3-devel \
>           hostname \
>           jemalloc-devel \
> +        json-c-devel \
>           libaio-devel \
>           libasan \
>           libattr-devel \
> @@ -60,7 +62,6 @@ RUN dnf update -y && \
>           libgcrypt-devel \
>           libiscsi-devel \
>           libjpeg-devel \
> -        json-c-devel \
>           libnfs-devel \
>           libpmem-devel \
>           libpng-devel \
> @@ -99,7 +100,6 @@ RUN dnf update -y && \
>           python3-pip \
>           python3-sphinx \
>           python3-sphinx_rtd_theme \
> -        python3-virtualenv \
>           rdma-core-devel \
>           rpm \
>           sed \
> diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
> index 503e282802..8d78ba2484 100644
> --- a/tests/docker/dockerfiles/debian-amd64.docker
> +++ b/tests/docker/dockerfiles/debian-amd64.docker
> @@ -41,6 +41,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libcacard-dev \
>               libcap-ng-dev \
>               libcapstone-dev \
> +            libcmocka-dev \
>               libcurl4-gnutls-dev \
>               libdaxctl-dev \
>               libdrm-dev \
> @@ -59,6 +60,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libiscsi-dev \
>               libjemalloc-dev \
>               libjpeg62-turbo-dev \
> +            libjson-c-dev \
>               liblttng-ust-dev \
>               liblzo2-dev \
>               libncursesw5-dev \
> diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
> index b60426834c..b7ba2c527f 100644
> --- a/tests/docker/dockerfiles/debian-arm64-cross.docker
> +++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
> @@ -84,6 +84,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libcacard-dev:arm64 \
>               libcap-ng-dev:arm64 \
>               libcapstone-dev:arm64 \
> +            libcmocka-dev:arm64 \
>               libcurl4-gnutls-dev:arm64 \
>               libdaxctl-dev:arm64 \
>               libdrm-dev:arm64 \
> @@ -102,6 +103,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libiscsi-dev:arm64 \
>               libjemalloc-dev:arm64 \
>               libjpeg62-turbo-dev:arm64 \
> +            libjson-c-dev:arm64 \
>               liblttng-ust-dev:arm64 \
>               liblzo2-dev:arm64 \
>               libncursesw5-dev:arm64 \
> diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
> index a6153e5a83..9b1778261e 100644
> --- a/tests/docker/dockerfiles/debian-armel-cross.docker
> +++ b/tests/docker/dockerfiles/debian-armel-cross.docker
> @@ -84,6 +84,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libcacard-dev:armel \
>               libcap-ng-dev:armel \
>               libcapstone-dev:armel \
> +            libcmocka-dev:armel \
>               libcurl4-gnutls-dev:armel \
>               libdaxctl-dev:armel \
>               libdrm-dev:armel \
> @@ -102,6 +103,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libiscsi-dev:armel \
>               libjemalloc-dev:armel \
>               libjpeg62-turbo-dev:armel \
> +            libjson-c-dev:armel \
>               liblttng-ust-dev:armel \
>               liblzo2-dev:armel \
>               libncursesw5-dev:armel \
> diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
> index a2ebce96f8..addbc9a793 100644
> --- a/tests/docker/dockerfiles/debian-armhf-cross.docker
> +++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
> @@ -84,6 +84,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libcacard-dev:armhf \
>               libcap-ng-dev:armhf \
>               libcapstone-dev:armhf \
> +            libcmocka-dev:armhf \
>               libcurl4-gnutls-dev:armhf \
>               libdaxctl-dev:armhf \
>               libdrm-dev:armhf \
> @@ -102,6 +103,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libiscsi-dev:armhf \
>               libjemalloc-dev:armhf \
>               libjpeg62-turbo-dev:armhf \
> +            libjson-c-dev:armhf \
>               liblttng-ust-dev:armhf \
>               liblzo2-dev:armhf \
>               libncursesw5-dev:armhf \
> diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
> index b02dcb7fd9..1bb7d8e184 100644
> --- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
> +++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
> @@ -83,6 +83,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libcacard-dev:mips64el \
>               libcap-ng-dev:mips64el \
>               libcapstone-dev:mips64el \
> +            libcmocka-dev:mips64el \
>               libcurl4-gnutls-dev:mips64el \
>               libdaxctl-dev:mips64el \
>               libdrm-dev:mips64el \
> @@ -101,6 +102,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libiscsi-dev:mips64el \
>               libjemalloc-dev:mips64el \
>               libjpeg62-turbo-dev:mips64el \
> +            libjson-c-dev:mips64el \
>               liblttng-ust-dev:mips64el \
>               liblzo2-dev:mips64el \
>               libncursesw5-dev:mips64el \
> diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
> index b6d99ae324..a94b459b23 100644
> --- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
> +++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
> @@ -83,6 +83,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libcacard-dev:mipsel \
>               libcap-ng-dev:mipsel \
>               libcapstone-dev:mipsel \
> +            libcmocka-dev:mipsel \
>               libcurl4-gnutls-dev:mipsel \
>               libdaxctl-dev:mipsel \
>               libdrm-dev:mipsel \
> @@ -101,6 +102,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libiscsi-dev:mipsel \
>               libjemalloc-dev:mipsel \
>               libjpeg62-turbo-dev:mipsel \
> +            libjson-c-dev:mipsel \
>               liblttng-ust-dev:mipsel \
>               liblzo2-dev:mipsel \
>               libncursesw5-dev:mipsel \
> diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
> index bcf04bc90b..c641fd5d0e 100644
> --- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
> +++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
> @@ -84,6 +84,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libcacard-dev:ppc64el \
>               libcap-ng-dev:ppc64el \
>               libcapstone-dev:ppc64el \
> +            libcmocka-dev:ppc64el \
>               libcurl4-gnutls-dev:ppc64el \
>               libdaxctl-dev:ppc64el \
>               libdrm-dev:ppc64el \
> @@ -102,6 +103,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libiscsi-dev:ppc64el \
>               libjemalloc-dev:ppc64el \
>               libjpeg62-turbo-dev:ppc64el \
> +            libjson-c-dev:ppc64el \
>               liblttng-ust-dev:ppc64el \
>               liblzo2-dev:ppc64el \
>               libncursesw5-dev:ppc64el \
> diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
> index ff79a2cc4f..c0cbe09e66 100644
> --- a/tests/docker/dockerfiles/debian-s390x-cross.docker
> +++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
> @@ -84,6 +84,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libcacard-dev:s390x \
>               libcap-ng-dev:s390x \
>               libcapstone-dev:s390x \
> +            libcmocka-dev:s390x \
>               libcurl4-gnutls-dev:s390x \
>               libdaxctl-dev:s390x \
>               libdrm-dev:s390x \
> @@ -102,6 +103,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libiscsi-dev:s390x \
>               libjemalloc-dev:s390x \
>               libjpeg62-turbo-dev:s390x \
> +            libjson-c-dev:s390x \
>               liblttng-ust-dev:s390x \
>               liblzo2-dev:s390x \
>               libncursesw5-dev:s390x \
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
> index 2e6a84abfd..b39d311bbc 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -53,12 +53,14 @@ exec "$@"' > /usr/bin/nosync && \
>           gtk3-devel \
>           hostname \
>           jemalloc-devel \
> +        json-c-devel \
>           libaio-devel \
>           libasan \
>           libattr-devel \
>           libbpf-devel \
>           libcacard-devel \
>           libcap-ng-devel \
> +        libcmocka-devel \
>           libcurl-devel \
>           libdrm-devel \
>           libepoxy-devel \
> @@ -106,7 +108,6 @@ exec "$@"' > /usr/bin/nosync && \
>           python3-pip \
>           python3-sphinx \
>           python3-sphinx_rtd_theme \
> -        python3-virtualenv \
>           rdma-core-devel \
>           rpm \
>           sed \
> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
> index 6f5993d602..047a435ab5 100644
> --- a/tests/docker/dockerfiles/opensuse-leap.docker
> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> @@ -1,10 +1,10 @@
>   # THIS FILE WAS AUTO-GENERATED
>   #
> -#  $ lcitool dockerfile --layers all opensuse-leap-152 qemu
> +#  $ lcitool dockerfile --layers all opensuse-leap-153 qemu
>   #
>   # https://gitlab.com/libvirt/libvirt-ci
>   
> -FROM registry.opensuse.org/opensuse/leap:15.2
> +FROM registry.opensuse.org/opensuse/leap:15.3
>   
>   RUN zypper update -y && \
>       zypper install -y \
> @@ -44,6 +44,7 @@ RUN zypper update -y && \
>              libbz2-devel \
>              libcacard-devel \
>              libcap-ng-devel \
> +           libcmocka-devel \
>              libcurl-devel \
>              libdrm-devel \
>              libepoxy-devel \
> @@ -53,6 +54,7 @@ RUN zypper update -y && \
>              libgnutls-devel \
>              libiscsi-devel \
>              libjpeg8-devel \
> +           libjson-c-devel \
>              libndctl-devel \
>              libnettle-devel \
>              libnfs-devel \
> @@ -94,7 +96,6 @@ RUN zypper update -y && \
>              python3-pip \
>              python3-setuptools \
>              python3-sphinx_rtd_theme \
> -           python3-virtualenv \
>              python3-wheel \
>              rdma-core-devel \
>              rpm \
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
> index a3b38884e3..99803b343b 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -40,6 +40,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libcacard-dev \
>               libcap-ng-dev \
>               libcapstone-dev \
> +            libcmocka-dev \
>               libcurl4-gnutls-dev \
>               libdaxctl-dev \
>               libdrm-dev \
> @@ -58,6 +59,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libiscsi-dev \
>               libjemalloc-dev \
>               libjpeg-turbo8-dev \
> +            libjson-c-dev \
>               liblttng-ust-dev \
>               liblzo2-dev \
>               libncursesw5-dev \
> diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
> index f83b916d5e..324355cf62 160000
> --- a/tests/lcitool/libvirt-ci
> +++ b/tests/lcitool/libvirt-ci
> @@ -1 +1 @@
> -Subproject commit f83b916d5efa4bd33fbf4b7ea41bf6d535cc63fb
> +Subproject commit 324355cf62e86fb551408575afb123bac989ac37
> diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
> index d068a7a8de..d9f826f8eb 100644
> --- a/tests/lcitool/projects/qemu.yml
> +++ b/tests/lcitool/projects/qemu.yml
> @@ -9,6 +9,7 @@ packages:
>    - capstone
>    - ccache
>    - clang
> + - cmocka
>    - column
>    - ctags
>    - cyrus-sasl
> @@ -26,15 +27,16 @@ packages:
>    - genisoimage
>    - glib2
>    - glib2-static
> - - glibc-static
>    - glusterfs
>    - gnutls
>    - gtk3
>    - hostname
> + - json-c
>    - libaio
>    - libattr
>    - libasan
>    - libbpf
> + - libc-static
>    - libcacard
>    - libcap-ng
>    - libcurl
> @@ -90,7 +92,7 @@ packages:
>    - python3-pip
>    - python3-sphinx
>    - python3-sphinx-rtd-theme
> - - python3-virtualenv
> + - python3-venv
>    - rpm2cpio
>    - sdl2
>    - sdl2-image
> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index 5e260f8cd6..2a59150322 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -25,7 +25,7 @@ self_dir = Path(__file__).parent
>   src_dir = self_dir.parent.parent
>   dockerfiles_dir = Path(src_dir, "tests", "docker", "dockerfiles")
>   
> -lcitool_path = Path(self_dir, "libvirt-ci", "lcitool")
> +lcitool_path = Path(self_dir, "libvirt-ci", "bin", "lcitool")
>   
>   lcitool_cmd = [lcitool_path, "--data-dir", self_dir]
>   
> @@ -112,7 +112,7 @@ try:
>       generate_dockerfile("debian-amd64", "debian-11",
>                           trailer="".join(debian11_extras))
>       generate_dockerfile("fedora", "fedora-35")
> -    generate_dockerfile("opensuse-leap", "opensuse-leap-152")
> +    generate_dockerfile("opensuse-leap", "opensuse-leap-153")
>       generate_dockerfile("ubuntu2004", "ubuntu-2004",
>                           trailer="".join(ubuntu2004_tsanhack))
>   


