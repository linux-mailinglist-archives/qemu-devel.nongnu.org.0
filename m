Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7831588927
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 11:14:14 +0200 (CEST)
Received: from localhost ([::1]:51312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJASE-0001qo-0q
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 05:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJANn-0008Fo-HM; Wed, 03 Aug 2022 05:09:39 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c]:41605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJANl-0007bb-MQ; Wed, 03 Aug 2022 05:09:39 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id n15so8327560vkk.8;
 Wed, 03 Aug 2022 02:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Xq0ZDjgtPqAsCgyYuFquGSsgZ3kw5kh8sVdh9xybE+o=;
 b=M2a//7ZZmAoZZwyfBCYRgbioNn2anxWDmsd1XShzhveRo+Jjvb8WB8QAH4kaf/icj3
 4BXMAqlL82skaQ3VlmokERZmzeWCUhOWr7BQtQf7fB60VviQA7XllYGRaWALmbrnpq02
 PLnvx8q/e55SvPX7+2HX976CEMP+Iq2wxoUhDZRDiOxRUvA2+mWJvfV7T8zfsYPbmqhU
 Fh3bFs+XaDkqsFrlEpW8QhI95KEu3tyQMGJAQHbd6QpjSpRLKQ/Dt1XT/INp33W5Kvp8
 otxv5aFXETcUh9xCt8xOxhck0xca7qTRyS3yELe5jD1f0HaAVRd4dJuH7iT8UzokcZF3
 AnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Xq0ZDjgtPqAsCgyYuFquGSsgZ3kw5kh8sVdh9xybE+o=;
 b=kxX3K/T3+pyrtDI6TOdYcit10NcSuacHRdgudbT0AFfbThYeYWfmVxhbLbqCXafbIS
 wdcTZCgy3uuwHIX8yRxoQ3fcWUgJ2w83MXZVTmAa4se8zsATFhDVNcDClDIp+I3ZxBpv
 njSpAzdX0pqWVjFbRKWAIxA2f3f3l8c60GPiafc5YGQ9QfFBY6IGvBNiY7GWwHab9DuB
 dUD+6RsHqV7pYsp2ahB098wgP8/9T8E3Ul5T6U4mmYUgPMaMQ1yuA+cgYJLNnnaVtfUn
 9oWL2if1GRXeWh4xWsOvQBajb8xHHuYN87sm0Qyv/TqSCjPNL18b1X5r7/27CfF3go6u
 JiFQ==
X-Gm-Message-State: ACgBeo0NK1gtedTFfjkKXEwTD/Xt17GVot28lOCbMC+4pF/mKOmm39hM
 XSaiIe4ghWtmfHS0KyCInWdoxo4myvY=
X-Google-Smtp-Source: AA6agR6by0wxtUsDqoiwhEqQj8Orlys3IECsPeePiX5vj5SH6eLJzb0lUsX7G4y7DR4kDIwOZtYqWg==
X-Received: by 2002:ac5:c92d:0:b0:377:37fb:945b with SMTP id
 u13-20020ac5c92d000000b0037737fb945bmr6601501vkl.30.1659517776245; 
 Wed, 03 Aug 2022 02:09:36 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a67f8d2000000b003861d2f31efsm4602499vsp.3.2022.08.03.02.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 02:09:35 -0700 (PDT)
Message-ID: <9e113398-e0cd-7902-a910-654eaedde56d@gmail.com>
Date: Wed, 3 Aug 2022 06:09:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 06/19] ppc/ppc405: QOM'ify CPU
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-7-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220801131039.1693913-7-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 8/1/22 10:10, Cédric Le Goater wrote:
> Drop the use of ppc4xx_init() and duplicate a bit of code related to
> clocks in the SoC realize routine. We will clean that up in the
> following patches.
> 
> ppc_dcr_init simply allocates default DCR handlers for the CPU. Maybe
> this could be done in model initializer of the CPU families needing it.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/ppc405.h        |  2 +-
>   hw/ppc/ppc405_boards.c |  2 +-
>   hw/ppc/ppc405_uc.c     | 34 ++++++++++++++++++++++++----------
>   3 files changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index 5e4e96d86ceb..4e99ab48be36 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -80,7 +80,7 @@ struct Ppc405SoCState {
>       hwaddr ram_size;
>   
>       uint32_t sysclk;
> -    PowerPCCPU *cpu;
> +    PowerPCCPU cpu;
>       DeviceState *uic;
>   };
>   
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 363cb0770506..82b51cc457fa 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -313,7 +313,7 @@ static void ppc405_init(MachineState *machine)
>   
>       /* Load ELF kernel and rootfs.cpio */
>       } else if (kernel_filename && !machine->firmware) {
> -        boot_from_kernel(machine, ppc405->soc.cpu);
> +        boot_from_kernel(machine, &ppc405->soc.cpu);
>       }
>   }
>   
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 59612504bf3f..b84749b36114 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -1432,10 +1432,18 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
>   #endif
>   }
>   
> +static void ppc405_soc_instance_init(Object *obj)
> +{
> +    Ppc405SoCState *s = PPC405_SOC(obj);
> +
> +    object_initialize_child(obj, "cpu", &s->cpu,
> +                            POWERPC_CPU_TYPE_NAME("405ep"));
> +}
> +
>   static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>   {
>       Ppc405SoCState *s = PPC405_SOC(dev);
> -    clk_setup_t clk_setup[PPC405EP_CLK_NB], tlb_clk_setup;
> +    clk_setup_t clk_setup[PPC405EP_CLK_NB];
>       qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
>       CPUPPCState *env;
>       Error *err = NULL;
> @@ -1462,12 +1470,17 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>       memset(clk_setup, 0, sizeof(clk_setup));
>   
>       /* init CPUs */
> -    s->cpu = ppc4xx_init(POWERPC_CPU_TYPE_NAME("405ep"),
> -                      &clk_setup[PPC405EP_CPU_CLK],
> -                      &tlb_clk_setup, s->sysclk);
> -    env = &s->cpu->env;
> -    clk_setup[PPC405EP_CPU_CLK].cb = tlb_clk_setup.cb;
> -    clk_setup[PPC405EP_CPU_CLK].opaque = tlb_clk_setup.opaque;
> +    if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
> +        return;
> +    }
> +
> +    env = &s->cpu.env;
> +
> +    clk_setup[PPC405EP_CPU_CLK].cb =
> +        ppc_40x_timers_init(env, s->sysclk, PPC_INTERRUPT_PIT);
> +    clk_setup[PPC405EP_CPU_CLK].opaque = env;
> +
> +    ppc_dcr_init(env, NULL, NULL);
>   
>       /* CPU control */
>       ppc405ep_cpc_init(env, clk_setup, s->sysclk);
> @@ -1484,16 +1497,16 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>       /* Universal interrupt controller */
>       s->uic = qdev_new(TYPE_PPC_UIC);
>   
> -    object_property_set_link(OBJECT(s->uic), "cpu", OBJECT(s->cpu),
> +    object_property_set_link(OBJECT(s->uic), "cpu", OBJECT(&s->cpu),
>                                &error_fatal);
>       if (!sysbus_realize(SYS_BUS_DEVICE(s->uic), errp)) {
>           return;
>       }
>   
>       sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_INT,
> -                       qdev_get_gpio_in(DEVICE(s->cpu), PPC40x_INPUT_INT));
> +                       qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_INT));
>       sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_CINT,
> -                       qdev_get_gpio_in(DEVICE(s->cpu), PPC40x_INPUT_CINT));
> +                       qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_CINT));
>   
>       /* SDRAM controller */
>       /* XXX 405EP has no ECC interrupt */
> @@ -1575,6 +1588,7 @@ static const TypeInfo ppc405_types[] = {
>           .name           = TYPE_PPC405_SOC,
>           .parent         = TYPE_DEVICE,
>           .instance_size  = sizeof(Ppc405SoCState),
> +        .instance_init  = ppc405_soc_instance_init,
>           .class_init     = ppc405_soc_class_init,
>       }
>   };

