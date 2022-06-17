Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2815754FB85
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 18:52:43 +0200 (CEST)
Received: from localhost ([::1]:43082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2FD7-000706-6S
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 12:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2FAd-00056h-Tb; Fri, 17 Jun 2022 12:50:11 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:35774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2FAc-0006IU-1U; Fri, 17 Jun 2022 12:50:07 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-100eb6f7782so6244514fac.2; 
 Fri, 17 Jun 2022 09:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=N60Pztn9bXOpC8s0DpNooTnCg7eMuW8ROOdvbMFylP0=;
 b=mrIWVArmwSAzpRSTTkcS0/bEPMzYtlee8PUlbDaF+JxR2MfDTshOGk2RzHZIIfDMi2
 L2M3vVnu6FDWduRZyGQY6GueMsZh+fNTlnKBNa/y/bhJphj8Q4HKSGMLgmV95D6/qOWG
 rlsX0DSLZr63dWASoeWXlO4oQD4hZ2r0613HklO97FgOxP80omBLD3/UyQZZ6M0iE0/P
 vYcQmmgqe30VpQEvbxIX9ZAdJAghqL402rpjb75/R2HLPSiCF9jWXXyUZbW9EzHJQg+6
 qCdwF1R/jihOKtsyjodjtBvKKE7kwGmdY/8eNpMvnMLMjBZRFF92/a67NkmPJzvgTwZR
 4uiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N60Pztn9bXOpC8s0DpNooTnCg7eMuW8ROOdvbMFylP0=;
 b=dFhhH3uHPRT6kMmHjgpfIOLXzhh0gbR1OeTJHSW/6saOjihl9szkDpDcEjnXErdAJ8
 U2EWilDdip4SllkY2muGqpeK2Ljd5utLQ62m4q/4rYkECeSAstcik8unZ5t4M0yLW5yw
 c9GTQKwigr9ATuJNWEj/Nci1NTfr+8pK1Ct+Ba4IAdNSqpX/wRRfkwwsA/dgNN7sAlcE
 8NorQcakcxSXY4LQ4qLS5qiUNlY9QmYkzJdefFLeI8JO3TBqmMborzWdubu9sLe47skD
 n0AXjfEm+hE7PvlZkKG1sOe/pc5NC8gsKaOiqPdJIrEra2sb4NwIa+Aqe9UamFlPq0h4
 WHFQ==
X-Gm-Message-State: AJIora/l2U0KSG/xJXNSFpQNP7t/XIlT4ZINnluwWP7tRFNpuUBIiRmR
 YnyPyOx0WdN+QyZCaC/5qnU=
X-Google-Smtp-Source: AGRyM1tOqQxTn6HgxsvTNzVcWvzW8lVdAa8mVVVnik2Cx3yiy3saJMUoafv36dEeXvwL1IoQJjQNRQ==
X-Received: by 2002:a05:6870:8311:b0:100:ef5f:77b6 with SMTP id
 p17-20020a056870831100b00100ef5f77b6mr11446533oae.157.1655484604276; 
 Fri, 17 Jun 2022 09:50:04 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:ccc8:8e07:268b:a09:2834?
 ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a056870a60300b000f8851d777bsm2670254oam.39.2022.06.17.09.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 09:50:03 -0700 (PDT)
Message-ID: <14983389-aace-f030-65a8-2234b94952bd@gmail.com>
Date: Fri, 17 Jun 2022 13:50:01 -0300
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
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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



On 6/17/22 03:07, Alexey Kardashevskiy wrote:
> It keeps repeating, move it to the header. This uses __builtin_ctzl() to
> allow using the macros in #define.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


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

