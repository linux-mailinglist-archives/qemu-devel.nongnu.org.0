Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEBC607E9B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 21:03:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxDG-00076Y-Au; Fri, 21 Oct 2022 14:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1olumz-0007nX-08; Fri, 21 Oct 2022 12:22:29 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1olumv-0001Lq-PT; Fri, 21 Oct 2022 12:22:28 -0400
Received: by mail-oi1-x22e.google.com with SMTP id g130so3699062oia.13;
 Fri, 21 Oct 2022 09:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cp2ZJW0CP6rh5Bk76fqsqGoOZsJLSdyJkFjaelt56k4=;
 b=ic9wce8JBX09kfus1p/FL1H27jvAZoCbTp5VIl/XhA508mIEkI+tQVLg09sY3O0AmN
 9ZO7dJbhVVSkdZwwbdDuv7zb/ugJesuarZ2szumA8tyzYtyqSPFEnVZVvfXA1z9+j37l
 VdRsmD5R9wKwGTseFK0fm+qh5/xVzGEIxBm+EQp1UgFPixfAhtdzE/Wf5xAWbVqaH/Rm
 u907B6ejx2/Gu+WDKf7bDmSxlKvz3tRMVumdeq+RbGTyphACobmgQx49AgjKCGydL1Ul
 pFo1k0qpq5hOIVWx9EijGPHzBu/IH468cBPwXH6tzGlDfDpKPms1IHu8Q3sJ5s7ZZ8OT
 0uCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cp2ZJW0CP6rh5Bk76fqsqGoOZsJLSdyJkFjaelt56k4=;
 b=474J4XfN604CoUrFiykgWbVgcUYqY9NmEK9oi1yYq8Sek/6Syoyj3GoZ2PW1vsEr6O
 Zw9POUnRTrxBUqO9gJ3ifHpOThsevf0Z72y9u5hwRu/jwpyOkVa++/t8nFyR6sCBbQLH
 K5Zi5OnORaxNTUkonHlbU8ADrEevbKTxOsVkVExafik2NUaWC3jHnIA5iyMjQ2h5I++b
 FiLTGt+VIWif5GiC2kBa3CQx53/Ta+UOO85e2GyLLwZeeIp+3DwkDbo7kYI+BXbgU9sJ
 oRtLSUODpMgZf0VQF94pkvLZ6HNpVo3aGrnp4pjKCLHsXQALP3czbMCfyFn5Y1IjG4p3
 fHFg==
X-Gm-Message-State: ACrzQf0i9NsZ5fPKN80IWMQMMgHqPwJBrBbmIVEUIBwhg3dDn+SYcwgt
 1RWvGsF5hQZNsBIcQT9ZLjM=
X-Google-Smtp-Source: AMsMyM6xPZAScRIY1U4WHCznQTakF5+Uq9WhEZk/GGwGSP97IqI3xAfdIhpABlpldshFHCOELyP0iw==
X-Received: by 2002:a05:6808:bd3:b0:355:561c:44d2 with SMTP id
 o19-20020a0568080bd300b00355561c44d2mr9475887oik.187.1666369343721; 
 Fri, 21 Oct 2022 09:22:23 -0700 (PDT)
Received: from [192.168.10.102] ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a4aeb14000000b004805b00b2cdsm8761525ooj.28.2022.10.21.09.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 09:22:23 -0700 (PDT)
Message-ID: <9cf98147-3ddb-c456-78e1-afcbc3e61881@gmail.com>
Date: Fri, 21 Oct 2022 13:22:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v7 1/8] ppc440_uc.c: Move DDR2 SDRAM controller model to
 ppc4xx_sdram.c
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, philmd@linaro.org
References: <cover.1666194485.git.balaton@eik.bme.hu>
 <2f2900f93e997480e54b7bf9c32bb482a0fb1022.1666194485.git.balaton@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <2f2900f93e997480e54b7bf9c32bb482a0fb1022.1666194485.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
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

Minimal nit down below:

On 10/19/22 13:02, BALATON Zoltan wrote:
> In order to move PPC4xx SDRAM controller models together move out the
> DDR2 controller model from ppc440_uc.c into a new ppc4xx_sdram.c file.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/meson.build    |   3 +-
>   hw/ppc/ppc440_uc.c    | 332 ----------------------------------------
>   hw/ppc/ppc4xx_sdram.c | 348 ++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 350 insertions(+), 333 deletions(-)
>   create mode 100644 hw/ppc/ppc4xx_sdram.c
> 
> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> index 32babc9b48..c927337da0 100644
> --- a/hw/ppc/meson.build
> +++ b/hw/ppc/meson.build
> @@ -59,8 +59,9 @@ ppc_ss.add(when: 'CONFIG_PPC440', if_true: files(
>     'ppc440_bamboo.c',
>     'ppc440_pcix.c', 'ppc440_uc.c'))
>   ppc_ss.add(when: 'CONFIG_PPC4XX', if_true: files(
> +  'ppc4xx_devs.c',
>     'ppc4xx_pci.c',
> -  'ppc4xx_devs.c'))
> +  'ppc4xx_sdram.c'))
>   ppc_ss.add(when: 'CONFIG_SAM460EX', if_true: files('sam460ex.c'))
>   # PReP
>   ppc_ss.add(when: 'CONFIG_PREP', if_true: files('prep.c'))
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index 5fbf44009e..651263926e 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -10,21 +10,14 @@
>   
>   #include "qemu/osdep.h"
>   #include "qemu/units.h"
> -#include "qemu/error-report.h"
>   #include "qapi/error.h"
>   #include "qemu/log.h"
> -#include "qemu/module.h"
>   #include "hw/irq.h"
> -#include "exec/memory.h"
> -#include "cpu.h"
>   #include "hw/ppc/ppc4xx.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/pci/pci.h"
> -#include "sysemu/block-backend.h"
>   #include "sysemu/reset.h"
>   #include "ppc440.h"
> -#include "qom/object.h"
> -#include "trace.h"
>   
>   /*****************************************************************************/
>   /* L2 Cache as SRAM */
> @@ -478,331 +471,6 @@ void ppc4xx_sdr_init(CPUPPCState *env)
>                        sdr, &dcr_read_sdr, &dcr_write_sdr);
>   }
>   
> -/*****************************************************************************/
> -/* SDRAM controller */
> -enum {
> -    SDRAM0_CFGADDR = 0x10,
> -    SDRAM0_CFGDATA,
> -    SDRAM_R0BAS = 0x40,
> -    SDRAM_R1BAS,
> -    SDRAM_R2BAS,
> -    SDRAM_R3BAS,
> -    SDRAM_CONF1HB = 0x45,
> -    SDRAM_PLBADDULL = 0x4a,
> -    SDRAM_CONF1LL = 0x4b,
> -    SDRAM_CONFPATHB = 0x4f,
> -    SDRAM_PLBADDUHB = 0x50,
> -};
> -
> -static uint32_t sdram_ddr2_bcr(hwaddr ram_base, hwaddr ram_size)
> -{
> -    uint32_t bcr;
> -
> -    switch (ram_size) {
> -    case 8 * MiB:
> -        bcr = 0xffc0;
> -        break;
> -    case 16 * MiB:
> -        bcr = 0xff80;
> -        break;
> -    case 32 * MiB:
> -        bcr = 0xff00;
> -        break;
> -    case 64 * MiB:
> -        bcr = 0xfe00;
> -        break;
> -    case 128 * MiB:
> -        bcr = 0xfc00;
> -        break;
> -    case 256 * MiB:
> -        bcr = 0xf800;
> -        break;
> -    case 512 * MiB:
> -        bcr = 0xf000;
> -        break;
> -    case 1 * GiB:
> -        bcr = 0xe000;
> -        break;
> -    case 2 * GiB:
> -        bcr = 0xc000;
> -        break;
> -    case 4 * GiB:
> -        bcr = 0x8000;
> -        break;
> -    default:
> -        error_report("invalid RAM size " TARGET_FMT_plx, ram_size);
> -        return 0;
> -    }
> -    bcr |= ram_base >> 2 & 0xffe00000;
> -    bcr |= 1;
> -
> -    return bcr;
> -}
> -
> -static inline hwaddr sdram_ddr2_base(uint32_t bcr)
> -{
> -    return (bcr & 0xffe00000) << 2;
> -}
> -
> -static uint64_t sdram_ddr2_size(uint32_t bcr)
> -{
> -    uint64_t size;
> -    int sh;
> -
> -    sh = 1024 - ((bcr >> 6) & 0x3ff);
> -    size = 8 * MiB * sh;
> -
> -    return size;
> -}
> -
> -static void sdram_bank_map(Ppc4xxSdramBank *bank)
> -{
> -    memory_region_init(&bank->container, NULL, "sdram-container", bank->size);
> -    memory_region_add_subregion(&bank->container, 0, &bank->ram);
> -    memory_region_add_subregion(get_system_memory(), bank->base,
> -                                &bank->container);
> -}
> -
> -static void sdram_bank_unmap(Ppc4xxSdramBank *bank)
> -{
> -    memory_region_del_subregion(get_system_memory(), &bank->container);
> -    memory_region_del_subregion(&bank->container, &bank->ram);
> -    object_unparent(OBJECT(&bank->container));
> -}
> -
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
> -static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
> -{
> -    Ppc4xxSdramDdr2State *sdram = opaque;
> -    uint32_t ret = 0;
> -
> -    switch (dcrn) {
> -    case SDRAM_R0BAS:
> -    case SDRAM_R1BAS:
> -    case SDRAM_R2BAS:
> -    case SDRAM_R3BAS:
> -        if (sdram->bank[dcrn - SDRAM_R0BAS].size) {
> -            ret = sdram_ddr2_bcr(sdram->bank[dcrn - SDRAM_R0BAS].base,
> -                                 sdram->bank[dcrn - SDRAM_R0BAS].size);
> -        }
> -        break;
> -    case SDRAM_CONF1HB:
> -    case SDRAM_CONF1LL:
> -    case SDRAM_CONFPATHB:
> -    case SDRAM_PLBADDULL:
> -    case SDRAM_PLBADDUHB:
> -        break;
> -    case SDRAM0_CFGADDR:
> -        ret = sdram->addr;
> -        break;
> -    case SDRAM0_CFGDATA:
> -        switch (sdram->addr) {
> -        case 0x14: /* SDRAM_MCSTAT (405EX) */
> -        case 0x1F:
> -            ret = 0x80000000;
> -            break;
> -        case 0x21: /* SDRAM_MCOPT2 */
> -            ret = sdram->mcopt2;
> -            break;
> -        case 0x40: /* SDRAM_MB0CF */
> -            ret = 0x00008001;
> -            break;
> -        case 0x7A: /* SDRAM_DLCR */
> -            ret = 0x02000000;
> -            break;
> -        case 0xE1: /* SDR0_DDR0 */
> -            ret = SDR0_DDR0_DDRM_ENCODE(1) | SDR0_DDR0_DDRM_DDR1;
> -            break;
> -        default:
> -            break;
> -        }
> -        break;
> -    default:
> -        break;
> -    }
> -
> -    return ret;
> -}
> -
> -#define SDRAM_DDR2_MCOPT2_DCEN BIT(27)
> -
> -static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
> -{
> -    Ppc4xxSdramDdr2State *sdram = opaque;
> -
> -    switch (dcrn) {
> -    case SDRAM_R0BAS:
> -    case SDRAM_R1BAS:
> -    case SDRAM_R2BAS:
> -    case SDRAM_R3BAS:
> -    case SDRAM_CONF1HB:
> -    case SDRAM_CONF1LL:
> -    case SDRAM_CONFPATHB:
> -    case SDRAM_PLBADDULL:
> -    case SDRAM_PLBADDUHB:
> -        break;
> -    case SDRAM0_CFGADDR:
> -        sdram->addr = val;
> -        break;
> -    case SDRAM0_CFGDATA:
> -        switch (sdram->addr) {
> -        case 0x00: /* B0CR */
> -            break;
> -        case 0x21: /* SDRAM_MCOPT2 */
> -            if (!(sdram->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
> -                (val & SDRAM_DDR2_MCOPT2_DCEN)) {
> -                trace_ppc4xx_sdram_enable("enable");
> -                /* validate all RAM mappings */
> -                sdram_ddr2_map_bcr(sdram);
> -                sdram->mcopt2 |= SDRAM_DDR2_MCOPT2_DCEN;
> -            } else if ((sdram->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
> -                       !(val & SDRAM_DDR2_MCOPT2_DCEN)) {
> -                trace_ppc4xx_sdram_enable("disable");
> -                /* invalidate all RAM mappings */
> -                sdram_ddr2_unmap_bcr(sdram);
> -                sdram->mcopt2 &= ~SDRAM_DDR2_MCOPT2_DCEN;
> -            }
> -            break;
> -        default:
> -            break;
> -        }
> -        break;
> -    default:
> -        break;
> -    }
> -}
> -
> -static void ppc4xx_sdram_ddr2_reset(DeviceState *dev)
> -{
> -    Ppc4xxSdramDdr2State *sdram = PPC4xx_SDRAM_DDR2(dev);
> -
> -    sdram->addr = 0;
> -    sdram->mcopt2 = 0;
> -}
> -
> -static void ppc4xx_sdram_ddr2_realize(DeviceState *dev, Error **errp)
> -{
> -    Ppc4xxSdramDdr2State *s = PPC4xx_SDRAM_DDR2(dev);
> -    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
> -    /*
> -     * SoC also has 4 GiB but that causes problem with 32 bit
> -     * builds (4*GiB overflows the 32 bit ram_addr_t).
> -     */
> -    const ram_addr_t valid_bank_sizes[] = {
> -        2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB,
> -        64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 0
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
> -    ppc4xx_dcr_register(dcr, SDRAM0_CFGADDR,
> -                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc4xx_dcr_register(dcr, SDRAM0_CFGDATA,
> -                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -
> -    ppc4xx_dcr_register(dcr, SDRAM_R0BAS,
> -                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc4xx_dcr_register(dcr, SDRAM_R1BAS,
> -                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc4xx_dcr_register(dcr, SDRAM_R2BAS,
> -                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc4xx_dcr_register(dcr, SDRAM_R3BAS,
> -                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc4xx_dcr_register(dcr, SDRAM_CONF1HB,
> -                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc4xx_dcr_register(dcr, SDRAM_PLBADDULL,
> -                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc4xx_dcr_register(dcr, SDRAM_CONF1LL,
> -                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc4xx_dcr_register(dcr, SDRAM_CONFPATHB,
> -                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc4xx_dcr_register(dcr, SDRAM_PLBADDUHB,
> -                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -}
> -
> -static Property ppc4xx_sdram_ddr2_props[] = {
> -    DEFINE_PROP_LINK("dram", Ppc4xxSdramDdr2State, dram_mr, TYPE_MEMORY_REGION,
> -                     MemoryRegion *),
> -    DEFINE_PROP_UINT32("nbanks", Ppc4xxSdramDdr2State, nbanks, 4),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
> -static void ppc4xx_sdram_ddr2_class_init(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(oc);
> -
> -    dc->realize = ppc4xx_sdram_ddr2_realize;
> -    dc->reset = ppc4xx_sdram_ddr2_reset;
> -    /* Reason: only works as function of a ppc4xx SoC */
> -    dc->user_creatable = false;
> -    device_class_set_props(dc, ppc4xx_sdram_ddr2_props);
> -}
> -
> -void ppc4xx_sdram_ddr2_enable(Ppc4xxSdramDdr2State *s)
> -{
> -    sdram_ddr2_dcr_write(s, SDRAM0_CFGADDR, 0x21);
> -    sdram_ddr2_dcr_write(s, SDRAM0_CFGDATA, 0x08000000);
> -}
> -
> -static const TypeInfo ppc4xx_types[] = {
> -    {
> -        .name           = TYPE_PPC4xx_SDRAM_DDR2,
> -        .parent         = TYPE_PPC4xx_DCR_DEVICE,
> -        .instance_size  = sizeof(Ppc4xxSdramDdr2State),
> -        .class_init     = ppc4xx_sdram_ddr2_class_init,
> -    }
> -};
> -DEFINE_TYPES(ppc4xx_types)
> -
>   /*****************************************************************************/
>   /* PLB to AHB bridge */
>   enum {
> diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
> new file mode 100644
> index 0000000000..b49a7ed60a
> --- /dev/null
> +++ b/hw/ppc/ppc4xx_sdram.c
> @@ -0,0 +1,348 @@
> +/*
> + * DDR2 SDRAM controller:
> + * Copyright (c) 2012 François Revol
> + * Copyright (c) 2016-2019 BALATON Zoltan


Shouldn't your Copyright be 2016-2022 for this new file?


The rest LGTM

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


> + *
> + * This work is licensed under the GNU GPL license version 2 or later.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "qapi/error.h"
> +#include "exec/address-spaces.h" /* get_system_memory() */
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/ppc/ppc4xx.h"
> +#include "trace.h"
> +
> +/*****************************************************************************/
> +/* Shared functions */
> +
> +static void sdram_bank_map(Ppc4xxSdramBank *bank)
> +{
> +    memory_region_init(&bank->container, NULL, "sdram-container", bank->size);
> +    memory_region_add_subregion(&bank->container, 0, &bank->ram);
> +    memory_region_add_subregion(get_system_memory(), bank->base,
> +                                &bank->container);
> +}
> +
> +static void sdram_bank_unmap(Ppc4xxSdramBank *bank)
> +{
> +    memory_region_del_subregion(get_system_memory(), &bank->container);
> +    memory_region_del_subregion(&bank->container, &bank->ram);
> +    object_unparent(OBJECT(&bank->container));
> +}
> +
> +enum {
> +    SDRAM0_CFGADDR = 0x010,
> +    SDRAM0_CFGDATA = 0x011,
> +};
> +
> +/*****************************************************************************/
> +/* DDR2 SDRAM controller */
> +enum {
> +    SDRAM_R0BAS = 0x40,
> +    SDRAM_R1BAS,
> +    SDRAM_R2BAS,
> +    SDRAM_R3BAS,
> +    SDRAM_CONF1HB = 0x45,
> +    SDRAM_PLBADDULL = 0x4a,
> +    SDRAM_CONF1LL = 0x4b,
> +    SDRAM_CONFPATHB = 0x4f,
> +    SDRAM_PLBADDUHB = 0x50,
> +};
> +
> +static uint32_t sdram_ddr2_bcr(hwaddr ram_base, hwaddr ram_size)
> +{
> +    uint32_t bcr;
> +
> +    switch (ram_size) {
> +    case 8 * MiB:
> +        bcr = 0xffc0;
> +        break;
> +    case 16 * MiB:
> +        bcr = 0xff80;
> +        break;
> +    case 32 * MiB:
> +        bcr = 0xff00;
> +        break;
> +    case 64 * MiB:
> +        bcr = 0xfe00;
> +        break;
> +    case 128 * MiB:
> +        bcr = 0xfc00;
> +        break;
> +    case 256 * MiB:
> +        bcr = 0xf800;
> +        break;
> +    case 512 * MiB:
> +        bcr = 0xf000;
> +        break;
> +    case 1 * GiB:
> +        bcr = 0xe000;
> +        break;
> +    case 2 * GiB:
> +        bcr = 0xc000;
> +        break;
> +    case 4 * GiB:
> +        bcr = 0x8000;
> +        break;
> +    default:
> +        error_report("invalid RAM size " TARGET_FMT_plx, ram_size);
> +        return 0;
> +    }
> +    bcr |= ram_base >> 2 & 0xffe00000;
> +    bcr |= 1;
> +
> +    return bcr;
> +}
> +
> +static inline hwaddr sdram_ddr2_base(uint32_t bcr)
> +{
> +    return (bcr & 0xffe00000) << 2;
> +}
> +
> +static uint64_t sdram_ddr2_size(uint32_t bcr)
> +{
> +    uint64_t size;
> +    int sh;
> +
> +    sh = 1024 - ((bcr >> 6) & 0x3ff);
> +    size = 8 * MiB * sh;
> +
> +    return size;
> +}
> +
> +static void sdram_ddr2_set_bcr(Ppc4xxSdramDdr2State *sdram, int i,
> +                               uint32_t bcr, int enabled)
> +{
> +    if (sdram->bank[i].bcr & 1) {
> +        /* First unmap RAM if enabled */
> +        trace_ppc4xx_sdram_unmap(sdram_ddr2_base(sdram->bank[i].bcr),
> +                                 sdram_ddr2_size(sdram->bank[i].bcr));
> +        sdram_bank_unmap(&sdram->bank[i]);
> +    }
> +    sdram->bank[i].bcr = bcr & 0xffe0ffc1;
> +    if (enabled && (bcr & 1)) {
> +        trace_ppc4xx_sdram_map(sdram_ddr2_base(bcr), sdram_ddr2_size(bcr));
> +        sdram_bank_map(&sdram->bank[i]);
> +    }
> +}
> +
> +static void sdram_ddr2_map_bcr(Ppc4xxSdramDdr2State *sdram)
> +{
> +    int i;
> +
> +    for (i = 0; i < sdram->nbanks; i++) {
> +        if (sdram->bank[i].size) {
> +            sdram_ddr2_set_bcr(sdram, i,
> +                               sdram_ddr2_bcr(sdram->bank[i].base,
> +                                              sdram->bank[i].size), 1);
> +        } else {
> +            sdram_ddr2_set_bcr(sdram, i, 0, 0);
> +        }
> +    }
> +}
> +
> +static void sdram_ddr2_unmap_bcr(Ppc4xxSdramDdr2State *sdram)
> +{
> +    int i;
> +
> +    for (i = 0; i < sdram->nbanks; i++) {
> +        if (sdram->bank[i].size) {
> +            sdram_ddr2_set_bcr(sdram, i, sdram->bank[i].bcr & ~1, 0);
> +        }
> +    }
> +}
> +
> +static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
> +{
> +    Ppc4xxSdramDdr2State *sdram = opaque;
> +    uint32_t ret = 0;
> +
> +    switch (dcrn) {
> +    case SDRAM_R0BAS:
> +    case SDRAM_R1BAS:
> +    case SDRAM_R2BAS:
> +    case SDRAM_R3BAS:
> +        if (sdram->bank[dcrn - SDRAM_R0BAS].size) {
> +            ret = sdram_ddr2_bcr(sdram->bank[dcrn - SDRAM_R0BAS].base,
> +                                 sdram->bank[dcrn - SDRAM_R0BAS].size);
> +        }
> +        break;
> +    case SDRAM_CONF1HB:
> +    case SDRAM_CONF1LL:
> +    case SDRAM_CONFPATHB:
> +    case SDRAM_PLBADDULL:
> +    case SDRAM_PLBADDUHB:
> +        break;
> +    case SDRAM0_CFGADDR:
> +        ret = sdram->addr;
> +        break;
> +    case SDRAM0_CFGDATA:
> +        switch (sdram->addr) {
> +        case 0x14: /* SDRAM_MCSTAT (405EX) */
> +        case 0x1F:
> +            ret = 0x80000000;
> +            break;
> +        case 0x21: /* SDRAM_MCOPT2 */
> +            ret = sdram->mcopt2;
> +            break;
> +        case 0x40: /* SDRAM_MB0CF */
> +            ret = 0x00008001;
> +            break;
> +        case 0x7A: /* SDRAM_DLCR */
> +            ret = 0x02000000;
> +            break;
> +        case 0xE1: /* SDR0_DDR0 */
> +            ret = SDR0_DDR0_DDRM_ENCODE(1) | SDR0_DDR0_DDRM_DDR1;
> +            break;
> +        default:
> +            break;
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +#define SDRAM_DDR2_MCOPT2_DCEN BIT(27)
> +
> +static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
> +{
> +    Ppc4xxSdramDdr2State *sdram = opaque;
> +
> +    switch (dcrn) {
> +    case SDRAM_R0BAS:
> +    case SDRAM_R1BAS:
> +    case SDRAM_R2BAS:
> +    case SDRAM_R3BAS:
> +    case SDRAM_CONF1HB:
> +    case SDRAM_CONF1LL:
> +    case SDRAM_CONFPATHB:
> +    case SDRAM_PLBADDULL:
> +    case SDRAM_PLBADDUHB:
> +        break;
> +    case SDRAM0_CFGADDR:
> +        sdram->addr = val;
> +        break;
> +    case SDRAM0_CFGDATA:
> +        switch (sdram->addr) {
> +        case 0x00: /* B0CR */
> +            break;
> +        case 0x21: /* SDRAM_MCOPT2 */
> +            if (!(sdram->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
> +                (val & SDRAM_DDR2_MCOPT2_DCEN)) {
> +                trace_ppc4xx_sdram_enable("enable");
> +                /* validate all RAM mappings */
> +                sdram_ddr2_map_bcr(sdram);
> +                sdram->mcopt2 |= SDRAM_DDR2_MCOPT2_DCEN;
> +            } else if ((sdram->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
> +                       !(val & SDRAM_DDR2_MCOPT2_DCEN)) {
> +                trace_ppc4xx_sdram_enable("disable");
> +                /* invalidate all RAM mappings */
> +                sdram_ddr2_unmap_bcr(sdram);
> +                sdram->mcopt2 &= ~SDRAM_DDR2_MCOPT2_DCEN;
> +            }
> +            break;
> +        default:
> +            break;
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +
> +static void ppc4xx_sdram_ddr2_reset(DeviceState *dev)
> +{
> +    Ppc4xxSdramDdr2State *sdram = PPC4xx_SDRAM_DDR2(dev);
> +
> +    sdram->addr = 0;
> +    sdram->mcopt2 = 0;
> +}
> +
> +static void ppc4xx_sdram_ddr2_realize(DeviceState *dev, Error **errp)
> +{
> +    Ppc4xxSdramDdr2State *s = PPC4xx_SDRAM_DDR2(dev);
> +    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
> +    /*
> +     * SoC also has 4 GiB but that causes problem with 32 bit
> +     * builds (4*GiB overflows the 32 bit ram_addr_t).
> +     */
> +    const ram_addr_t valid_bank_sizes[] = {
> +        2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB,
> +        64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 0
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
> +    ppc4xx_dcr_register(dcr, SDRAM0_CFGADDR,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM0_CFGDATA,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +
> +    ppc4xx_dcr_register(dcr, SDRAM_R0BAS,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM_R1BAS,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM_R2BAS,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM_R3BAS,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM_CONF1HB,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM_PLBADDULL,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM_CONF1LL,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM_CONFPATHB,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM_PLBADDUHB,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +}
> +
> +static Property ppc4xx_sdram_ddr2_props[] = {
> +    DEFINE_PROP_LINK("dram", Ppc4xxSdramDdr2State, dram_mr, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
> +    DEFINE_PROP_UINT32("nbanks", Ppc4xxSdramDdr2State, nbanks, 4),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void ppc4xx_sdram_ddr2_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ppc4xx_sdram_ddr2_realize;
> +    dc->reset = ppc4xx_sdram_ddr2_reset;
> +    /* Reason: only works as function of a ppc4xx SoC */
> +    dc->user_creatable = false;
> +    device_class_set_props(dc, ppc4xx_sdram_ddr2_props);
> +}
> +
> +void ppc4xx_sdram_ddr2_enable(Ppc4xxSdramDdr2State *s)
> +{
> +    sdram_ddr2_dcr_write(s, SDRAM0_CFGADDR, 0x21);
> +    sdram_ddr2_dcr_write(s, SDRAM0_CFGDATA, 0x08000000);
> +}
> +
> +static const TypeInfo ppc4xx_sdram_types[] = {
> +    {
> +        .name           = TYPE_PPC4xx_SDRAM_DDR2,
> +        .parent         = TYPE_PPC4xx_DCR_DEVICE,
> +        .instance_size  = sizeof(Ppc4xxSdramDdr2State),
> +        .class_init     = ppc4xx_sdram_ddr2_class_init,
> +    }
> +};
> +
> +DEFINE_TYPES(ppc4xx_sdram_types)

