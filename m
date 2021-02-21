Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79634320DB1
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:47:18 +0100 (CET)
Received: from localhost ([::1]:46730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDvdN-0003bh-Ei
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:47:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDvbz-0002GP-GI
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:45:51 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDvbx-0001h9-1w
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:45:51 -0500
Received: by mail-ed1-x536.google.com with SMTP id s11so19417171edd.5
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 12:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ziQ5xtus7V6Jviby2eYGAEEhwrtxsh09dFvrzFZAfuU=;
 b=fn6Ifp1pZw04kjFiWELgId3IsCBLMomldrx8kHF/0BrrFvaGXBW7JYJB4Dhd5nS1rP
 KC69+93Kx9vv+okVsNy/Qpjs/58UX+a4hAET3CgWLbOKrt5eNBEvaCHefKqL/I0sMKkn
 ILrpATH8xA2yUYM5R/1WNulXIqOOyOzT/Ct0iqMcrtBR2AKU+FjsAqYoPCWeukiBxF6q
 nYDDSHhBWFnMv2yKOGO+9IRRL3eo6zyej84VKUGMlbhoaOvgLgKUJ7m8okpL25Kyr1o5
 g9qWjKjpKrBpKzxW9dP9XRhXgXouG6G50Ir64rwED4+x2Iu0qvTLPDvYK1wq3N2tsTDH
 uYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ziQ5xtus7V6Jviby2eYGAEEhwrtxsh09dFvrzFZAfuU=;
 b=PvWeGqEWdW1zLqowThix02gY5mBSM+vnI6deHMaFaKc8T/eywOC9vqRIMusnE5EHy3
 s4Z+Qw89f12IQ9JP3XCSocpsghYBEscfneh+43NjKUFnqKEGvmYyjc/mlCKHj6GarMHP
 HU/8SrLaa8e0FYPHqi6SzC1kt7KOeqDd4uXfahI/brXAhLJzYhxI+rTmHxz8KeWS1hg4
 9N4Jp/xAVkWblyAyK9dgqjxlZ90TngSTKDRJ9rM5Xz4w+th75O8/pCSUZO0qI/mRwsSK
 0faQPgl2T+kF4JTWCKmHQ9A21QWrGBslY9YlTcDm32oUsQxTKPG7n8tAYKXzTIGJf1dE
 yp+Q==
X-Gm-Message-State: AOAM532JAhidUtN/Ytzmi2+01GUj8L6hbo2OORtioc3jtXVECtLSfsQU
 2W/ccrWBKmFxgZwfqubKmEY7JBUcHgqgv+EficwGxw==
X-Google-Smtp-Source: ABdhPJyOWZbLssPk0g1N6y4HAnDql5AT94k2lI1b/GnCWsL5AY6vxpGMfbE6rkTTgjP7tcqsLOJDoJP6DMVUxJEmO6M=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr19334664edd.52.1613940347606; 
 Sun, 21 Feb 2021 12:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20210221200249.2536247-1-f4bug@amsat.org>
 <20210221200249.2536247-5-f4bug@amsat.org>
In-Reply-To: <20210221200249.2536247-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 20:45:36 +0000
Message-ID: <CAFEAcA9=KJKSKEdRae5q4xN6oAB6mt8R_C5H8nCFGLHY0jsp6w@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] hw/char: Introduce SH_SCI Kconfig entry
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Qemu-block <qemu-block@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 at 20:03, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We want to be able to use the 'SH4' config for architecture
> specific features. Add more fine-grained selection by adding
> a CONFIG_SH_SCI selector for the SH4 serial controller.
>
> Add the missing MAINTAINERS entries.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS         | 2 ++
>  hw/char/Kconfig     | 3 +++
>  hw/char/meson.build | 2 +-
>  hw/sh4/Kconfig      | 1 +
>  4 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index da10756abf7..34587d90637 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1387,6 +1387,7 @@ R2D
>  M: Yoshinori Sato <ysato@users.sourceforge.jp>
>  R: Magnus Damm <magnus.damm@gmail.com>
>  S: Odd Fixes
> +F: hw/char/sh_serial.c
>  F: hw/sh4/r2d.c
>  F: hw/intc/sh_intc.c
>  F: include/hw/sh4/sh_intc.h
> @@ -1395,6 +1396,7 @@ Shix
>  M: Yoshinori Sato <ysato@users.sourceforge.jp>
>  R: Magnus Damm <magnus.damm@gmail.com>
>  S: Odd Fixes
> +F: hw/char/sh_serial.c
>  F: hw/sh4/shix.c
>  F: hw/intc/sh_intc.c
>  F: include/hw/sh4/sh_intc.h

I didn't realise you could list a file twice in MAINTAINERS,
but we I guess we already do for sh_intc.c.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

