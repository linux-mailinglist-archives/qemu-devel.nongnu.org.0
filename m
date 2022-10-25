Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6137460D458
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 21:08:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onPE1-0002a6-8W; Tue, 25 Oct 2022 15:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onPDP-0002MR-3U; Tue, 25 Oct 2022 15:04:08 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onPDL-00073s-Mg; Tue, 25 Oct 2022 15:03:54 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-13b6c1c89bdso11030549fac.13; 
 Tue, 25 Oct 2022 12:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LF66vXnYMwWux2AtpPtTkjQO6ml71eRAPYoPPJcH5zk=;
 b=lfGE/qJE3Q/a+tH8CARPjNsb3wMifZToRPtxnNbcL1EyLkKaJDk3L3PkHj3gPmP1GR
 PrXqV4mJ8s8qUt0aPM5Z0LuO7K1s50C26M0kgS+NWHo4RRMsxElJuEOtFkrRWAZQRjQL
 b0VfrZGdewWBeRcyA7NQlYsh3K9ezEg2tVny4UdkhqmKpZJN33x2iD2ZwRRPIen3MM+z
 5gT/qWXUIvwHWeQWY9BTSQ+9GPILbNBDXXH76YekOuUfdgQGVDxT9RbJfk9fDcQFTOtk
 SmkP1WT+9esLc2L5YNjyN+JLGtfYsK513Gh0ttIYEjrWmy6TyI0Efs+8pS3Nq55e0mxp
 /1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LF66vXnYMwWux2AtpPtTkjQO6ml71eRAPYoPPJcH5zk=;
 b=XIeQDhkvVg/PO5Hmx+tsVRUDePODkHNQH6NpvJCkjIyek4OhqlFiiFnE6bPLK7ozN0
 k8p6BhgdwFBKP8bir05alKEu20ktFSWlUqgZEUu2PmjCIeT1ANJbdrqmFmNxKF8arJYh
 i1P+e4FUnsRUCMe1k5jNbO/Hn+z+vcbO9m0Hmi2JBgSNVxna7uim9h22wsqfQjg8ObKv
 S4c4FOtgcH+DLTRXXxWi6O1owA1f8qSTKgWyDZ5V7nscT4Nom8zzfxrI2zXRRNPiN5Xl
 qrC/fC9YWbR3Kt2mSUUH+SuJZpORKcVvKFQJiBEjhPE5HqGSdWKsorkBhNJGOufijj48
 RbQg==
X-Gm-Message-State: ACrzQf0vGbrjYl5zhMN6jSKqQof9T6G/QRpay/gI7+b0hnOixH9yHQCN
 03qdrMhif/0vc6qWLNKI8YA=
X-Google-Smtp-Source: AMsMyM5oRTp3qJVLpJGkkU4P4m7mppc0wMC4/tepy177VvZzNGmZgtmtoDgUI08WVKBpkfNL08vepQ==
X-Received: by 2002:a05:6870:e2ce:b0:13b:9805:57d8 with SMTP id
 w14-20020a056870e2ce00b0013b980557d8mr199392oad.7.1666724627187; 
 Tue, 25 Oct 2022 12:03:47 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a05680801c600b0035173c2fddasm1202685oic.51.2022.10.25.12.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 12:03:46 -0700 (PDT)
Message-ID: <863fff5a-c65f-1831-6808-50e61a002410@gmail.com>
Date: Tue, 25 Oct 2022 16:03:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v7 6/8] ppc4xx_sdram: Generalise bank setup
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, philmd@linaro.org
References: <cover.1666194485.git.balaton@eik.bme.hu>
 <51b957b4b2d714a1072aa2589b979e08411640df.1666194485.git.balaton@eik.bme.hu>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <51b957b4b2d714a1072aa2589b979e08411640df.1666194485.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 10/19/22 13:02, BALATON Zoltan wrote:
> Currently only base and size are set on initial bank creation and bcr
> value is computed on mapping the region. Set bcr at init so the bcr
> encoding method becomes local to the controller model and mapping and
> unmapping can operate on the bank so it can be shared between
> different controller models. This patch converts the DDR2 controller.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/ppc4xx_sdram.c | 91 ++++++++++++++++++++++---------------------
>   hw/ppc/trace-events   |  1 +
>   2 files changed, 48 insertions(+), 44 deletions(-)
> 
> diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
> index 4bc53c8f01..63a33b8fd4 100644
> --- a/hw/ppc/ppc4xx_sdram.c
> +++ b/hw/ppc/ppc4xx_sdram.c
> @@ -105,6 +105,7 @@ static void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>   
>   static void sdram_bank_map(Ppc4xxSdramBank *bank)
>   {
> +    trace_ppc4xx_sdram_map(bank->base, bank->size);
>       memory_region_init(&bank->container, NULL, "sdram-container", bank->size);
>       memory_region_add_subregion(&bank->container, 0, &bank->ram);
>       memory_region_add_subregion(get_system_memory(), bank->base,
> @@ -113,11 +114,26 @@ static void sdram_bank_map(Ppc4xxSdramBank *bank)
>   
>   static void sdram_bank_unmap(Ppc4xxSdramBank *bank)
>   {
> +    trace_ppc4xx_sdram_unmap(bank->base, bank->size);
>       memory_region_del_subregion(get_system_memory(), &bank->container);
>       memory_region_del_subregion(&bank->container, &bank->ram);
>       object_unparent(OBJECT(&bank->container));
>   }
>   
> +static void sdram_bank_set_bcr(Ppc4xxSdramBank *bank, uint32_t bcr,
> +                               hwaddr base, hwaddr size, int enabled)
> +{
> +    if (memory_region_is_mapped(&bank->container)) {
> +        sdram_bank_unmap(bank);
> +    }
> +    bank->bcr = bcr;
> +    bank->base = base;
> +    bank->size = size;
> +    if (enabled && (bcr & 1)) {
> +        sdram_bank_map(bank);
> +    }
> +}
> +
>   enum {
>       SDRAM0_CFGADDR = 0x010,
>       SDRAM0_CFGDATA = 0x011,
> @@ -455,6 +471,8 @@ void ppc4xx_sdram_ddr_enable(Ppc4xxSdramDdrState *s)
>   
>   /*****************************************************************************/
>   /* DDR2 SDRAM controller */
> +#define SDRAM_DDR2_BCR_MASK 0xffe0ffc1
> +
>   enum {
>       SDRAM_R0BAS = 0x40,
>       SDRAM_R1BAS,
> @@ -528,48 +546,6 @@ static hwaddr sdram_ddr2_size(uint32_t bcr)
>       return size;
>   }
>   
> -static void sdram_ddr2_set_bcr(Ppc4xxSdramDdr2State *sdram, int i,
> -                               uint32_t bcr, int enabled)
> -{
> -    if (sdram->bank[i].bcr & 1) {
> -        /* First unmap RAM if enabled */
> -        trace_ppc4xx_sdram_unmap(sdram_ddr2_base(sdram->bank[i].bcr),
> -                                 sdram_ddr2_size(sdram->bank[i].bcr));
> -        sdram_bank_unmap(&sdram->bank[i]);
> -    }
> -    sdram->bank[i].bcr = bcr & 0xffe0ffc1;
> -    if (enabled && (bcr & 1)) {
> -        trace_ppc4xx_sdram_map(sdram_ddr2_base(bcr), sdram_ddr2_size(bcr));
> -        sdram_bank_map(&sdram->bank[i]);
> -    }
> -}
> -
> -static void sdram_ddr2_map_bcr(Ppc4xxSdramDdr2State *sdram)
> -{
> -    int i;
> -
> -    for (i = 0; i < sdram->nbanks; i++) {
> -        if (sdram->bank[i].size) {
> -            sdram_ddr2_set_bcr(sdram, i,
> -                               sdram_ddr2_bcr(sdram->bank[i].base,
> -                                              sdram->bank[i].size), 1);
> -        } else {
> -            sdram_ddr2_set_bcr(sdram, i, 0, 0);
> -        }
> -    }
> -}
> -
> -static void sdram_ddr2_unmap_bcr(Ppc4xxSdramDdr2State *sdram)
> -{
> -    int i;
> -
> -    for (i = 0; i < sdram->nbanks; i++) {
> -        if (sdram->bank[i].size) {
> -            sdram_ddr2_set_bcr(sdram, i, sdram->bank[i].bcr & ~1, 0);
> -        }
> -    }
> -}
> -
>   static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
>   {
>       Ppc4xxSdramDdr2State *s = opaque;
> @@ -628,6 +604,7 @@ static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
>   static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
>   {
>       Ppc4xxSdramDdr2State *s = opaque;
> +    int i;
>   
>       switch (dcrn) {
>       case SDRAM_R0BAS:
> @@ -652,13 +629,25 @@ static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
>                   (val & SDRAM_DDR2_MCOPT2_DCEN)) {
>                   trace_ppc4xx_sdram_enable("enable");
>                   /* validate all RAM mappings */
> -                sdram_ddr2_map_bcr(s);
> +                for (i = 0; i < s->nbanks; i++) {
> +                    if (s->bank[i].size) {
> +                        sdram_bank_set_bcr(&s->bank[i], s->bank[i].bcr,
> +                                           s->bank[i].base, s->bank[i].size,
> +                                           1);
> +                    }
> +                }
>                   s->mcopt2 |= SDRAM_DDR2_MCOPT2_DCEN;
>               } else if ((s->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
>                          !(val & SDRAM_DDR2_MCOPT2_DCEN)) {
>                   trace_ppc4xx_sdram_enable("disable");
>                   /* invalidate all RAM mappings */
> -                sdram_ddr2_unmap_bcr(s);
> +                for (i = 0; i < s->nbanks; i++) {
> +                    if (s->bank[i].size) {
> +                        sdram_bank_set_bcr(&s->bank[i], s->bank[i].bcr,
> +                                           s->bank[i].base, s->bank[i].size,
> +                                           0);
> +                    }
> +                }
>                   s->mcopt2 &= ~SDRAM_DDR2_MCOPT2_DCEN;
>               }
>               break;
> @@ -691,6 +680,7 @@ static void ppc4xx_sdram_ddr2_realize(DeviceState *dev, Error **errp)
>           2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB,
>           64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 0
>       };
> +    int i;
>   
>       if (s->nbanks < 1 || s->nbanks > 4) {
>           error_setg(errp, "Invalid number of RAM banks");
> @@ -701,6 +691,19 @@ static void ppc4xx_sdram_ddr2_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>       ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank, valid_bank_sizes);
> +    for (i = 0; i < s->nbanks; i++) {
> +        if (s->bank[i].size) {
> +            s->bank[i].bcr = sdram_ddr2_bcr(s->bank[i].base, s->bank[i].size);
> +            s->bank[i].bcr &= SDRAM_DDR2_BCR_MASK;
> +            sdram_bank_set_bcr(&s->bank[i], s->bank[i].bcr,
> +                               s->bank[i].base, s->bank[i].size, 0);
> +        } else {
> +            sdram_bank_set_bcr(&s->bank[i], 0, 0, 0, 0);
> +        }
> +        trace_ppc4xx_sdram_init(sdram_ddr2_base(s->bank[i].bcr),
> +                                sdram_ddr2_size(s->bank[i].bcr),
> +                                s->bank[i].bcr);
> +    }
>   
>       ppc4xx_dcr_register(dcr, SDRAM0_CFGADDR,
>                           s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
> index a07d5aca0f..3b3e4211d4 100644
> --- a/hw/ppc/trace-events
> +++ b/hw/ppc/trace-events
> @@ -179,3 +179,4 @@ ppc405ep_clocks_setup(const char *trace) "%s"
>   ppc4xx_sdram_enable(const char *trace) "%s SDRAM controller"
>   ppc4xx_sdram_unmap(uint64_t addr, uint64_t size) "Unmap RAM area 0x%" PRIx64 " size 0x%" PRIx64
>   ppc4xx_sdram_map(uint64_t addr, uint64_t size) "Map RAM area 0x%" PRIx64 " size 0x%" PRIx64
> +ppc4xx_sdram_init(uint64_t base, uint64_t size, uint32_t bcr) "Init RAM area 0x%" PRIx64 " size 0x%" PRIx64 " bcr 0x%x"

