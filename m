Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD7F64D763
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 08:42:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5irS-0005h0-NX; Thu, 15 Dec 2022 02:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5irQ-0005eX-PL
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:40:56 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5irO-0004V2-Uj
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:40:56 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so1146123wmb.5
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 23:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yi1QJJgZMGdhYlUB81LHlIFp4i0PwuX/WX3pMM83qlc=;
 b=ym5i8V+tDLQ1mCtQj4CN/2pOs1UcbUtIUuwF6tkLp/EEJTYFINbTEmAbMcw6MT2ddr
 87cE3iV5rZAlS9vJKrvWMY82aBXC7DolfJ1ft+yCa0eZo2sHlB5EkJN1HxER2kDn7Z28
 8ZtY5gcUEbC5oPX8X0cfmnj1DoUr4M/yLxZ1s4Ef3kiEsYu+6lq/xUhaCalR54+FMBJ6
 UecK/YGd3eaygyCCX2K3+rxSpfTkuKx37vJJi5GOILuLAewELGgH6M92gbLcmYxFYWGI
 322c3kkJ1GG3iQCZwCj+a8zbQb8DJwBDu5f0jDfTrYHJje1prkSFIcmMkIWW2CH4L/Rv
 r4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yi1QJJgZMGdhYlUB81LHlIFp4i0PwuX/WX3pMM83qlc=;
 b=iuOvo/4NWkgUnqLgnQh5cFWpcXZbk6zeFlW15R6NKDDmU0gY4qWeAg3ZYUnC1WhiZv
 NquJHwz6Vvni2TqmWg/JcDLYxk9PDPndAS7x7uxJTbhefbXaqbYuzFS//JSI6lzvWHlv
 OjrIH+4VzByRNQRVQGmGy00Jr8mlaQzvOSrL2wM7MbNZvM2Mae3Q/hHzalosmYd4+r5/
 Q6MzNGHmCVIts3Rvdln2QzechKWfIN8Dgth5hKbuZ6dTZLPX7TGffemxXyXXrP0NepbZ
 Ax7R+ft6zaDgS15ZQ+N8PIhfqKkcbBHES8eRIQ+fqfEt6xRpMQ1dmzWooiY8F8XvWAHg
 Ij3Q==
X-Gm-Message-State: ANoB5pnRNDoNh0v0Z0Xz6L9RNBsz0zs8scQm6Fp90c3KZjD4vc+K+oat
 t/xRWEGQbi1wexvmA63K5c3qWQ==
X-Google-Smtp-Source: AA0mqf7KONbwhHmEY6/gyIx2MKcul7GOwyck4Mjj8Doc1oXl1asvkZgLubqS6JbySaSsxnxFrtBlAQ==
X-Received: by 2002:a05:600c:1c91:b0:3d2:640:c4e5 with SMTP id
 k17-20020a05600c1c9100b003d20640c4e5mr19763421wms.8.1671090053482; 
 Wed, 14 Dec 2022 23:40:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b003a3442f1229sm6103821wmq.29.2022.12.14.23.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 23:40:53 -0800 (PST)
Message-ID: <7d5663c2-4925-2e36-a842-ff39f2755db7@linaro.org>
Date: Thu, 15 Dec 2022 08:40:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v1 1/2] hw/intc/loongarch_pch_msi: add irq number property
Content-Language: en-US
To: Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn
References: <20221215065011.2133471-1-zhaotianrui@loongson.cn>
 <20221215065011.2133471-2-zhaotianrui@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221215065011.2133471-2-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15/12/22 07:50, Tianrui Zhao wrote:
> This patch adds irq number property for loongarch msi interrupt
> controller, and remove hard coding irq number macro.
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>   hw/intc/loongarch_pch_msi.c         | 22 +++++++++++++++++++---
>   hw/loongarch/virt.c                 | 11 +++++++----
>   include/hw/intc/loongarch_pch_msi.h |  3 ++-
>   include/hw/pci-host/ls7a.h          |  1 -
>   4 files changed, 28 insertions(+), 9 deletions(-)


> @@ -49,6 +49,22 @@ static void pch_msi_irq_handler(void *opaque, int irq, int level)
>       qemu_set_irq(s->pch_msi_irq[irq], level);
>   }
>   
> +static void loongarch_pch_msi_realize(DeviceState *dev, Error **errp)
> +{
> +    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(dev);
> +
> +    assert(s->irq_num > 0);

        if (!s->irq_num || s->irq_num  > PCH_MSI_IRQ_NUM) {
            error_setg(errp, "Invalid 'msi_irq_num'");
            return;
        }

> +    s->pch_msi_irq = g_malloc(sizeof(qemu_irq) * s->irq_num);

        s->pch_msi_irq = g_new(qemu_irq, s->irq_num);

> +    if (!s->pch_msi_irq) {
> +        error_report("loongarch_pch_msi: fail to alloc memory");
> +        exit(1);
> +    }
> +
> +    qdev_init_gpio_out(dev, s->pch_msi_irq, s->irq_num);
> +    qdev_init_gpio_in(dev, pch_msi_irq_handler, s->irq_num);
> +}

Missing g_free(s->pch_msi_irq) in loongarch_pch_msi_unrealize().

>   static void loongarch_pch_msi_init(Object *obj)
>   {
>       LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(obj);
> @@ -59,12 +75,11 @@ static void loongarch_pch_msi_init(Object *obj)
>       sysbus_init_mmio(sbd, &s->msi_mmio);
>       msi_nonbroken = true;
>   
> -    qdev_init_gpio_out(DEVICE(obj), s->pch_msi_irq, PCH_MSI_IRQ_NUM);
> -    qdev_init_gpio_in(DEVICE(obj), pch_msi_irq_handler, PCH_MSI_IRQ_NUM);
>   }
>   
>   static Property loongarch_msi_properties[] = {
>       DEFINE_PROP_UINT32("msi_irq_base", LoongArchPCHMSI, irq_base, 0),
> +    DEFINE_PROP_UINT32("msi_irq_num",  LoongArchPCHMSI, irq_num, 0),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> @@ -72,6 +87,7 @@ static void loongarch_pch_msi_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
>   
> +    dc->realize = loongarch_pch_msi_realize;

        dc->unrealize = loongarch_pch_msi_unrealize;

>       device_class_set_props(dc, loongarch_msi_properties);
>   }
>   
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index 958be74fa1..3547d5f711 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -496,7 +496,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
>       LoongArchCPU *lacpu;
>       CPULoongArchState *env;
>       CPUState *cpu_state;
> -    int cpu, pin, i;
> +    int cpu, pin, i, start, num;
>   
>       ipi = qdev_new(TYPE_LOONGARCH_IPI);
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(ipi), &error_fatal);
> @@ -576,14 +576,17 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
>       }
>   
>       pch_msi = qdev_new(TYPE_LOONGARCH_PCH_MSI);
> -    qdev_prop_set_uint32(pch_msi, "msi_irq_base", PCH_MSI_IRQ_START);
> +    start   =  PCH_PIC_IRQ_NUM;
> +    num = 256 - start;

This part is confuse. So you don't need PCH_MSI_IRQ_START anymore?
What is this magic '256' value?

> +    qdev_prop_set_uint32(pch_msi, "msi_irq_base", start);
> +    qdev_prop_set_uint32(pch_msi, "msi_irq_num", num);
>       d = SYS_BUS_DEVICE(pch_msi);
>       sysbus_realize_and_unref(d, &error_fatal);
>       sysbus_mmio_map(d, 0, VIRT_PCH_MSI_ADDR_LOW);
> -    for (i = 0; i < PCH_MSI_IRQ_NUM; i++) {
> +    for (i = 0; i < num; i++) {
>           /* Connect 192 pch_msi irqs to extioi */
>           qdev_connect_gpio_out(DEVICE(d), i,
> -                              qdev_get_gpio_in(extioi, i + PCH_MSI_IRQ_START));
> +                              qdev_get_gpio_in(extioi, i + start));
>       }



