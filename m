Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D78040C0AA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 09:39:16 +0200 (CEST)
Received: from localhost ([::1]:49040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQPVj-0006ds-Di
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 03:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPSa-0003oH-LQ
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 03:36:03 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPSY-0005Hf-SG
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 03:36:00 -0400
Received: by mail-wr1-x430.google.com with SMTP id q11so2267704wrr.9
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 00:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zqg2Ey4D7v59cLJKa6aTNVFrZvr/bnLJFmpTCmKedaQ=;
 b=RpkLdBAEOWNG/ucVg4WcqcDin3JD8v6XfRk8AZBuw/w3okpJqSjSKnv0rcfwPxqHop
 /DMz6VL9uAQKzvPRJp8TSZEIIPPC+6DB/1cSNpdAbMv3dIAf/IoaPxOccpFpHyucmqEO
 E2vQoqSrOZKZcGohBO1cf/INhBqPXbRHwZB8E5QEt/0GQan/vbNyL/i4pDT6eCyIH+tR
 OpmzlOcQxZNtAv0k0KgmwWlsIJak0iFjQEHPEBQZHo45ovupqv2f7hShZ/kTWGO7/DdQ
 boiVNQ46pU1J+N87nAqJHqJyuoFaW6IAjtQmVzE5C6JF3m06zcKCeIw17+IuGyuUt2lD
 O3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zqg2Ey4D7v59cLJKa6aTNVFrZvr/bnLJFmpTCmKedaQ=;
 b=x7J8GokLrGBtDnxonkhkHDOHMFop38e0OXa3q152YlJ6qh0p5wL0wEoLFGEUbuJwd4
 gnHvR53XPo9TtIQPbZQ1PhLAJngpFLesoxx5sRX5hrNePz14zqJqMHIVm7BVZ2Q2D0zn
 exnQNSsTIKPfHyxoZfQOOYwxskFcPW8js6pp24kvPgGdJqXGVpdCf6opZ5WVugLqA6T7
 kQdNvDXy+hgk0PPV1rZ4hFWjE7O1D5eHygSW537VfkKXluzO1rmq/GwunFIJ8q6m0VK3
 gdOgqA/uA7lOqZ0Dj59rBtxRdL9Q1ZqxN/ikJTuXYF+Jx/doUTQIlbKzeI9wnD7xDQWJ
 FR5g==
X-Gm-Message-State: AOAM533EagmbxCODUSqDwOgBy5eA4gZ7nmrtB3eeh/xNlT2YFP10YWQ1
 HX1HyA7dVG0adOQkijkKAZ0=
X-Google-Smtp-Source: ABdhPJwYs703rAab5dAOOcb2Ragm1o7+JRreyNe4S21L0tNSMXnpSmd0pyV7H7Z58knvvXCSC6PquA==
X-Received: by 2002:adf:fc49:: with SMTP id e9mr3274824wrs.298.1631691356440; 
 Wed, 15 Sep 2021 00:35:56 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id z7sm15903598wre.72.2021.09.15.00.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:35:55 -0700 (PDT)
Subject: Re: [PATCH 1/2] tests/docker: promote debian-riscv64-cross to a full
 image
To: qemu-devel@nongnu.org, alex.bennee@linaro.org
References: <20210914185830.1378771-1-richard.henderson@linaro.org>
 <20210914185830.1378771-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <14f98dad-fb1c-7b1b-4194-484973a53c90@amsat.org>
Date: Wed, 15 Sep 2021 09:35:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914185830.1378771-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
Cc: willianr@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, thuth@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, wainersm@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 8:58 PM, Richard Henderson wrote:
> From: Alex Bennée <alex.bennee@linaro.org>
> 
> To be able to cross build QEMU itself we need to include a few more
> libraries. These are only available in Debian's unstable ports repo
> for now so we need to base the riscv64 image on sid with the the
> minimal libs needed to build QEMU (glib/pixman).
> 
> The result works but is not as clean as using build-dep to bring in
> more dependencies. However sid is by definition a shifting pile of
> sand and by keeping the list of libs minimal we reduce the chance of
> having an image we can't build. It's good enough for a basic cross
> build testing of TCG.
> 
> Cc: "Daniel P. Berrangé" <berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  .gitlab-ci.d/container-cross.yml              |  1 -
>  tests/docker/Makefile.include                 |  2 -
>  .../dockerfiles/debian-riscv64-cross.docker   | 46 +++++++++++++++++--
>  3 files changed, 41 insertions(+), 8 deletions(-)
> 
> diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
> index 0fcebe363a..05996200e1 100644
> --- a/.gitlab-ci.d/container-cross.yml
> +++ b/.gitlab-ci.d/container-cross.yml
> @@ -134,7 +134,6 @@ ppc64el-debian-cross-container:
>  riscv64-debian-cross-container:
>    extends: .container_job_template
>    stage: containers-layer2
> -  needs: ['amd64-debian10-container']
>    variables:
>      NAME: debian-riscv64-cross
>  
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index ff5d732889..3b03763186 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -141,7 +141,6 @@ docker-image-debian-mips64-cross: docker-image-debian10
>  docker-image-debian-mips64el-cross: docker-image-debian10
>  docker-image-debian-mipsel-cross: docker-image-debian10
>  docker-image-debian-ppc64el-cross: docker-image-debian10
> -docker-image-debian-riscv64-cross: docker-image-debian10
>  docker-image-debian-s390x-cross: docker-image-debian10
>  docker-image-debian-sh4-cross: docker-image-debian10
>  docker-image-debian-sparc64-cross: docker-image-debian10
> @@ -180,7 +179,6 @@ DOCKER_PARTIAL_IMAGES += debian-arm64-test-cross
>  DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
>  DOCKER_PARTIAL_IMAGES += debian-hppa-cross
>  DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
> -DOCKER_PARTIAL_IMAGES += debian-riscv64-cross
>  DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
>  DOCKER_PARTIAL_IMAGES += debian-tricore-cross
>  DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
> diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/tests/docker/dockerfiles/debian-riscv64-cross.docker
> index 2bbff19772..594d97982c 100644
> --- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
> +++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
> @@ -1,12 +1,48 @@
>  #
> -# Docker cross-compiler target
> +# Docker cross-compiler target for riscv64
>  #
> -# This docker target builds on the debian Buster base image.
> +# Currently the only distro that gets close to cross compiling riscv64
> +# images is Debian Sid (with unofficial ports). As this is a moving
> +# target we keep the library list minimal and are aiming to migrate
> +# from this hack as soon as we are able.
>  #
> -FROM qemu/debian10
> +FROM docker.io/library/debian:sid-slim
> +
> +# Add ports
> +RUN apt update && \
> +    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
> +    DEBIAN_FRONTEND=noninteractive eatmydata apt update -yy && \
> +    DEBIAN_FRONTEND=noninteractive eatmydata apt upgrade -yy
> +
> +# Install common build utilities
> +RUN DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
> +    bc \
> +    build-essential \
> +    ca-certificates \
> +    debian-ports-archive-keyring \
> +    dpkg-dev \
> +    gettext \
> +    git \
> +    ninja-build \
> +    pkg-config \
> +    python3

Alex, why not using a debian-sid intermediate image?

> +# Add ports and riscv64 architecture
> +RUN echo "deb http://ftp.ports.debian.org/debian-ports/ sid main" >> /etc/apt/sources.list
> +RUN dpkg --add-architecture riscv64
> +
> +# Duplicate deb line as deb-src
> +RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
>  
>  RUN apt update && \
>      DEBIAN_FRONTEND=noninteractive eatmydata \
>      apt install -y --no-install-recommends \
> -        gcc-riscv64-linux-gnu \
> -        libc6-dev-riscv64-cross
> +         gcc-riscv64-linux-gnu \
> +         libc6-dev-riscv64-cross \
> +         libffi-dev:riscv64 \
> +         libglib2.0-dev:riscv64 \
> +         libpixman-1-dev:riscv64
> +
> +# Specify the cross prefix for this image (see tests/docker/common.rc)
> +ENV QEMU_CONFIGURE_OPTS --cross-prefix=riscv64-linux-gnu-
> +ENV DEF_TARGET_LIST riscv64-softmmu,riscv64-linux-user
> 


