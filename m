Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5923D6B0A22
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:56:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZuG0-0008Ko-Cp; Wed, 08 Mar 2023 08:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZuFw-0008Jn-Tn
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:55:01 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZuFv-0003U9-4C
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:55:00 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso1342378wmi.4
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 05:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678283696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5bTcHmPVt05j+/agFGAjugyt5zxIsiZXgmI9VS+ncL4=;
 b=nUs/V6klMKF/bcVGwt3S0+v8rrp3p77VoaigZQAMn9UNWnwGEZ8M1HrrkbL9knzlUL
 nD/mbSY1T6ajap0OTHMbdc1tEiZEETLtf09NKjLH/1nHwo9PS4YzF4mf4c22z0XqDrDH
 MUTicTmMjuTTABxjqDW9PU8EUhZD2YiOwGsUVg6Bh5SdmIwkpLkCXIyyZkRsbhfgX8U1
 aX9+wDt3Rb3gqvY8SZsGrvO9auZtYP2HWVpQwPSZcoH7wb6eDXFb2six5Op1Ra/rFBmD
 r/qivhEAuuVNhH7Tsi2763MmE75a8bCroOlt7J0c2XN/PBs4Y538cIJTT1b7xXMXrm7u
 i63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678283696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5bTcHmPVt05j+/agFGAjugyt5zxIsiZXgmI9VS+ncL4=;
 b=3BVX85ptZgPa4xNodzr+K7xKrFDiH0Z9fThI8ymC8WVMq20L6xLzqraVhKK6wGu4xQ
 J6LfEiFb6pMYV2Yp7U/E4KduP92aKXZdTIkCnGzLBpCq6uBk8We5re0rtZ0G1IBZKyad
 dTsTbfLDW1mlYt4RBxEKALWxSfpbEcgDyzBLHxHiosmV8XoGXg9xWn5E66l2rm8obTRw
 A/7AA1/FaVZdhi4/tv3MP8sl+7Aih2vITtxd+Ra1JX9AHAav116TLyouWSLrXLHY+6le
 TepmHnKR6gKK0hjOb7kf/TMdnkh6yhU02e5NFG772hgi0AjqwnXOA7gkqrs2DWi5eWSb
 JTxg==
X-Gm-Message-State: AO0yUKXxZ9iaDMkRJupxWBCQdsG8JSOMqKo7Uhehne5CJWXV2SqAhXAr
 mbYZIbM36Oh8/i/ttBq+EIiqhmY/jGat24xlaeQ=
X-Google-Smtp-Source: AK7set9lnXPOZltB2Dp/qJ6n0N9MO3RmABS1lbdHHQYXZwFuc4LyNXLhtppYqpoB3l0HfT7YTJoQ0w==
X-Received: by 2002:a05:600c:1c12:b0:3eb:389d:156c with SMTP id
 j18-20020a05600c1c1200b003eb389d156cmr16116392wms.37.1678283696139; 
 Wed, 08 Mar 2023 05:54:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d660a000000b002c70ce264bfsm15403545wru.76.2023.03.08.05.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 05:54:55 -0800 (PST)
Message-ID: <dab7a6d9-4bfe-0afe-8098-50cfaf0c6aae@linaro.org>
Date: Wed, 8 Mar 2023 14:54:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 14/20] hw/ppc/pegasos2: Fix PCI interrupt routing
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Rene Engel <ReneEngel80@emailn.de>, Bernhard Beschow <shentey@gmail.com>
References: <20230307234711.55375-1-philmd@linaro.org>
 <20230307234711.55375-15-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307234711.55375-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

Hi Zoltan,

On 8/3/23 00:47, Philippe Mathieu-Daudé wrote:
> From: BALATON Zoltan <balaton@eik.bme.hu>
> 
> According to the PegasosII schematics the PCI interrupt lines are
> connected to both the gpp pins of the Mv64361 north bridge and the
> PINT pins of the VT8231 south bridge so guests can get interrupts from
> either of these. So far we only had the MV64361 connections which
> worked for on board devices but for additional PCI devices (such as
> network or sound card added with -device) guest OSes expect interrupt
> from the ISA IRQ 9 where the firmware routes these PCI interrupts in
> VT8231 ISA bridge. After the previous patches we can now model this
> and also remove the board specific connection from mv64361. Also
> configure routing of these lines when using Virtual Open Firmware to
> match board firmware for guests that expect this.

IIUC the schematic, only tje INTA and INTB lines (AGP IRQs) are
bidirectional and shared between NB/SB.

INTC and INTC are SB output to NB input.

> This fixes PCI interrupts on pegasos2 under Linux, MorphOS and AmigaOS.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Tested-by: Rene Engel <ReneEngel80@emailn.de>
> Message-Id: <520ff9e6eeef600ee14a4116c0c7b11940cc499c.1678188711.git.balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/pci-host/mv64361.c |  4 ----
>   hw/ppc/pegasos2.c     | 26 +++++++++++++++++++++++++-
>   2 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
> index 298564f1f5..19e8031a3f 100644
> --- a/hw/pci-host/mv64361.c
> +++ b/hw/pci-host/mv64361.c
> @@ -873,10 +873,6 @@ static void mv64361_realize(DeviceState *dev, Error **errp)
>       }
>       sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cpu_irq);
>       qdev_init_gpio_in_named(dev, mv64361_gpp_irq, "gpp", 32);
> -    /* FIXME: PCI IRQ connections may be board specific */
> -    for (i = 0; i < PCI_NUM_PINS; i++) {
> -        s->pci[1].irq[i] = qdev_get_gpio_in_named(dev, "gpp", 12 + i);
> -    }
>   }
>   
>   static void mv64361_reset(DeviceState *dev)
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 7cc375df05..f1650be5ee 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -73,6 +73,8 @@ struct Pegasos2MachineState {
>       MachineState parent_obj;
>       PowerPCCPU *cpu;
>       DeviceState *mv;
> +    qemu_irq mv_pirq[PCI_NUM_PINS];
> +    qemu_irq via_pirq[PCI_NUM_PINS];
>       Vof *vof;
>       void *fdt_blob;
>       uint64_t kernel_addr;
> @@ -95,6 +97,15 @@ static void pegasos2_cpu_reset(void *opaque)
>       }
>   }
>   
> +static void pegasos2_pci_irq(void *opaque, int n, int level)

So this handler is only for A/B. We could rename it pegasos2_agp_irq()
and only wire it to the first 2 pins, but I since we can only register
one handler per bus, simpler to ...

> +{
> +    Pegasos2MachineState *pm = opaque;
> +
> +    /* PCI interrupt lines are connected to both MV64361 and VT8231 */
> +    qemu_set_irq(pm->mv_pirq[n], level);

... add a 'if (n < 2)' check here.

> +    qemu_set_irq(pm->via_pirq[n], level);
> +}

> @@ -156,11 +167,18 @@ static void pegasos2_init(MachineState *machine)
>       /* Marvell Discovery II system controller */
>       pm->mv = DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
>                             qdev_get_gpio_in(DEVICE(pm->cpu), PPC6xx_INPUT_INT)));
> +    for (i = 0; i < PCI_NUM_PINS; i++) {
> +        pm->mv_pirq[i] = qdev_get_gpio_in_named(pm->mv, "gpp", 12 + i);
> +    }
>       pci_bus = mv64361_get_pci_bus(pm->mv, 1);
> +    pci_bus_irqs(pci_bus, pegasos2_pci_irq, pm, PCI_NUM_PINS);
>   
>       /* VIA VT8231 South Bridge (multifunction PCI device) */
>       via = OBJECT(pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0),
>                                                    true, TYPE_VT8231_ISA));
> +    for (i = 0; i < PCI_NUM_PINS; i++) {

I'd rather declare as via_pirq[2] and iterate over ARRAY_SIZE() here
(and also use ARRAY_SIZE() in the new check in pegasos2_pci_irq).

> +        pm->via_pirq[i] = qdev_get_gpio_in_named(DEVICE(via), "pirq", i);
> +    }


