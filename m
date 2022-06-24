Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107815599FC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 14:59:41 +0200 (CEST)
Received: from localhost ([::1]:52478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4iuS-0006Zt-5j
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 08:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4is6-0003Yd-Ef; Fri, 24 Jun 2022 08:57:14 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31]:42926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4is3-0005gd-E6; Fri, 24 Jun 2022 08:57:14 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 n24-20020a4ae758000000b0041b82638b42so455743oov.9; 
 Fri, 24 Jun 2022 05:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=10YQ0z38NBT0idPSL9A7P0pxz4n+ED7h2rliGDEgTMo=;
 b=jndqTYYAod2mSBhKWChyTCIlzinJOZYU60JMjETlg3gtu27HQ7SlndyuJbUawe+SVV
 4ZTbLyjt9Dwujf+ndz4iQsEreoAiBGDliVHZfNKffnHgmxcVywGmfE5o7L4tbBl/ls15
 eAzLQcULjuI4aJ99+yLv6dYFG5eonhrfn4iDC2SogjCFrPkrbqtxWN1yNpAK3hySvcK5
 kWrwlJnduXr3YZbbdrwDn0EUzJ3tgX+w94yk0lJ7chGYFLQMQHHD9mI+XCEdj+EIe+Rz
 bnhGs0JI0YvZKWU5DAfmonF+Ixrq7Ta9FCxOMKL+PI1Jl8tU3dT7TTtTja/86G9jtqdj
 eM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=10YQ0z38NBT0idPSL9A7P0pxz4n+ED7h2rliGDEgTMo=;
 b=TlbBlAruo5/yQvIzCTSdN8o7cTrNeZ+Fs179I9qUr3x52jumY2eYJnvjvTJvbFJ2+b
 A9UXENaGc5okz7M2+Jx8XB49ldFHMKT8l8OF8eNRjOadIB8a1HFTA2irLCiQt1x3sEjk
 Pmsb5J/Puvbl4ME8PU0yh+cu+oaz4eHge4swV1mqc1+fPLdXnLjXmepa88M936kzGV64
 ldiHzoLxnMtA4WPV0J//E1g4X3JcHxm/J1mp6M4UCfW7OjlYE5R5wuB4rGPybRpopmUi
 JFQi6MA3mPCPhnDMdv4ujkI0Su9/FDckWYslarmDiz5PVRrS3bcCYr/ySrZy62e1qyV7
 S2cw==
X-Gm-Message-State: AJIora8B/QT0OOQJ9t2Mtyh6U4nO5/5kQ7FUaZGjUEJJ1NtrE5NOgKDv
 Q/WMF2vUrCLFYogMSX7wAAo=
X-Google-Smtp-Source: AGRyM1vZMUTr9vXfIKdym8JEQ9WqFYw7869kc7SRy7HZxKBqmIiR9KqCjdNYAFl//PGTMD3AU9AzoQ==
X-Received: by 2002:a4a:6518:0:b0:425:81ce:3ba1 with SMTP id
 y24-20020a4a6518000000b0042581ce3ba1mr1127906ooc.59.1656075429830; 
 Fri, 24 Jun 2022 05:57:09 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a4a9705000000b0042568efdaccsm1335717ooi.15.2022.06.24.05.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 05:57:09 -0700 (PDT)
Message-ID: <a63db784-7a3b-cc87-8676-81c38d42e391@gmail.com>
Date: Fri, 24 Jun 2022 09:57:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH qemu v2] ppc: Define SETFIELD for the ppc target
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220622050844.1067391-1-aik@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220622050844.1067391-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc31.google.com
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



On 6/22/22 02:08, Alexey Kardashevskiy wrote:
> It keeps repeating, move it to the header. This uses __builtin_ffsl() to
> allow using the macros in #define.
> 
> This is not using the QEMU's FIELD macros as this would require changing
> all such macros found in skiboot (the PPC PowerNV firmware).
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> Changes:
> v2:
> * preserved the comment about skiboot
> * copied the actual macros from skiboot:
> https://github.com/open-power/skiboot/blob/master/include/bitutils.h#L31
> ---
>   include/hw/pci-host/pnv_phb3_regs.h | 16 ----------------
>   target/ppc/cpu.h                    | 12 ++++++++++++
>   hw/intc/pnv_xive.c                  | 20 --------------------
>   hw/intc/pnv_xive2.c                 | 20 --------------------
>   hw/pci-host/pnv_phb4.c              | 16 ----------------
>   5 files changed, 12 insertions(+), 72 deletions(-)
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
> index 6d78078f379d..e45cc7a8c115 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -47,6 +47,18 @@
>                                    PPC_BIT32(bs))
>   #define PPC_BITMASK8(bs, be)    ((PPC_BIT8(bs) - PPC_BIT8(be)) | PPC_BIT8(bs))
>   
> +/*
> + * QEMU version of the GETFIELD/SETFIELD macros
> + *
> + * It might be better to use the existing extract64() and
> + * deposit64() but this means that all the register definitions will
> + * change and become incompatible with the ones found in skiboot.
> + */
> +#define MASK_TO_LSH(m)          (__builtin_ffsl(m) - 1)
> +#define GETFIELD(m, v)          (((v) & (m)) >> MASK_TO_LSH(m))
> +#define SETFIELD(m, v, val) \
> +        (((v) & ~(m)) | ((((typeof(v))(val)) << MASK_TO_LSH(m)) & (m)))
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
> index f31c53c28dd2..f22ce5ca59ae 100644
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
> index 6594016121a3..5d72c0c432b2 100644
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

