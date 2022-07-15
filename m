Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F320D57648E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 17:40:45 +0200 (CEST)
Received: from localhost ([::1]:42024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCNQn-0005Br-Lf
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 11:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCNOg-0001vs-W3
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 11:38:31 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:43977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCNOe-0002d0-59
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 11:38:30 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-31df2545d87so27752787b3.10
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 08:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bQ28LxSKCjjYmzSLGbZc3jd+smOUB2hYE7Be/XzSJtU=;
 b=owos9V7E6Xio/bZoTJc5F0nCNV1Akdm6p1kAOHxBCxaMDcJdk8IrVLHh9DU4elj1L3
 nuJ3HZZt+pNn8rFOyLlUznV8JlMOUIhLm2iuHkeCdnBcI1BDsgpweDRPny5Hr9da+0pf
 sXMN5hEmxkgeN3X8uk/xnj7pAZNQG0fHxZnLRGRnOaqv1c4hRn+jXvKHime/0OpjZNJx
 2a4uotOJWe79OMM1vVTkT1ZNk5WV97JPfV46nv4iZLLncalSreXQ3vhMtVCSOPB5GmpO
 l9LmBn4cEEQfweVcJ2M2S5IuRkmBQaZ2RG30mAX24sgnFhBFqB78a4ylgeI1OWZBxrnc
 rN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bQ28LxSKCjjYmzSLGbZc3jd+smOUB2hYE7Be/XzSJtU=;
 b=J0cJCe9cXJJGAO7r6YAxpQwJAUBTI0cL6cjG1jI1zTSaQ3f07S9JsYNf/Ngqrgb1a0
 fP2hNLrHdC2LOspkCNOsDNjVHmHrwWwbmas27i1q0a/0/wgMPNWf1jJqAgyQgQMob/Jv
 UM7CRRJTbcqDU2ssfMqW3V0N4pRAcGksyAwIgJ2u/cDN/3/iL2nO7AJZFzDGKJH4QF2j
 GcautvgTXHMhsPBUM/OWhqdQzR9yp734KvU6DjQ50/XqY/ow7pifiLOuYEfuciMHEGrl
 v2hYw2wR/HJ4fqPMwzpnWyQiigS3ttEx+QWojGhehtT0M8/S32rpP7zef2RRLZf0AcYU
 jXZg==
X-Gm-Message-State: AJIora+xJbWLq0lE2t0mOPUxBs1C2HvBT+Cn6VKF2fuxVryZalvLY0IA
 JDyFEpmDIg+WzHODA93i89HaVbPDnHWS4rOyGtmpCA==
X-Google-Smtp-Source: AGRyM1t88Z32PW1xV1cMk6ElVvYpKrQ9ym2pDKPCzESZfmopiwcTWQ5Rz9Ndf5pTV5DQWNQtSzoUMVSnAFxxyNY2U7M=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr16440026ywb.257.1657899507196; Fri, 15
 Jul 2022 08:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-3-wuhaotsh@google.com>
In-Reply-To: <20220714182836.89602-3-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jul 2022 16:37:48 +0100
Message-ID: <CAFEAcA8G2HxqNXHg-Yo-nSpVikTOmZFvhD1T12kR8L8PftNw4Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX
 SMBus
To: Hao Wu <wuhaotsh@google.com>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, armbru@redhat.com, thuth@redhat.com, 
 Titus Rwantare <titusr@google.com>, Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jul 2022 at 19:28, Hao Wu <wuhaotsh@google.com> wrote:
>
> Originally we read in from SMBus when RXF_STS is cleared. However,
> the driver clears RXF_STS before setting RXF_CTL, causing the SM bus
> module to read incorrect amount of bytes in FIFO mode when the number
> of bytes read changed. This patch fixes this issue.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> ---
>  hw/i2c/npcm7xx_smbus.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
> index f18e311556..1435daea94 100644
> --- a/hw/i2c/npcm7xx_smbus.c
> +++ b/hw/i2c/npcm7xx_smbus.c
> @@ -637,9 +637,6 @@ static void npcm7xx_smbus_write_rxf_sts(NPCM7xxSMBusState *s, uint8_t value)
>  {
>      if (value & NPCM7XX_SMBRXF_STS_RX_THST) {
>          s->rxf_sts &= ~NPCM7XX_SMBRXF_STS_RX_THST;
> -        if (s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
> -            npcm7xx_smbus_recv_fifo(s);
> -        }
>      }
>  }
>
> @@ -651,6 +648,9 @@ static void npcm7xx_smbus_write_rxf_ctl(NPCM7xxSMBusState *s, uint8_t value)
>          new_ctl = KEEP_OLD_BIT(s->rxf_ctl, new_ctl, NPCM7XX_SMBRXF_CTL_LAST);
>      }
>      s->rxf_ctl = new_ctl;
> +    if (s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
> +        npcm7xx_smbus_recv_fifo(s);
> +    }
>  }

I don't know anything about this hardware, but this looks a bit odd.
Why should we care what order the driver does the register operations
in? Do we really want to read new fifo data regardless of what value
the driver writes to RXF_CTL ? Should the logic actually be "if the
new device register state is <whatever> then read fifo data", and
checked in both places ?

thanks
-- PMM

