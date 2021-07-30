Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B0F3DB736
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 12:37:57 +0200 (CEST)
Received: from localhost ([::1]:46140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Pts-0006yt-85
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 06:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9Psp-0005sc-A2
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:36:52 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:45888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9Psm-0003YA-QX
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:36:51 -0400
Received: by mail-ed1-x531.google.com with SMTP id x14so12462360edr.12
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 03:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3BSnEsKtnMUfjtuJ2cmvipbicq8L+ExXFMKJLSrmWY0=;
 b=lkYSaKluujz5Vjy8j2UUksk8/7LWtvTnRoWrD2zO3x8nXb3p4f9u3jUBL/BTQHQB4P
 GoKop+5Blvj9pwWx6H60m86KMzIBP2DlM2rXexDqsbsxK3e1AlgwkT321S4muNptNFcl
 BG+cufR8PqXkFu8z+/X8IRbAmCkQWDp6vzX5aEBUxs86yYlCUylGUMrSXCS1MYVUNvp4
 PlqmZ9yovjR2Bes0xgFCsIVy4nyQrCXuNM2mt5Sh+TSXAGQ6hqOAqi6Qd+CYlSaI4Hvf
 +gV4rcBpaqOYppSziGocB95+gkx4kcD7J6vKuVqAXdaqRTxoff6M8HQKVpnXfrwCloAs
 hBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3BSnEsKtnMUfjtuJ2cmvipbicq8L+ExXFMKJLSrmWY0=;
 b=FSuRJ1lnq+JCpcaZxnbfnqvD7rO9KruT3NTm/lnaowtrWXpGTgOW+Iq+DWT/LgZlqS
 i1RG1iz4SETB2hdl2rYE/wUEDwjQp4n7BBZ7U1DVcyIodJUnzvkbN+g2zG4eg9lsoJPW
 8NIZHMhQT1DKchPplB0pDOgJJBPYbsSlaSUPfFVz5Ari4h+74c/ps9eVzxRrT+NqhoNt
 R8/nRtSE0PS4rF0TY/EWat6bmJTZkaXwz85cstxtuUEiP4dXJjwJD+ElDFTl/+xV2ALu
 bSn3hQDoqnqiLCa8qR9B7B49QHDYsS9lqM1aYF2lqsuKfA5p7JlaBhNMvOcocPCwT/va
 RaUg==
X-Gm-Message-State: AOAM5300jqgzhac4WDNewNoOS8tZ68uYwjX3d8PGfCwuu0vDRD9Ght3e
 9bRtNaBrejtc9m9MMJpLxOP3ZDJeBpejUImFdPNXqFNs9Ik=
X-Google-Smtp-Source: ABdhPJyiOX5nL4FNHpMbRLI0JjqvoJaSOU8255eq75ncwsNaBZB1DRB4S/ireywTXjJP2rshMu8Wv6yLH2/me3eKTx8=
X-Received: by 2002:a05:6402:31e6:: with SMTP id
 dy6mr2197416edb.36.1627641407361; 
 Fri, 30 Jul 2021 03:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
 <20210730030821.231106-4-ishii.shuuichir@fujitsu.com>
In-Reply-To: <20210730030821.231106-4-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Jul 2021 11:36:04 +0100
Message-ID: <CAFEAcA-F3V2ByQ=AJjNWU8H1FHiHZBUYAN4UAfEFMjmo8PK7eA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] target-arm: Add A64FX processor support to virt
 machine
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 30 Jul 2021 at 04:08, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> Fix for patch consistency.
> https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg06993.html

Commit messages should describe what the patch is doing and why,
so the reader can understand it without having to cross-reference
old mailing list threads.

> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  docs/system/arm/virt.rst | 1 +
>  hw/arm/virt.c            | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 27652adfae..5329e952cf 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -55,6 +55,7 @@ Supported guest CPU types:
>  - ``cortex-a53`` (64-bit)
>  - ``cortex-a57`` (64-bit)
>  - ``cortex-a72`` (64-bit)
> +- ``a64fx`` (64-bit)
>  - ``host`` (with KVM only)
>  - ``max`` (same as ``host`` for KVM; best possible emulation with TCG)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 81eda46b0b..10286d3fd6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -200,6 +200,7 @@ static const char *valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
> +    ARM_CPU_TYPE_NAME("a64fx"),
>      ARM_CPU_TYPE_NAME("host"),
>      ARM_CPU_TYPE_NAME("max"),
>  };

thanks
-- PMM

