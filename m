Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FFB3BAA5A
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 23:41:20 +0200 (CEST)
Received: from localhost ([::1]:35860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lznO2-0007VP-Ms
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 17:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lznNG-0006ir-9p
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 17:40:30 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lznND-0007lh-68
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 17:40:29 -0400
Received: by mail-ej1-x629.google.com with SMTP id nd37so22512727ejc.3
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 14:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wvP0CO3S5s6ud4Dd9pHfct1VBoNuNj5dY04HpSGKAaM=;
 b=Isx8Mta+ZkNT8aaYK8B0yy6bTlewqLCC315Z10trXu3CKHom7L3KehT7R1nxK8EapP
 OrGd2hA7wuILz2N572+Gl/mfNf8bGq3u32YS6hhkdIDf2zrisMSuOHyi2VwGCCh2mK+T
 yop9ue44vXHjo1gZ4A4tVGZhBeDyTxOFV2c43DI9zEB/7p1hyrT58VH8pybgh/ffukrF
 olBxjk0w29MHDl4BrEqY/zUKjNuOjISUvbX3cZw0aXDhW6VcH3+HLnGMeOA4aZkpiged
 BxXzISEOUM9HmHPMzTQFsW54j7Tq6c57Bdk/SlM2BAxByYFpOrr87rBCmIxNq5Uh0wQ9
 YTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wvP0CO3S5s6ud4Dd9pHfct1VBoNuNj5dY04HpSGKAaM=;
 b=taMvR0Nk9QElfvY9a2i4pOuSZZwEbC7X8EEj/FTefCT+SglHxjukeDWF+O3CtsLAKj
 jO3cje/wRtWc0GsAwrRllmaMxCb+aq091scCl9O37PoaAj7iUsWPRDgw9jI8Oj88aK1P
 n5bUU1bVe//iNUvKfLlTjitXz/oz37rymCR8nFmkCozNGbemCFIRad7iCSlFfQhizhsG
 dr9ECO89YYu6R80TuVUZOrFQRaiPIm2MhfWndDJKITQjGSIx9pOUYkgAwEW/31bWGVtd
 /3ddurzQsXQjTLLIT/r89aXGJkHXEHNNFQPVak5AcmuUb1PXGpxcxfe+xlzU4hobvr1p
 hbgA==
X-Gm-Message-State: AOAM530yzEg+M6Wi1BABTlOKrl2KOAcyF6P/nGIATLI9mVGLQwcruSM9
 RPYd8Wy1s2wiEpOnsXZFpJ8KktiJDRRjI1ao/7HYaw==
X-Google-Smtp-Source: ABdhPJzZjvgqfhPpOu/4Vq0k35H0sWnK7oBs7WDljuRY+yHCwkBEi+oKjQ4EiFJlYgxwAKl4DK9VXPvjpxPGLRcwXV8=
X-Received: by 2002:a17:906:99c2:: with SMTP id
 s2mr476556ejn.482.1625348425529; 
 Sat, 03 Jul 2021 14:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAOakUfOhn43BUUGoJPahxmxxTk8vcPeyrgsX0GDmzt46ZriNeA@mail.gmail.com>
In-Reply-To: <CAOakUfOhn43BUUGoJPahxmxxTk8vcPeyrgsX0GDmzt46ZriNeA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 3 Jul 2021 22:39:47 +0100
Message-ID: <CAFEAcA-rhL_BEJMi7a2tCoVE61OV2o5QeDdDfz1JXL9fLvM_cQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Fix for Haiku
To: Richard Zak <richard.j.zak@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 3 Jul 2021 at 22:10, Richard Zak <richard.j.zak@gmail.com> wrote:
>
> For Haiku: turn off TPM, disable mips & xtensa emulators as they won't compile on Haiku, use Haiku's capstone. I'm resending this as I previously sent to the wrong address. This should resolve the memory issue with "make vm-build-haiku.x86_64"


So why don't the mips and xtensa emulators compile on Haiku?
What goes wrong ?

> Signed-off-by: Richard Zak <richard.j.zak@gmail.com>
> ---
>  configure | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index e799d908a3..a965c6c72e 100755
> --- a/configure
> +++ b/configure
> @@ -358,6 +358,7 @@ oss_lib=""
>  bsd="no"
>  linux="no"
>  solaris="no"
> +haiku="no"
>  profiler="no"
>  cocoa="auto"
>  softmmu="yes"
> @@ -769,7 +770,10 @@ SunOS)
>  ;;
>  Haiku)
>    haiku="yes"
> -  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE $QEMU_CFLAGS"
> +  tpm="no"

Why do we need to disable tpm?

> +  capstone="system"
> +  target_list_exclude="mips-softmmu mipsel-softmmu mips64-softmmu mips64el-softmmu xtensa-softmmu xtensaeb-softmmu"
> +  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -I`finddir B_SYSTEM_HEADERS_DIRECTORY`/capstone $QEMU_CFLAGS"

It seems a bit odd that we have to manually put the capstone headers
on the include path. meson.build runs pkg-config to ask where the system
capstone headers are: does Haiku return the wrong value there?

thanks
-- PMM

