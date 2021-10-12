Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5152442AA8B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 19:14:00 +0200 (CEST)
Received: from localhost ([::1]:42964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maLLi-0003r7-S5
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 13:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maLJm-00029W-Bd
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 13:11:58 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maLJk-0007dc-F1
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 13:11:58 -0400
Received: by mail-wr1-x42c.google.com with SMTP id y3so35946605wrl.1
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 10:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3R48nYNjHQ0anuZjufmpCAIzL0jklBVO/GP0qr/iqlc=;
 b=WVr2jri7QoIGT6DO5jG88Mu7beqe7GALn3C830jEYKjEW9TvTSNh6xE4InM2l86zMZ
 pSCGqRZzMiknDmBSEMJvO2lzpxzFCVvtGQeGZhtlc1yf5H3J0APq7L41ZyP7tqas8t1V
 qk8OBYA4vrCsJDNTKhFksNMHp5bamvAJtt/4jMKgFIiYOszBljGgzDgRvacp+D64iQ4a
 yf+Bga4hioZ7Y5XQUYsXOadwIFO/cLdd0mlb/qSKiJ2N9IPry2aZaDZti4GFg6Iez5xB
 Peslh/bkXO2em3e8xnRuplITfl3JePPI40BYPk7wCTMgnkr6uII525F6Bf9sE1fUa9/S
 ovNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3R48nYNjHQ0anuZjufmpCAIzL0jklBVO/GP0qr/iqlc=;
 b=e/oukQnQdFmTW2Yb0oQVo5Sw1m7yex0bvOdOmb+wmlMhEB9HCTTz4aikpZaNP3kMCM
 w3wX7Zl76USGW0gtg7HaMna4/fg27AxYHiS3WJJ1BcaxV6OEQ6hPDqgS4GPqXTSq03kj
 mDZXsASC8B4An4zMhzf9xoZBi3QW6ZknLm9yFI/VO1gjREDDVDBJfKmR4MJgBYobAclx
 UNlhSayZDffCzAYbtSbZV9Cxe4VEloW/aVsHwX312LlmZpf7EBnRbk6OIVK6oacksfXM
 uez17I7gt2RQJ6gYj8aFhPGOrQeyKe+Iqkv3G61wTYUpdPzle2RqEppjHfPaohFTaelz
 1qIw==
X-Gm-Message-State: AOAM5327ODni6hHDjSGqdnmCtbGwZ/MFWXfOGsDMqYLS6g3ZGsu+XKaa
 WHTm016abSqBlqvTuuJxnScwSQ==
X-Google-Smtp-Source: ABdhPJzIzd8dcbFYjPxE6jALhLzxmnEYjTPXuYfTugOLryQb8Kx0QKwXykIqocZFUn7dTg5aV/o6Lg==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr11713137wrr.76.1634058714718; 
 Tue, 12 Oct 2021 10:11:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k188sm3099740wme.44.2021.10.12.10.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 10:11:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E9EC51FF96;
 Tue, 12 Oct 2021 18:11:52 +0100 (BST)
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
 <20211001153347.1736014-2-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/9] tests/docker: Add debian-nios2-cross image
Date: Tue, 12 Oct 2021 18:03:49 +0100
In-reply-to: <20211001153347.1736014-2-richard.henderson@linaro.org>
Message-ID: <87h7dmw4kn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: marex@denx.de, crwulff@gmail.com, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Build the entire cross tool chain from source.
> For this reason, default to caching.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/docker/Makefile.include                 | 19 ++++
>  .../dockerfiles/debian-nios2-cross.docker     | 34 +++++++
>  .../build-toolchain.sh                        | 97 +++++++++++++++++++
>  3 files changed, 150 insertions(+)
>  create mode 100644 tests/docker/dockerfiles/debian-nios2-cross.docker
>  create mode 100755 tests/docker/dockerfiles/debian-nios2-cross.docker.d/=
build-toolchain.sh
>
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index ff5d732889..2ccd93caa4 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -168,10 +168,28 @@ docker-image-debian-hexagon-cross: $(DOCKER_FILES_D=
IR)/debian-hexagon-cross.dock
>  				qemu/debian-hexagon-cross --add-current-user,		\
>  			"PREPARE", "debian-hexagon-cross"))

We need^H^H^H^H (might need, see bellow) a separate patch with:

docker-image-debian10: NOUSER=3D1

to ensure the images we base our "handbuilt" compilers on don't include
a potentially clashing uid (which should only be added for local
builds).


> +docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-nios2-cross.=
docker
> +	$(if $(NOCACHE), 								\
> +		$(call quiet-command,							\
> +			$(DOCKER_SCRIPT) build -t qemu/debian-nios2-cross -f $< 	\
> +			$(if $V,,--quiet) --no-cache 					\
> +			--registry $(DOCKER_REGISTRY) --extra-files			\
> +			$(DOCKER_FILES_DIR)/debian-nios2-cross.docker.d/build-toolchain.sh, \
> +			"BUILD", "debian-nios2-cross"),				        \
> +		$(call quiet-command,							\
> +			$(DOCKER_SCRIPT) fetch $(if $V,,--quiet)			\
> +				qemu/debian-nios2-cross $(DOCKER_REGISTRY),		\
> +			"FETCH", "debian-nios2-cross")				        \
> +		$(call quiet-command,							\
> +			$(DOCKER_SCRIPT) update $(if $V,,--quiet) 			\
> +				qemu/debian-nios2-cross --add-current-user,		\
> +			"PREPARE", "debian-nios2-cross"))
> +

Could we update the comment above to something like:

  #
  # The build rule for these cross compilers are special in so far for
  # most of the time we don't want to build them. While dockers caching
  # does avoid this most of the time sometimes we want to force the
  # issue. Also we want to ensure the image they are based on hasn't
  # been polluted with our UID because it will fail when users build
  # their local version from what has been pushed upstream.
  #

>  # Specialist build images, sometimes very limited tools
>  docker-image-debian-tricore-cross: docker-image-debian10
>  docker-image-debian-all-test-cross: docker-image-debian10
>  docker-image-debian-arm64-test-cross: docker-image-debian11
> +docker-image-debian-nios2-cross: docker-image-debian10
>  docker-image-debian-powerpc-test-cross: docker-image-debian11
>=20=20
>  # These images may be good enough for building tests but not for test bu=
ilds
> @@ -180,6 +198,7 @@ DOCKER_PARTIAL_IMAGES +=3D debian-arm64-test-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-powerpc-test-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-hppa-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-m68k-cross debian-mips64-cross
> +DOCKER_PARTIAL_IMAGES +=3D debian-nios2-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-riscv64-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-sh4-cross debian-sparc64-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-tricore-cross
> diff --git a/tests/docker/dockerfiles/debian-nios2-cross.docker b/tests/d=
ocker/dockerfiles/debian-nios2-cross.docker
> new file mode 100644
> index 0000000000..208737fc5e
> --- /dev/null
> +++ b/tests/docker/dockerfiles/debian-nios2-cross.docker
> @@ -0,0 +1,34 @@
> +#
> +# Docker NIOS2 cross-compiler target
> +#
> +# This docker target is used for building tests. As it also needs to be
> +# able to build QEMU itself in CI we include it's build-deps. It is also
> +# a "stand-alone" image so as not to be triggered by re-builds on other
> +# base images given it takes a long time to build.
> +#
> +FROM qemu/debian10
> +
> +# Install build utilities for building gcc and glibc.
> +# ??? The build-dep isn't working, missing a number of
> +# minimal build dependiencies, e.g. libmpc.
> +
> +RUN apt update && \
> +    DEBIAN_FRONTEND=3Dnoninteractive apt install -yy eatmydata && \
> +    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
> +    apt install -y --no-install-recommends \
> +        bison \
> +        flex \
> +        gawk \
> +        libmpc-dev \
> +        libmpfr-dev \
> +        rsync \
> +        texinfo \
> +        wget \
> +        $(apt-get -s build-dep --arch-only gcc | egrep ^Inst | fgrep '[a=
ll]' | cut -d\  -f2) \
> +        $(apt-get -s build-dep --arch-only glibc | egrep ^Inst | fgrep '=
[all]' | cut -d\  -f2)
> +
> +ADD build-toolchain.sh /root/build-toolchain.sh
> +
> +RUN cd /root && ./build-toolchain.sh

We need to split this like in hexagon and have a second stage which does
a:

  COPY --from=3D0 /usr/local /usr/local

This will limit the size of the final image (and also avoid duplicting
the UID in the hexagon build).

--=20
Alex Benn=C3=A9e

