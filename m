Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6582659860
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:43:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEeG-0002XC-6l; Fri, 30 Dec 2022 07:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEeB-0002PH-2i
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:38:05 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEe9-0002DZ-AK
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:38:02 -0500
Received: by mail-wr1-x435.google.com with SMTP id d4so11812191wrw.6
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 04:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hkLhyiEvpn+TwPUOhGSa2z4UnCevZJx3QB6aX6d6d7E=;
 b=N3/Zk2PO/kfxSA+aJz7FEFDVR5edKIR4WjOpMX+exfts+BN851XbannxDjG892WdZ1
 8JYEQkd4Hg1L42/eZdeBt0WucTNtQ3p79qkuiXqtbdJrpE8RhCUb1AL8eibG2fJD60Oh
 QoDANOmKYk4RLKsBSpNUWiirbUapEu28/QXYM0GhBpZR0wI4U6ydEtQtjgj3312Flfr2
 BUOciX5Fx612QtpNqvMiaNvZBfw1mSuLK2J9+fd7PBuUfnzYAj4xe6c2CCseDkiwC/sN
 DBpHYaewSQXwcLinjL4xPqDzAXR85e+FUIR6jKurYMyzlQuTgqsxw3TWbpgPg0XlHJqr
 xo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hkLhyiEvpn+TwPUOhGSa2z4UnCevZJx3QB6aX6d6d7E=;
 b=nuxjgRaWxUQedt1VdGTb8dG9ZRnr1XGS85/E+/1664o0W9usYCpQ+riSXWV6DL3WPE
 D+7sBefyNTni3ncMAX2efCeKN4/WIGe+yaGYQqbiEY1OsIjpXttpC6VRst6NEXxRVI4/
 Pa7kL7CeNTDRPRFVhupGwGY3/2SvNy94kLtpBTV+9Y2/RL8WqdcctQ5/a9rWV/fO72zp
 k55iMM2kQea3DdXDny78gLj2XVAfhN2pYJRwqfVgWjRzXnd5Es5tQkLbw+vr5Zi88KrN
 dfjexiNcUWr0d70BrCqoMce5ban/psHf7e8LhbjRZ9ZO0Sn+HmsC526mhvBsoik9l5Hr
 XmzA==
X-Gm-Message-State: AFqh2kocC5Dm1yCvF8BjyII6ybQ3K3ZmkSjKyBuWtzuTUOaRufNkpA9Q
 n2dVXIhIRCnq2JfJ1elIFuBTIg==
X-Google-Smtp-Source: AMrXdXv6FdiDE3CZH7waVdMQf2NHOLgYXdwCDYy5jwq4mCh8PPsG/bRj6Fd1zFAvZ1z1NLh/yyR5iw==
X-Received: by 2002:a5d:67c7:0:b0:242:57bb:ee0f with SMTP id
 n7-20020a5d67c7000000b0024257bbee0fmr18054886wrw.25.1672403879085; 
 Fri, 30 Dec 2022 04:37:59 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0023c8026841csm20468935wrx.23.2022.12.30.04.37.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 04:37:58 -0800 (PST)
Message-ID: <e2c6364c-eee9-2bf1-9738-deccc35a57b8@linaro.org>
Date: Fri, 30 Dec 2022 13:37:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/3] hw/intc/loongarch_pch_msi: add irq number property
Content-Language: en-US
To: Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn
References: <20221230095950.2217103-1-zhaotianrui@loongson.cn>
 <20221230095950.2217103-2-zhaotianrui@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221230095950.2217103-2-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 30/12/22 10:59, Tianrui Zhao wrote:
> This patch adds irq number property for loongarch msi interrupt
> controller, and remove hard coding irq number macro.
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>   hw/intc/loongarch_pch_msi.c         | 33 ++++++++++++++++++++++++++---
>   hw/loongarch/virt.c                 | 13 +++++++-----
>   include/hw/intc/loongarch_pch_msi.h |  3 ++-
>   include/hw/pci-host/ls7a.h          |  1 -
>   4 files changed, 40 insertions(+), 10 deletions(-)


> +static void loongarch_pch_msi_realize(DeviceState *dev, Error **errp)
> +{
> +    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(dev);
> +
> +    if (!s->irq_num || s->irq_num  > PCH_MSI_IRQ_NUM) {

Here you check for s->irq_num != 0, ...

> +        error_setg(errp, "Invalid 'msi_irq_num'");
> +        return;
> +    }
> +
> +    s->pch_msi_irq = g_new(qemu_irq, s->irq_num);
> +    if (!s->pch_msi_irq) {

... so this check is unreachable / pointless: g_new() will never
return NULL but abort.

> +        error_report("loongarch_pch_msi: fail to alloc memory");
> +        exit(1);
> +    }
> +
> +    qdev_init_gpio_out(dev, s->pch_msi_irq, s->irq_num);
> +    qdev_init_gpio_in(dev, pch_msi_irq_handler, s->irq_num);
> +}

> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index 958be74fa1..1e58346aeb 100644
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

Maybe name this 'msi_irq_base'

> +    num = EXTIOI_IRQS - start;

and 'msi_irq_num' for clarity?

> +    qdev_prop_set_uint32(pch_msi, "msi_irq_base", start);
> +    qdev_prop_set_uint32(pch_msi, "msi_irq_num", num);
>       d = SYS_BUS_DEVICE(pch_msi);
>       sysbus_realize_and_unref(d, &error_fatal);
>       sysbus_mmio_map(d, 0, VIRT_PCH_MSI_ADDR_LOW);
> -    for (i = 0; i < PCH_MSI_IRQ_NUM; i++) {
> -        /* Connect 192 pch_msi irqs to extioi */
> +    for (i = 0; i < num; i++) {
> +        /* Connect pch_msi irqs to extioi */
>           qdev_connect_gpio_out(DEVICE(d), i,
> -                              qdev_get_gpio_in(extioi, i + PCH_MSI_IRQ_START));
> +                              qdev_get_gpio_in(extioi, i + start));
>       }

Removing the unreachable check:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


