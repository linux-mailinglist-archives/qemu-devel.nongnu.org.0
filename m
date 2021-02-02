Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DF430BC1B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 11:35:42 +0100 (CET)
Received: from localhost ([::1]:49082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6t22-000617-Jk
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 05:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6t0j-0005SO-F8
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:34:17 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:36405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6t0h-0005dT-D7
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:34:17 -0500
Received: by mail-ej1-x62d.google.com with SMTP id lg21so1821442ejb.3
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 02:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oYCKgYeTZFIXYzlgfOx5yK9+kfLjp/kYudqFD9ohZU0=;
 b=dO6hhg1GHVOjQPHXePsA0p8jBPb9Nkl2JJfliTN1opjL5WnHYdqtCMDG0f5BGqgbUw
 p1y0KasxRn7BW4Key6E0Do82hQoFCq4MlqjYTPdeDYOR7tovhchavIlkDtfN9zc45oUg
 ONJP2mO1jPBzr3db/Jfqob/Alkm7SEveqGqti4/xI0yOwRDgxeb+BbRdkyK8JsCpxg6A
 RtkRO4oYX8gqIhB9BEUihKfOuP8RIUBqHWa3Hn2v1PbE6BXaA4fuxQYsEjBmYWEa4fwV
 +BfO0pyuyHWyYJsOJlYhdvQuN4B7M/LDGYd54FAXwvVGEJSvS20qOeHMSqBbwS70VGBN
 bcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oYCKgYeTZFIXYzlgfOx5yK9+kfLjp/kYudqFD9ohZU0=;
 b=r1V+8vp/KM5BGjQSWKyfVZZTZfGAqTFhhvEki5AXnXhqhzQP5d+/Dy2LNtZovFrOFj
 a2peBKibKDm7Ivsyv5tdtk1as7Vzcl2jjmxvVloFMyLSNdZXjfgRoUP7Gb1ELTxvuzrD
 Ivx9CA4pSAvJBu5Ndxr7/pizuXv5Qg1KtPuuanWo9RaAlZLiO76LonfSFLoWf5Kvrv8B
 MXP4m7q6FeZH3Np45hEMoguiCjvjIlAX8T2u7PGIdVTtf9skJhN50X0KM3YYX/MxqfWc
 H/hKjWPUWT+YIH4dmORCX+z3aPSx93LBG+cU6DdruZ1fDEJviSN1xhUPD1C867SGgV/2
 bhAQ==
X-Gm-Message-State: AOAM532CwRoIzPTZGjxXj57Jg7MjZJuZEMNJER+OZU5Qtp6wai2+Auxp
 udlJ+XZ2SHK/fbYwCHQBA8MjCSRBtPfVaHsjueChnA==
X-Google-Smtp-Source: ABdhPJyqI30Ce/DFDhiUtDBdzI86EcSvNMY5V6Vlyc3uDB+InpAPPbi0VGfBU3BtURrNfKSoLk3IxPVBfTIBiGF+dT8=
X-Received: by 2002:a17:906:5917:: with SMTP id
 h23mr11011083ejq.407.1612262053882; 
 Tue, 02 Feb 2021 02:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20210124025306.3949-1-leif@nuviainc.com>
 <20210124025306.3949-4-leif@nuviainc.com>
In-Reply-To: <20210124025306.3949-4-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 10:34:02 +0000
Message-ID: <CAFEAcA8M6kfy-xfBViMjDLM-XSKcBSie+6nhSCWGQpRy3+PdGg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] hw/intc: set GICD_TYPER.DVIS for GICv4
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 24 Jan 2021 at 02:53, Leif Lindholm <leif@nuviainc.com> wrote:
>
> The VLPI frames are what make the redistributor size change, so ensure
> we state in GICD_TYPER that we have them.
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  hw/intc/arm_gicv3_dist.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
> index b65f56f903..833deb0a74 100644
> --- a/hw/intc/arm_gicv3_dist.c
> +++ b/hw/intc/arm_gicv3_dist.c
> @@ -387,6 +387,9 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
>
>          *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
>              (0xf << 19) | itlinesnumber;
> +        if (s->revision == 4) {
> +            *data |= (1 << 18);;
> +        }

Double semicolon.

>          return MEMTX_OK;
>      }
>      case GICD_IIDR:

I think I'd prefer not to take this patch in mainline for the moment:
it would be "safe", in the sense that it doesn't affect anything,
but it's not the only thing in this register that changes for GIC
versions > 3, and it would make a lot more sense to go in as part
of the general support for the feature the bit is advertising.

thanks
-- PMM

