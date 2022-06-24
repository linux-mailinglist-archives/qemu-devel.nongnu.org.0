Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 922F255A269
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 22:16:21 +0200 (CEST)
Received: from localhost ([::1]:42190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4pj2-0006f8-6U
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 16:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4pfX-0005HP-UG; Fri, 24 Jun 2022 16:12:45 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:46940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4pfV-0001mG-0I; Fri, 24 Jun 2022 16:12:43 -0400
Received: by mail-oi1-x229.google.com with SMTP id e131so4878595oif.13;
 Fri, 24 Jun 2022 13:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Glkn+rO5TiWcc0xS4xi7qO6WqRFq6m8EHI8AD6dupCo=;
 b=asb8FvoP0nTmMrWn1LUMTMX8FV6t6Z4fgECyTo4qJ8nUtnzGe+Odkt+aM8jG5rUpDR
 2QAfk9sOaRn/n2K+VQ8E3PNGZXTuIWjiBAwOT3tGNnVeXOUHOjoNwjrwQMVjXVdxk30v
 8EgpEOdB8q8iw+cbrnfKMc8tL4n73g+HgaQDHEJ39ODWleAOS+I/S0NKfJDjKg4AKF7i
 rJwh1U1P/zqA2WwX6dvwuW5NrX2huzZbK4INwsJ6LQyNOLbtl6FVXqeafr1bl0pW+Vqh
 JQXeFuD1OpUXMqzEOBzlYp3/KU8Jfz+LFPMxgGJzuX5zO8jzAYFVfGuaCKbpBm3jK4B4
 xVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Glkn+rO5TiWcc0xS4xi7qO6WqRFq6m8EHI8AD6dupCo=;
 b=N7OJ7Xx3Lo3o89xWUCkWIzhWQCgwpBx4tcCpPb6mSlaM4juHy5qNu5OCDjnxH/Z53Z
 k+gGq2dh4nTX6HhoZDAkeqU3BigR/554cfuEELc+qcOJUgM7c79t2h2M14ltIcNBwcS7
 91iCiZfSdGmuPTNTNhHkRfu7OP6Y56x9AvLRZMEd/4EJPmNby260g4UkGPnGxDPBxawO
 iWljUOe9YUHjvC6DlF/tbh72Dv5IpptO/GTb+bX32BiLPcu9xN548xQjJxjHtrisLQd0
 QayFJacAp6zP/9X1T4bQIlez33BojeWG31AOjyxIYyQTiZ8btVpa/+0g0m+eLH7xYLiQ
 75WQ==
X-Gm-Message-State: AJIora/kMZahOevIog3OjuJLiLK1GOxOcqTkYUUeEJFpszbP+zskcJPr
 5D0u7shO9XnZ9OJR93dTMhQ=
X-Google-Smtp-Source: AGRyM1uH7yyUPfvwArZPVczA/GS8oYbJBuMK7IbwvEF+4MMVfCEcsuGpqjF11zcx6AzOcGgnkkPKMA==
X-Received: by 2002:a05:6808:2393:b0:331:41f1:e601 with SMTP id
 bp19-20020a056808239300b0033141f1e601mr499039oib.48.1656101558477; 
 Fri, 24 Jun 2022 13:12:38 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a056830078a00b006060322125esm2062526ots.46.2022.06.24.13.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 13:12:38 -0700 (PDT)
Message-ID: <806270d7-c630-d436-43fc-bed8fd3ef694@gmail.com>
Date: Fri, 24 Jun 2022 17:12:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH qemu v2 1/2] ppc: Define SETFIELD for the ppc target
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220617060703.951747-1-aik@ozlabs.ru>
 <20220617060703.951747-2-aik@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220617060703.951747-2-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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

Alexey,

The newer version of this patch is having trouble with Gitlab runners, as
you can read in my feedback there.

I've tested this one just in case. The same problems happen. E.g. for the
cross-armel-system runner:


In file included from ../hw/intc/pnv_xive.c:14:
../hw/intc/pnv_xive.c: In function ‘pnv_xive_block_id’:
/builds/danielhb/qemu/target/ppc/cpu.h:45:33: error: conversion from ‘long long unsigned int’ to ‘long unsigned int’ changes value from ‘4222124650659840’ to ‘0’ [-Werror=overflow]
    45 | #define PPC_BITMASK(bs, be)     ((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/builds/danielhb/qemu/target/ppc/cpu.h:51:42: note: in definition of macro ‘GETFIELD’
    51 |     (((word) & (mask)) >> __builtin_ctzl(mask))
       |                                          ^~~~
../hw/intc/pnv_xive_regs.h:77:41: note: in expansion of macro ‘PPC_BITMASK’
    77 | #define  PC_TCTXT_CHIPID                PPC_BITMASK(12, 15)
       |                                         ^~~~~~~~~~~
../hw/intc/pnv_xive.c:80:24: note: in expansion of macro ‘PC_TCTXT_CHIPID’
    80 |         blk = GETFIELD(PC_TCTXT_CHIPID, cfg_val);
       |                        ^~~~~~~~~~~~~~~
../hw/intc/pnv_xive.c: In function ‘pnv_xive_vst_addr’:
/builds/danielhb/qemu/target/ppc/cpu.h:45:33: error: conversion from ‘long long unsigned int’ to ‘long unsigned int’ changes value from ‘13835058055282163712’ to ‘0’ [-Werror=overflow]
    45 | #define PPC_BITMASK(bs, be)     ((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/builds/danielhb/qemu/target/ppc/cpu.h:51:42: note: in definition of macro ‘GETFIELD’
    51 |     (((word) & (mask)) >> __builtin_ctzl(mask))
       |                                          ^~~~
../hw/intc/pnv_xive_regs.h:230:33: note: in expansion of macro ‘PPC_BITMASK’
   230 | #define VSD_MODE                PPC_BITMASK(0, 1)
       |                                 ^~~~~~~~~~~
../hw/intc/pnv_xive.c:226:18: note: in expansion of macro ‘VSD_MODE’
   226 |     if (GETFIELD(VSD_MODE, vsd) == VSD_MODE_FORWARD) {
       |                  ^~~~~~~~
../hw/intc/pnv_xive.c: In function ‘pnv_xive_end_update’:


Link:

https://gitlab.com/danielhb/qemu/-/jobs/2637716673


I don´t know how to deal with that.


For the record: if this is too troublesome to fix, I am ok with just consolidating
the GETFIELD and SETFIELD inlines we already have, under cpu.h, keeping them exactly
as they are today (functions, not macros).


Thanks,


Daniel



On 6/17/22 03:07, Alexey Kardashevskiy wrote:
> It keeps repeating, move it to the header. This uses __builtin_ctzl() to
> allow using the macros in #define.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>   include/hw/pci-host/pnv_phb3_regs.h | 16 ----------------
>   target/ppc/cpu.h                    |  5 +++++
>   hw/intc/pnv_xive.c                  | 20 --------------------
>   hw/intc/pnv_xive2.c                 | 20 --------------------
>   hw/pci-host/pnv_phb4.c              | 16 ----------------
>   5 files changed, 5 insertions(+), 72 deletions(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb3_regs.h b/include/hw/pci-host/pnv_phb3_regs.h
> index a174ef1f7045..38f8ce9d7406 100644
> --- a/include/hw/pci-host/pnv_phb3_regs.h
> +++ b/include/hw/pci-host/pnv_phb3_regs.h
> @@ -12,22 +12,6 @@
>   
>   #include "qemu/host-utils.h"
>   
> -/*
> - * QEMU version of the GETFIELD/SETFIELD macros
> - *
> - * These are common with the PnvXive model.
> - */
> -static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
> -{
> -    return (word & mask) >> ctz64(mask);
> -}
> -
> -static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
> -                                uint64_t value)
> -{
> -    return (word & ~mask) | ((value << ctz64(mask)) & mask);
> -}
> -
>   /*
>    * PBCQ XSCOM registers
>    */
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 6d78078f379d..9a1f1e9999a3 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -47,6 +47,11 @@
>                                    PPC_BIT32(bs))
>   #define PPC_BITMASK8(bs, be)    ((PPC_BIT8(bs) - PPC_BIT8(be)) | PPC_BIT8(bs))
>   
> +#define GETFIELD(mask, word)   \
> +    (((word) & (mask)) >> __builtin_ctzl(mask))
> +#define SETFIELD(mask, word, val)   \
> +    (((word) & ~(mask)) | (((uint64_t)(val) << __builtin_ctzl(mask)) & (mask)))
> +
>   /*****************************************************************************/
>   /* Exception vectors definitions                                             */
>   enum {
> diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
> index 1ce1d7b07d63..c7b75ed12ee0 100644
> --- a/hw/intc/pnv_xive.c
> +++ b/hw/intc/pnv_xive.c
> @@ -66,26 +66,6 @@ static const XiveVstInfo vst_infos[] = {
>       qemu_log_mask(LOG_GUEST_ERROR, "XIVE[%x] - " fmt "\n",              \
>                     (xive)->chip->chip_id, ## __VA_ARGS__);
>   
> -/*
> - * QEMU version of the GETFIELD/SETFIELD macros
> - *
> - * TODO: It might be better to use the existing extract64() and
> - * deposit64() but this means that all the register definitions will
> - * change and become incompatible with the ones found in skiboot.
> - *
> - * Keep it as it is for now until we find a common ground.
> - */
> -static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
> -{
> -    return (word & mask) >> ctz64(mask);
> -}
> -
> -static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
> -                                uint64_t value)
> -{
> -    return (word & ~mask) | ((value << ctz64(mask)) & mask);
> -}
> -
>   /*
>    * When PC_TCTXT_CHIPID_OVERRIDE is configured, the PC_TCTXT_CHIPID
>    * field overrides the hardwired chip ID in the Powerbus operations
> diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
> index a39e070e82d2..3fe349749384 100644
> --- a/hw/intc/pnv_xive2.c
> +++ b/hw/intc/pnv_xive2.c
> @@ -75,26 +75,6 @@ static const XiveVstInfo vst_infos[] = {
>       qemu_log_mask(LOG_GUEST_ERROR, "XIVE[%x] - " fmt "\n",              \
>                     (xive)->chip->chip_id, ## __VA_ARGS__);
>   
> -/*
> - * QEMU version of the GETFIELD/SETFIELD macros
> - *
> - * TODO: It might be better to use the existing extract64() and
> - * deposit64() but this means that all the register definitions will
> - * change and become incompatible with the ones found in skiboot.
> - *
> - * Keep it as it is for now until we find a common ground.
> - */
> -static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
> -{
> -    return (word & mask) >> ctz64(mask);
> -}
> -
> -static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
> -                                uint64_t value)
> -{
> -    return (word & ~mask) | ((value << ctz64(mask)) & mask);
> -}
> -
>   /*
>    * TODO: Document block id override
>    */
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 13ba9e45d8b6..0913e7c8f015 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -31,22 +31,6 @@
>       qemu_log_mask(LOG_GUEST_ERROR, "phb4_pec[%d:%d]: " fmt "\n",        \
>                     (pec)->chip_id, (pec)->index, ## __VA_ARGS__)
>   
> -/*
> - * QEMU version of the GETFIELD/SETFIELD macros
> - *
> - * These are common with the PnvXive model.
> - */
> -static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
> -{
> -    return (word & mask) >> ctz64(mask);
> -}
> -
> -static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
> -                                uint64_t value)
> -{
> -    return (word & ~mask) | ((value << ctz64(mask)) & mask);
> -}
> -
>   static PCIDevice *pnv_phb4_find_cfg_dev(PnvPHB4 *phb)
>   {
>       PCIHostState *pci = PCI_HOST_BRIDGE(phb);

