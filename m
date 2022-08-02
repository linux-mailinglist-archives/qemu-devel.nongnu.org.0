Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A207458826E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 21:21:39 +0200 (CEST)
Received: from localhost ([::1]:48740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIxSU-0007yJ-Pe
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 15:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oIxQ1-0004zW-Om; Tue, 02 Aug 2022 15:19:05 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:44946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oIxPz-0003e9-Pv; Tue, 02 Aug 2022 15:19:05 -0400
Received: by mail-oi1-x233.google.com with SMTP id bb16so17559494oib.11;
 Tue, 02 Aug 2022 12:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=soqYnYXxgDHmHP2un/kR4FxTk2V8rxRKMM4+sPGCC+c=;
 b=c66EST0FAAFg5SpGUX15mAR0E01guLOQAmc7Qx85GWbaODW4YMnsR8/9SRPDOt+bAk
 NBPGj7+rOPPkS0wkWPU+q5FCnnKpRu5O5aPtXENpjDmsXFG9pJbNnD0zrCMyIubp5xs/
 bTHA69x9ZhuoBRmFkQKSmkFl2JBzqlAlWT0dZlr6dlleHyori1XDub9kO5zzCBUs1kTl
 L0wKbMYdbUBO5y8knr32q5RWeiNcXwygLZQNDXWgaOS2apV0/a7t0t5PtZt6xd9RtV9p
 nNMFE8koTnLFDzY7d5yoDwo1jrhZWx+DjPV4CRNZl3qrco1aOy7J4Cnjt/5wsUXY3rZA
 +z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=soqYnYXxgDHmHP2un/kR4FxTk2V8rxRKMM4+sPGCC+c=;
 b=UZ0Wx3g2PuspzckgySl0Jh9wBnMVSIzabLPXGDaWXdZ4zie+Tamd9iJK4HKqCqG/y6
 4zXhDKk7UXQrZ6jiz5CwuyioIb2AT4TbMTuJeWjzppalbfzUsam5TcCjCJKpmo2oakCg
 VK7VWcZEmjLdCDxeEjUp2zfP2HZbS/zRD9o2V1qSuvhDgbE/gnDsM01+K6VkTDGjo/bs
 jrokcw8mJeJofEZPkgLhXOMNd/IOXLfkMkMJqTZtiTIKlGXjR1QazCjLhs2gHObpyqT2
 ee6TWg5d7pvzE/427JIF0GVrP8eyM30pvGIVLEcRR0esZPli42a/FoeNbKznzeIhrNUS
 aUpw==
X-Gm-Message-State: ACgBeo1evgyygjS04Sw/HPJS07BMtFE4gs+OmDPbw9ArCDq743KKyVdB
 JWX1+Hy49fXhfLMEdWizEBg=
X-Google-Smtp-Source: AA6agR5xy6BrEf7NjTv4k0ObFx0RkD/kFu+vZgLtM06d3J7fj2K+/Jn/bzIH/DCzx6TVJXtaVKRXiQ==
X-Received: by 2002:a05:6808:170b:b0:333:53cf:8022 with SMTP id
 bc11-20020a056808170b00b0033353cf8022mr404814oib.28.1659467942324; 
 Tue, 02 Aug 2022 12:19:02 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a9d6208000000b0061cbd18bd18sm3648525otj.45.2022.08.02.12.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 12:19:01 -0700 (PDT)
Message-ID: <ae33a6ed-cce6-cfc9-e6b1-3c6e8fb9ee41@gmail.com>
Date: Tue, 2 Aug 2022 16:18:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 04/19] ppc/ppc405: Introduce a PPC405 SoC
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-5-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220801131039.1693913-5-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
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
> It is an initial model to start QOMification of the PPC405 board.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/ppc405.h        | 17 ++++++++++++++
>   hw/ppc/ppc405_boards.c | 29 ++++++++++-------------
>   hw/ppc/ppc405_uc.c     | 53 ++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 82 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index 83f156f585c8..c8cddb71733a 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -25,6 +25,7 @@
>   #ifndef PPC405_H
>   #define PPC405_H
>   
> +#include "qom/object.h"
>   #include "hw/ppc/ppc4xx.h"
>   
>   #define PPC405EP_SDRAM_BASE 0x00000000
> @@ -62,6 +63,22 @@ struct ppc4xx_bd_info_t {
>       uint32_t bi_iic_fast[2];
>   };
>   
> +#define TYPE_PPC405_SOC "ppc405-soc"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405SoCState, PPC405_SOC);
> +
> +struct Ppc405SoCState {
> +    /* Private */
> +    DeviceState parent_obj;
> +
> +    /* Public */
> +    MemoryRegion sram;
> +    MemoryRegion ram_memories[2];
> +    hwaddr ram_bases[2], ram_sizes[2];
> +
> +    MemoryRegion *dram_mr;
> +    hwaddr ram_size;
> +};
> +
>   /* PowerPC 405 core */
>   ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
>   
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 24ec948d22a4..96db52c5a309 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -54,6 +54,8 @@ struct Ppc405MachineState {
>       /* Private */
>       MachineState parent_obj;
>       /* Public */
> +
> +    Ppc405SoCState soc;
>   };
>   
>   #define TYPE_PPC405_MACHINE MACHINE_TYPE_NAME("ppc405")
> @@ -232,12 +234,10 @@ static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
>   
>   static void ppc405_init(MachineState *machine)
>   {
> +    Ppc405MachineState *ppc405 = PPC405_MACHINE(machine);
>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>       const char *kernel_filename = machine->kernel_filename;
>       PowerPCCPU *cpu;
> -    MemoryRegion *sram = g_new(MemoryRegion, 1);
> -    MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
> -    hwaddr ram_bases[2], ram_sizes[2];
>       MemoryRegion *sysmem = get_system_memory();
>       DeviceState *uicdev;
>   
> @@ -248,23 +248,18 @@ static void ppc405_init(MachineState *machine)
>           exit(EXIT_FAILURE);
>       }
>   
> -    /* XXX: fix this */
> -    memory_region_init_alias(&ram_memories[0], NULL, "ef405ep.ram.alias",
> -                             machine->ram, 0, machine->ram_size);
> -    ram_bases[0] = 0;
> -    ram_sizes[0] = machine->ram_size;
> -    memory_region_init(&ram_memories[1], NULL, "ef405ep.ram1", 0);
> -    ram_bases[1] = 0x00000000;
> -    ram_sizes[1] = 0x00000000;
> +    object_initialize_child(OBJECT(machine), "soc", &ppc405->soc,
> +                            TYPE_PPC405_SOC);
> +    object_property_set_uint(OBJECT(&ppc405->soc), "ram-size",
> +                             machine->ram_size, &error_fatal);
> +    object_property_set_link(OBJECT(&ppc405->soc), "dram",
> +                             OBJECT(machine->ram), &error_abort);
> +    qdev_realize(DEVICE(&ppc405->soc), NULL, &error_abort);
>   
> -    cpu = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
> +    cpu = ppc405ep_init(sysmem, ppc405->soc.ram_memories, ppc405->soc.ram_bases,
> +                        ppc405->soc.ram_sizes,
>                           33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
>   
> -    /* allocate SRAM */
> -    memory_region_init_ram(sram, NULL, "ef405ep.sram", PPC405EP_SRAM_SIZE,
> -                           &error_fatal);
> -    memory_region_add_subregion(sysmem, PPC405EP_SRAM_BASE, sram);
> -
>       /* allocate and load BIOS */
>       if (machine->firmware) {
>           MemoryRegion *bios = g_new(MemoryRegion, 1);
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index d6420c88d3a6..156e839b8283 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -30,6 +30,7 @@
>   #include "hw/ppc/ppc.h"
>   #include "hw/i2c/ppc4xx_i2c.h"
>   #include "hw/irq.h"
> +#include "hw/qdev-properties.h"
>   #include "ppc405.h"
>   #include "hw/char/serial.h"
>   #include "qemu/timer.h"
> @@ -1530,3 +1531,55 @@ PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
>   
>       return cpu;
>   }
> +
> +static void ppc405_soc_realize(DeviceState *dev, Error **errp)
> +{
> +    Ppc405SoCState *s = PPC405_SOC(dev);
> +    Error *err = NULL;
> +
> +    /* XXX: fix this ? */
> +    memory_region_init_alias(&s->ram_memories[0], OBJECT(s),
> +                             "ef405ep.ram.alias", s->dram_mr, 0, s->ram_size);
> +    s->ram_bases[0] = 0;
> +    s->ram_sizes[0] = s->ram_size;
> +    memory_region_init(&s->ram_memories[1], OBJECT(s), "ef405ep.ram1", 0);
> +    s->ram_bases[1] = 0x00000000;
> +    s->ram_sizes[1] = 0x00000000;
> +
> +    /* allocate SRAM */
> +    memory_region_init_ram(&s->sram, OBJECT(s), "ef405ep.sram",
> +                           PPC405EP_SRAM_SIZE,  &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_add_subregion(get_system_memory(), PPC405EP_SRAM_BASE,
> +                                &s->sram);
> +}
> +
> +static Property ppc405_soc_properties[] = {
> +    DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
> +    DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void ppc405_soc_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ppc405_soc_realize;
> +    dc->user_creatable = false;
> +    device_class_set_props(dc, ppc405_soc_properties);
> +}
> +
> +static const TypeInfo ppc405_types[] = {
> +    {
> +        .name           = TYPE_PPC405_SOC,
> +        .parent         = TYPE_DEVICE,
> +        .instance_size  = sizeof(Ppc405SoCState),
> +        .class_init     = ppc405_soc_class_init,
> +    }
> +};
> +
> +DEFINE_TYPES(ppc405_types)

