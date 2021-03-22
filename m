Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F20344C99
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:02:57 +0100 (CET)
Received: from localhost ([::1]:60712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONxA-0003kA-EM
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lONu6-0002QU-CK
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:59:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lONu1-0008LH-8c
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616432379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4GBh6p1x7mY06qawPUFNwJ4jg8DE/9k4ygWz+g8p6ns=;
 b=DWim7aQeJzz3IvKOh0lQ60xUTrX5HxA1XZyxrWlxiyAXBhj0Mq1IIw6TwmVzoeqh4MuYqJ
 k2y6mH4JtAtkaFqEE8R77FsJjaLYHkaX+lK/yu4T+M1Q8sHDsZXAE6JtDjAH4h5w8rqBcK
 KA7+tXYTIAIqcFZCBLn/xKaqEa2x8u4=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-z3z11I7kMMehTUa4nf47ew-1; Mon, 22 Mar 2021 12:59:37 -0400
X-MC-Unique: z3z11I7kMMehTUa4nf47ew-1
Received: by mail-vk1-f198.google.com with SMTP id 131so15068358vkz.2
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 09:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4GBh6p1x7mY06qawPUFNwJ4jg8DE/9k4ygWz+g8p6ns=;
 b=nyFyUjJC8MsEVfPI2q7GGd7LP+1RTlltojfFwZ+4mJQpCieUNZ1opJjRFhVL1Q7MvY
 CwJWBDQR+CyswAGcKKjO5vfirJ6KiYtHk+/aJ9YcdLLqv77EzlqwU+FhEZ46DvrRaaGd
 PcedRh+vy7WF3scg+TTx5z6KbZfRB0d5hnkAFCMxDmEn1j+uB0ZZBUQ79CWV97tzlnVf
 WYplgVfMJY+OSFlMOfSOIuaB6RPVk/coeX+U1AK7k0/IJQ2mtTtZwxp+vE7wcrxu1g1D
 uPWa077Z1URriWDNy2gWBbBr2XuUUxG3M1WJwdX3RyVQTBs9KfJCFAPAJ3vsxTJqG9Vq
 Nb/Q==
X-Gm-Message-State: AOAM5316Aj5xoV/RfgShpopGnurDN0kIoXds5COKXbGcv2CdUd1e4P9t
 oIVmaOi3HkHpT0P0lrFSJmyIox7+lhHTnLF/CWLGCpBrhdda3dCcg8AocATm0A6jJNujoQ6ceOd
 UY3ndP2SOj5rIWsErX/EGdrLe0rS4ml0=
X-Received: by 2002:a67:3241:: with SMTP id y62mr565569vsy.45.1616432377258;
 Mon, 22 Mar 2021 09:59:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQRAC2nnJI1UzoAf5ni640EblROyRYYWwj1qF+UNqdi9qgtB293vZK0KnB/GWW4WlrZ0cO5A8sscTvNnadn38=
X-Received: by 2002:a67:3241:: with SMTP id y62mr565551vsy.45.1616432377012;
 Mon, 22 Mar 2021 09:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210322144140.13505-1-alex.bennee@linaro.org>
In-Reply-To: <20210322144140.13505-1-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 22 Mar 2021 13:59:11 -0300
Message-ID: <CAKJDGDb2znmCxRLV8PeHMb5rs3W+sMb5W_DUBydRkk4Ai9OfvA@mail.gmail.com>
Subject: Re: [RFC PATCH] gitlab: default to not building the documentation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 11:41 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> In d0f26e68a0 ("gitlab: force enable docs build in Fedora, Ubuntu,
> Debian") we made sure we can build the documents on more than one
> system. However we don't want to build documents all the time as it's
> a waste of cycles (and energy). So lets reduce the total amount of
> documentation we build while still keeping some coverage.
>
> Fixes: a8a3abe0b3 ("gitlab: move docs and tools build across from Travis"=
)
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.yml | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 9ffbaa7ffb..7714c7cac8 100644
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
> @@ -443,7 +443,7 @@ build-user-centos7:
>      job: amd64-centos7-container
>    variables:
>      IMAGE: centos7
> -    CONFIGURE_ARGS: --disable-system --disable-tools --disable-docs
> +    CONFIGURE_ARGS: --disable-system --disable-tools
>      MAKE_CHECK_ARGS: check-tcg
>
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
> --
> 2.20.1
>


