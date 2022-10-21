Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAF560806D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 22:59:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxCd-0006az-9V; Fri, 21 Oct 2022 14:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oluvU-0000Rv-NG; Fri, 21 Oct 2022 12:31:18 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oluvS-00038W-Q9; Fri, 21 Oct 2022 12:31:16 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-131dda37dddso4261786fac.0; 
 Fri, 21 Oct 2022 09:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LX6fD4c+KvNBnXr43vhCU1rtVpE+IllA6KJJHpU3Ifw=;
 b=jqSa79cPbBN1QihYrxB5eJNT+xS6zFohPmEFvGTek5/jDMRLBhXBJKplrYeKZE2kyq
 qFzfKCPVNy46dYciMsptWrOO9Z1qhA/+a7TFEQlomX8T/bkNqxXZNNkN3r2l+tDY2Zna
 z/+o4iaxSNTXuAPGPIWqY+cMHUclNpZ5CaMnRk+q8xe1R7t2pdnwYM2oBe4FWsAVDzvd
 pvFIYKsCT8po0AtVckL6kS3ou/6w16j35TOhwqZ/ssj6m8BAb8Y8xeMYEStC+YFvCJs1
 cdvBj9t7ndhic3+05dHw7I6LrtpWrFYhc3pgHxEi8kPJZ0EDw0+mMOwGwQqJSXZvpP55
 +MaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LX6fD4c+KvNBnXr43vhCU1rtVpE+IllA6KJJHpU3Ifw=;
 b=gh76XpSXqg66PQzgatduPfrS1IAYD7XKn7VzR+fweq8oa57Y8WSjXjWSo9Tp8m3CxA
 aIJE2CX5NkmyvlHWz4+PC7loI3YWp/PlsPUeDFhPQ9ki9gaQysPRAxpcVlHJBz+bY1QB
 4HXCiODhRykEPEootP+yqi4U0D6SnOaFVbwmDnhbe1DSgIYTQkrXgRk2u2HL87X8p0ed
 p4SK+1Z0/WRaoxlgSx4nysMidAjygnmc5g54/53srQNI59gpaAwFMDRqnb/xrPJSD1Cy
 ZT2YNVRSujTP3w20/20YmQMrXoE/x340ymrwJDIow58xNTetfwtXBmxzTmkadVo9MndH
 4H4Q==
X-Gm-Message-State: ACrzQf2VONr+9sXwDUfLB3pcJPTQCEwVelR57wCIYgzWKsPyyAP2vcmg
 w4KqyoWhTof3wFyPO744MBY=
X-Google-Smtp-Source: AMsMyM7uhUot99K2r+r26p3tSZXv0BfcX8YQabWNNxM89McHgMWioYwvWYGjFR6NAZap7OnkbBOdoA==
X-Received: by 2002:a05:6870:a91b:b0:131:f14a:30c2 with SMTP id
 eq27-20020a056870a91b00b00131f14a30c2mr12569394oab.286.1666369873035; 
 Fri, 21 Oct 2022 09:31:13 -0700 (PDT)
Received: from [192.168.10.102] ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a4ad00e000000b00476995b5f0fsm8867668oor.9.2022.10.21.09.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 09:31:12 -0700 (PDT)
Message-ID: <7bd3abea-d945-cbe3-a21a-8b8dde5f3c9f@gmail.com>
Date: Fri, 21 Oct 2022 13:31:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v7 3/8] ppc4xx_sdram: Move ppc4xx_sdram_banks() to
 ppc4xx_sdram.c
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, philmd@linaro.org
References: <cover.1666194485.git.balaton@eik.bme.hu>
 <b1504a82157a586aa284e8ee3b427b9a07b24169.1666194485.git.balaton@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <b1504a82157a586aa284e8ee3b427b9a07b24169.1666194485.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
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
> This function is only used by the ppc4xx memory controller models so
> it can be made static.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/ppc4xx_devs.c    | 62 -----------------------------------------
>   hw/ppc/ppc4xx_sdram.c   | 61 ++++++++++++++++++++++++++++++++++++++++
>   include/hw/ppc/ppc4xx.h | 20 ++++++-------
>   3 files changed, 69 insertions(+), 74 deletions(-)
> 
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index f737dbb3d6..c1d111465d 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -23,73 +23,11 @@
>    */
>   
>   #include "qemu/osdep.h"
> -#include "qemu/units.h"
>   #include "cpu.h"
>   #include "hw/ppc/ppc4xx.h"
>   #include "hw/qdev-properties.h"
>   #include "qapi/error.h"
>   
> -/*
> - * Split RAM between SDRAM banks.
> - *
> - * sdram_bank_sizes[] must be in descending order, that is sizes[i] > sizes[i+1]
> - * and must be 0-terminated.
> - *
> - * The 4xx SDRAM controller supports a small number of banks, and each bank
> - * must be one of a small set of sizes. The number of banks and the supported
> - * sizes varies by SoC.
> - */
> -void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
> -                        Ppc4xxSdramBank ram_banks[],
> -                        const ram_addr_t sdram_bank_sizes[])
> -{
> -    ram_addr_t size_left = memory_region_size(ram);
> -    ram_addr_t base = 0;
> -    ram_addr_t bank_size;
> -    int i;
> -    int j;
> -
> -    for (i = 0; i < nr_banks; i++) {
> -        for (j = 0; sdram_bank_sizes[j] != 0; j++) {
> -            bank_size = sdram_bank_sizes[j];
> -            if (bank_size <= size_left) {
> -                char name[32];
> -
> -                ram_banks[i].base = base;
> -                ram_banks[i].size = bank_size;
> -                base += bank_size;
> -                size_left -= bank_size;
> -                snprintf(name, sizeof(name), "ppc4xx.sdram%d", i);
> -                memory_region_init_alias(&ram_banks[i].ram, NULL, name, ram,
> -                                         ram_banks[i].base, ram_banks[i].size);
> -                break;
> -            }
> -        }
> -        if (!size_left) {
> -            /* No need to use the remaining banks. */
> -            break;
> -        }
> -    }
> -
> -    if (size_left) {
> -        ram_addr_t used_size = memory_region_size(ram) - size_left;
> -        GString *s = g_string_new(NULL);
> -
> -        for (i = 0; sdram_bank_sizes[i]; i++) {
> -            g_string_append_printf(s, "%" PRIi64 "%s",
> -                                   sdram_bank_sizes[i] / MiB,
> -                                   sdram_bank_sizes[i + 1] ? ", " : "");
> -        }
> -        error_report("at most %d bank%s of %s MiB each supported",
> -                     nr_banks, nr_banks == 1 ? "" : "s", s->str);
> -        error_printf("Possible valid RAM size: %" PRIi64 " MiB\n",
> -            used_size ? used_size / MiB : sdram_bank_sizes[i - 1] / MiB);
> -
> -        g_string_free(s, true);
> -        exit(EXIT_FAILURE);
> -    }
> -}
> -
>   /*****************************************************************************/
>   /* MAL */
>   
> diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
> index d88363bc3d..62ef7d8f0d 100644
> --- a/hw/ppc/ppc4xx_sdram.c
> +++ b/hw/ppc/ppc4xx_sdram.c
> @@ -43,6 +43,67 @@
>   /*****************************************************************************/
>   /* Shared functions */
>   
> +/*
> + * Split RAM between SDRAM banks.
> + *
> + * sdram_bank_sizes[] must be in descending order, that is sizes[i] > sizes[i+1]
> + * and must be 0-terminated.
> + *
> + * The 4xx SDRAM controller supports a small number of banks, and each bank
> + * must be one of a small set of sizes. The number of banks and the supported
> + * sizes varies by SoC.
> + */
> +static void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
> +                               Ppc4xxSdramBank ram_banks[],
> +                               const ram_addr_t sdram_bank_sizes[])
> +{
> +    ram_addr_t size_left = memory_region_size(ram);
> +    ram_addr_t base = 0;
> +    ram_addr_t bank_size;
> +    int i;
> +    int j;
> +
> +    for (i = 0; i < nr_banks; i++) {
> +        for (j = 0; sdram_bank_sizes[j] != 0; j++) {
> +            bank_size = sdram_bank_sizes[j];
> +            if (bank_size <= size_left) {
> +                char name[32];
> +
> +                ram_banks[i].base = base;
> +                ram_banks[i].size = bank_size;
> +                base += bank_size;
> +                size_left -= bank_size;
> +                snprintf(name, sizeof(name), "ppc4xx.sdram%d", i);
> +                memory_region_init_alias(&ram_banks[i].ram, NULL, name, ram,
> +                                         ram_banks[i].base, ram_banks[i].size);
> +                break;
> +            }
> +        }
> +        if (!size_left) {
> +            /* No need to use the remaining banks. */
> +            break;
> +        }
> +    }
> +
> +    if (size_left) {
> +        ram_addr_t used_size = memory_region_size(ram) - size_left;
> +        GString *s = g_string_new(NULL);
> +
> +        for (i = 0; sdram_bank_sizes[i]; i++) {
> +            g_string_append_printf(s, "%" PRIi64 "%s",
> +                                   sdram_bank_sizes[i] / MiB,
> +                                   sdram_bank_sizes[i + 1] ? ", " : "");
> +        }
> +        error_report("at most %d bank%s of %s MiB each supported",
> +                     nr_banks, nr_banks == 1 ? "" : "s", s->str);
> +        error_printf("Possible valid RAM size: %" PRIi64 " MiB\n",
> +            used_size ? used_size / MiB : sdram_bank_sizes[i - 1] / MiB);
> +
> +        g_string_free(s, true);
> +        exit(EXIT_FAILURE);
> +    }
> +}
> +
>   static void sdram_bank_map(Ppc4xxSdramBank *bank)
>   {
>       memory_region_init(&bank->container, NULL, "sdram-container", bank->size);
> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
> index 10c6dd535f..f8c86e09ec 100644
> --- a/include/hw/ppc/ppc4xx.h
> +++ b/include/hw/ppc/ppc4xx.h
> @@ -29,18 +29,6 @@
>   #include "exec/memory.h"
>   #include "hw/sysbus.h"
>   
> -typedef struct {
> -    MemoryRegion ram;
> -    MemoryRegion container; /* used for clipping */
> -    hwaddr base;
> -    hwaddr size;
> -    uint32_t bcr;
> -} Ppc4xxSdramBank;
> -
> -void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
> -                        Ppc4xxSdramBank ram_banks[],
> -                        const ram_addr_t sdram_bank_sizes[]);
> -
>   #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
>   
>   /*
> @@ -111,6 +99,14 @@ struct Ppc4xxEbcState {
>   };
>   
>   /* SDRAM DDR controller */
> +typedef struct {
> +    MemoryRegion ram;
> +    MemoryRegion container; /* used for clipping */
> +    hwaddr base;
> +    hwaddr size;
> +    uint32_t bcr;
> +} Ppc4xxSdramBank;
> +
>   #define SDR0_DDR0_DDRM_ENCODE(n)  ((((unsigned long)(n)) & 0x03) << 29)
>   #define SDR0_DDR0_DDRM_DDR1       0x20000000
>   #define SDR0_DDR0_DDRM_DDR2       0x40000000

