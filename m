Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727935EAEE6
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 19:58:56 +0200 (CEST)
Received: from localhost ([::1]:41214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsNb-0002Se-I3
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 13:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocrRl-0005mn-T6; Mon, 26 Sep 2022 12:59:10 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:43610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocrRi-0003eA-Ij; Mon, 26 Sep 2022 12:59:09 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1279948d93dso10006253fac.10; 
 Mon, 26 Sep 2022 09:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=08ZXmQ9pIchljCI5AYv/BLjDYW7zPqMl0XVoZ0VJpX0=;
 b=IRudDwgf9TELD/9l0a74taDhVBWv5NdHbp+Ovwqj1fiTKDkxPSeFOB/F60eLFiHdzN
 ZRY7zrSlmcP9MrPMA8VzJ4hho7iwRAkf+8IwJ5MMaOjrT5CDlt9WfU1AZKLZD6zJc376
 DRj/6DhWNPNzL+YnmaAtIBAz2dv0EYjtYq7cYjw/TaF+V4TO8c8HQHQCKmhyMC1Q+Qcp
 yjmTohHZf+K90ermZCuKm7KqqVnUTp0AAaqqOSCO7vBiv5s6lFHoby0Rxw08YciDdMVs
 PqGbsqXRLhejXiO7bqyJyUVP0yEqt001KVqRB/3ecK/kvAleFqRQkJ++FAEJkJo8+yt+
 JYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=08ZXmQ9pIchljCI5AYv/BLjDYW7zPqMl0XVoZ0VJpX0=;
 b=QCvpXFaGd3d6g4B1zP8Bg0WEAPWZZEgq0xrk3aYhiXIXErH7QQBGqrwhXobyQbRsx0
 atWYeFcVLq3+bOENJ0yGYu5U1BrR9ymqcaCXbw2129HrfDBJlugPkCPHIrvSDivCQ0dQ
 jcZSA1DfdzwK9fxFB895JcF5LJNy5g7pNZXqBnDskapUWEY4lKE7HB/qjuMoOqqfeq1X
 JXVu6hpeVtswS2FK8CakwMnw3fnUVVowJSctSPeLd+Afqn3puZZsW7xfW2nlPxWLJcTc
 W8Br0JaXX2zOtFRHbzHP9maRWZVjHzUkIZR7buh6kADQEgeonOVlBDMnRhdSIg7WYTAF
 /hLg==
X-Gm-Message-State: ACrzQf0yN6pqIDOVaWe+7IV42OmCC6FIaefBf9/iKE3IPmr+nJ1OYPyj
 An9dsJ3wZB4WbkpiqM6QeQk=
X-Google-Smtp-Source: AMsMyM7/SAVv60xQimewgunZ43DdqN1da5gz0XF0zpXPM7P9wxDJTlV9iLWobYysdLSyF49gaJ/oaA==
X-Received: by 2002:a05:6870:4191:b0:128:4d:9203 with SMTP id
 y17-20020a056870419100b00128004d9203mr13867978oac.253.1664211543376; 
 Mon, 26 Sep 2022 09:59:03 -0700 (PDT)
Received: from [192.168.10.102] (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 c13-20020a9d684d000000b00616d3ec6734sm7919085oto.53.2022.09.26.09.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 09:59:02 -0700 (PDT)
Message-ID: <7040b0bd-2f5d-4ee3-cef2-490b926dc0d1@gmail.com>
Date: Mon, 26 Sep 2022 13:59:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6 11/25] ppc440_sdram: Get rid of the init RAM hack
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Peter Maydell <peter.maydell@linaro.org>
References: <cover.1664021647.git.balaton@eik.bme.hu>
 <c2eda8f83c82f655aa7821a5a8c9310484bd6a1d.1664021647.git.balaton@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <c2eda8f83c82f655aa7821a5a8c9310484bd6a1d.1664021647.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
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



On 9/24/22 09:28, BALATON Zoltan wrote:
> Remove the do_init parameter of ppc440_sdram_init and enable SDRAM
> controller from the board. Firmware does this so it may only be needed
> when booting with -kernel without firmware but we enable SDRAM
> unconditionally to preserve previous behaviour.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> v5: Add function to enable sdram controller
> 
>   hw/ppc/ppc440.h         |  3 +--
>   hw/ppc/ppc440_uc.c      | 15 +++++++++------
>   hw/ppc/sam460ex.c       |  4 +++-
>   include/hw/ppc/ppc4xx.h |  2 ++
>   4 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/ppc/ppc440.h b/hw/ppc/ppc440.h
> index e6c905b7d6..01d76b8000 100644
> --- a/hw/ppc/ppc440.h
> +++ b/hw/ppc/ppc440.h
> @@ -17,8 +17,7 @@ void ppc4xx_l2sram_init(CPUPPCState *env);
>   void ppc4xx_cpr_init(CPUPPCState *env);
>   void ppc4xx_sdr_init(CPUPPCState *env);
>   void ppc440_sdram_init(CPUPPCState *env, int nbanks,
> -                       Ppc4xxSdramBank *ram_banks,
> -                       int do_init);
> +                       Ppc4xxSdramBank *ram_banks);
>   void ppc4xx_ahb_init(CPUPPCState *env);
>   void ppc4xx_dma_init(CPUPPCState *env, int dcr_base);
>   void ppc460ex_pcie_init(CPUPPCState *env);
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index 3fbfe4ad13..e8bc088c8f 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -16,6 +16,7 @@
>   #include "qemu/module.h"
>   #include "hw/irq.h"
>   #include "exec/memory.h"
> +#include "cpu.h"
>   #include "hw/ppc/ppc4xx.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/pci/pci.h"
> @@ -727,12 +728,11 @@ static void sdram_reset(void *opaque)
>       ppc440_sdram_t *sdram = opaque;
>   
>       sdram->addr = 0;
> -    sdram->mcopt2 = SDRAM_DDR2_MCOPT2_DCEN;
> +    sdram->mcopt2 = 0;
>   }
>   
>   void ppc440_sdram_init(CPUPPCState *env, int nbanks,
> -                       Ppc4xxSdramBank *ram_banks,
> -                       int do_init)
> +                       Ppc4xxSdramBank *ram_banks)
>   {
>       ppc440_sdram_t *sdram;
>       int i;
> @@ -749,9 +749,6 @@ void ppc440_sdram_init(CPUPPCState *env, int nbanks,
>                        sdram, &dcr_read_sdram, &dcr_write_sdram);
>       ppc_dcr_register(env, SDRAM0_CFGDATA,
>                        sdram, &dcr_read_sdram, &dcr_write_sdram);
> -    if (do_init) {
> -        sdram_map_bcr(sdram);
> -    }
>   
>       ppc_dcr_register(env, SDRAM_R0BAS,
>                        sdram, &dcr_read_sdram, &dcr_write_sdram);
> @@ -773,6 +770,12 @@ void ppc440_sdram_init(CPUPPCState *env, int nbanks,
>                        sdram, &dcr_read_sdram, &dcr_write_sdram);
>   }
>   
> +void ppc440_sdram_enable(CPUPPCState *env)
> +{
> +    ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x21);
> +    ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x08000000);
> +}
> +
>   /*****************************************************************************/
>   /* PLB to AHB bridge */
>   enum {
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index f4c2a693fb..9c01211b20 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -345,7 +345,9 @@ static void sam460ex_init(MachineState *machine)
>       ppc4xx_sdram_banks(machine->ram, 1, ram_banks, ppc460ex_sdram_bank_sizes);
>   
>       /* FIXME: does 460EX have ECC interrupts? */
> -    ppc440_sdram_init(env, 1, ram_banks, 1);
> +    ppc440_sdram_init(env, 1, ram_banks);
> +    /* Enable SDRAM memory regions as we may boot without firmware */
> +    ppc440_sdram_enable(env);
>   
>       /* IIC controllers and devices */
>       dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600700,
> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
> index 558500fb97..78a845399e 100644
> --- a/include/hw/ppc/ppc4xx.h
> +++ b/include/hw/ppc/ppc4xx.h
> @@ -37,6 +37,8 @@ typedef struct {
>       uint32_t bcr;
>   } Ppc4xxSdramBank;
>   
> +void ppc440_sdram_enable(CPUPPCState *env);
> +
>   void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>                           Ppc4xxSdramBank ram_banks[],
>                           const ram_addr_t sdram_bank_sizes[]);

