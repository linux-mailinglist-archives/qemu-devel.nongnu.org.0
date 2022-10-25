Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B99A60D45B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 21:12:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onPIT-00013W-TE; Tue, 25 Oct 2022 15:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onPIS-0000zT-5A; Tue, 25 Oct 2022 15:09:08 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onPIQ-0007bI-9G; Tue, 25 Oct 2022 15:09:07 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 x6-20020a4ac586000000b0047f8cc6dbe4so1998276oop.3; 
 Tue, 25 Oct 2022 12:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RPg6bbZxg3/obU2M+gjEKwgRpqqiAWgjcWBmyUo5WGo=;
 b=RNzL4S1iDaS1OjBG/37fsW+dtopYkTZ6k1OllnAhD6BxtrHe/5VLZGX7IPN7cV1oqD
 FnVtllXUDdpI10IpsV3w3y4yn/SVSzdj34c4S/ZLOqa8ndGqoliVyAePk7bpmCT0x7SN
 Grl8o/V8lqwC/P7kfC+KbkRvW8BIkW4xYHQluV3UOlNCrv4WpOA5o2sp9I6eAvFDGvT9
 wu7dWljLZafttP1JTthH1JEk2Xfzpee9OhOc7B4jssssKg+DzGmHCAig5NRCtkVAW65o
 4O6Q4qGA99zCcod8e+w1FmwE8yxcjzwUOMALkaA9HZDE67FW78v6VB/T6k7fRIhpHbyh
 FQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RPg6bbZxg3/obU2M+gjEKwgRpqqiAWgjcWBmyUo5WGo=;
 b=SHl2Bkmr1BZJHfBA87crN1R9ZiagJVKRSdleW5hzanmJSvGsyhnyXC/tyWpKaDAV5/
 TmmDIEGKCjDegGfEA9OgzebpG3POeXJ3oULBBW/qYjXJMG1LrRVLwuSgLASWmM928do9
 tj36B5EGqU5Ctypa+2JXbD8KGTRIUt9zV9RWvkpLgW8FZo2b+POaAc3rvqN7Hrm+TlyR
 Xwq9N8WrVy/bg10k8UPHh+D3nmXaBohOtXWHIba3JHp1lhgsCVJgHxIhJCWmcEYXc96h
 q6hsFvSnGQSZoYAL0CEqJETWCsi1uwppNhTQc1lcOYGIUzx0Vs8CnktDPCMZgLA9ybtQ
 4OBQ==
X-Gm-Message-State: ACrzQf2joB8RyFQTtpsN1pNf3bMet1QJLolf+GPpYXEcpV9rO0cKPcUX
 /B6XB0JFcVeMl1nvVYNk6qE=
X-Google-Smtp-Source: AMsMyM4q2RDI1aEp3HzSLysrkJlVWy/8E4/bkHR6RUFOshcjtVMV74iFLv4zNV1B12F0K2vwRZ7RtA==
X-Received: by 2002:a05:6820:1746:b0:47f:926a:286d with SMTP id
 bf6-20020a056820174600b0047f926a286dmr17308437oob.5.1666724941939; 
 Tue, 25 Oct 2022 12:09:01 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a056870580500b0013669485016sm1963756oap.37.2022.10.25.12.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 12:09:01 -0700 (PDT)
Message-ID: <1dc355d3-c973-5691-fd9e-bf6493adfed8@gmail.com>
Date: Tue, 25 Oct 2022 16:08:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v7 7/8] ppc4xx_sdram: Convert DDR SDRAM controller to new
 bank handling
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, philmd@linaro.org
References: <cover.1666194485.git.balaton@eik.bme.hu>
 <fc7c50e365d0027a659111e9cd67f9b93113a163.1666194485.git.balaton@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <fc7c50e365d0027a659111e9cd67f9b93113a163.1666194485.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc30.google.com
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
> Use the generic bank handling introduced in previous patch in the DDR
> SDRAM controller too. This also fixes previously broken region unmap
> due to sdram_ddr_unmap_bcr() ignoring container region so it crashed
> with an assert when the guest tried to disable the controller.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/ppc4xx_sdram.c | 98 ++++++++++++++++---------------------------
>   1 file changed, 37 insertions(+), 61 deletions(-)
> 
> diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
> index 63a33b8fd4..7c097efe20 100644
> --- a/hw/ppc/ppc4xx_sdram.c
> +++ b/hw/ppc/ppc4xx_sdram.c
> @@ -141,6 +141,8 @@ enum {
>   
>   /*****************************************************************************/
>   /* DDR SDRAM controller */
> +#define SDRAM_DDR_BCR_MASK 0xFFDEE001
> +
>   static uint32_t sdram_ddr_bcr(hwaddr ram_base, hwaddr ram_size)
>   {
>       uint32_t bcr;
> @@ -199,58 +201,6 @@ static hwaddr sdram_ddr_size(uint32_t bcr)
>       return size;
>   }
>   
> -static void sdram_ddr_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
> -                              uint32_t bcr, int enabled)
> -{
> -    if (sdram->bank[i].bcr & 1) {
> -        /* Unmap RAM */
> -        trace_ppc4xx_sdram_unmap(sdram_ddr_base(sdram->bank[i].bcr),
> -                                 sdram_ddr_size(sdram->bank[i].bcr));
> -        memory_region_del_subregion(get_system_memory(),
> -                                    &sdram->bank[i].container);
> -        memory_region_del_subregion(&sdram->bank[i].container,
> -                                    &sdram->bank[i].ram);
> -        object_unparent(OBJECT(&sdram->bank[i].container));
> -    }
> -    sdram->bank[i].bcr = bcr & 0xFFDEE001;
> -    if (enabled && (bcr & 1)) {
> -        trace_ppc4xx_sdram_map(sdram_ddr_base(bcr), sdram_ddr_size(bcr));
> -        memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
> -                           sdram_ddr_size(bcr));
> -        memory_region_add_subregion(&sdram->bank[i].container, 0,
> -                                    &sdram->bank[i].ram);
> -        memory_region_add_subregion(get_system_memory(),
> -                                    sdram_ddr_base(bcr),
> -                                    &sdram->bank[i].container);
> -    }
> -}
> -
> -static void sdram_ddr_map_bcr(Ppc4xxSdramDdrState *sdram)
> -{
> -    int i;
> -
> -    for (i = 0; i < sdram->nbanks; i++) {
> -        if (sdram->bank[i].size != 0) {
> -            sdram_ddr_set_bcr(sdram, i, sdram_ddr_bcr(sdram->bank[i].base,
> -                                                      sdram->bank[i].size), 1);
> -        } else {
> -            sdram_ddr_set_bcr(sdram, i, 0, 0);
> -        }
> -    }
> -}
> -
> -static void sdram_ddr_unmap_bcr(Ppc4xxSdramDdrState *sdram)
> -{
> -    int i;
> -
> -    for (i = 0; i < sdram->nbanks; i++) {
> -        trace_ppc4xx_sdram_unmap(sdram_ddr_base(sdram->bank[i].bcr),
> -                                 sdram_ddr_size(sdram->bank[i].bcr));
> -        memory_region_del_subregion(get_system_memory(),
> -                                    &sdram->bank[i].ram);
> -    }
> -}
> -
>   static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
>   {
>       Ppc4xxSdramDdrState *s = opaque;
> @@ -321,6 +271,7 @@ static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
>   static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
>   {
>       Ppc4xxSdramDdrState *s = opaque;
> +    int i;
>   
>       switch (dcrn) {
>       case SDRAM0_CFGADDR:
> @@ -342,12 +293,24 @@ static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
>               if (!(s->cfg & 0x80000000) && (val & 0x80000000)) {
>                   trace_ppc4xx_sdram_enable("enable");
>                   /* validate all RAM mappings */
> -                sdram_ddr_map_bcr(s);
> +                for (i = 0; i < s->nbanks; i++) {
> +                    if (s->bank[i].size) {
> +                        sdram_bank_set_bcr(&s->bank[i], s->bank[i].bcr,
> +                                           s->bank[i].base, s->bank[i].size,
> +                                           1);
> +                    }
> +                }
>                   s->status &= ~0x80000000;
>               } else if ((s->cfg & 0x80000000) && !(val & 0x80000000)) {
>                   trace_ppc4xx_sdram_enable("disable");
>                   /* invalidate all RAM mappings */
> -                sdram_ddr_unmap_bcr(s);
> +                for (i = 0; i < s->nbanks; i++) {
> +                    if (s->bank[i].size) {
> +                        sdram_bank_set_bcr(&s->bank[i], s->bank[i].bcr,
> +                                           s->bank[i].base, s->bank[i].size,
> +                                           0);
> +                    }
> +                }
>                   s->status |= 0x80000000;
>               }
>               if (!(s->cfg & 0x40000000) && (val & 0x40000000)) {
> @@ -367,16 +330,16 @@ static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
>               s->pmit = (val & 0xF8000000) | 0x07C00000;
>               break;
>           case 0x40: /* SDRAM_B0CR */
> -            sdram_ddr_set_bcr(s, 0, val, s->cfg & 0x80000000);
> -            break;
>           case 0x44: /* SDRAM_B1CR */
> -            sdram_ddr_set_bcr(s, 1, val, s->cfg & 0x80000000);
> -            break;
>           case 0x48: /* SDRAM_B2CR */
> -            sdram_ddr_set_bcr(s, 2, val, s->cfg & 0x80000000);
> -            break;
>           case 0x4C: /* SDRAM_B3CR */
> -            sdram_ddr_set_bcr(s, 3, val, s->cfg & 0x80000000);
> +            i = (s->addr - 0x40) / 4;
> +            val &= SDRAM_DDR_BCR_MASK;
> +            if (s->bank[i].size) {
> +                sdram_bank_set_bcr(&s->bank[i], val,
> +                                   sdram_ddr_base(val), sdram_ddr_size(val),
> +                                   s->cfg & 0x80000000);
> +            }
>               break;
>           case 0x80: /* SDRAM_TR */
>               s->tr = val & 0x018FC01F;
> @@ -426,6 +389,7 @@ static void ppc4xx_sdram_ddr_realize(DeviceState *dev, Error **errp)
>       const ram_addr_t valid_bank_sizes[] = {
>           256 * MiB, 128 * MiB, 64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 4 * MiB, 0
>       };
> +    int i;
>   
>       if (s->nbanks < 1 || s->nbanks > 4) {
>           error_setg(errp, "Invalid number of RAM banks");
> @@ -436,6 +400,18 @@ static void ppc4xx_sdram_ddr_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>       ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank, valid_bank_sizes);
> +    for (i = 0; i < s->nbanks; i++) {
> +        if (s->bank[i].size) {
> +            s->bank[i].bcr = sdram_ddr_bcr(s->bank[i].base, s->bank[i].size);
> +            sdram_bank_set_bcr(&s->bank[i], s->bank[i].bcr,
> +                               s->bank[i].base, s->bank[i].size, 0);
> +        } else {
> +            sdram_bank_set_bcr(&s->bank[i], 0, 0, 0, 0);
> +        }
> +        trace_ppc4xx_sdram_init(sdram_ddr_base(s->bank[i].bcr),
> +                                sdram_ddr_size(s->bank[i].bcr),
> +                                s->bank[i].bcr);
> +    }
>   
>       sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>   

