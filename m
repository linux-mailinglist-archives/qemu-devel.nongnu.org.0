Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5A1345029
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 20:45:06 +0100 (CET)
Received: from localhost ([::1]:37440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOQU4-0004r5-L4
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 15:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOQOs-0000v7-Ht
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 15:39:42 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOQOo-00050X-BR
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 15:39:42 -0400
Received: by mail-ej1-x633.google.com with SMTP id w3so23236955ejc.4
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 12:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=kprDOaVSa4s7UXNRoHa8XnrcKBOMX5ybwZXYW7et6Do=;
 b=Lur6Kk3bdHakXnFNcE3hVHWgUXmR8a3P92pDd2UPsOsObsmRoCTPMbOqGYtzaGSf38
 q3EkjhUqWb+dHO6PXG9F109aBO1Pn8U1yEuyyLsZGcWkbiKd435U4XJjCGWFcPg82Ajf
 WjYqmyyUAzramZ9MO+a0qDfvkr5dzWcOl+tyqzCaR9uYJ3eqXcCFF7mqaQLROBI70B+U
 PDh8dqs2FwSRPB10sFjdJo6aZ4fmFX1cvU85ZOrTrWQWbiCdziOtZKS1oQ9ROATJPneE
 uEkW4+9C7Z0JvIz9ieAzcRDa/1GKMJYWiKEk0puKG3VnZbs0sQSstIXbJHRTEDhj+l6o
 KlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=kprDOaVSa4s7UXNRoHa8XnrcKBOMX5ybwZXYW7et6Do=;
 b=IimGQ2wOhFvCLS/3L5k2/Du/WF2Zehuwo65P9vrDVhZAnijbgqJ7w/itSJ5koa/z4E
 YaGnpn7gPk5GrkuRLWuMItFOHddLs2C+G4f00ky9xmiQMgQMj/UhEOF9C7t4rAh+LFZL
 oFOGCyUCiLP4FaDUspBGVP39j42VAlgiq8a50JXYTRQ8XrktAJwXelX0FiJQxJ74TarF
 K5Z+x7D572QLlhhPt3wtWbCFXRcpLpd4b47EelmZ+UErUGWrks5/FWXPpUA2GE7kU+Bt
 AEYIXQimEjxnflreFKT2ds+vUKURLbJN0rLaXsGJsjpgdF90KuzW29PAT9BkLIi50ziD
 JkWw==
X-Gm-Message-State: AOAM531A0Ew/C3QQiq0Hc1SQ0HXT+eoncxKNnbKQ5s4bA4AaiSv7SmpW
 GXOrB2oSYB9knGr1WNmfspqPZg==
X-Google-Smtp-Source: ABdhPJzSKal96eu5uN2msfqNp5ZwHHB13sv+LIrA94QpPCy6/PFio5IxmJfE8WB1icae8fdm2vf+zw==
X-Received: by 2002:a17:907:778d:: with SMTP id
 ky13mr1360637ejc.291.1616441976686; 
 Mon, 22 Mar 2021 12:39:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id da17sm12041220edb.83.2021.03.22.12.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 12:39:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3285F1FF7E;
 Mon, 22 Mar 2021 19:39:35 +0000 (GMT)
References: <20210322175238.4503-1-alex.bennee@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2] gitlab: default to not building the documentation
Date: Mon, 22 Mar 2021 19:39:05 +0000
In-reply-to: <20210322175238.4503-1-alex.bennee@linaro.org>
Message-ID: <874kh3j7uw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> In d0f26e68a0 ("gitlab: force enable docs build in Fedora, Ubuntu,
> Debian") we made sure we can build the documents on more than one
> system. However we don't want to build documents all the time as it's
> a waste of cycles (and energy). So lets reduce the total amount of
> documentation we build while still keeping coverage of at least one
> build on each supported target.
>
> Fixes: a8a3abe0b3 ("gitlab: move docs and tools build across from Travis")
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>
> ---
> v2
>   - enable for OpenSUSE LEAP and Centos8 as well

Predictably these two fail the documentation build :-/

>   - disable for all cross builds
>   - minor re-word of the commit text
> ---
>  .gitlab-ci.d/crossbuilds.yml | 15 ++++++++-------
>  .gitlab-ci.yml               | 16 ++++++++--------
>  2 files changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index d5098c986b..2d95784ed5 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -6,10 +6,10 @@
>      - mkdir build
>      - cd build
>      - PKG_CONFIG_PATH=3D$PKG_CONFIG_PATH
> -      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-user
> -        --target-list-exclude=3D"arm-softmmu cris-softmmu i386-softmmu
> -          microblaze-softmmu mips-softmmu mipsel-softmmu mips64-softmmu
> -          ppc-softmmu sh4-softmmu xtensa-softmmu"
> +      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
> +        --disable-user --target-list-exclude=3D"arm-softmmu cris-softmmu
> +          i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
> +          mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
>      - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>=20=20
>  # Job to cross-build specific accelerators.
> @@ -25,8 +25,8 @@
>      - mkdir build
>      - cd build
>      - PKG_CONFIG_PATH=3D$PKG_CONFIG_PATH
> -      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
> -        --enable-${ACCEL:-kvm} $ACCEL_CONFIGURE_OPTS
> +      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
> +        --disable-tools --enable-${ACCEL:-kvm} $ACCEL_CONFIGURE_OPTS
>      - make -j$(expr $(nproc) + 1) all check-build
>=20=20
>  .cross_user_build_job:
> @@ -36,7 +36,8 @@
>      - mkdir build
>      - cd build
>      - PKG_CONFIG_PATH=3D$PKG_CONFIG_PATH
> -      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-system
> +      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
> +        --disable-system
>      - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>=20=20
>  cross-armel-system:
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 9ffbaa7ffb..c9c4079dbb 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -23,9 +23,9 @@ include:
>      - cd build
>      - if test -n "$TARGETS";
>        then
> -        ../configure --enable-werror $CONFIGURE_ARGS --target-list=3D"$T=
ARGETS" ;
> +        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS --ta=
rget-list=3D"$TARGETS" ;
>        else
> -        ../configure --enable-werror $CONFIGURE_ARGS ;
> +        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS ;
>        fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
>      - if test -n "$LD_JOBS";
>        then
> @@ -119,7 +119,7 @@ build-system-ubuntu:
>      job: amd64-ubuntu2004-container
>    variables:
>      IMAGE: ubuntu2004
> -    CONFIGURE_ARGS: --enable-fdt=3Dsystem --enable-slirp=3Dsystem
> +    CONFIGURE_ARGS: --enable-docs --enable-fdt=3Dsystem --enable-slirp=
=3Dsystem
>      TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
>        moxie-softmmu microblazeel-softmmu mips64el-softmmu
>      MAKE_CHECK_ARGS: check-build
> @@ -223,7 +223,7 @@ build-system-centos:
>    variables:
>      IMAGE: centos8
>      CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=3Dsyst=
em
> -                    --enable-modules
> +                    --enable-modules --enable-docs
>      TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
>        x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
>      MAKE_CHECK_ARGS: check-build
> @@ -257,7 +257,7 @@ build-system-opensuse:
>      job: amd64-opensuse-leap-container
>    variables:
>      IMAGE: opensuse-leap
> -    CONFIGURE_ARGS: --enable-fdt=3Dsystem
> +    CONFIGURE_ARGS: --enable-docs --enable-fdt=3Dsystem
>      TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
>      MAKE_CHECK_ARGS: check-build
>    artifacts:
> @@ -443,7 +443,7 @@ build-user-centos7:
>      job: amd64-centos7-container
>    variables:
>      IMAGE: centos7
> -    CONFIGURE_ARGS: --disable-system --disable-tools --disable-docs
> +    CONFIGURE_ARGS: --disable-system --disable-tools
>      MAKE_CHECK_ARGS: check-tcg
>=20=20
>  build-some-softmmu-plugins:
> @@ -607,7 +607,7 @@ tsan-build:
>      job: amd64-ubuntu2004-container
>    variables:
>      IMAGE: ubuntu2004
> -    CONFIGURE_ARGS: --enable-tsan --cc=3Dclang-10 --cxx=3Dclang++-10 --d=
isable-docs
> +    CONFIGURE_ARGS: --enable-tsan --cc=3Dclang-10 --cxx=3Dclang++-10
>            --enable-trace-backends=3Dust --enable-fdt=3Dsystem --enable-s=
lirp=3Dsystem
>      TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-u=
ser
>      MAKE_CHECK_ARGS: bench V=3D1
> @@ -619,7 +619,7 @@ build-deprecated:
>      job: amd64-debian-user-cross-container
>    variables:
>      IMAGE: debian-all-test-cross
> -    CONFIGURE_ARGS: --disable-docs --disable-tools
> +    CONFIGURE_ARGS: --disable-tools
>      MAKE_CHECK_ARGS: build-tcg
>      TARGETS: ppc64abi32-linux-user lm32-softmmu unicore32-softmmu
>    artifacts:


--=20
Alex Benn=C3=A9e

