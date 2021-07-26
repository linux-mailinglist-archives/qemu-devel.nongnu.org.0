Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D913D585E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 13:14:29 +0200 (CEST)
Received: from localhost ([::1]:56260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7yZ2-0007Qs-3g
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 07:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7ySh-0004nS-1X
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:07:56 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7ySf-0006Mn-8s
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:07:54 -0400
Received: by mail-ej1-x630.google.com with SMTP id hb6so15759874ejc.8
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 04:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6e6cV89XlK2v89HMMmtC5h9tNKDmc8LAVownlsIndJo=;
 b=ydAJQewm+vQZCYBSGyMS8gYXVRUWP5vQyPi/C0r5+3haFDrfksYxdE4a/pII+gqtM9
 zRxEr/eCSM/m322WcXxXVV3lSRcOf+O9lywNxkIUD/sbsOIXQQbevozkg6GsDAO4iC9i
 JdQHAByS8mXiaE7Mz2Lv9S0gVu0fcllFew2AK8osSykmmWif6z/mUf07dXt764vaf/TB
 AS9gXBoAkDEU+d74jkEHIxUi4eyweiQER5/DxTmllbvsAhiVOzPkdbZBOWqI1UTE0dlm
 JYfuKCcYcm5SWk1kcr2lNOa0K5jOt/X77Tt1e+3IzLjNkW1XYkXb/mVTA004PRwTW7JQ
 5UdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6e6cV89XlK2v89HMMmtC5h9tNKDmc8LAVownlsIndJo=;
 b=MD9LyEt/NFvZNjhbUfxL6e3VqqkZjkM3/r+eB/U8b0AsyV9FAZ6pKKFDaxlu9zD0hU
 jj0rMmEsOa/A5CpfeJEi7Cxzj92v2AAK/18ukRS8DMoxDfzLomDWHPLfUGn9CmPc5D57
 La0lsHLVBr9cizUwc0hc2/9rpb9XvZkJPaycs4vrHkosR2CcSJltYgRHxrr6YMeeyQho
 5zOr7BR7N7xH/JwrpUrw3h34fNGERGm+syJdUTSORwcIES8Cu/WgX6+vexQINM9Uly7K
 RKTY4gGAImCe4zl+zIrZgn6DfNG84UUPKrO6ejtdWRaFGFXLT7ng1fDyxP1V3E8u4QNo
 Ggag==
X-Gm-Message-State: AOAM531RxRjWdFHrsl0FoWbuDf3U7+3xEGUwu24nFFehDO3Sa8zLNdvi
 epeCdcThuC2ugW8DlgX4ja4NR+7sRuo7VVwNkZBqRw==
X-Google-Smtp-Source: ABdhPJwc0sM8FjoJoJ8jg96+tiPJPXCwTbgkF9edTkirRbgHBBAk+dLjD/V5BgP24j/v7Gy7j/g/LzOfwhQgjn3MLSc=
X-Received: by 2002:a17:907:3581:: with SMTP id
 ao1mr16664821ejc.85.1627297671385; 
 Mon, 26 Jul 2021 04:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210723203344.968563-1-richard.henderson@linaro.org>
 <20210723203344.968563-4-richard.henderson@linaro.org>
In-Reply-To: <20210723203344.968563-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 12:07:09 +0100
Message-ID: <CAFEAcA_0_cGcSDFVk+WqUS9Koi9hsQjRs7=7O1jiqQwv5fO2+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] target/arm: Add sve-default-vector-length cpu
 property
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Jul 2021 at 21:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mirror the behavour of /proc/sys/abi/sve_default_vector_length
> under the real linux kernel.  We have no way of passing along
> a real default across exec like the kernel can, but this is a
> decent way of adjusting the startup vector length of a process.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/482
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  docs/system/arm/cpu-features.rst | 11 ++++++
>  target/arm/cpu.h                 |  5 +++
>  target/arm/cpu.c                 | 14 ++++++--
>  target/arm/cpu64.c               | 60 ++++++++++++++++++++++++++++++++
>  4 files changed, 88 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index c455442eaf..4ff36cc83f 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -376,3 +376,14 @@ verbose command lines.  However, the recommended way to select vector
>  lengths is to explicitly enable each desired length.  Therefore only
>  example's (1), (4), and (6) exhibit recommended uses of the properties.
>
> +SVE User-mode Default Vector Length Property
> +--------------------------------------------
> +
> +For qemu-aarch64, the cpu property `sve-default-vector-length=N` is

You probably don't want single-backticks. In rST this means
"interpreted text", which can be handled as a bunch of different
things if tagged with a specific "role":
https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#interpreted-text
The default "role" if none is specified is "title_reference", intended for
references to book or article titles, and it renders into the HTML
as <cite>...</cite> (usually comes out as italics).

If you want fixed-width-font text, that's double backtick: ``text``.
If you want italics, that's *emphasised text*.
If you want bold, that's **strong text**.

> +defined to mirror the Linux kernel parameter file
> +`/proc/sys/abi/sve_default_vector_length`.  The default length, `N`,
> +is in units of bytes and must be between 16 and 8192.
> +If not specified, the default vector length is 64.
> +
> +If the default length is larger than the maximum vector length enabled
> +with `sve<N>` properties, the actual vector length will be reduced.

We should document the -1 case too, something like:

If this property is set to ``-1`` then the default vector length
is set to the maximum possible length.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

