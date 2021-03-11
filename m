Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16737337211
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:09:05 +0100 (CET)
Received: from localhost ([::1]:37838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKK7k-0005mK-4z
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKK6R-000584-3F
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:07:43 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKK6M-0006IA-Th
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:07:42 -0500
Received: by mail-ej1-x62e.google.com with SMTP id dx17so45740373ejb.2
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 04:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yLjgREMD9eQ4UnJRKOm2CicdV7iEp/vNuleh8Ij//GY=;
 b=cGJW7QCAoWUYfjwdZ4JuKwJX5BcJTbxzIqW+PoJVexRS5y2Af4omlcQwvlwjgqAEjf
 PHt9rzP5XDpLSHZRfvp9QyIO3W/7J1LoGeVqeNfT+rAdZ74rIAZaD0T9jIH7iLwICXwn
 uL/ui6a9vfWMogFeUfaogXmOmy83v55WB2dkJRLUUSkdLSpvv2V8PJC0tMLev+NjfMic
 kAgpDUnQxN8vNDsM4g3RjCaHuMreMw1Ri2p2gBmGGLfjQkhZBMeBjXc+8q1J4mB1SJUt
 oVqfHQEc6PEIIZrqy3PHP3bGX9UtFMl4ghCNiWmWh6DyWwYsy8/BM6xsNAhQ4KJYpCpc
 S1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yLjgREMD9eQ4UnJRKOm2CicdV7iEp/vNuleh8Ij//GY=;
 b=uMkzS4UknaYd3ZmfjqkA1utfNU1+m3URygzSfooKFrL7U5o2hwMyenhTj5y0TjX+Ny
 4FktOcRlKhG/MvTcbhfWdBkb5w94+/7yXUhC/jT5mM3xggxEhrmlGblKvd0O9GbORpSO
 yx8X+JiCkD/XrCS3G+key+p+rtiot0qKcfMIe6jgwPTN1q+oKF/mxBEGrRbrXeD+uxwQ
 Ks/tgUIYprSM9ggqzj+ONpaGq1S/JAMY/SDxdAFjNKyE5Np90yLZAHLEVfllAFrDR3bN
 kIwVupUdUE4EGwk6/uIWd8KihbelMbdpNiV2/vv7W71LGF3hvdy50Qcz63K25o9l2RSC
 Ftdg==
X-Gm-Message-State: AOAM5300WGUBGVUneRiN4myZdTwwpuxfxH6hOcMxx7iX3rSLaSE3M7Eu
 /1zLDkJlXm1LE92GCIrYKMvr0KpgnX5EYxC7jdr8xA==
X-Google-Smtp-Source: ABdhPJxKtHsMrEpbHNnmlarFHg49xRixh0KQ9ufErcvhVfk6vgxFML0LTYIVJVh7XiJg9QrkAXeWGY+n87/xCJAJNOY=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr2776605ejg.482.1615464457347; 
 Thu, 11 Mar 2021 04:07:37 -0800 (PST)
MIME-Version: 1.0
References: <20210305183857.3120188-1-wuhaotsh@google.com>
 <20210305183857.3120188-3-wuhaotsh@google.com>
In-Reply-To: <20210305183857.3120188-3-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 12:07:18 +0000
Message-ID: <CAFEAcA_q0WW_1FA_2McFB-o3cC_XWDEZJsw3C+zj4057L9YpDg@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/misc: Add NPCM7XX MFT Module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Mar 2021 at 18:40, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch adds Multi Function Timer (MFT) module for NPCM7XX Soc.
> This module is mainly used to configure PWM fans. It has just enough
> functionality to make the PWM fan kernel module work.
>
> The module takes two input, the max_rpm of a fan (modifiable via QMP)
> and duty cycle (a GPIO from the PWM module.) The actual measured RPM
> is equal to max_rpm * duty_cycle / NPCM7XX_PWM_MAX_DUTY. The RPM is
> measured as a counter compared to a prescaled input clock. The kernel
> driver reads this counter and report to user space.
>
> Refs:
> https://github.com/torvalds/linux/blob/master/drivers/hwmon/npcm750-pwm-fan.c
>
> Reviewed-by: Doug Evans <dje@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  docs/system/arm/nuvoton.rst   |   2 +-
>  hw/arm/npcm7xx.c              |  45 ++-
>  hw/misc/meson.build           |   1 +
>  hw/misc/npcm7xx_mft.c         | 541 ++++++++++++++++++++++++++++++++++
>  hw/misc/trace-events          |   8 +
>  include/hw/arm/npcm7xx.h      |   2 +
>  include/hw/misc/npcm7xx_mft.h |  70 +++++
>  7 files changed, 660 insertions(+), 9 deletions(-)
>  create mode 100644 hw/misc/npcm7xx_mft.c
>  create mode 100644 include/hw/misc/npcm7xx_mft.h

Can you split "implement new device" and "add new device to board"
into separate patches, please?


> +static void npcm7xx_mft_init(Object *obj)
> +{
> +    NPCM7xxMFTState *s = NPCM7XX_MFT(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    DeviceState *dev = DEVICE(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &npcm7xx_mft_ops, s,
> +                          TYPE_NPCM7XX_MFT, 4 * KiB);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_init_irq(sbd, &s->irq);
> +    s->clock_in = qdev_init_clock_in(dev, "clock-in",
> +                                     npcm7xx_mft_update_clock, s);

You'll need to update this for the change to the Clock API that's
now in master, I'm afraid.

(You'll also find some conflicts in the docs and in the board .c file
when you rebase now the ethernet device patchset has landed, but those
are easy to fix.)

thanks
-- PMM

