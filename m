Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6532D8CE5
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 12:53:41 +0100 (CET)
Received: from localhost ([::1]:57186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koPwa-0008Bd-Q8
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 06:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koPrA-0005R7-2m; Sun, 13 Dec 2020 06:48:04 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koPr6-0002EE-2g; Sun, 13 Dec 2020 06:48:03 -0500
Received: by mail-wr1-x441.google.com with SMTP id r14so13582603wrn.0;
 Sun, 13 Dec 2020 03:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bA+6KZkTOy2lI1qZ8bTp9iznhQEAFGUCNVtgkS7tAkc=;
 b=lxmtYb89g1tVT+4zFQbl+qWUr7zy/iS1eDFX+YbuoqsuJQbdp3A1qdldTVhKt+mYhk
 A4zyIMxuwu41pzye2hrul2VvaY9lcm8kvZYFoFXYG8l3nnGlsijLTK2fKf3JJsH640LG
 o0NrdOKofDzqQM8r1A52m4WoW/pwqWcPSROPtL0u29X7lDML4+kZmV6Q64WtZlZtakK4
 DvjrMVSA4aLrQp2b1ypK/BBj+joAEgkshsxS3BFv+3vgz6rBs/M4FKhzXgpiClCuCQMn
 g6qS2q5LMtFhzx+5XKy+fVFGXNWBdzCNn6O1wK4UcKd20Mb99aENdk89uSGbCKvhl7Ub
 hPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bA+6KZkTOy2lI1qZ8bTp9iznhQEAFGUCNVtgkS7tAkc=;
 b=Rk/WF5vltcuXOxroP5Me/lpF5DtjF5kXecKTPAh75fZ/Vp9ObxY2qd8auQnUgkgDQE
 tfD0RSsIKfpE9DKizWt1Reix6p3CD94U+I/AflDn+nWYJM2xKagnEmVDnrw05/jMIn6C
 z1jB2Icdc2T7jPaV2CEA+wqJh37dG2wBJkDC28LWNb9vRdZE5UdT6doEK+FWt24W8qu6
 5wHyTOquy08OZj0W2qcG6ih0b9EEjZAXH2B1WNXJFB9Mov/5qT281PN4wXdbMp64pQ9X
 GHelWmogrzwFvceAKYVlteUD+FBCJ42PdPlX3OPWOmQfDKcacvh5QDTkbBmGnJLaW+Lm
 LRlQ==
X-Gm-Message-State: AOAM5302aEl/6JZElUW1PxafTOxXqwCI6N4htTO2Rm/oFjIRW9qDfSO6
 p/MWGoVP0uZxxLVHN6VQ9T8=
X-Google-Smtp-Source: ABdhPJy1SVyD+LnTkn4CalYvIJHXUg89WQuM/L3flEh7CWneIzzfqIvT9i43MPkMZi67uHb8ZUuNKw==
X-Received: by 2002:a5d:5227:: with SMTP id i7mr24448378wra.68.1607860078420; 
 Sun, 13 Dec 2020 03:47:58 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n3sm26663330wrw.61.2020.12.13.03.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 03:47:57 -0800 (PST)
Subject: Re: [PATCH v2 3/4] hw/adc: Add an ADC module for NPCM7XX
To: Hao Wu <wuhaotsh@google.com>, hskinnemoen@google.com
References: <20201211222223.2252172-1-wuhaotsh@google.com>
 <20201211222223.2252172-4-wuhaotsh@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2d6eca6e-1690-8411-51c2-c0e7f8e8d677@amsat.org>
Date: Sun, 13 Dec 2020 12:47:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201211222223.2252172-4-wuhaotsh@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, minyard@acm.org, venture@google.com,
 qemu-devel@nongnu.org, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 11:22 PM, Hao Wu via wrote:
> The ADC is part of NPCM7XX Module. Its behavior is controled by the
> ADC_CON register. It converts one of the eight analog inputs into a
> digital input and stores it in the ADC_DATA register when enabled.
> 
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  docs/system/arm/nuvoton.rst    |   2 +-
>  hw/adc/meson.build             |   1 +
>  hw/adc/npcm7xx_adc.c           | 318 ++++++++++++++++++++++++++
>  hw/arm/npcm7xx.c               |  24 +-
>  include/hw/adc/npcm7xx_adc.h   |  72 ++++++
>  include/hw/arm/npcm7xx.h       |   2 +
>  tests/qtest/meson.build        |   3 +-
>  tests/qtest/npcm7xx_adc-test.c | 400 +++++++++++++++++++++++++++++++++
>  8 files changed, 819 insertions(+), 3 deletions(-)
>  create mode 100644 hw/adc/npcm7xx_adc.c
>  create mode 100644 include/hw/adc/npcm7xx_adc.h
>  create mode 100644 tests/qtest/npcm7xx_adc-test.c
...

> +static void npcm7xx_adc_init(Object *obj)
> +{
> +    NPCM7xxADCState *s = NPCM7XX_ADC(obj);
> +    SysBusDevice *sbd = &s->parent;
> +    int i;
> +
> +    sysbus_init_irq(sbd, &s->irq);
> +
> +    timer_init_ns(&s->conv_timer, QEMU_CLOCK_VIRTUAL,
> +            npcm7xx_adc_convert_done, s);
> +    timer_init_ns(&s->reset_timer, QEMU_CLOCK_VIRTUAL,
> +            npcm7xx_adc_reset_done, s);
> +    memory_region_init_io(&s->iomem, obj, &npcm7xx_adc_ops, s,
> +                          TYPE_NPCM7XX_ADC, 4 * KiB);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL);
> +
> +    for (i = 0; i < NPCM7XX_ADC_NUM_INPUTS; ++i) {
> +        object_property_add_uint32_ptr(obj, "adci[*]",
> +                &s->adci[i], OBJ_PROP_FLAG_WRITE);

How do you use this, any example?

FWIW I'm experimenting with other ADC to use the "audio/audio.h"
API (which is not voice/audio specific, but generic DSP), then
I can pass any QEMU source and consume it using AUD_read() to fill
the ADC buffer (device sram or in main ram).

But I'm doing that alone during my free time, so don't expect it
any time soon :(

> +    }
> +    object_property_add_uint32_ptr(obj, "vref",
> +            &s->vref, OBJ_PROP_FLAG_WRITE);
> +    npcm7xx_adc_calibrate(s);
> +}

