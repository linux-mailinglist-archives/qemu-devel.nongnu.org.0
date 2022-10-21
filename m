Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2458607EA0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 21:04:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxJZ-0007XR-G7; Fri, 21 Oct 2022 15:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1olurn-0008Dd-34; Fri, 21 Oct 2022 12:27:27 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1olurj-0002SO-Vs; Fri, 21 Oct 2022 12:27:26 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 z11-20020a05683020cb00b00661a95cf920so2123522otq.5; 
 Fri, 21 Oct 2022 09:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h1lm04gVUhOm4q7sQ4kSCAIvZAVuApAoAUCQRc0jPS4=;
 b=isdYLccU0ONj+JgprdmD7X47YHFH8j/lKIFywjPJO1xQkSAblIfGG6gI2TnWrbqq1V
 OYyvxEiNmFvFQ6sL5Dx2kXqApihcjYSr1XSTC8N7IDwVlUlGTuPSIhq17MMFThg6sIJp
 lZ8yoCKhkzRU+vEHVxDcAtu01cr+uZX/f9jgKk0qmQX3yXxZ0jZvO2ssKUxJpw1pOvdM
 yKFh5iuLMkR0xoZWL2sZ/NOZrmXSf+6mDSTT/ZowS8O6r0y6H7DhO1mdk6zdKLN9Axbi
 vXeEU8izpwaiURcNrSzJyoMW0XTgyvOtgwiEAya/zQu1gQy/zZKE/LLHo5zQPEY24U3w
 7JPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h1lm04gVUhOm4q7sQ4kSCAIvZAVuApAoAUCQRc0jPS4=;
 b=MOcYvebA2gPGsZlZ2mklupAbwpT4El3jbUwE5uWoohAdfLqtNHX3oYxp+JkN0S+2XK
 O9hhG9/j7ciCikJSdKX4STizd/tIrMcKovgAZH1JU3qPAcpkN7/01PY6fkGEWmrhTwEg
 V/MLs160EhlhbUE/DRDXgCz6bvieWgF6/xPGiL1CPiRbVzM1OfI6Tg81kGJhsdkdKs3O
 bbCs/AvTLCGDsB0CvWZUCATykPvrddlIU1xS9QlNOKeBjpkqQlzKltP4oDHNAlg4uWV1
 qcGB2WHHsnB9XO4fnj7+B4PH2PS/66Fyh+D7AZ+Jva+ejFgj3s/gpfXqrWx+j3rSFOw8
 kU5Q==
X-Gm-Message-State: ACrzQf2/nJ52JfhsvB+T6shmYhjWctKLd1n2Pxarji6DlvRoF9vI6XU0
 qSCrpjlFuFXbnukcBDAxHyg=
X-Google-Smtp-Source: AMsMyM7IoT4O9pEKhWB1mhuGUxnUFkWtn6QNRzaCa9CE57JxYo7PnYqrJTmWZRL4W+wErC9feKkyMg==
X-Received: by 2002:a05:6830:3495:b0:661:92d7:62f1 with SMTP id
 c21-20020a056830349500b0066192d762f1mr10200624otu.311.1666369642231; 
 Fri, 21 Oct 2022 09:27:22 -0700 (PDT)
Received: from [192.168.10.102] ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 b25-20020a9d6b99000000b006619483182csm1283498otq.18.2022.10.21.09.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 09:27:21 -0700 (PDT)
Message-ID: <cbb61f63-7841-783a-ff76-2dd7006bb37e@gmail.com>
Date: Fri, 21 Oct 2022 13:27:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v7 2/8] ppc4xx_devs.c: Move DDR SDRAM controller model to
 ppc4xx_sdram.c
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, philmd@linaro.org
References: <cover.1666194485.git.balaton@eik.bme.hu>
 <3ea98072dbeb757942e25dcfcdd6a7a47738d2ca.1666194485.git.balaton@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <3ea98072dbeb757942e25dcfcdd6a7a47738d2ca.1666194485.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
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

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

On 10/19/22 13:02, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc4xx_devs.c  | 352 ----------------------------------------
>   hw/ppc/ppc4xx_sdram.c | 365 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 365 insertions(+), 352 deletions(-)
> 
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index 12af90f244..f737dbb3d6 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -24,357 +24,10 @@
>   
>   #include "qemu/osdep.h"
>   #include "qemu/units.h"
> -#include "sysemu/reset.h"
>   #include "cpu.h"
> -#include "hw/irq.h"
> -#include "hw/ppc/ppc.h"
>   #include "hw/ppc/ppc4xx.h"
>   #include "hw/qdev-properties.h"
> -#include "qemu/log.h"
> -#include "exec/address-spaces.h"
> -#include "qemu/error-report.h"
>   #include "qapi/error.h"
> -#include "trace.h"
> -
> -/*****************************************************************************/
> -/* SDRAM controller */
> -enum {
> -    SDRAM0_CFGADDR = 0x010,
> -    SDRAM0_CFGDATA = 0x011,
> -};
> -
> -/*
> - * XXX: TOFIX: some patches have made this code become inconsistent:
> - *      there are type inconsistencies, mixing hwaddr, target_ulong
> - *      and uint32_t
> - */
> -static uint32_t sdram_ddr_bcr(hwaddr ram_base, hwaddr ram_size)
> -{
> -    uint32_t bcr;
> -
> -    switch (ram_size) {
> -    case 4 * MiB:
> -        bcr = 0;
> -        break;
> -    case 8 * MiB:
> -        bcr = 0x20000;
> -        break;
> -    case 16 * MiB:
> -        bcr = 0x40000;
> -        break;
> -    case 32 * MiB:
> -        bcr = 0x60000;
> -        break;
> -    case 64 * MiB:
> -        bcr = 0x80000;
> -        break;
> -    case 128 * MiB:
> -        bcr = 0xA0000;
> -        break;
> -    case 256 * MiB:
> -        bcr = 0xC0000;
> -        break;
> -    default:
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: invalid RAM size 0x%" HWADDR_PRIx "\n", __func__,
> -                      ram_size);
> -        return 0;
> -    }
> -    bcr |= ram_base & 0xFF800000;
> -    bcr |= 1;
> -
> -    return bcr;
> -}
> -
> -static inline hwaddr sdram_ddr_base(uint32_t bcr)
> -{
> -    return bcr & 0xFF800000;
> -}
> -
> -static target_ulong sdram_ddr_size(uint32_t bcr)
> -{
> -    target_ulong size;
> -    int sh;
> -
> -    sh = (bcr >> 17) & 0x7;
> -    if (sh == 7) {
> -        size = -1;
> -    } else {
> -        size = (4 * MiB) << sh;
> -    }
> -
> -    return size;
> -}
> -
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
> -static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
> -{
> -    Ppc4xxSdramDdrState *sdram = opaque;
> -    uint32_t ret;
> -
> -    switch (dcrn) {
> -    case SDRAM0_CFGADDR:
> -        ret = sdram->addr;
> -        break;
> -    case SDRAM0_CFGDATA:
> -        switch (sdram->addr) {
> -        case 0x00: /* SDRAM_BESR0 */
> -            ret = sdram->besr0;
> -            break;
> -        case 0x08: /* SDRAM_BESR1 */
> -            ret = sdram->besr1;
> -            break;
> -        case 0x10: /* SDRAM_BEAR */
> -            ret = sdram->bear;
> -            break;
> -        case 0x20: /* SDRAM_CFG */
> -            ret = sdram->cfg;
> -            break;
> -        case 0x24: /* SDRAM_STATUS */
> -            ret = sdram->status;
> -            break;
> -        case 0x30: /* SDRAM_RTR */
> -            ret = sdram->rtr;
> -            break;
> -        case 0x34: /* SDRAM_PMIT */
> -            ret = sdram->pmit;
> -            break;
> -        case 0x40: /* SDRAM_B0CR */
> -            ret = sdram->bank[0].bcr;
> -            break;
> -        case 0x44: /* SDRAM_B1CR */
> -            ret = sdram->bank[1].bcr;
> -            break;
> -        case 0x48: /* SDRAM_B2CR */
> -            ret = sdram->bank[2].bcr;
> -            break;
> -        case 0x4C: /* SDRAM_B3CR */
> -            ret = sdram->bank[3].bcr;
> -            break;
> -        case 0x80: /* SDRAM_TR */
> -            ret = -1; /* ? */
> -            break;
> -        case 0x94: /* SDRAM_ECCCFG */
> -            ret = sdram->ecccfg;
> -            break;
> -        case 0x98: /* SDRAM_ECCESR */
> -            ret = sdram->eccesr;
> -            break;
> -        default: /* Error */
> -            ret = -1;
> -            break;
> -        }
> -        break;
> -    default:
> -        /* Avoid gcc warning */
> -        ret = 0;
> -        break;
> -    }
> -
> -    return ret;
> -}
> -
> -static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
> -{
> -    Ppc4xxSdramDdrState *sdram = opaque;
> -
> -    switch (dcrn) {
> -    case SDRAM0_CFGADDR:
> -        sdram->addr = val;
> -        break;
> -    case SDRAM0_CFGDATA:
> -        switch (sdram->addr) {
> -        case 0x00: /* SDRAM_BESR0 */
> -            sdram->besr0 &= ~val;
> -            break;
> -        case 0x08: /* SDRAM_BESR1 */
> -            sdram->besr1 &= ~val;
> -            break;
> -        case 0x10: /* SDRAM_BEAR */
> -            sdram->bear = val;
> -            break;
> -        case 0x20: /* SDRAM_CFG */
> -            val &= 0xFFE00000;
> -            if (!(sdram->cfg & 0x80000000) && (val & 0x80000000)) {
> -                trace_ppc4xx_sdram_enable("enable");
> -                /* validate all RAM mappings */
> -                sdram_ddr_map_bcr(sdram);
> -                sdram->status &= ~0x80000000;
> -            } else if ((sdram->cfg & 0x80000000) && !(val & 0x80000000)) {
> -                trace_ppc4xx_sdram_enable("disable");
> -                /* invalidate all RAM mappings */
> -                sdram_ddr_unmap_bcr(sdram);
> -                sdram->status |= 0x80000000;
> -            }
> -            if (!(sdram->cfg & 0x40000000) && (val & 0x40000000)) {
> -                sdram->status |= 0x40000000;
> -            } else if ((sdram->cfg & 0x40000000) && !(val & 0x40000000)) {
> -                sdram->status &= ~0x40000000;
> -            }
> -            sdram->cfg = val;
> -            break;
> -        case 0x24: /* SDRAM_STATUS */
> -            /* Read-only register */
> -            break;
> -        case 0x30: /* SDRAM_RTR */
> -            sdram->rtr = val & 0x3FF80000;
> -            break;
> -        case 0x34: /* SDRAM_PMIT */
> -            sdram->pmit = (val & 0xF8000000) | 0x07C00000;
> -            break;
> -        case 0x40: /* SDRAM_B0CR */
> -            sdram_ddr_set_bcr(sdram, 0, val, sdram->cfg & 0x80000000);
> -            break;
> -        case 0x44: /* SDRAM_B1CR */
> -            sdram_ddr_set_bcr(sdram, 1, val, sdram->cfg & 0x80000000);
> -            break;
> -        case 0x48: /* SDRAM_B2CR */
> -            sdram_ddr_set_bcr(sdram, 2, val, sdram->cfg & 0x80000000);
> -            break;
> -        case 0x4C: /* SDRAM_B3CR */
> -            sdram_ddr_set_bcr(sdram, 3, val, sdram->cfg & 0x80000000);
> -            break;
> -        case 0x80: /* SDRAM_TR */
> -            sdram->tr = val & 0x018FC01F;
> -            break;
> -        case 0x94: /* SDRAM_ECCCFG */
> -            sdram->ecccfg = val & 0x00F00000;
> -            break;
> -        case 0x98: /* SDRAM_ECCESR */
> -            val &= 0xFFF0F000;
> -            if (sdram->eccesr == 0 && val != 0) {
> -                qemu_irq_raise(sdram->irq);
> -            } else if (sdram->eccesr != 0 && val == 0) {
> -                qemu_irq_lower(sdram->irq);
> -            }
> -            sdram->eccesr = val;
> -            break;
> -        default: /* Error */
> -            break;
> -        }
> -        break;
> -    }
> -}
> -
> -static void ppc4xx_sdram_ddr_reset(DeviceState *dev)
> -{
> -    Ppc4xxSdramDdrState *sdram = PPC4xx_SDRAM_DDR(dev);
> -
> -    sdram->addr = 0;
> -    sdram->bear = 0;
> -    sdram->besr0 = 0; /* No error */
> -    sdram->besr1 = 0; /* No error */
> -    sdram->cfg = 0;
> -    sdram->ecccfg = 0; /* No ECC */
> -    sdram->eccesr = 0; /* No error */
> -    sdram->pmit = 0x07C00000;
> -    sdram->rtr = 0x05F00000;
> -    sdram->tr = 0x00854009;
> -    /* We pre-initialize RAM banks */
> -    sdram->status = 0;
> -    sdram->cfg = 0x00800000;
> -}
> -
> -static void ppc4xx_sdram_ddr_realize(DeviceState *dev, Error **errp)
> -{
> -    Ppc4xxSdramDdrState *s = PPC4xx_SDRAM_DDR(dev);
> -    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
> -    const ram_addr_t valid_bank_sizes[] = {
> -        256 * MiB, 128 * MiB, 64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 4 * MiB, 0
> -    };
> -
> -    if (s->nbanks < 1 || s->nbanks > 4) {
> -        error_setg(errp, "Invalid number of RAM banks");
> -        return;
> -    }
> -    if (!s->dram_mr) {
> -        error_setg(errp, "Missing dram memory region");
> -        return;
> -    }
> -    ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank, valid_bank_sizes);
> -
> -    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
> -
> -    ppc4xx_dcr_register(dcr, SDRAM0_CFGADDR,
> -                        s, &sdram_ddr_dcr_read, &sdram_ddr_dcr_write);
> -    ppc4xx_dcr_register(dcr, SDRAM0_CFGDATA,
> -                        s, &sdram_ddr_dcr_read, &sdram_ddr_dcr_write);
> -}
> -
> -static Property ppc4xx_sdram_ddr_props[] = {
> -    DEFINE_PROP_LINK("dram", Ppc4xxSdramDdrState, dram_mr, TYPE_MEMORY_REGION,
> -                     MemoryRegion *),
> -    DEFINE_PROP_UINT32("nbanks", Ppc4xxSdramDdrState, nbanks, 4),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
> -static void ppc4xx_sdram_ddr_class_init(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(oc);
> -
> -    dc->realize = ppc4xx_sdram_ddr_realize;
> -    dc->reset = ppc4xx_sdram_ddr_reset;
> -    /* Reason: only works as function of a ppc4xx SoC */
> -    dc->user_creatable = false;
> -    device_class_set_props(dc, ppc4xx_sdram_ddr_props);
> -}
> -
> -void ppc4xx_sdram_ddr_enable(Ppc4xxSdramDdrState *s)
> -{
> -    sdram_ddr_dcr_write(s, SDRAM0_CFGADDR, 0x20);
> -    sdram_ddr_dcr_write(s, SDRAM0_CFGDATA, 0x80000000);
> -}
>   
>   /*
>    * Split RAM between SDRAM banks.
> @@ -963,11 +616,6 @@ static void ppc4xx_dcr_class_init(ObjectClass *oc, void *data)
>   
>   static const TypeInfo ppc4xx_types[] = {
>       {
> -        .name           = TYPE_PPC4xx_SDRAM_DDR,
> -        .parent         = TYPE_PPC4xx_DCR_DEVICE,
> -        .instance_size  = sizeof(Ppc4xxSdramDdrState),
> -        .class_init     = ppc4xx_sdram_ddr_class_init,
> -    }, {
>           .name           = TYPE_PPC4xx_MAL,
>           .parent         = TYPE_PPC4xx_DCR_DEVICE,
>           .instance_size  = sizeof(Ppc4xxMalState),
> diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
> index b49a7ed60a..d88363bc3d 100644
> --- a/hw/ppc/ppc4xx_sdram.c
> +++ b/hw/ppc/ppc4xx_sdram.c
> @@ -1,4 +1,27 @@
>   /*
> + * QEMU PowerPC 4xx embedded processors SDRAM controller emulation
> + *
> + * DDR SDRAM controller:
> + * Copyright (c) 2007 Jocelyn Mayer
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + *
>    * DDR2 SDRAM controller:
>    * Copyright (c) 2012 François Revol
>    * Copyright (c) 2016-2019 BALATON Zoltan
> @@ -9,7 +32,9 @@
>   #include "qemu/osdep.h"
>   #include "qemu/units.h"
>   #include "qapi/error.h"
> +#include "qemu/log.h"
>   #include "exec/address-spaces.h" /* get_system_memory() */
> +#include "exec/cpu-defs.h" /* target_ulong */
>   #include "hw/irq.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/ppc/ppc4xx.h"
> @@ -38,6 +63,341 @@ enum {
>       SDRAM0_CFGDATA = 0x011,
>   };
>   
> +/*****************************************************************************/
> +/* DDR SDRAM controller */
> +/*
> + * XXX: TOFIX: some patches have made this code become inconsistent:
> + *      there are type inconsistencies, mixing hwaddr, target_ulong
> + *      and uint32_t
> + */
> +static uint32_t sdram_ddr_bcr(hwaddr ram_base, hwaddr ram_size)
> +{
> +    uint32_t bcr;
> +
> +    switch (ram_size) {
> +    case 4 * MiB:
> +        bcr = 0;
> +        break;
> +    case 8 * MiB:
> +        bcr = 0x20000;
> +        break;
> +    case 16 * MiB:
> +        bcr = 0x40000;
> +        break;
> +    case 32 * MiB:
> +        bcr = 0x60000;
> +        break;
> +    case 64 * MiB:
> +        bcr = 0x80000;
> +        break;
> +    case 128 * MiB:
> +        bcr = 0xA0000;
> +        break;
> +    case 256 * MiB:
> +        bcr = 0xC0000;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid RAM size 0x%" HWADDR_PRIx "\n", __func__,
> +                      ram_size);
> +        return 0;
> +    }
> +    bcr |= ram_base & 0xFF800000;
> +    bcr |= 1;
> +
> +    return bcr;
> +}
> +
> +static inline hwaddr sdram_ddr_base(uint32_t bcr)
> +{
> +    return bcr & 0xFF800000;
> +}
> +
> +static target_ulong sdram_ddr_size(uint32_t bcr)
> +{
> +    target_ulong size;
> +    int sh;
> +
> +    sh = (bcr >> 17) & 0x7;
> +    if (sh == 7) {
> +        size = -1;
> +    } else {
> +        size = (4 * MiB) << sh;
> +    }
> +
> +    return size;
> +}
> +
> +static void sdram_ddr_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
> +                              uint32_t bcr, int enabled)
> +{
> +    if (sdram->bank[i].bcr & 1) {
> +        /* Unmap RAM */
> +        trace_ppc4xx_sdram_unmap(sdram_ddr_base(sdram->bank[i].bcr),
> +                                 sdram_ddr_size(sdram->bank[i].bcr));
> +        memory_region_del_subregion(get_system_memory(),
> +                                    &sdram->bank[i].container);
> +        memory_region_del_subregion(&sdram->bank[i].container,
> +                                    &sdram->bank[i].ram);
> +        object_unparent(OBJECT(&sdram->bank[i].container));
> +    }
> +    sdram->bank[i].bcr = bcr & 0xFFDEE001;
> +    if (enabled && (bcr & 1)) {
> +        trace_ppc4xx_sdram_map(sdram_ddr_base(bcr), sdram_ddr_size(bcr));
> +        memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
> +                           sdram_ddr_size(bcr));
> +        memory_region_add_subregion(&sdram->bank[i].container, 0,
> +                                    &sdram->bank[i].ram);
> +        memory_region_add_subregion(get_system_memory(),
> +                                    sdram_ddr_base(bcr),
> +                                    &sdram->bank[i].container);
> +    }
> +}
> +
> +static void sdram_ddr_map_bcr(Ppc4xxSdramDdrState *sdram)
> +{
> +    int i;
> +
> +    for (i = 0; i < sdram->nbanks; i++) {
> +        if (sdram->bank[i].size != 0) {
> +            sdram_ddr_set_bcr(sdram, i, sdram_ddr_bcr(sdram->bank[i].base,
> +                                                      sdram->bank[i].size), 1);
> +        } else {
> +            sdram_ddr_set_bcr(sdram, i, 0, 0);
> +        }
> +    }
> +}
> +
> +static void sdram_ddr_unmap_bcr(Ppc4xxSdramDdrState *sdram)
> +{
> +    int i;
> +
> +    for (i = 0; i < sdram->nbanks; i++) {
> +        trace_ppc4xx_sdram_unmap(sdram_ddr_base(sdram->bank[i].bcr),
> +                                 sdram_ddr_size(sdram->bank[i].bcr));
> +        memory_region_del_subregion(get_system_memory(),
> +                                    &sdram->bank[i].ram);
> +    }
> +}
> +
> +static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
> +{
> +    Ppc4xxSdramDdrState *sdram = opaque;
> +    uint32_t ret;
> +
> +    switch (dcrn) {
> +    case SDRAM0_CFGADDR:
> +        ret = sdram->addr;
> +        break;
> +    case SDRAM0_CFGDATA:
> +        switch (sdram->addr) {
> +        case 0x00: /* SDRAM_BESR0 */
> +            ret = sdram->besr0;
> +            break;
> +        case 0x08: /* SDRAM_BESR1 */
> +            ret = sdram->besr1;
> +            break;
> +        case 0x10: /* SDRAM_BEAR */
> +            ret = sdram->bear;
> +            break;
> +        case 0x20: /* SDRAM_CFG */
> +            ret = sdram->cfg;
> +            break;
> +        case 0x24: /* SDRAM_STATUS */
> +            ret = sdram->status;
> +            break;
> +        case 0x30: /* SDRAM_RTR */
> +            ret = sdram->rtr;
> +            break;
> +        case 0x34: /* SDRAM_PMIT */
> +            ret = sdram->pmit;
> +            break;
> +        case 0x40: /* SDRAM_B0CR */
> +            ret = sdram->bank[0].bcr;
> +            break;
> +        case 0x44: /* SDRAM_B1CR */
> +            ret = sdram->bank[1].bcr;
> +            break;
> +        case 0x48: /* SDRAM_B2CR */
> +            ret = sdram->bank[2].bcr;
> +            break;
> +        case 0x4C: /* SDRAM_B3CR */
> +            ret = sdram->bank[3].bcr;
> +            break;
> +        case 0x80: /* SDRAM_TR */
> +            ret = -1; /* ? */
> +            break;
> +        case 0x94: /* SDRAM_ECCCFG */
> +            ret = sdram->ecccfg;
> +            break;
> +        case 0x98: /* SDRAM_ECCESR */
> +            ret = sdram->eccesr;
> +            break;
> +        default: /* Error */
> +            ret = -1;
> +            break;
> +        }
> +        break;
> +    default:
> +        /* Avoid gcc warning */
> +        ret = 0;
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
> +{
> +    Ppc4xxSdramDdrState *sdram = opaque;
> +
> +    switch (dcrn) {
> +    case SDRAM0_CFGADDR:
> +        sdram->addr = val;
> +        break;
> +    case SDRAM0_CFGDATA:
> +        switch (sdram->addr) {
> +        case 0x00: /* SDRAM_BESR0 */
> +            sdram->besr0 &= ~val;
> +            break;
> +        case 0x08: /* SDRAM_BESR1 */
> +            sdram->besr1 &= ~val;
> +            break;
> +        case 0x10: /* SDRAM_BEAR */
> +            sdram->bear = val;
> +            break;
> +        case 0x20: /* SDRAM_CFG */
> +            val &= 0xFFE00000;
> +            if (!(sdram->cfg & 0x80000000) && (val & 0x80000000)) {
> +                trace_ppc4xx_sdram_enable("enable");
> +                /* validate all RAM mappings */
> +                sdram_ddr_map_bcr(sdram);
> +                sdram->status &= ~0x80000000;
> +            } else if ((sdram->cfg & 0x80000000) && !(val & 0x80000000)) {
> +                trace_ppc4xx_sdram_enable("disable");
> +                /* invalidate all RAM mappings */
> +                sdram_ddr_unmap_bcr(sdram);
> +                sdram->status |= 0x80000000;
> +            }
> +            if (!(sdram->cfg & 0x40000000) && (val & 0x40000000)) {
> +                sdram->status |= 0x40000000;
> +            } else if ((sdram->cfg & 0x40000000) && !(val & 0x40000000)) {
> +                sdram->status &= ~0x40000000;
> +            }
> +            sdram->cfg = val;
> +            break;
> +        case 0x24: /* SDRAM_STATUS */
> +            /* Read-only register */
> +            break;
> +        case 0x30: /* SDRAM_RTR */
> +            sdram->rtr = val & 0x3FF80000;
> +            break;
> +        case 0x34: /* SDRAM_PMIT */
> +            sdram->pmit = (val & 0xF8000000) | 0x07C00000;
> +            break;
> +        case 0x40: /* SDRAM_B0CR */
> +            sdram_ddr_set_bcr(sdram, 0, val, sdram->cfg & 0x80000000);
> +            break;
> +        case 0x44: /* SDRAM_B1CR */
> +            sdram_ddr_set_bcr(sdram, 1, val, sdram->cfg & 0x80000000);
> +            break;
> +        case 0x48: /* SDRAM_B2CR */
> +            sdram_ddr_set_bcr(sdram, 2, val, sdram->cfg & 0x80000000);
> +            break;
> +        case 0x4C: /* SDRAM_B3CR */
> +            sdram_ddr_set_bcr(sdram, 3, val, sdram->cfg & 0x80000000);
> +            break;
> +        case 0x80: /* SDRAM_TR */
> +            sdram->tr = val & 0x018FC01F;
> +            break;
> +        case 0x94: /* SDRAM_ECCCFG */
> +            sdram->ecccfg = val & 0x00F00000;
> +            break;
> +        case 0x98: /* SDRAM_ECCESR */
> +            val &= 0xFFF0F000;
> +            if (sdram->eccesr == 0 && val != 0) {
> +                qemu_irq_raise(sdram->irq);
> +            } else if (sdram->eccesr != 0 && val == 0) {
> +                qemu_irq_lower(sdram->irq);
> +            }
> +            sdram->eccesr = val;
> +            break;
> +        default: /* Error */
> +            break;
> +        }
> +        break;
> +    }
> +}
> +
> +static void ppc4xx_sdram_ddr_reset(DeviceState *dev)
> +{
> +    Ppc4xxSdramDdrState *sdram = PPC4xx_SDRAM_DDR(dev);
> +
> +    sdram->addr = 0;
> +    sdram->bear = 0;
> +    sdram->besr0 = 0; /* No error */
> +    sdram->besr1 = 0; /* No error */
> +    sdram->cfg = 0;
> +    sdram->ecccfg = 0; /* No ECC */
> +    sdram->eccesr = 0; /* No error */
> +    sdram->pmit = 0x07C00000;
> +    sdram->rtr = 0x05F00000;
> +    sdram->tr = 0x00854009;
> +    /* We pre-initialize RAM banks */
> +    sdram->status = 0;
> +    sdram->cfg = 0x00800000;
> +}
> +
> +static void ppc4xx_sdram_ddr_realize(DeviceState *dev, Error **errp)
> +{
> +    Ppc4xxSdramDdrState *s = PPC4xx_SDRAM_DDR(dev);
> +    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
> +    const ram_addr_t valid_bank_sizes[] = {
> +        256 * MiB, 128 * MiB, 64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 4 * MiB, 0
> +    };
> +
> +    if (s->nbanks < 1 || s->nbanks > 4) {
> +        error_setg(errp, "Invalid number of RAM banks");
> +        return;
> +    }
> +    if (!s->dram_mr) {
> +        error_setg(errp, "Missing dram memory region");
> +        return;
> +    }
> +    ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank, valid_bank_sizes);
> +
> +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
> +
> +    ppc4xx_dcr_register(dcr, SDRAM0_CFGADDR,
> +                        s, &sdram_ddr_dcr_read, &sdram_ddr_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM0_CFGDATA,
> +                        s, &sdram_ddr_dcr_read, &sdram_ddr_dcr_write);
> +}
> +
> +static Property ppc4xx_sdram_ddr_props[] = {
> +    DEFINE_PROP_LINK("dram", Ppc4xxSdramDdrState, dram_mr, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
> +    DEFINE_PROP_UINT32("nbanks", Ppc4xxSdramDdrState, nbanks, 4),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void ppc4xx_sdram_ddr_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ppc4xx_sdram_ddr_realize;
> +    dc->reset = ppc4xx_sdram_ddr_reset;
> +    /* Reason: only works as function of a ppc4xx SoC */
> +    dc->user_creatable = false;
> +    device_class_set_props(dc, ppc4xx_sdram_ddr_props);
> +}
> +
> +void ppc4xx_sdram_ddr_enable(Ppc4xxSdramDdrState *s)
> +{
> +    sdram_ddr_dcr_write(s, SDRAM0_CFGADDR, 0x20);
> +    sdram_ddr_dcr_write(s, SDRAM0_CFGDATA, 0x80000000);
> +}
> +
>   /*****************************************************************************/
>   /* DDR2 SDRAM controller */
>   enum {
> @@ -338,6 +698,11 @@ void ppc4xx_sdram_ddr2_enable(Ppc4xxSdramDdr2State *s)
>   
>   static const TypeInfo ppc4xx_sdram_types[] = {
>       {
> +        .name           = TYPE_PPC4xx_SDRAM_DDR,
> +        .parent         = TYPE_PPC4xx_DCR_DEVICE,
> +        .instance_size  = sizeof(Ppc4xxSdramDdrState),
> +        .class_init     = ppc4xx_sdram_ddr_class_init,
> +    }, {
>           .name           = TYPE_PPC4xx_SDRAM_DDR2,
>           .parent         = TYPE_PPC4xx_DCR_DEVICE,
>           .instance_size  = sizeof(Ppc4xxSdramDdr2State),

