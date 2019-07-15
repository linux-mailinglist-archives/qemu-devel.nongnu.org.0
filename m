Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2882C690F0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 16:25:53 +0200 (CEST)
Received: from localhost ([::1]:39351 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn1vM-0006uz-4X
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 10:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33050)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hn1u1-0001Q8-Ro
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:24:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hn1u0-0002kx-H4
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:24:29 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55763)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hn1tz-0002jp-4w
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:24:27 -0400
Received: by mail-wm1-x343.google.com with SMTP id a15so15381822wmj.5
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 07:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=LJ1SW2CapLq3j+AoEDMffiAbDzz/4kxGKSB9DHSXD4U=;
 b=Jy5tU6nOyD6xMQcf/n27+FIqtjUo6iuk5j/NaXM9M6ULiQAm5rhH/hVwwO7XGhQ4Jq
 0gE/A20Pu65gbPxeNx+FPISzXDHEP0MzQF8gfZ4FdgVBSfGloBX7WaLzBzo61kQItLf7
 JZrI3k0jU9ZP06wSLeg7DwIJ9gHpz0wGHzG9WSlzKRyCNQ9MGnWVXNs+RGNrNXbkZwC1
 LqGsJUd7TGLD/Sfl+rJqTSrRYcV1qNHAxgVDwcAKR3v7pEjqBmv2L454alajKHVgz94I
 2/zcxuXYg8CTmZMKgtScOotRwM7XeIe9tWMGIJBG16D4eDNfaImgRdoSPq6Hl7DFOgJo
 npSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=LJ1SW2CapLq3j+AoEDMffiAbDzz/4kxGKSB9DHSXD4U=;
 b=ZqDt/6ihvZQ0mK5iVxw+o1ipowRh9jTE4WmBR/GEpc35SgsL6NI4wpG7Uxb5lOF6Nf
 Jl2y9QEWJPOzMNq20mg1/SNBitA7fpW/586+2AqF9DHzvPShTF79aRc4VgDsxI9411X+
 O9WcRNPUPqHqFnnD3Q+XbExBQqXDrZfXVodRz+AbpE3ehSLf21uCOvyFtaLCeCn3PXqr
 g1clFNP3NXa4GvVgs/sCXf3CvOO1gTUl7cM/Po8GY8bgnuPehZ9CiH6TZGr1zWzuLPOF
 ZP/yApQuzW5LqeILz8HywecDUADUILQaLVv18jb0ftNr1IRkNSFo2xMvIvmJII305G4j
 bwpQ==
X-Gm-Message-State: APjAAAXngmzodY5RBK9t5pihSCVS98jwTF5IcjL4+ihwhX0TblRCb+Zr
 44DSveHBfBmprILo0M4fKGFJ9A==
X-Google-Smtp-Source: APXvYqyk11Kd21EOvho1iBcOh/2WqnczT1XmmuJ2aekwwdthtdWoJqTrOrR3LtTEL6vtWDp57strsA==
X-Received: by 2002:a1c:f408:: with SMTP id z8mr19184249wma.97.1563200664401; 
 Mon, 15 Jul 2019 07:24:24 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id o24sm22341164wmh.2.2019.07.15.07.24.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 07:24:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 420501FF87;
 Mon, 15 Jul 2019 15:24:23 +0100 (BST)
References: <20190713163558.13204-1-philmd@redhat.com>
 <20190713163558.13204-2-philmd@redhat.com>
User-agent: mu4e 1.3.3; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
In-reply-to: <20190713163558.13204-2-philmd@redhat.com>
Date: Mon, 15 Jul 2019 15:24:23 +0100
Message-ID: <87lfwzv0iw.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 1/3] tests/docker: Install Sphinx in the
 Debian images
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
Cc: Fam Zheng <fam@euphon.net>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Since commit 5f71eac06e the Sphinx tool is required
> to build the rST documentation.
>
> This fixes:
>
>  $ ./configure --enable-docs
>
>  ERROR: User requested feature docs
>         configure was not able to find it.
>         Install texinfo, Perl/perl-podlators and python-sphinx
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/docker/dockerfiles/debian-sid.docker          | 1 +
>  tests/docker/dockerfiles/debian-xtensa-cross.docker | 3 ++-

These two are probably overkill - sid and xtensa are used for building
test cases.

>  tests/docker/dockerfiles/debian10.docker            | 1 +

Again used as a base for docker-cross targets - it can't build QEMU on
it's own but I guess makes sense to include it here.

>  tests/docker/dockerfiles/debian9-mxe.docker         | 1 +

debian9-mxe is derived from  qemu:debian9 so

>  tests/docker/dockerfiles/debian9.docker             | 1 +

We only really need this one.

>  5 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tests/docker/dockerfiles/debian-sid.docker b/tests/docker/do=
ckerfiles/debian-sid.docker
> index 676941cb32..9d65c15916 100644
> --- a/tests/docker/dockerfiles/debian-sid.docker
> +++ b/tests/docker/dockerfiles/debian-sid.docker
> @@ -38,4 +38,5 @@ RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>          pkg-config \
>          psmisc \
>          python \
> +        python3-sphinx \
>          texinfo || { echo "Failed to build - see debian-sid.docker notes=
"; exit 1; }
> diff --git a/tests/docker/dockerfiles/debian-xtensa-cross.docker b/tests/=
docker/dockerfiles/debian-xtensa-cross.docker
> index afd2ab9163..3022940e64 100644
> --- a/tests/docker/dockerfiles/debian-xtensa-cross.docker
> +++ b/tests/docker/dockerfiles/debian-xtensa-cross.docker
> @@ -18,7 +18,8 @@ RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>          flex \
>          gettext \
>          git \
> -        python-minimal
> +        python-minimal \
> +        python3-sphinx
>
>  ENV CPU_LIST csp dc232b dc233c
>  ENV TOOLCHAIN_RELEASE 2018.02
> diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dock=
erfiles/debian10.docker
> index aeeb151b52..cf57d8218f 100644
> --- a/tests/docker/dockerfiles/debian10.docker
> +++ b/tests/docker/dockerfiles/debian10.docker
> @@ -27,5 +27,6 @@ RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>          pkg-config \
>          psmisc \
>          python \
> +        python3-sphinx \
>          texinfo \
>          $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut =
-d\  -f2)
> diff --git a/tests/docker/dockerfiles/debian9-mxe.docker b/tests/docker/d=
ockerfiles/debian9-mxe.docker
> index 5bc8a6d5c3..497c198731 100644
> --- a/tests/docker/dockerfiles/debian9-mxe.docker
> +++ b/tests/docker/dockerfiles/debian9-mxe.docker
> @@ -17,6 +17,7 @@ RUN apt-get update
>  RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>      apt-get install -y --no-install-recommends \
>          libpython2.7-stdlib \
> +        python3-sphinx \
>          $(apt-get -s install -y --no-install-recommends gw32.shared-ming=
w-w64 | egrep "^Inst mxe-x86-64-unknown-" | cut -d\  -f2)
>
>  ENV PATH $PATH:/usr/lib/mxe/usr/bin/
> diff --git a/tests/docker/dockerfiles/debian9.docker b/tests/docker/docke=
rfiles/debian9.docker
> index 5f23a35404..52c589a7d6 100644
> --- a/tests/docker/dockerfiles/debian9.docker
> +++ b/tests/docker/dockerfiles/debian9.docker
> @@ -27,5 +27,6 @@ RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>          pkg-config \
>          psmisc \
>          python \
> +        python3-sphinx \
>          texinfo \
>          $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut =
-d\  -f2)


--
Alex Benn=C3=A9e

