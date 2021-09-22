Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870DE414FBB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:19:45 +0200 (CEST)
Received: from localhost ([::1]:40630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT6qO-0001Ob-Hj
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mT5g4-0001J6-Fm
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:05:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mT5fz-0004SZ-M5
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632330293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pTDRmJ70YOG4GfcGNHeR2xW2XARnl9W2GYUIPi5gwPM=;
 b=DdJda0pJYj6DPYeRvMohW9zAsxa7ZCf0lHQzE6GsqLAdw8kVv0xGBe5Zb25LcmTiQM1oAU
 iy8Rn9B4PW8Hvhq6zHucKv5B8c5zitsDhukJduhUdsRWXuECXgj6CvevUk3W+NcMgUsTJ2
 387MUyM6pF4mnJp04E5+A+py+RaJqdg=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-9exQbgBONICXZ965tegJiA-1; Wed, 22 Sep 2021 13:04:49 -0400
X-MC-Unique: 9exQbgBONICXZ965tegJiA-1
Received: by mail-pl1-f197.google.com with SMTP id
 m5-20020a170902bb8500b0013a2b785187so1211436pls.11
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 10:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pTDRmJ70YOG4GfcGNHeR2xW2XARnl9W2GYUIPi5gwPM=;
 b=tQz/MbP8asFPJp+0H2ExAwcI587xcFoUZ5DX8yCrpA9nONNKhXWopALi6kZnM5TBsE
 +SXbJ9CWvXZg7dfiYa+JwU64+RjChg6ZOIR+zLYK0K+lihZmAlwSl+7GwFKvw0+g2EZt
 iwbfGPJJ0KY5F4Qdt3yqpkuNpl+/IV7cuXcFWWXFCmDzEeWIeWc6z5LZjQ+J3wVoQPvf
 YGexV79fbdFeTTLgDehjTDPL3M+BlmVxXfWlXHAa/iG1QlBnO4qV+OS8MH23cpnumG6n
 kaiPanFVPlrYfpCwD7ulrfH6ebZeReUb9w3VF+xJBXXTVGuvn5uAwH1YL5LYKq0KFnkX
 M4lQ==
X-Gm-Message-State: AOAM530QZxr0B4YAwD1guhGUAbwV/eOYOsyV1125KP26jUbZEQS4QxO2
 Thf26pZG3aAo/wAwWI8etqY1ZlHf9VQyAg9Zh6dAzvWoVV/4IzWCjKoT7A3mNKRTx22z1RJu6AM
 SuVNb3J52UnMS4txvsTUSyqrZrWjbmxo=
X-Received: by 2002:a17:90b:14cc:: with SMTP id
 jz12mr31517pjb.203.1632330288350; 
 Wed, 22 Sep 2021 10:04:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxacOhU0Dq6Qw8c0haEECiEFXU4FxGceatmXcgdWy4u7ugzLNOnsKxR69f58ZMtqKIE+/TmmhRQphF8mk3DkIk=
X-Received: by 2002:a17:90b:14cc:: with SMTP id
 jz12mr31464pjb.203.1632330287972; 
 Wed, 22 Sep 2021 10:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210922151528.2192966-1-alex.bennee@linaro.org>
In-Reply-To: <20210922151528.2192966-1-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 22 Sep 2021 14:04:21 -0300
Message-ID: <CAKJDGDaqJQyG+JaL59a8t5XCospPprvUXXogd1oCBjgzRATffw@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/docker: add a debian-native image and make
 available
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Thomas Huth <thuth@redhat.com>, Anders Roxell <anders.roxell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 12:15 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
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

if this is overridden when the user sets it, maybe remove the "always".

> -# overriden by TARGET_LIST if the user sets it.
> -DEF_TARGET_LIST=3D${DEF_TARGET_LIST:-"x86_64-softmmu,aarch64-softmmu"}
> +# overriden by TARGET_LIST if the user sets it. We special case

s/overriden/overridden/
Also, is there some word missing after "We"? Or you meant "With"?

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

s/This this/This/ or you meant "This is..."

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

Overall, looks good to me,

Acked-by: Willian Rampazzo <willianr@redhat.com>


