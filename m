Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F9662F993
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 16:42:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow3UO-0005Dt-79; Fri, 18 Nov 2022 10:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3UL-00055r-8h
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:41:09 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3UJ-0000f9-IW
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:41:08 -0500
Received: by mail-pj1-x1032.google.com with SMTP id o7so4830680pjj.1
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 07:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Qj4NeZjy+UCZoy7h7CI0d9ukJiO6wkFiZF1RKQ9NxFw=;
 b=BzxMqO09PHoLMsJVJ257CUpdCcnpUgB2uDOjzMraIi7vLgEmKbuVhf1g7kjtmP8y99
 CxqUW0SMUqjWVll+1v2BeiAQBN8Axj5W3/uMort63fsc7v7c56flvUOrewTSMmJOdblx
 NF4m5DDIyJKRbiDvClYNw4h5fJfuGxGZ+fCXh9+58yJzUa1I+EX1cRh4ppkNMlfk3K8p
 crWcEOpZF6J75ncg9N7Xjj/jgbpvjPRtoOhtYOXMS5o35XODfmddVmPvngxFDEpyz2F2
 mRMr9F5erymV5GYUE62ybRjIEMNw9QiwmuZ6Gf8nBDa2eufQ/U8n6Wr8Vwda604b2/Uw
 2wCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qj4NeZjy+UCZoy7h7CI0d9ukJiO6wkFiZF1RKQ9NxFw=;
 b=MyzbgkHrZ0BKqd5APKENJHwyAX0N95pg9QkQrDiznYtLKrK+9wAroT81/2Ih6HgB98
 k2F1zXvUaPdcuUDE3Jm8J8Qk4QHQB6STESrmE3tZpoBAEXXiZTfANdPiSFdVWBMPi3Pu
 ukEpkpww1HHF76kmliL+jfY6t6NHOoORiZiy5zzKiE0HzKpMlI+TvhAZMZRA0swioHQt
 nC6hgUQB2qIRuDCv6w4KggJ2l9sPs6GK1AIpRLH73fwlxsyt/GxXQZW9TaeJzOPozpOJ
 kaaYDaLBiMBuHU/FJDu6btWNtJnw/edDZ7pLAGzshsL8GtzKmtnYVSdU1DTfFpihOXNm
 2jcQ==
X-Gm-Message-State: ANoB5pk69mEbW2Xe8aKGlatj5kpfeSwK0J1DpFUFcYXbtk9Q4z00iqx/
 VEmi/rrUwOB81Up3hM42SahagKx3d5Dush5EutdHBA==
X-Google-Smtp-Source: AA0mqf6ezVzaV8NYKPcYf9hZvZGV9LiO3ZK3ZfWOefq3fLIJg+OJxBuwMjalytifaXXRtxzoOCR1POECc95WD6MtgzU=
X-Received: by 2002:a17:90a:7004:b0:218:8757:8f2b with SMTP id
 f4-20020a17090a700400b0021887578f2bmr3451446pjk.221.1668786065817; Fri, 18
 Nov 2022 07:41:05 -0800 (PST)
MIME-Version: 1.0
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-3@git.sr.ht>
In-Reply-To: <166783932395.3279.1096141058484230644-3@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 15:40:54 +0000
Message-ID: <CAFEAcA8e13HHR7yyFv7kWNOrMuPTtsHMTChyN8=Q3z6VFveXCQ@mail.gmail.com>
Subject: Re: [PATCH qemu.git v2 3/9] hw/timer/imx_epit: simplify interrupt
 logic
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 7 Nov 2022 at 16:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>  hw/timer/imx_epit.c | 27 +++++++++++----------------
>  1 file changed, 11 insertions(+), 16 deletions(-)
>
> diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
> index 8ec770f674..2e9dae0bc8 100644
> --- a/hw/timer/imx_epit.c
> +++ b/hw/timer/imx_epit.c
> @@ -61,18 +61,6 @@ static const IMXClk imx_epit_clocks[] =  {
>      CLK_32k,       /* 11 ipg_clk_32k -- ~32kHz */
>  };
>
> -/*
> - * Update interrupt status
> - */
> -static void imx_epit_update_int(IMXEPITState *s)
> -{
> -    if (s->sr && (s->cr & CR_OCIEN) && (s->cr & CR_EN)) {
> -        qemu_irq_raise(s->irq);
> -    } else {
> -        qemu_irq_lower(s->irq);
> -    }
> -}
> -
>  /*
>   * Must be called from within a ptimer_transaction_begin/commit block
>   * for both s->timer_cmp and s->timer_reload.
> @@ -253,10 +241,10 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
>          break;
>
>      case 1: /* SR - ACK*/
> -        /* writing 1 to OCIF clears the OCIF bit */
> +        /* writing 1 to OCIF clears the OCIF bit and the interrupt */
>          if (value & 0x01) {
>              s->sr = 0;
> -            imx_epit_update_int(s);
> +            qemu_irq_lower(s->irq);
>          }
>          break;
>
> @@ -305,10 +293,17 @@ static void imx_epit_cmp(void *opaque)
>  {
>      IMXEPITState *s = IMX_EPIT(opaque);
>
> +    /* Set the interrupt status flag to signaled. */
>      DPRINTF("sr was %d\n", s->sr);
> -
>      s->sr = 1;
> -    imx_epit_update_int(s);
> +
> +    /*
> +     * An actual interrupt is generated only if the peripheral is enabled
> +     * and the interrupt generation is enabled.
> +     */
> +    if ((s->cr & (CR_EN | CR_OCIEN)) == (CR_EN | CR_OCIEN)) {
> +        qemu_irq_raise(s->irq);
> +    }
>  }

Having an "update interrupt" function is the more common
convention in QEMU device models -- it means you have one
function you can call from any point where you've updated
any of the state that affects whether an interrupt is generated or not.

For instance there's currently I think a bug where when the
guest writes to the CR register and changes the value of
the CR_OCIEN bit we aren't updating the state of the IRQ line.
If you keep the imx_epit_update_int() function then fixing
that bug is fairly straightforward: you just need to call it
in the appropriate place. Without the function then the
logic of "what is the IRQ line state given the current
device register state" ends up dispersed across the device
model code and potentially duplicated.

thanks
-- PMM

