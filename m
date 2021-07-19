Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DFE3CEE2A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:37:38 +0200 (CEST)
Received: from localhost ([::1]:34378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5axF-0007jF-Um
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5awQ-000747-8l
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:36:46 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:33773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5awO-0001Fa-Fl
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:36:46 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso669045wme.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZMjRarhoG1Ju8P71psLA1KNAzBJ5udGUasCrWzJMvRo=;
 b=NKlnX30Y/6GoBx7oScx6yWRwvg5044mFF1ucuDybe/yP/NgxVjfPyRHrPGNlw+luDO
 o/PTw00PuqE/H3Qv+BwHEUkoE26wJfMQskTRYCYLQUnNJVXknkTsK4/OI9T/pG7s3Hjj
 yRwQlxqyqIjumWZEGKEr5CfB6HMjlKpb8nAf5mHM/rfxTagtLeunoVTy9eJ5SHe8inSU
 z+u8l7A643o6Y0rB9fgzhLMPezWr6E/Z8v579mzoUfRei2zyjMX+NmiXGMDujWbnQXYH
 44GIWpilZre84mrJY/9UAr/GBAc83el6b/DKCOB9ZdmuISAozuUpKkfbWXK2O18TUdnL
 vtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZMjRarhoG1Ju8P71psLA1KNAzBJ5udGUasCrWzJMvRo=;
 b=HT7RlzcNrVCqxpXm4ugyNu0YemGDUL5+drr620wuTBdOd6p/v7foNzqM5qvvXSvtM3
 ne1Wfoj8w09zFeLAEfQwO9Ef1jzDCYhvc/qpU0G/302eLfw/09apqlw5vGlCS7T7Y3DB
 Z4zR/mHORABeR61G9ZoOiu0aNXKa8wHvEQc+28bUGGhFUToxQqMxyVUoTm+1P8J5wfco
 bXTBIWvDQGC0OwY/HxfQ+Zme+kNzAjRztDz0xUJBIJfDBqvfqdHCzscSlMavqhIZfFuW
 FCncLgVTPZoOJmPw2M52n2oYmqcnrX9al+xShwQnRNVXYOMAWvQMaKTsOBCCXMcQVavM
 izXw==
X-Gm-Message-State: AOAM532ez1902uUgx+dCn1isC866SPQAY5HkGan2kkCMSpqOXEFmCPcL
 KpRdls9tCg7+mO81gDx6WGzN9g==
X-Google-Smtp-Source: ABdhPJwyBUl0hxKUo8aCNGm4BWB3JgUTi5q/JYt+4Dvm9uWibkhCWj6xNou1nYU6nduP0/4Fpcf3Jw==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr28323994wmj.120.1626730602957; 
 Mon, 19 Jul 2021 14:36:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w8sm10204981wrk.10.2021.07.19.14.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:36:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 37F891FF7E;
 Mon, 19 Jul 2021 22:36:41 +0100 (BST)
References: <20210719195002.6753-1-alex.bennee@linaro.org>
 <20210719195002.6753-3-alex.bennee@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH  v1 2/2] gitlab: enable a very minimal build with the
 tricore container
Date: Mon, 19 Jul 2021 22:36:08 +0100
In-reply-to: <20210719195002.6753-3-alex.bennee@linaro.org>
Message-ID: <87bl6ynfyu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> We do the same thing as hexagon and do a two stage build that provides
> the minimal dependencies to build qemu-tricore-system and it's
> check-tcg tests.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/buildtest.yml                    | 11 +++++
>  .../dockerfiles/debian-tricore-cross.docker   | 48 +++++++++++++++++--
>  2 files changed, 54 insertions(+), 5 deletions(-)
>
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 89df51517c..1f3fbcd965 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -354,6 +354,17 @@ build-some-softmmu:
>      TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
>      MAKE_CHECK_ARGS: check-tcg
>=20=20
> +# We build tricore in a very minimal tricore only container
> +build-tricore-softmmu:
> +  extends: .native_build_job_template
> +  needs:
> +    job: debian-tricore-cross-container
> +  variables:
> +    IMAGE: debian-tricore-cross
> +    CONFIGURE_ARGS: --disable-tools --enable-debug
> +    TARGETS: tricore-softmmu
> +    MAKE_CHECK_ARGS: check-tcg
> +
>  clang-system:
>    extends: .native_build_job_template
>    needs:
> diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests=
/docker/dockerfiles/debian-tricore-cross.docker
> index 985925134c..50c87f251f 100644
> --- a/tests/docker/dockerfiles/debian-tricore-cross.docker
> +++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
> @@ -15,9 +15,47 @@ RUN git clone --single-branch \
>          https://github.com/bkoppelmann/tricore-binutils.git \
>          /usr/src/binutils && \
>      cd /usr/src/binutils && chmod +x missing && \
> -    CFLAGS=3D-w ./configure --prefix=3D/usr --disable-nls --target=3Dtri=
core && \
> -    make && make install && \
> -    rm -rf /usr/src/binutils
> +    CFLAGS=3D-w ./configure --prefix=3D/usr/local --disable-nls --target=
=3Dtricore && \
> +    make && make install
>=20=20
> -# This image isn't designed for building QEMU but building tests
> -ENV QEMU_CONFIGURE_OPTS --disable-system --disable-user
> +FROM debian:buster-slim
> +# Duplicate deb line as deb-src
> +RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sou=
rces.list
> +# Install QEMU build deps for use in CI
> +RUN apt update && \
> +    DEBIAN_FRONTEND=3Dnoninteractive apt install -yy eatmydata && \
> +    DEBIAN_FRONTEND=3Dnoninteractive eatmydata apt install -yy \
> +       build-essential \
> +       git \
> +       libglib2.0-dev \
> +       libpixman-1-dev \
> +       ninja-build \
> +       python3 \
> +       pkg-config
> +       bzip2 \
> +       ca-certificates \
> +       ccache \
> +       diffutils \
> +       findutils \
> +       g++ \
> +       gcc \
> +       git \
> +       libcapstone-dev \
> +       libfdt-dev \
> +       libglib2.0-dev \
> +       libpixman-1-dev \
> +       libtest-harness-perl \
> +       locales \
> +       make \
> +       ninja-build \
> +       perl-base \
> +       pkgconf \
> +       python3-pip \
> +       python3-setuptools \
> +       python3-wheel

Oops that combined the two lists, it should be:

# Install very minimal QEMU build deps for use in CI
# $ lcitool variables debian-10 qemu+minimal
RUN apt update && \
    DEBIAN_FRONTEND=3Dnoninteractive apt install -yy eatmydata && \
    DEBIAN_FRONTEND=3Dnoninteractive eatmydata apt install -yy \
       bzip2 \
       ca-certificates \
       ccache \
       g++ \
       gcc \
       git \
       libcapstone-dev \
       libfdt-dev \
       libglib2.0-dev \
       libpixman-1-dev \
       libtest-harness-perl \
       locales \
       make \
       ninja-build \
       perl-base \
       pkgconf \
       python3-pip \
       python3-setuptools \
       python3-wheel


> +COPY --from=3D0 /usr/local /usr/local
> +ENV PATH $PATH:/usr/local/bin/
> +
> +# This image can only build a very minimal QEMU as well as the tests
> +ENV DEF_TARGET_LIST tricore-softmmu
> +ENV QEMU_CONFIGURE_OPTS --disable-user --disable-tools


--=20
Alex Benn=C3=A9e

