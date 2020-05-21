Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC5B1DD331
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 18:42:58 +0200 (CEST)
Received: from localhost ([::1]:48332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jboHY-0000xv-Ng
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 12:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jboGn-0000K7-UM
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:42:09 -0400
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:36700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jboGm-0006Cu-4f
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:42:09 -0400
Received: by mail-oo1-xc41.google.com with SMTP id z6so1573569ooz.3
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 09:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8E/poLvZzRLPdzPli9ukalkP/v2cZkBvpmdtH4RI/Xw=;
 b=eZyh2EoreYs9k+rK4XeDxZjRuLGsib1jv0W4KOn56jGEojb40/3eb50axs3BMKnQPM
 6XbixvXJO3pPXEB9VDCg+vPsG1P/CGC0RjEPRxX8M/60v8fjL638Fnu72hQQcFvsRg2+
 5M1ag/fFMd59yYu+cf3e5q2WoWBd3unUcPpwG2LxUhcsQH7atfUzMZYjbm6mu/p8qkZR
 XllEVAN6urSoeUif2kWQzcKkmNv5ZHcuRsReMAHNYGzNHMs360jE9GxWispRTPPeOJ/Y
 Ml9go81xBH8Xt6JCm3UrtqdYzDubzKURrGDcnzXhbSotjP/lcmPBOki+k7g72y4czfhp
 dWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8E/poLvZzRLPdzPli9ukalkP/v2cZkBvpmdtH4RI/Xw=;
 b=DGOZM0QxVxrDuwbtgqZ7ZcK/JTDHkMPH4T146QXw4DzaQFAZ8ZmIz6VmsYDYVgBKje
 lLlUuza3stIPZAGIbpUGkv3W9boVhrjNRF+gfxgtCsJiwI8K8Yqcxm1XyGpEzechdcOk
 h8n6XqhP2SkCZYDc+9imAOQ3dEpUWVbfpHk9YLiIEhoQHsX/plq0UtZ39+3BmsczGUK4
 B0usgiBLnt35wK8wjngl4Kq97DO933v0ZbK48tTeWdthIUd1Y0jKLt8R/pZGkMe6f7bi
 9323fesZ5TJIURh5SZKvF3f6tRgljPF9W1nEbaNerynCVbZ3tAvTulhl3Fk2prqTEAuj
 yepg==
X-Gm-Message-State: AOAM533zU3GvLMVov150TVPko62/95VUJ+uTdFtrO9v2QCSOXj6ruCzQ
 PvlvsqAT8WrQ1oDjbyIhwBkmI8zmgE94nw+trF3gBA==
X-Google-Smtp-Source: ABdhPJxcWnbu1tQgtA+DqWw0AVv2GsdXos/Yrs0FaYN9fLooxvrtic//VE+dSXhjx85YXkzGutxBnBAnaIB3mYOz9oI=
X-Received: by 2002:a4a:3556:: with SMTP id w22mr7967412oog.20.1590079326635; 
 Thu, 21 May 2020 09:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200520143255.27235-1-e.mikitas@gmail.com>
In-Reply-To: <20200520143255.27235-1-e.mikitas@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2020 17:41:55 +0100
Message-ID: <CAFEAcA_i=HsBtpJh_o4+NWNeUihvNTccfB67gs0WrXttYdTc2A@mail.gmail.com>
Subject: Re: [PATCH] ssi/imx_spi: Removed unnecessary cast and fixed condition
 in while statement
To: Eden Mikitas <e.mikitas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "open list:i.MX31 \(kzm\)" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 May 2020 at 15:33, Eden Mikitas <e.mikitas@gmail.com> wrote:
> When inserting the value retrieved (rx) from the spi slave, rx is pushed to
> rx_fifo after being cast to uint8_t. rx_fifo is a fifo32, and the rx
> register the driver uses is also 32 bit. This zeroes the 24 most
> significant bits of rx. This proved problematic with devices that expect to
> use the whole 32 bits of the rx register.
> I tested this change by running `make check` and by booting linux on
> sabrelite (which uses an spi flash device).
>
> Signed-off-by: Eden Mikitas <e.mikitas@gmail.com>
> ---
>  hw/ssi/imx_spi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 2dd9a631e1..43b2f14dd2 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -182,7 +182,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>
>          rx = 0;
>
> -        while (tx_burst) {
> +        while (tx_burst > 0) {
>              uint8_t byte = tx & 0xff;

When does this make a difference? Looking at the code
I don't think tx_burst can ever be negative at this
point, in which case the two conditions are equivalent.
What was the motivation for this change?

>              DPRINTF("writing 0x%02x\n", (uint32_t)byte);
> @@ -206,7 +206,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>          if (fifo32_is_full(&s->rx_fifo)) {
>              s->regs[ECSPI_STATREG] |= ECSPI_STATREG_RO;
>          } else {
> -            fifo32_push(&s->rx_fifo, (uint8_t)rx);
> +            fifo32_push(&s->rx_fifo, rx);
>          }
>
>          if (s->burst_length <= 0) {

This seems like a separate change to the first one;
in general unrelated changes should be each in their
own patch, rather than combined into a single patch.

The fifo32_push() part of this change looks correct to me.

thanks
-- PMM

