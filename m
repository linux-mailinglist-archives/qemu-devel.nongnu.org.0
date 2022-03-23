Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237F24E5857
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:24:32 +0100 (CET)
Received: from localhost ([::1]:55856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5ep-00016Z-8h
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:24:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5aa-00061B-TN
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:20:09 -0400
Received: from [2607:f8b0:4864:20::1130] (port=38325
 helo=mail-yw1-x1130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5aW-0001EM-O4
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:20:06 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2e592e700acso27129387b3.5
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lFXlvf1PHn3Qyz28ksEvdnfuTCsA6m7TFmb6oPkshyA=;
 b=XXFgoc3QL5zCe5WRdRYpyo0uA9Z02iuu+frTQWdRQhaxxA5wUHgD8JB6UJmK78L6UO
 G7gpsbTfR0f9KT7/cGfsGDS1P86Tv4RBDm7tSg3A/MGzV069BDOepG/wzpBhWoddwijs
 +aEycu+Vk+IwiTK3aQBOdGOlXEtM97GGsfpsIeG9x1OUETFHg3s9VQQzc6+TZbsHdHib
 HkZmYDKgvilNu2dYImmvwM0TrFULw06krpRRuYwJnCl4DEyjWJiHWaIIzbVSN4WuTsvC
 mTh4IkVSPPwgSw0o7W/kxCVyZ4dsfavlNJfqFg53AjJVtQ0+5tV24pCPsY+5GIfap7FZ
 jQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lFXlvf1PHn3Qyz28ksEvdnfuTCsA6m7TFmb6oPkshyA=;
 b=bs1RToHmwLQO4SZPy6soVxziKWg22vbYZF8yMcEqxNOCZECpjvi8/7pBXHCbyrLLmN
 bHwGVoQbhKruiYP/MFmdkEKjmWCf49WQrutnNp9C7M8aRApzEbAuJGVCjwE6SXb8VJxK
 +EK0Z0GHZVyVqXfpAKcRPWqNQVgHfQrc15yOCWt0guZ+ABSUU300RKmeWAaEc0951/yO
 WnjJhgl5bLOAxt+RyFmIBDgYoYM9y1ER/ssMxjYwdQ1Jl9tfVwgOx/WIUddqQmcTGFH6
 W+rrju/yqN4TWdl97++O3Ak16fb1JZsnRav6ddY5TWxua30dGsQGUUkCtEtLQTkkOEPy
 QRQQ==
X-Gm-Message-State: AOAM531jKVkuTSlmQbZ7eLTjmTS0/U9EOhiE1uPGs6/GYqjxL1Kd/ReQ
 fgy1/H8IfvKGgBZa80EdZOjwBRKa13BEX3RfXRJMOg==
X-Google-Smtp-Source: ABdhPJy3USXpM3DTeb2WZXNtVnlopwGUV80Pipw+UjKj4EdF4p06z/8jCBjCcaC2a7qLCANk9+rahV3xbAGI/zYwv/g=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr1243580ywh.329.1648059603715; Wed, 23
 Mar 2022 11:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220323173543.146442-1-zongyuan.li@smartx.com>
 <20220323173543.146442-3-zongyuan.li@smartx.com>
In-Reply-To: <20220323173543.146442-3-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Mar 2022 18:19:50 +0000
Message-ID: <CAFEAcA-m2F2fn77=3fz_pfteiPaHmUuGEbsCpYG-gnJSQ2or9Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] hw/arm/stellaris: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:Stellaris" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Mar 2022 at 17:36, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> ---
>  hw/arm/stellaris.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index b6c8a5d609..ccc2d5def2 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -9,6 +9,7 @@
>
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> +#include "hw/core/split-irq.h"
>  #include "hw/sysbus.h"
>  #include "hw/sd/sd.h"
>  #include "hw/ssi/ssi.h"
> @@ -1023,6 +1024,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>      I2CBus *i2c;
>      DeviceState *dev;
>      DeviceState *ssys_dev;
> +       DeviceState *gpio_d_splitter;

Indentation seems to be off here. Also since we only use this
in one place you can put the new variable declaration in the
narrower scope that starts "if (board->peripherals & BP_OLED_SSI) {".

>      int i;
>      int j;
>      const uint8_t *macaddr;
> @@ -1237,9 +1239,20 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>                                     &error_fatal);
>
>              ssddev = ssi_create_peripheral(bus, "ssd0323");
> -            gpio_out[GPIO_D][0] = qemu_irq_split(
> -                    qdev_get_gpio_in_named(sddev, SSI_GPIO_CS, 0),
> +
> +            gpio_d_splitter = qdev_new(TYPE_SPLIT_IRQ);
> +            qdev_prop_set_uint32(gpio_d_splitter, "num-lines", 2);
> +            if (!qdev_realize_and_unref(gpio_d_splitter, NULL, &error_fatal)) {
> +                return;
> +            }

If you're passing &error_fatal to a function, it will never return
on errors, it will exit. So you don't need to have the if() here.

> +            qdev_connect_gpio_out(
> +                    gpio_d_splitter, 0,
> +                    qdev_get_gpio_in_named(sddev, SSI_GPIO_CS, 0));
> +            qdev_connect_gpio_out(
> +                    gpio_d_splitter, 1,
>                      qdev_get_gpio_in_named(ssddev, SSI_GPIO_CS, 0));
> +            gpio_out[GPIO_D][0] = qdev_get_gpio_in(gpio_d_splitter, 0);
> +
>              gpio_out[GPIO_C][7] = qdev_get_gpio_in(ssddev, 0);

Otherwise this looks OK.

thanks
-- PMM

