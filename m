Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2712EE67B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:02:57 +0100 (CET)
Received: from localhost ([::1]:35766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbUm-0003M2-Fa
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:02:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxbT6-00021g-G2
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:01:19 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxbT4-0004b9-KO
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:01:12 -0500
Received: by mail-ej1-x630.google.com with SMTP id g20so11492054ejb.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5xw3j+kjjmJJDjmlmsVhdRn/Wx0+xXxnfBFmqL2+YXA=;
 b=xfR6lIs5ZhLXs57eL2Nm+cD4fhjqRhlM/nUvD4T6GYFnrqWTHn4HbOtZhn3CAcwLM+
 WpYWPGRILHJFAfbWIQbfXb9cisFxN9JXnUpaeTTeen2QWrhqzN/LYd4Uy0COcBaMmuAB
 xd1EWE+pEV4KVhvR2/7gHhW5lNL2TI1bSFzLlROHWibR1ZwrW0gWtJZyqkjiYWIGLnM2
 rtljSwm5veCxuB+7ZWrqqvufdJRepVI2qN+99BYoRDWlwzELEOxbDW2zxIuTxw53IZpi
 DVUcERZaajOByokWXuz2aY6tDiUHPm490MZW5IgoqQkHJs0g2zV4fDMVNBGV+rFasfvb
 BVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5xw3j+kjjmJJDjmlmsVhdRn/Wx0+xXxnfBFmqL2+YXA=;
 b=NeDVAFITCbMUTl0axX8yDwIfYGdKagP1JkhGTGGQEa3TwGjblarFIp475TGcUql2hP
 sA0fex6QXKJnuOL3Zoy+rZ3bo2ygavyW2ExmkdT2b0cGrViZk45SQ0Yv12/E09w43fvh
 TMIOczdPdKdQVnngGoEdf9I8w6blh+o85z+sAe0E3nk+UIx0C9mV0YDgVW/HFOJNFlXx
 FpG5z+bP5ZN4i0JE+YIYjxqlwIabhoeufONuF0+qpj0TGFukkxHsE1jMNSIQaYVL1jTB
 LnPHY/Tf2UC302NrVagC3BZkJelFseQXLopeFOprCDaPKht8nalD1GN7amhJ528dbyh7
 CQ4g==
X-Gm-Message-State: AOAM53163RX12A0IzW16cOy4Iy056ss3+zHO3i5TL7AsX2+ExGvikPMX
 9ULSzCeC9Z6/whjdRuV4xWCxPZWXWanIL8W9Ll21mQ==
X-Google-Smtp-Source: ABdhPJzxbyYFEhzF7xl57UKz8ngmE11AqCofnDd3ABJlBMSPcXEeKiLSiJiERBiigq/2V/RcNsG9zt5PbYZmb5BknWQ=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr364752ejb.56.1610049668968; 
 Thu, 07 Jan 2021 12:01:08 -0800 (PST)
MIME-Version: 1.0
References: <FRYP281MB0158389968A2A1C231F3A585ABFB0@FRYP281MB0158.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To: <FRYP281MB0158389968A2A1C231F3A585ABFB0@FRYP281MB0158.DEUP281.PROD.OUTLOOK.COM>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 20:00:57 +0000
Message-ID: <CAFEAcA9-EP7s-gNCsXf_59eOfo+hvTX_EwJjg02dHt0eyWOk9A@mail.gmail.com>
Subject: Re: [PATCH] Initialize Zynq7000 UART clocks on reset
To: Michael Peter <michael.peter@hensoldt-cyber.de>
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alistair/Edgar/Damien -- could I get a review from one of you
for this Xilinx clock-gen related patch, please?

thanks
-- PMM

On Tue, 24 Nov 2020 at 18:54, Michael Peter
<michael.peter@hensoldt-cyber.de> wrote:
>
> Pass an additional argument to zynq_slcr_compute_clocks that indicates whether an reset-exit condition
> applies. If called from zynq_slcr_reset_exit, external clocks are assumed to be active, even if the
> device state indicates a reset state.
>
> Signed-off-by: Michael Peter <michael.peter@hensoldt-cyber.de>
> ---
>  hw/misc/zynq_slcr.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
> index a2b28019e3..073122b934 100644
> --- a/hw/misc/zynq_slcr.c
> +++ b/hw/misc/zynq_slcr.c
> @@ -269,12 +269,12 @@ static uint64_t zynq_slcr_compute_clock(const uint64_t periods[],
>   * But do not propagate them further. Connected clocks
>   * will not receive any updates (See zynq_slcr_compute_clocks())
>   */
> -static void zynq_slcr_compute_clocks(ZynqSLCRState *s)
> +static void zynq_slcr_compute_clocks(ZynqSLCRState *s, bool ignore_reset)
>  {
>      uint64_t ps_clk = clock_get(s->ps_clk);
>
>      /* consider outputs clocks are disabled while in reset */
> -    if (device_is_in_reset(DEVICE(s))) {
> +    if (!ignore_reset && device_is_in_reset(DEVICE(s))) {
>          ps_clk = 0;
>      }
>
> @@ -305,7 +305,7 @@ static void zynq_slcr_propagate_clocks(ZynqSLCRState *s)
>  static void zynq_slcr_ps_clk_callback(void *opaque)
>  {
>      ZynqSLCRState *s = (ZynqSLCRState *) opaque;
> -    zynq_slcr_compute_clocks(s);
> +    zynq_slcr_compute_clocks(s, false);
>      zynq_slcr_propagate_clocks(s);
>  }
>
> @@ -410,7 +410,7 @@ static void zynq_slcr_reset_hold(Object *obj)
>      ZynqSLCRState *s = ZYNQ_SLCR(obj);
>
>      /* will disable all output clocks */
> -    zynq_slcr_compute_clocks(s);
> +    zynq_slcr_compute_clocks(s, false);
>      zynq_slcr_propagate_clocks(s);
>  }
>
> @@ -419,7 +419,7 @@ static void zynq_slcr_reset_exit(Object *obj)
>      ZynqSLCRState *s = ZYNQ_SLCR(obj);
>
>      /* will compute output clocks according to ps_clk and registers */
> -    zynq_slcr_compute_clocks(s);
> +    zynq_slcr_compute_clocks(s, true);
>      zynq_slcr_propagate_clocks(s);
>  }
>
> @@ -558,7 +558,7 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
>      case R_ARM_PLL_CTRL:
>      case R_DDR_PLL_CTRL:
>      case R_UART_CLK_CTRL:
> -        zynq_slcr_compute_clocks(s);
> +        zynq_slcr_compute_clocks(s, false);
>          zynq_slcr_propagate_clocks(s);
>          break;
>      }
> --
> 2.17.1

