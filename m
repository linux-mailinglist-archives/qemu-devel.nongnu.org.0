Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B11261049E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 23:41:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooAbj-0000q3-96; Thu, 27 Oct 2022 17:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooAbg-0000iM-JI
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:40:08 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooAbe-00074Q-Nr
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:40:08 -0400
Received: by mail-wr1-x434.google.com with SMTP id bp11so4354461wrb.9
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 14:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tqz37kYB6uHx5KPzbhm445J/fwRI3Pyt1inJhMkHi6M=;
 b=UqmNUduYk6+GVF5ZnkIamxcaHVEl/QehBh0mSQB9SvFLBSZhTqazB8xO7ztwVJqpF1
 otgFpLnLZavXSeRASKvyIrs8Ip1LDJzKUEldpWbewpnXhP40Dn9HmUf+UsMPPBYAp5l6
 p0CGIz4IyEB2E1Y80ooG/LSt9+/E27WNdjRNS9BHtFjzAdoLOuf26G9jh4JBhdNMTC6j
 jU3h9B8YQq40NhyZ9hnjk+2hpKip9eHfmsVkr2vVo3py1bWKcbBXA4TpS1yi2bcWSL6I
 6V9JObNHDWWsFtJh9spfh+pg6Wk7r6y+S2qPAnGtFd1EZoQ6hjy2sZiyILQlJJiopLUK
 dkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tqz37kYB6uHx5KPzbhm445J/fwRI3Pyt1inJhMkHi6M=;
 b=vLNrgAHeFRMX93emBQS2IdL/1l2+MKDzl9zHGk3ZueFkrRhu/SZ8RGjYV4IokQ/nex
 PDMYCq9NgHb4jpEKVr522oyb5Fo3iKCCEQlF+a9vk0z7jgRmNvRNyJL+XGA0rdMmyKB1
 uGZg6484cWAPRb5FdLXbQlJl0LJSTObQ9OIsyEgcC/tT2FeqnrX3gTQRbIYk8z5kBFvT
 UAZV8WcrsNkMv2pJQUhguHUehCuNsh4j02bZOM+DCQ5gjHxLGpMDaItjPkn9ut4mm4SF
 cwSr/BC3At2rMl1yOj9G43/lcR/haqwvvaTRlRqAdbHLz9qHoEEG3lEcwRARsUJmjADf
 QVQQ==
X-Gm-Message-State: ACrzQf2KdXf93Ipbg6psPAv1Oij7JVUzfEXbd7tTPQHcIDEyasijyNLS
 iZH1CmOxrbLVqgYhk8bi0TwOUQ==
X-Google-Smtp-Source: AMsMyM5o4tPMKVKLbTt6UBcuZij0IXOI4hjd0qXympvqLLHJ/MmmXvfmnI0iyvG6Hx3MAOVraJXl8Q==
X-Received: by 2002:a05:6000:1686:b0:230:e1f7:71f5 with SMTP id
 y6-20020a056000168600b00230e1f771f5mr32487228wrd.185.1666906805094; 
 Thu, 27 Oct 2022 14:40:05 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a056000170f00b0022cd0c8c696sm2163244wrc.103.2022.10.27.14.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 14:40:03 -0700 (PDT)
Message-ID: <f9dd1e1e-65b6-c74d-d957-43774393c2a4@linaro.org>
Date: Thu, 27 Oct 2022 23:40:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v4 6/7] hw/sd/sdhci: Implement Freescale eSDHC device model
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
References: <20221018210146.193159-1-shentey@gmail.com>
 <20221018210146.193159-7-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221018210146.193159-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Bernhard,

On 18/10/22 23:01, Bernhard Beschow wrote:
> Will allow e500 boards to access SD cards using just their own devices.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/sd/sdhci.c         | 120 +++++++++++++++++++++++++++++++++++++++++-
>   include/hw/sd/sdhci.h |   3 ++
>   2 files changed, 122 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 306070c872..8d8ad9ff24 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1369,6 +1369,7 @@ void sdhci_initfn(SDHCIState *s)
>       s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
>   
>       s->io_ops = &sdhci_mmio_ops;
> +    s->io_registers_map_size = SDHC_REGISTERS_MAP_SIZE;
>   }
>   
>   void sdhci_uninitfn(SDHCIState *s)
> @@ -1392,7 +1393,7 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
>       s->fifo_buffer = g_malloc0(s->buf_maxsz);
>   
>       memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhci",
> -                          SDHC_REGISTERS_MAP_SIZE);
> +                          s->io_registers_map_size);

I don't think we want to change this region size. [see below]

>   void sdhci_common_unrealize(SDHCIState *s)
> @@ -1575,6 +1576,122 @@ static const TypeInfo sdhci_bus_info = {
>       .class_init = sdhci_bus_class_init,
>   };
>   
> +/* --- qdev Freescale eSDHC --- */
> +
> +/* Watermark Level Register */
> +#define ESDHC_WML                    0x44
> +
> +/* Control Register for DMA transfer */
> +#define ESDHC_DMA_SYSCTL            0x40c
> +
> +#define ESDHC_REGISTERS_MAP_SIZE    0x410

My preferred approach would be to create a container region with a
size of ESDHC_REGISTERS_MAP_SIZE. Map the SDHC_REGISTERS_MAP region
in the container at offset 0, priority -1. Add 2 register regions
for ESDHC_WML and ESDHC_DMA_SYSCTL, and map them with priority 1 in
the container. ...

> +static uint64_t esdhci_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    uint64_t ret;
> +
> +    switch (offset) {
> +    case SDHC_SYSAD:
> +    case SDHC_BLKSIZE:
> +    case SDHC_ARGUMENT:
> +    case SDHC_TRNMOD:
> +    case SDHC_RSPREG0:
> +    case SDHC_RSPREG1:
> +    case SDHC_RSPREG2:
> +    case SDHC_RSPREG3:
> +    case SDHC_BDATA:
> +    case SDHC_PRNSTS:
> +    case SDHC_HOSTCTL:
> +    case SDHC_CLKCON:
> +    case SDHC_NORINTSTS:
> +    case SDHC_NORINTSTSEN:
> +    case SDHC_NORINTSIGEN:
> +    case SDHC_ACMD12ERRSTS:
> +    case SDHC_CAPAB:
> +    case SDHC_SLOT_INT_STATUS:
> +        ret = sdhci_read(opaque, offset, size);
> +        break;

... Then you don't need these cases.

> +    case ESDHC_WML:
> +    case ESDHC_DMA_SYSCTL:
> +        ret = 0;
> +        qemu_log_mask(LOG_UNIMP, "ESDHC rd @0x%02" HWADDR_PRIx
> +                      " not implemented\n", offset);

But then I realize you only treat these 2 registers as UNIMP.

So now, I'd create 1 UNIMP region for ESDHC_WML and map it
into SDHC_REGISTERS_MAP (s->iomem) with priority 1, and add
another UNIMP region of ESDHC_REGISTERS_MAP_SIZE - 
SDHC_REGISTERS_MAP_SIZE (= 0x310) and map it normally at offset
0x100 (SDHC_REGISTERS_MAP_SIZE). Look at create_unimp() in
hw/arm/bcm2835_peripherals.c.

But the ESDHC_WML register has address 0x44 and fits inside the
SDHC_REGISTERS_MAP region, so likely belong there. 0x44 is the
upper part of the SDHC_CAPAB register. These bits are undefined
on the spec v2, which I see you are setting in esdhci_init().
So this register should already return 0, otherwise we have
a bug. Thus we don't need to handle this ESDHC_WML particularly.

And your model is reduced to handling create_unimp() in esdhci_realize().

Am I missing something?

Regards,

Phil.

