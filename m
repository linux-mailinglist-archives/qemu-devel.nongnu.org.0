Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 816CC5BBAD6
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 00:20:40 +0200 (CEST)
Received: from localhost ([::1]:34988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZgAx-00053f-9w
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 18:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZg74-00018V-Re; Sat, 17 Sep 2022 18:16:40 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZg72-0004oY-VH; Sat, 17 Sep 2022 18:16:38 -0400
Received: by mail-wr1-x434.google.com with SMTP id c11so41440440wrp.11;
 Sat, 17 Sep 2022 15:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=xGvXuTdl2446XWymFxjfvykwNmNX4eFIPx/8uvj00cE=;
 b=APiG78gmSq6LTEsDOeRe3GbfH5rumdDiQlwGB7Ct88uYiDgNrgmiZiyDqzrMGTeGcW
 2f53oFmu0gG85s/L+WnDPTcxvvZob/6x+YSQiPWIv5OptZDuUka+tgt+BfByVrp+Gcuf
 Yb6ybCYn7w+Wx850VUYOSicINzI2yQWnK2mtwqFNsocE6LoW64W5QKZ0jfJzi/J73DfW
 DbLnqCDGj5jerbxwj1NjO6xYSHxo51kOvlwKjh4oq3bu1QMCoW70CiBsO0BaLB5DkRPK
 OVk79Vrzcg3ubTnTy2kml/zOMtn5SdV6KjIx7ftlA1M+jnOm3oBtEGQ+gmNvHasdrFdO
 f4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=xGvXuTdl2446XWymFxjfvykwNmNX4eFIPx/8uvj00cE=;
 b=2Ap8KBYSzQ2unkQOlg7LF+qt+9DAF2cI9navI46LKcvn1Ns2uOQHs01VwDDSx6Oq0b
 scGLEHW/JG2jN+Aexvpot7aOfLv95KGc3eyKS4C3hDCj613yL7UVuXRBC3Qqtj6iTfJa
 PSC4l8eBEJFMmjt60I36gtCN+ypSBuP6N/+7y/Y+tdFfneIXrTAh/YG47FwxcOLDxHvr
 c5oNwKSvrvDE4oU7JZPLw6Z9jgu0Asa/8CjZWYDeHkMwTFxecXCF5xgmeSA1qK0buKzx
 U7erHx0dZKst2/D20E5+iDcHATGnUWSQyYAjsrV+Mi5zeZPSKh6xV8MuXoNfYMvY1ZAH
 klxQ==
X-Gm-Message-State: ACrzQf24vHC/ZkeEfItDwr7VyreRx9eDHCSqdPyPp1Yd3VDjBIvHu3Pl
 KvQLWCfRnjzl0sjf106nFKw=
X-Google-Smtp-Source: AMsMyM4SBecdeFj2mPmkY32CNbKsmYmNJeZoa6Dk8yklYM16gMXn5vWGJajMU2LkRgiIt+Pr7d+OXQ==
X-Received: by 2002:a5d:59a7:0:b0:22a:47e3:a1b with SMTP id
 p7-20020a5d59a7000000b0022a47e30a1bmr6525243wrr.319.1663452995019; 
 Sat, 17 Sep 2022 15:16:35 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z3-20020adff1c3000000b0022af9555669sm321867wro.99.2022.09.17.15.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 15:16:34 -0700 (PDT)
Message-ID: <cb366d11-7abd-c70c-6392-d74f3fabf04b@amsat.org>
Date: Sun, 18 Sep 2022 00:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 14/21] ppc440_sdram: Move RAM size check to
 ppc440_sdram_init
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1663154398.git.balaton@eik.bme.hu>
 <1e6385a288c0756cb8ec3b2a526393b509fdba40.1663154398.git.balaton@eik.bme.hu>
In-Reply-To: <1e6385a288c0756cb8ec3b2a526393b509fdba40.1663154398.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 14/9/22 13:34, BALATON Zoltan wrote:
> Move the check for valid memory sizes from board to sdram controller
> init. Board now only checks for additional restrictions imposed by
> firmware then sdram init checks for valid sizes for SoC.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc440.h    |  4 ++--
>   hw/ppc/ppc440_uc.c | 15 +++++++--------
>   hw/ppc/sam460ex.c  | 32 +++++++++++++++++---------------
>   3 files changed, 26 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/ppc/ppc440.h b/hw/ppc/ppc440.h
> index 01d76b8000..29f6f14ed7 100644
> --- a/hw/ppc/ppc440.h
> +++ b/hw/ppc/ppc440.h
> @@ -11,13 +11,13 @@
>   #ifndef PPC440_H
>   #define PPC440_H
>   
> -#include "hw/ppc/ppc4xx.h"
> +#include "hw/ppc/ppc.h"
>   
>   void ppc4xx_l2sram_init(CPUPPCState *env);
>   void ppc4xx_cpr_init(CPUPPCState *env);
>   void ppc4xx_sdr_init(CPUPPCState *env);
>   void ppc440_sdram_init(CPUPPCState *env, int nbanks,
> -                       Ppc4xxSdramBank *ram_banks);
> +                       MemoryRegion *ram);
>   void ppc4xx_ahb_init(CPUPPCState *env);
>   void ppc4xx_dma_init(CPUPPCState *env, int dcr_base);
>   void ppc460ex_pcie_init(CPUPPCState *env);
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index fa313f979d..bd2a489557 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -486,7 +486,7 @@ void ppc4xx_sdr_init(CPUPPCState *env)
>   typedef struct ppc440_sdram_t {
>       uint32_t addr;
>       uint32_t mcopt2;
> -    int nbanks;
> +    int nbanks; /* Banks to use from the 4, e.g. when board has less slots */
>       Ppc4xxSdramBank bank[4];
>   } ppc440_sdram_t;
>   
> @@ -732,18 +732,17 @@ static void sdram_ddr2_reset(void *opaque)
>   }
>   
>   void ppc440_sdram_init(CPUPPCState *env, int nbanks,
> -                       Ppc4xxSdramBank *ram_banks)
> +                       MemoryRegion *ram)
>   {
>       ppc440_sdram_t *s;
> -    int i;
> +    const ram_addr_t valid_bank_sizes[] = {
> +        4 * GiB, 2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB, 64 * MiB,
> +        32 * MiB, 16 * MiB, 8 * MiB, 0

Where 16/8 come from?

> +    };
>   
>       s = g_malloc0(sizeof(*s));
>       s->nbanks = nbanks;
> -    for (i = 0; i < nbanks; i++) {
> -        s->bank[i].ram = ram_banks[i].ram;
> -        s->bank[i].base = ram_banks[i].base;
> -        s->bank[i].size = ram_banks[i].size;
> -    }
> +    ppc4xx_sdram_banks(ram, s->nbanks, s->bank, valid_bank_sizes);
>       qemu_register_reset(&sdram_ddr2_reset, s);
>       ppc_dcr_register(env, SDRAM0_CFGADDR,
>                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index dac329d482..9b850808a3 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -74,13 +74,6 @@
>   #define EBC_FREQ 115000000
>   #define UART_FREQ 11059200
>   
> -/* The SoC could also handle 4 GiB but firmware does not work with that. */
> -/* Maybe it overflows a signed 32 bit number somewhere? */
> -static const ram_addr_t ppc460ex_sdram_bank_sizes[] = {
> -    2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB, 64 * MiB,
> -    32 * MiB, 0
> -};
> -
>   struct boot_info {
>       uint32_t dt_base;
>       uint32_t dt_size;
> @@ -273,7 +266,6 @@ static void sam460ex_init(MachineState *machine)
>   {
>       MemoryRegion *address_space_mem = get_system_memory();
>       MemoryRegion *isa = g_new(MemoryRegion, 1);
> -    Ppc4xxSdramBank *ram_banks = g_new0(Ppc4xxSdramBank, 1);
>       MemoryRegion *l2cache_ram = g_new(MemoryRegion, 1);
>       DeviceState *uic[4];
>       int i;
> @@ -340,12 +332,22 @@ static void sam460ex_init(MachineState *machine)
>       }
>   
>       /* SDRAM controller */
> -    /* put all RAM on first bank because board has one slot
> -     * and firmware only checks that */
> -    ppc4xx_sdram_banks(machine->ram, 1, ram_banks, ppc460ex_sdram_bank_sizes);
> -
> +    /* The SoC could also handle 4 GiB but firmware does not work with that. */
> +    if (machine->ram_size > 2 * GiB) {
> +        error_report("Memory over 2 GiB is not supported");
> +        exit(1);
> +    }
> +    /* Firmware needs at least 64 MiB */
> +    if (machine->ram_size < 64 * MiB) {
> +        error_report("Memory below 64 MiB is not supported");
> +        exit(1);
> +    }
> +    /*
> +     * Put all RAM on first bank because board has one slot
> +     * and firmware only checks that
> +     */
> +    ppc440_sdram_init(env, 1, machine->ram);
>       /* FIXME: does 460EX have ECC interrupts? */
> -    ppc440_sdram_init(env, 1, ram_banks);
>       /* Enable SDRAM memory regions as we may boot without firmware */
>       if (ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x21) ||
>           ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x08000000)) {
> @@ -358,8 +360,8 @@ static void sam460ex_init(MachineState *machine)
>                                  qdev_get_gpio_in(uic[0], 2));
>       i2c = PPC4xx_I2C(dev)->bus;
>       /* SPD EEPROM on RAM module */
> -    spd_data = spd_data_generate(ram_banks->size < 128 * MiB ? DDR : DDR2,
> -                                 ram_banks->size);
> +    spd_data = spd_data_generate(machine->ram_size < 128 * MiB ? DDR : DDR2,
> +                                 machine->ram_size);
>       spd_data[20] = 4; /* SO-DIMM module */
>       smbus_eeprom_init_one(i2c, 0x50, spd_data);
>       /* RTC */


