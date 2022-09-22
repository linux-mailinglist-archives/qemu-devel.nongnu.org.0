Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A3B5E6320
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 15:05:04 +0200 (CEST)
Received: from localhost ([::1]:33090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obLt1-0007sJ-M6
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 09:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obLRF-0003yA-IX
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:36:24 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:45917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obLRB-000601-Ax
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:36:21 -0400
Received: by mail-ej1-x629.google.com with SMTP id dv25so20616980ejb.12
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 05:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=0q9R07i5Sf4SavsDCISXjgvDiaafwv+KXh2/V0r/Qi4=;
 b=TZCZRhaJCdKJSfGq8K2G/GgQoX1ITX0BMrfal5a7EfzuTdPkT0krxPqg90SYWk5DtX
 Jz2Fvo5blFnSNPJNJYJGl3dCJ48j5vzTbllPLeGEwuv1lYXFskj2Pk7DQfcfWDkw6COw
 21KQh8j8RAoq1wIagfTuAuZYD0LVoU6g1vO5UJIU04ND0F2aozi04AiyTvnoNSbu8WNj
 R7MeFCVLYJfdvjWu4mZVps4GxCR/YRs63J7ZHGmSmfQJ/Gqc+X5MqViJ3uf/mE71j4Tr
 7/iQYcbnTzxznyU8EUY53XvwUGagwKFiwIuG+DHMneu5lvt/LDlMVh66k6ryU5DI6OtN
 fWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=0q9R07i5Sf4SavsDCISXjgvDiaafwv+KXh2/V0r/Qi4=;
 b=mGTw7vNLKH3Em9Ppev58eXqAiQ4RvHlM8qqjz4tvZ0pmDQmK3qvHgeO69UzN17cxwH
 YB9uiaBuwQgj/mdC5JmXpaiLPpboXd/lpJk33oTT9PLH1GQGkJFmztREdHrhFU8tvg5b
 HCYRyfNaHWAW+JdBWIl6xiNx/8zxeGIRCwAm+x6eN9SoUf/AOhQUNKG8KZixOEJTazve
 rQIm1Kdyuk0nN274BbK5ziqD0eBQFxsA6W4bCuc5HvViNnuv/mxkDEo/BYo/bHJZ9k+o
 1Ueh4buT6YNcfAb40SQYdg1t+ZjV7gEsCoVXhZSXZUw5E3ppUwJXZJ5+NoHX1Zx62AX2
 YU/w==
X-Gm-Message-State: ACrzQf3DTlXZoJQ50gqndRtSf/OB316RvurRTahYRc5n8hEl+GKMq+uP
 dKaBTxQd4ZaaS/bvXngcyTkoBcPtIfglKXmG+nBIbg==
X-Google-Smtp-Source: AMsMyM4P1eBZjhiKu7ee8GBFytZXP5MvquEV8xoq+dcJND0FXzGIv695SO5i3R1BYTYp54EbPUEQudOALxd3HGfK8jQ=
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr2531275ejc.504.1663850120272; Thu, 22
 Sep 2022 05:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220921234646.949273-1-venture@google.com>
In-Reply-To: <20220921234646.949273-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 13:35:09 +0100
Message-ID: <CAFEAcA8f+JA4WKMwGFNxg7tRxTwL=RzDLgdJLrP8Dw_jB4XoRA@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc: set MAC in register space
To: Patrick Venture <venture@google.com>
Cc: hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>, 
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Sept 2022 at 00:47, Patrick Venture <venture@google.com> wrote:
>
> The MAC address set from Qemu wasn't being saved into the register space.
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>

> @@ -112,6 +115,18 @@ static void emc_reset(NPCM7xxEMCState *emc)
>
>      emc->tx_active = false;
>      emc->rx_active = false;
> +
> +    /* Set the MAC address in the register space. */
> +    uint32_t value = (emc->conf.macaddr.a[0] << 24) |
> +        (emc->conf.macaddr.a[1] << 16) |
> +        (emc->conf.macaddr.a[2] << 8) |
> +        emc->conf.macaddr.a[3];
> +    npcm7xx_emc_write(emc, REG_CAMM_BASE * sizeof(uint32_t), value,
> +                      sizeof(uint32_t));
> +
> +    value = (emc->conf.macaddr.a[4] << 24) | (emc->conf.macaddr.a[5] << 16);
> +    npcm7xx_emc_write(emc, REG_CAML_BASE * sizeof(uint32_t), value,
> +                      sizeof(uint32_t));

If I understand correctly, the issue here is that emc->regs[REG_CAMM_BASE]
and emc->regs[REG_CAML_BASE] aren't being reset correctly. If so,
I think the better approach is to simply reset them here, without
going through the register-write function, the same way we already
do for the handful of other registers which have non-zero reset values.
That's the way other devices seem to do it.

A question to which I don't know the answer: if the guest writes to
the device to change the MAC address, should that persist across
reset, or should reset revert the device to the original MAC address
as specified by the user on the command line or whatever ? At the
moment you have the former behaviour (and end up storing the MAC
address in two places as a result -- it would be neater to either
keep it in only one place, or else have emc->regs[] be the current
programmed MAC address and emc->conf.macaddr the value to reset to).

I'm not sure we're consistent between device models about that,
eg the e1000 seems to reset to the initial MAC addr, but the
imx_fec keeps the guest-set value over resets. Jason, is there
a recommended "right way" to handle guest-programmable MAC addresses
over device reset ?

thanks
-- PMM

