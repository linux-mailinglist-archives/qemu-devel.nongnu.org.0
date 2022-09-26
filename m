Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D84A5EADF5
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 19:18:30 +0200 (CEST)
Received: from localhost ([::1]:43782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocrkT-0005th-0Y
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 13:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocrKy-0004sZ-RE; Mon, 26 Sep 2022 12:52:09 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:42884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocrKw-0002OO-UL; Mon, 26 Sep 2022 12:52:08 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 z18-20020a9d65d2000000b0065c3705f7beso606507oth.9; 
 Mon, 26 Sep 2022 09:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=yY9IvCZkPNZr1msMsrVQrUNIWdNpG4c3xU2SmpfgO3g=;
 b=Sx6ZDXI14edQ2pEFaXAU+hEKqwLcYrMNhOC5R4Z9qSLpx/LOlSxGKnfB5mL338BVov
 uAs9bY0ZYHm6YmsKgWLw+3mIG60b94tP1v7fKW/Q8n2HYEEsLyUY1gvPhjGgQjCaM1SL
 TA0UhYmCRxIqa4hEngI6ZMptmnnocNxyoURftdAde3aYLgowPEKk9pYTXzP4VcDkxS5n
 sHLnGpvOWIpjSnRJ5FSEH5t5e1SPPWKBg5Gdwbgdli1cGuknzu9W9DYjHnH9/BzpjE4s
 Ym95XnWoK5SPexLgmz8U/s97iL0yNlNb+g3hK5kQowQ19IuVga83r/DMnFCpavP9FgZq
 QRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=yY9IvCZkPNZr1msMsrVQrUNIWdNpG4c3xU2SmpfgO3g=;
 b=67sDh8feY2xn8aOrhN94r1IlxpG4a1th/wFogPvq775TrgAoLMyk+vmkHVXgVFklTY
 kRf5WDLdlsXaFQDVY7JdmgUf/hlR/BMj9P2+MMSvnl3B+Q3GyIv5Mx2dfSAsblJ4ByaT
 HEmv/7E1zUgXnkXa8hR0e7ZbN3mR8GNKuHNQBm5OVvaaIUEGep7sL3kV3yh2YrOBNijA
 NSD1/0s4ZzsIuKvSWepbpU3xjrgLk9V8Zm/4vFwh53dmJ6B5a0UOFJ4VNjueU46dqLde
 +Urg/vW8L0yAsNW+NYskXqo5n8XVmkdXEyq3rJYLTgNmHBX/9LljT8QB2m6lV4+PuGjx
 qZ2A==
X-Gm-Message-State: ACrzQf1phjMEomAqJs5ZoWCcKOJNBYmn1Yt7jaupyXt7oWTrr2JKRkLX
 LgvtY8K9YREXDyf1uMJnSWo=
X-Google-Smtp-Source: AMsMyM6n2AW93qjCujmdTu2wTUWkt3JKVsUjpf7MnpnC6Qsk3u6rIyQ3tkqg848FL4lD8e7Q7ra/bQ==
X-Received: by 2002:a05:6830:1397:b0:655:bbc5:f04c with SMTP id
 d23-20020a056830139700b00655bbc5f04cmr10963749otq.249.1664211124956; 
 Mon, 26 Sep 2022 09:52:04 -0700 (PDT)
Received: from [192.168.10.102] (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 u74-20020acaab4d000000b00350267304a4sm7179197oie.12.2022.09.26.09.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 09:52:04 -0700 (PDT)
Message-ID: <22c3993a-ab2a-a313-2a73-658a9ddaa172@gmail.com>
Date: Mon, 26 Sep 2022 13:52:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6 03/25] ppc4xx_sdram: Get rid of the init RAM hack
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Peter Maydell <peter.maydell@linaro.org>
References: <cover.1664021647.git.balaton@eik.bme.hu>
 <d6c44c870befa1a075e21f1a59926dcdaff63f6b.1664021647.git.balaton@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <d6c44c870befa1a075e21f1a59926dcdaff63f6b.1664021647.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/24/22 09:27, BALATON Zoltan wrote:
> The do_init parameter of ppc4xx_sdram_init() is used to map memory
> regions that is normally done by the firmware by programming the SDRAM
> controller. Do this from board code emulating what firmware would do
> when booting a kernel directly from -kernel without a firmware so we
> can get rid of this do_init hack.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


> v5: Add function to enable sdram controller
> v2: Fix ref405ep boot with -kernel and U-Boot
> 
>   hw/ppc/ppc405.h         |  1 -
>   hw/ppc/ppc405_boards.c  |  3 +--
>   hw/ppc/ppc405_uc.c      |  4 +---
>   hw/ppc/ppc440_bamboo.c  |  4 +++-
>   hw/ppc/ppc4xx_devs.c    | 12 +++++++-----
>   include/hw/ppc/ppc4xx.h |  5 +++--
>   6 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index 1e558c7831..756865621b 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -169,7 +169,6 @@ struct Ppc405SoCState {
>       /* Public */
>       MemoryRegion ram_banks[2];
>       hwaddr ram_bases[2], ram_sizes[2];
> -    bool do_dram_init;
>   
>       MemoryRegion *dram_mr;
>       hwaddr ram_size;
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 083f12b23e..1eaeca8806 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -288,8 +288,6 @@ static void ppc405_init(MachineState *machine)
>                                machine->ram_size, &error_fatal);
>       object_property_set_link(OBJECT(&ppc405->soc), "dram",
>                                OBJECT(machine->ram), &error_abort);
> -    object_property_set_bool(OBJECT(&ppc405->soc), "dram-init",
> -                             kernel_filename != NULL, &error_abort);
>       object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 33333333,
>                                &error_abort);
>       qdev_realize(DEVICE(&ppc405->soc), NULL, &error_fatal);
> @@ -349,6 +347,7 @@ static void ppc405_init(MachineState *machine)
>   
>       /* Load ELF kernel and rootfs.cpio */
>       } else if (kernel_filename && !machine->firmware) {
> +        ppc4xx_sdram_enable(&ppc405->soc.cpu.env);
>           boot_from_kernel(machine, &ppc405->soc.cpu);
>       }
>   }
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 2ca42fdef6..1e02347e57 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -1081,8 +1081,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>                                s->ram_bases[0], s->ram_sizes[0]);
>   
>       ppc4xx_sdram_init(env, qdev_get_gpio_in(DEVICE(&s->uic), 17), 1,
> -                      s->ram_banks, s->ram_bases, s->ram_sizes,
> -                      s->do_dram_init);
> +                      s->ram_banks, s->ram_bases, s->ram_sizes);
>   
>       /* External bus controller */
>       if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->ebc), &s->cpu, errp)) {
> @@ -1160,7 +1159,6 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>   static Property ppc405_soc_properties[] = {
>       DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
>                        MemoryRegion *),
> -    DEFINE_PROP_BOOL("dram-init", Ppc405SoCState, do_dram_init, 0),
>       DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index 5ec82fa8c2..409a8840da 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -211,7 +211,9 @@ static void bamboo_init(MachineState *machine)
>       ppc4xx_sdram_init(env,
>                         qdev_get_gpio_in(uicdev, 14),
>                         PPC440EP_SDRAM_NR_BANKS, ram_memories,
> -                      ram_bases, ram_sizes, 1);
> +                      ram_bases, ram_sizes);
> +    /* Enable SDRAM memory regions, this should be done by the firmware */
> +    ppc4xx_sdram_enable(env);
>   
>       /* PCI */
>       dev = sysbus_create_varargs(TYPE_PPC4xx_PCI_HOST_BRIDGE,
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index 1226ec4aa9..3475589679 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -350,8 +350,7 @@ static void sdram_reset(void *opaque)
>   void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
>                          MemoryRegion *ram_memories,
>                          hwaddr *ram_bases,
> -                       hwaddr *ram_sizes,
> -                       int do_init)
> +                       hwaddr *ram_sizes)
>   {
>       ppc4xx_sdram_t *sdram;
>       int i;
> @@ -369,9 +368,12 @@ void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
>                        sdram, &dcr_read_sdram, &dcr_write_sdram);
>       ppc_dcr_register(env, SDRAM0_CFGDATA,
>                        sdram, &dcr_read_sdram, &dcr_write_sdram);
> -    if (do_init) {
> -        sdram_map_bcr(sdram);
> -    }
> +}
> +
> +void ppc4xx_sdram_enable(CPUPPCState *env)
> +{
> +    ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x20);
> +    ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x80000000);
>   }
>   
>   /*
> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
> index 2af0d60577..13b3229851 100644
> --- a/include/hw/ppc/ppc4xx.h
> +++ b/include/hw/ppc/ppc4xx.h
> @@ -37,6 +37,8 @@ typedef struct {
>       uint32_t bcr;
>   } Ppc4xxSdramBank;
>   
> +void ppc4xx_sdram_enable(CPUPPCState *env);
> +
>   void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>                           MemoryRegion ram_memories[],
>                           hwaddr ram_bases[], hwaddr ram_sizes[],
> @@ -45,8 +47,7 @@ void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>   void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq irq, int nbanks,
>                           MemoryRegion ram_memories[],
>                           hwaddr *ram_bases,
> -                        hwaddr *ram_sizes,
> -                        int do_init);
> +                        hwaddr *ram_sizes);
>   
>   #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
>   

