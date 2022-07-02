Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C6656405D
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 15:29:45 +0200 (CEST)
Received: from localhost ([::1]:33892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dBv-0000pN-Qy
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 09:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o7d9c-0007eW-6g; Sat, 02 Jul 2022 09:27:20 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:35453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o7d9a-0008TK-6X; Sat, 02 Jul 2022 09:27:19 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-10be0d7476aso233877fac.2; 
 Sat, 02 Jul 2022 06:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z1RY9P4vW/lnJBZCL90y/ZdWODz8BWyJxeuYSp8IzDs=;
 b=mjdsqydbBUQandDu0EU1IQsjDBu97it9qZeJBYoc30RtXlTOx7HA+3pEtRKOfOE4IC
 iWDt/iE9QNFJ0dRUL0+Knkx56lFFFqNH+2aYxqKmlOHE/pazer6D5TOpXYTglMddZ0Zg
 9HYICPtkWY/BcVBd77cfaIVt36bjK/lEMp/rpXe4iNaBzUQ9VLXRg0hrTEjyx59EpRWl
 tbPqKo6JH3X2m2muR91zw51tHHCFtioAtugin+kypf77IJ56LdsdvCTdEBnsaW+E1WfO
 AvoWyfZK/abVGiins2HQtbkx2G/x4fvRbRzOmue/O8PyR9yU/m05XXKX7KliAJOL5U+m
 gTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z1RY9P4vW/lnJBZCL90y/ZdWODz8BWyJxeuYSp8IzDs=;
 b=GQDDqNrAQvj4NMy0mZG1TzCFsmdizm0sUpnfqbXltZsgNlU24dabObSf/WfBIjThMZ
 O3r2DL+MTlST3PWjI2zpeI5lt3kxjIXGl/XMKNgLYAaqp/yRbytPj5hq8XwRPWR8GSOi
 RByLenQwqj1UkRl3ywjMor3gzVE2VY5b/IR5ApDbRNp0LX0zI7ZrotPx0t8nyi8NKPRy
 zaPoVZI4dYU77lhX1avWsFko3EInJG3AoQo436Bg2QMGWGn0fugEQY651UycDNYGN1e0
 ILQH1h/guetQLGpdCcvFCkjXBc1yDc+YBTGWIP4dBineAi/URyigPM+qqwMrsImmqJ7h
 4OIQ==
X-Gm-Message-State: AJIora8pNcQ7HLnJ5dR4rRA3s9s99S/3g7BJW9d26C0fUIN25ABGOy6O
 WXjXieTh14o06gwsvTQnQtQ=
X-Google-Smtp-Source: AGRyM1vjBESjx4QnnUff48QBx3jTkxSZVijYIbOva/FJAJY32c61jCHnKC5EgmzAsFGQf6s3GAYWMA==
X-Received: by 2002:a05:6870:470d:b0:101:c49b:7e0d with SMTP id
 b13-20020a056870470d00b00101c49b7e0dmr11172935oaq.273.1656768435607; 
 Sat, 02 Jul 2022 06:27:15 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 65-20020a4a1844000000b0042300765d39sm13532251ooo.46.2022.07.02.06.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 06:27:15 -0700 (PDT)
Message-ID: <06b481b5-8ced-a2e7-a860-5036c25b8efe@gmail.com>
Date: Sat, 2 Jul 2022 10:27:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH qemu v3] ppc: Define SETFIELD for the ppc target
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220628080544.1509428-1-aik@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220628080544.1509428-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
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



On 6/28/22 05:05, Alexey Kardashevskiy wrote:
> It keeps repeating, move it to the header. This uses __builtin_ffsll() to
> allow using the macros in #define.
> 
> This is not using the QEMU's FIELD macros as this would require changing
> all such macros found in skiboot (the PPC PowerNV firmware).
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


And queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel






> Changes:
> v3:
> * __builtin_ffsl -> __builtin_ffsll
> 
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
> index 6d78078f379d..50cea032c853 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -47,6 +47,18 @@
>                                    PPC_BIT32(bs))
>   #define PPC_BITMASK8(bs, be)    ((PPC_BIT8(bs) - PPC_BIT8(be)) | PPC_BIT8(bs))
>   
> +/*
> + * QEMU version of the GETFIELD/SETFIELD macros from skiboot
> + *
> + * It might be better to use the existing extract64() and
> + * deposit64() but this means that all the register definitions will
> + * change and become incompatible with the ones found in skiboot.
> + */
> +#define MASK_TO_LSH(m)          (__builtin_ffsll(m) - 1)
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

