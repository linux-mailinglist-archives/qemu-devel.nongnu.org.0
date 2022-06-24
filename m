Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEF2559D74
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:39:50 +0200 (CEST)
Received: from localhost ([::1]:60030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lPQ-0002xY-B5
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4lNU-0001EX-AO; Fri, 24 Jun 2022 11:37:48 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:33772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4lNS-0008H0-8k; Fri, 24 Jun 2022 11:37:48 -0400
Received: by mail-oi1-x235.google.com with SMTP id s124so4128753oia.0;
 Fri, 24 Jun 2022 08:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qsjU3AiH5per4DrVGOI7a/6vfVDRzIE9sL+d0k0p5Pk=;
 b=VE+UGrfxL56aDh4wQkaWGwLALhoTlnBIjBPGlRdPG6m7/tL+8dN1gtX+mHAAI9mRWH
 sO1tDwEKXK7Kbg5Z1ymk4q+kYHX40ELlrXFM4R2uSmRrNvg91jTsMKUbgJNQ/9PgCzcA
 kS32Z6h5mr30DJrBP5K3boPWYPper9NiO3LaCk9jpafOSzPu+8gc4whFW2QUi98Fv0lA
 Mg+BlrgzOGk6oyKGAhAZtqyl/04RdKtWQJ/mRv9KxWtBiZ1ZhKvB2ZdEXiiV9rQfBdCm
 AsFMgIZ55RPMStG0n9SuNR/TG/q9C7joXJCHVbD2M3OSqLkke9D+FXJedyVDG8wGRLpL
 yz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qsjU3AiH5per4DrVGOI7a/6vfVDRzIE9sL+d0k0p5Pk=;
 b=p706GJIZWQXXFmtqRPU/Ur0EgEDrbqmKLIgXLQE7i7310/MwmhUOQ9jVZqLNA5j0xH
 hWjPseEtiSYf1SPwSJAmOI/xbiFPvdJF162cT13TG2QVbW4qqL8MdTzNGY3enOqxdFKA
 pgDWUzv5onTxJRLXv8RpFGYHaKVozn0/P+SPwmaHDGTpSiQmcB2cHB6A6PwM0wLe+nWt
 uKYCvDd4aiHPROEBp2g9KPFAsTMCq/bq+jDQHHCE8PI7BvaUrkDx1USiZYOB6egMkLnI
 KiwNaDqHqZgWzJYfC8cXhc/GuWK47TrfL8v85W1eA5wn9migb31Qh1eodV8fZvXR/BDf
 QlcQ==
X-Gm-Message-State: AJIora88+EQQjkCC0WUNkbJT+/4b1WQC/0qagQet3LRA0u3875wgZqnh
 Jb9Wkq4O0eg/qor+jHb7ouL8qmyNbF8=
X-Google-Smtp-Source: AGRyM1vI2156/FFqogB9hBdNtdgrx/Bkr/PF+3JPF7Nya2q50jET0jQeOiMrGGcp72bDmPXaqUbxxw==
X-Received: by 2002:a05:6808:13c6:b0:331:3e35:a048 with SMTP id
 d6-20020a05680813c600b003313e35a048mr2203378oiw.223.1656085061953; 
 Fri, 24 Jun 2022 08:37:41 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a056870f28d00b001048b819e13sm2056144oap.8.2022.06.24.08.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 08:37:41 -0700 (PDT)
Message-ID: <15b5c451-eeec-1b52-3191-f21597ed2e85@gmail.com>
Date: Fri, 24 Jun 2022 12:37:38 -0300
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
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

Gitlab does not like what you're doing here. Several cross compile runners
fails with errors like these (this is from cross-win64-system):


../hw/intc/pnv_xive.c: In function 'pnv_xive_block_id':
3328/builds/danielhb/qemu/target/ppc/cpu.h:45:33: error: overflow in conversion from 'long long unsigned int' to 'long int' changes value from '4222124650659840' to '0' [-Werror=overflow]
3329   45 | #define PPC_BITMASK(bs, be)     ((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
3330      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
3331/builds/danielhb/qemu/target/ppc/cpu.h:57:49: note: in definition of macro 'MASK_TO_LSH'
3332   57 | #define MASK_TO_LSH(m)          (__builtin_ffsl(m) - 1)
3333      |                                                 ^
3334../hw/intc/pnv_xive.c:80:15: note: in expansion of macro 'GETFIELD'
3335   80 |         blk = GETFIELD(PC_TCTXT_CHIPID, cfg_val);
3336      |               ^~~~~~~~
3337../hw/intc/pnv_xive_regs.h:77:41: note: in expansion of macro 'PPC_BITMASK'
3338   77 | #define  PC_TCTXT_CHIPID                PPC_BITMASK(12, 15)
3339      |                                         ^~~~~~~~~~~
3340../hw/intc/pnv_xive.c:80:24: note: in expansion of macro 'PC_TCTXT_CHIPID'
3341   80 |         blk = GETFIELD(PC_TCTXT_CHIPID, cfg_val);
3342      |                        ^~~~~~~~~~~~~~~
3343/builds/danielhb/qemu/target/ppc/cpu.h:58:46: error: right shift count is negative [-Werror=shift-count-negative]
3344   58 | #define GETFIELD(m, v)          (((v) & (m)) >> MASK_TO_LSH(m))
3345      |                                              ^~
3346../hw/intc/pnv_xive.c:80:15: note: in expansion of macro 'GETFIELD'
3347   80 |         blk = GETFIELD(PC_TCTXT_CHIPID, cfg_val);
3348      |               ^~~~~~~~
../hw/intc/pnv_xive.c: In function 'pnv_xive_vst_addr':
3350/builds/danielhb/qemu/target/ppc/cpu.h:45:33: error: overflow in conversion from 'long long unsigned int' to 'long int' changes value from '13835058055282163712' to '0' [-Werror=overflow]
3351   45 | #define PPC_BITMASK(bs, be)     ((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
3352      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
3353/builds/danielhb/qemu/target/ppc/cpu.h:57:49: note: in definition of macro 'MASK_TO_LSH'
3354   57 | #define MASK_TO_LSH(m)          (__builtin_ffsl(m) - 1)
3355      |                                                 ^
3356../hw/intc/pnv_xive.c:226:9: note: in expansion of macro 'GETFIELD'
3357  226 |     if (GETFIELD(VSD_MODE, vsd) == VSD_MODE_FORWARD) {
3358      |         ^~~~~~~~
3359../hw/intc/pnv_xive_regs.h:230:33: note: in expansion of macro 'PPC_BITMASK'
3360  230 | #define VSD_MODE                PPC_BITMASK(0, 1)
3361      |                                 ^~~~~~~~~~~
3362../hw/intc/pnv_xive.c:226:18: note: in expansion of macro 'VSD_MODE'
3363  226 |     if (GETFIELD(VSD_MODE, vsd) == VSD_MODE_FORWARD) {
3364      |                  ^~~~~~~~
3365/builds/danielhb/qemu/target/ppc/cpu.h:58:46: error: right shift count is negative [-Werror=shift-count-negative]
3366   58 | #define GETFIELD(m, v)          (((v) & (m)) >> MASK_TO_LSH(m))
3367      |                                              ^~
3368../hw/intc/pnv_xive.c:226:9: note: in expansion of macro 'GETFIELD'
3369  226 |     if (GETFIELD(VSD_MODE, vsd) == VSD_MODE_FORWARD) {
3370      |         ^~~~~~~~


You can see the results here:

https://gitlab.com/danielhb/qemu/-/jobs/2636585317

Other failing runners include cross-armel-system and cross-mips-system, so I don't
think that the error is related to Windows specifics.


I guess we're missing an uint64_t cast somewhere like you did in the v2 of
this patch. The skiboot macros as is will not cut it.


Thanks,


Daniel


On 6/22/22 02:08, Alexey Kardashevskiy wrote:
> It keeps repeating, move it to the header. This uses __builtin_ffsl() to
> allow using the macros in #define.
> 
> This is not using the QEMU's FIELD macros as this would require changing
> all such macros found in skiboot (the PPC PowerNV firmware).
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
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

