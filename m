Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6C56A93A6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:20:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1a0-0007SH-6H; Fri, 03 Mar 2023 04:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pY1Zq-0007IJ-68; Fri, 03 Mar 2023 04:19:49 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pY1Zo-0007ur-6A; Fri, 03 Mar 2023 04:19:45 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1767a208b30so339065fac.2; 
 Fri, 03 Mar 2023 01:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gjjkEEWFpjdtiak566F6lNA6RwG0pIOceCNG1ZQ27FI=;
 b=J+s7qKithP3UMyr+Eq6mRDzYeuGSwLEk8vOPGuZSy4I89NYp3HmR5W9IpMQt35zQ2G
 ziaRR/UAT7H4ekXBi7p75t6+raUh74/FiZ6W3uirO52vj3ti1pVp8JicEnFXaOuyt7d/
 mdRVZ+2BqC1bSPPxACN52VnlBny9QrgAqMn6hY9Q61jBF3aCDph1sNwcBmx03uFaxxwm
 1eTMJ+FmexR021tyVzf5V1f8EmREY1TUDn0DZ8Ju4DWfXps3UcGtdC2PXKFlqXsXUprz
 Y3MB22rdI2LPIyccWdtLexxS9n/4+Xxh8xxvf547Dmc20O+lGzHQBCvwSEz4Vj23Ft1j
 tNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gjjkEEWFpjdtiak566F6lNA6RwG0pIOceCNG1ZQ27FI=;
 b=Gj4YtB/C9s+CPwvIly1ehPEthfr45ObgNo0JpODhEVITc3A6+Sx+bqEnQcsiTRCSEo
 yK32UKHQZpSj/tJpsx9pc+ZWpd3typnFeW2jig+5Qbb+JYC7Ia1wGWNcIIvRolaNYK/W
 +hrl/bZN5KXBtadS/UaxGm+mdh7eboBleyh5ZmNGU27R5K1acW3acMmfL+1/oIhjppZp
 qIdUMZ7NltpHJUl/ExaY68AG2bhMV1UYEXVdJ/05BqCucw9gnbMUXI2RJLs4s91pvdX2
 R9gXImqLVIcasrtZhcjzjAKID0coOkZK9nG5uke6SaoLcRbNxMZpjWb7X9YBreILz2do
 NAnQ==
X-Gm-Message-State: AO0yUKVf0QAfj39qEHk3Zy16d+cxw9DHNcxlp9FMNnpVvP5VfdE/7tTA
 j4fVfF7PO5f8YYt+JUgP5wzbB4DrLhM=
X-Google-Smtp-Source: AK7set9MMJIiFeelCcLLtlBvMRh7aRBHbhWfvG/f1WhbvicHzRVjqo+B8axgoFkWwoK/huJgEHMQiQ==
X-Received: by 2002:a05:6870:428f:b0:172:bd0:47a9 with SMTP id
 y15-20020a056870428f00b001720bd047a9mr603291oah.46.1677835179474; 
 Fri, 03 Mar 2023 01:19:39 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a056870d41100b001723f29f6e2sm784266oag.37.2023.03.03.01.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 01:19:39 -0800 (PST)
Message-ID: <92a2406e-840d-308f-f83e-94b82b3f4e5e@gmail.com>
Date: Fri, 3 Mar 2023 06:19:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] pnv_phb4_pec: Move pnv_phb4_get_pec() to rightful file
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20230302163715.129635-1-fbarrat@linux.ibm.com>
 <20230302163715.129635-4-fbarrat@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230302163715.129635-4-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.092,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 3/2/23 13:37, Frederic Barrat wrote:
> The function pnv_phb4_get_pec() exposes some internals of the PEC and
> PHB logic, yet it was in the higher level hw/ppc/pnv.c file for
> historical reasons: P8 implements the PHBs from pnv.c directly, but on
> P9/P10, it's done through the CEC model, which has its own file. So
> move pnv_phb4_get_pec() to hw/pci-host/pnv_phb4_pec.c, where it fits
> naturally.
> 
> While at it, replace the PnvPHB4 parameter by the PnvPHB front-end,
> since it has all the information needed and simplify it a bit.
> 
> No functional changes.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/pci-host/pnv_phb4_pec.c     | 40 +++++++++++++++++++++++++++++++
>   hw/ppc/pnv.c                   | 44 +---------------------------------
>   include/hw/pci-host/pnv_phb4.h |  1 +
>   3 files changed, 42 insertions(+), 43 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 6c9b386069..6e2e5ae186 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -112,6 +112,46 @@ static const MemoryRegionOps pnv_pec_pci_xscom_ops = {
>       .endianness = DEVICE_BIG_ENDIAN,
>   };
>   
> +PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB *phb, Error **errp)
> +{
> +    PnvPhb4PecState *pecs = NULL;
> +    int chip_id = phb->chip_id;
> +    int index = phb->phb_id;
> +    int i, j;
> +
> +    if (phb->version == 4) {
> +        Pnv9Chip *chip9 = PNV9_CHIP(chip);
> +
> +        pecs = chip9->pecs;
> +    } else if (phb->version == 5) {
> +        Pnv10Chip *chip10 = PNV10_CHIP(chip);
> +
> +        pecs = chip10->pecs;
> +    } else {
> +        g_assert_not_reached();
> +    }
> +
> +    for (i = 0; i < chip->num_pecs; i++) {
> +        /*
> +         * For each PEC, check the amount of phbs it supports
> +         * and see if the given phb4 index matches an index.
> +         */
> +        PnvPhb4PecState *pec = &pecs[i];
> +
> +        for (j = 0; j < pec->num_phbs; j++) {
> +            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
> +                pec->phbs[j] = phb;
> +                return pec;
> +            }
> +        }
> +    }
> +    error_setg(errp,
> +               "pnv-phb4 chip-id %d index %d didn't match any existing PEC",
> +               chip_id, index);
> +
> +    return NULL;
> +}
> +
>   static PnvPHB *pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>                                              int stack_no,
>                                              Error **errp)
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 24bf8461d6..46010b30ad 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -284,48 +284,6 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
>       g_free(reg);
>   }
>   
> -static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
> -                                         Error **errp)
> -{
> -    PnvPHB *phb_base = phb->phb_base;
> -    PnvPhb4PecState *pecs = NULL;
> -    int chip_id = phb->chip_id;
> -    int index = phb->phb_id;
> -    int i, j;
> -
> -    if (phb_base->version == 4) {
> -        Pnv9Chip *chip9 = PNV9_CHIP(chip);
> -
> -        pecs = chip9->pecs;
> -    } else if (phb_base->version == 5) {
> -        Pnv10Chip *chip10 = PNV10_CHIP(chip);
> -
> -        pecs = chip10->pecs;
> -    } else {
> -        g_assert_not_reached();
> -    }
> -
> -    for (i = 0; i < chip->num_pecs; i++) {
> -        /*
> -         * For each PEC, check the amount of phbs it supports
> -         * and see if the given phb4 index matches an index.
> -         */
> -        PnvPhb4PecState *pec = &pecs[i];
> -
> -        for (j = 0; j < pec->num_phbs; j++) {
> -            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
> -                pec->phbs[j] = phb->phb_base;
> -                return pec;
> -            }
> -        }
> -    }
> -    error_setg(errp,
> -               "pnv-phb4 chip-id %d index %d didn't match any existing PEC",
> -               chip_id, index);
> -
> -    return NULL;
> -}
> -
>   /*
>    * Adds a PnvPHB to the chip. Returns the parent obj of the
>    * PHB which varies with each version (phb version 3 is parented
> @@ -349,7 +307,7 @@ Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp)
>           return OBJECT(chip);
>       }
>   
> -    phb->pec = pnv_phb4_get_pec(chip, PNV_PHB4(phb->backend), errp);
> +    phb->pec = pnv_phb4_get_pec(chip, phb, errp);
>   
>       return OBJECT(phb->pec);
>   }
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 0b72ef1471..5c5edb2941 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -157,6 +157,7 @@ struct PnvPHB4 {
>   
>   void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
>   int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
> +PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB *phb, Error **errp);
>   void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb);
>   extern const MemoryRegionOps pnv_phb4_xscom_ops;
>   

