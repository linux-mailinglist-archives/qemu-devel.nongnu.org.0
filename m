Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4A5425507
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:08:38 +0200 (CEST)
Received: from localhost ([::1]:43430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYU4b-00027n-Ia
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anders.roxell@linaro.org>)
 id 1mYSZL-0005YT-5m
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:32:15 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:46646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anders.roxell@linaro.org>)
 id 1mYSZJ-0002Jy-As
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:32:14 -0400
Received: by mail-ed1-x532.google.com with SMTP id z20so22410219edc.13
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 05:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9LqvuRG5278MS0jZ6TrN0Au/Om9Hm8cjhhwJ2Uw2nPo=;
 b=H2pYsWjPRns8mkH40iawDN4wF6RAbm4jJkTbc1Ji3sHadL8AwE+Qe5imLyPOldoU2O
 MsL7a841VS5aTTg5vSH+NPIngdjURl9K2uBtPA++ma6HUqZll6SZhbnYizXmJ7tKd7R6
 ZpXBVgo69I1SY4C2Y3sXcLKllNlOQ7RrERodBkq7/WjxKk+c5iN6yQq+rszXHP0MA2e6
 nWf4sXpCIqf3+c0JY6Yb5vk8ngJnURarWazm4Ff/WW4W3rdSLFaZ6en9CE7kqZ/ekMdc
 vn6+tFF8DrWm/jVA6gfw8RqsGCCysAiwLw6miiX3CHLMJ1MuNhHSUIqGlEv6d4OOrsID
 cIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9LqvuRG5278MS0jZ6TrN0Au/Om9Hm8cjhhwJ2Uw2nPo=;
 b=OrCgJIS20Akb7uA91XTiG3VIMEab30Yqc0wSKxcbK5RbIw/AJbKOxsMHiemuLiTEqu
 WtHc/fUDPFkSD4qoqAjE68T4RLYuEuXT0QPcuSjEJ+joFg40CtkSXMZLNpoPgcfYMU6Z
 JB0r0D5tYotCFyGnWtgtKo2nyJ2f2wdSjcC+b0V/fvIkwnWqkXpodt7sGzbn23d+GnVv
 bTIVRoqj3t1F0iYqe67kbK6MqYlOZMSxyRJ6glon92o16UUyxY8XFuUWr9DkzSdw6LKR
 liHEhBByO1Ir4Sz6e8JASYbYAwOJ7KBX7CUSlIfi+IDRRGFya1znCjASw9bodsvSZ6uY
 /u5Q==
X-Gm-Message-State: AOAM531mAZd0ezqazL39T+xPW5bCTGpO3QxWQBri2EYQ0Ey4oxiXoDpI
 2QyS48iR5No8QNuJx4c53eQpQIvBlhUmOuRzBLOBKQ==
X-Google-Smtp-Source: ABdhPJzFRU18oeyc8FAktnrW1+LSZgjNhr+IC5q//s3jsYXAyDdGF3ka930c/lKHlHdw13aTtiG3g8cIyZNU+Ryq+6c=
X-Received: by 2002:a50:d511:: with SMTP id u17mr5931381edi.105.1633609930533; 
 Thu, 07 Oct 2021 05:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210922151528.2192966-1-alex.bennee@linaro.org>
In-Reply-To: <20210922151528.2192966-1-alex.bennee@linaro.org>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 7 Oct 2021 14:31:59 +0200
Message-ID: <CADYN=9+V=Q2hYgGev+HkPP7z7eADAqtAJsydEHAX+H24BFPLdg@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/docker: add a debian-native image and make
 available
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=anders.roxell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 07 Oct 2021 10:06:58 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Sept 2021 at 17:15, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> This image is intended for building whatever the native versions of
> QEMU are for the host architecture. This will hopefully be an aid for
> 3rd parties who want to be able to build QEMU themselves without
> redoing all the dependencies themselves.
>
> We disable the registry because we currently don't have multi-arch
> support there.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>

Thank you for doing this Alex,

Tested-by: Anders Roxell <anders.roxell@linaro.org>

Cheers,
Anders

> ---
>  tests/docker/Makefile.include                 |  4 ++
>  tests/docker/common.rc                        | 10 +++-
>  tests/docker/dockerfiles/debian-native.docker | 49 +++++++++++++++++++
>  3 files changed, 61 insertions(+), 2 deletions(-)
>  create mode 100644 tests/docker/dockerfiles/debian-native.docker
>
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.includ=
e
> index 3b03763186..2f276cc4b2 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -145,6 +145,10 @@ docker-image-debian-s390x-cross: docker-image-debian=
10
>  docker-image-debian-sh4-cross: docker-image-debian10
>  docker-image-debian-sparc64-cross: docker-image-debian10
>
> +# The native build should never use the registry
> +docker-image-debian-native: DOCKER_REGISTRY=3D
> +
> +
>  #
>  # The build rule for hexagon-cross is special in so far for most of
>  # the time we don't want to build it. While dockers caching does avoid
> diff --git a/tests/docker/common.rc b/tests/docker/common.rc
> index c5cc33d366..e6f8cee0d6 100755
> --- a/tests/docker/common.rc
> +++ b/tests/docker/common.rc
> @@ -12,8 +12,14 @@
>  # the top-level directory.
>
>  # This might be set by ENV of a docker container... it is always
> -# overriden by TARGET_LIST if the user sets it.
> -DEF_TARGET_LIST=3D${DEF_TARGET_LIST:-"x86_64-softmmu,aarch64-softmmu"}
> +# overriden by TARGET_LIST if the user sets it. We special case
> +# "none" to allow for other options like --disable-tcg to restrict the
> +# builds we eventually do.
> +if test "$DEF_TARGET_LIST" =3D "none"; then
> +    DEF_TARGET_LIST=3D""
> +else
> +    DEF_TARGET_LIST=3D${DEF_TARGET_LIST:-"x86_64-softmmu,aarch64-softmmu=
"}
> +fi
>
>  requires_binary()
>  {
> diff --git a/tests/docker/dockerfiles/debian-native.docker b/tests/docker=
/dockerfiles/debian-native.docker
> new file mode 100644
> index 0000000000..efd55cb6e0
> --- /dev/null
> +++ b/tests/docker/dockerfiles/debian-native.docker
> @@ -0,0 +1,49 @@
> +#
> +# Docker Debian Native
> +#
> +# This this intended to build QEMU on native host systems. Debian is
> +# chosen due to the broadest range on supported host systems for QEMU.
> +#
> +# This docker target is based on the docker.io Debian Bullseye base
> +# image rather than QEMU's base because we would otherwise confuse the
> +# build grabbing stuff from the registry built for other
> +# architectures.
> +#
> +FROM docker.io/library/debian:bullseye-slim
> +MAINTAINER Alex Benn=C3=A9e <alex.bennee@linaro.org>
> +
> +# Duplicate deb line as deb-src
> +RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sou=
rces.list
> +
> +# Install common build utilities
> +RUN apt update && \
> +    DEBIAN_FRONTEND=3Dnoninteractive apt install -yy eatmydata
> +
> +RUN apt update && \
> +    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
> +    apt build-dep -yy --arch-only qemu
> +
> +RUN apt update && \
> +    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
> +    apt install -y --no-install-recommends \
> +        cscope \
> +        genisoimage \
> +        exuberant-ctags \
> +        global \
> +        libbz2-dev \
> +        liblzo2-dev \
> +        libgcrypt20-dev \
> +        libfdt-dev \
> +        librdmacm-dev \
> +        libsasl2-dev \
> +        libsnappy-dev \
> +        libvte-dev \
> +        netcat-openbsd \
> +        ninja-build \
> +        openssh-client \
> +        python3-numpy \
> +        python3-opencv \
> +        python3-venv
> +
> +ENV QEMU_CONFIGURE_OPTS $QEMU_CONFIGURE_OPTS
> +ENV DEF_TARGET_LIST "none"
> --
> 2.30.2
>

