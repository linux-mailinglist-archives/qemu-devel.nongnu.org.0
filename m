Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78B26A939D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:19:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1Z8-0005pr-72; Fri, 03 Mar 2023 04:19:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pY1Yi-0005mv-Fp; Fri, 03 Mar 2023 04:18:36 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pY1Yg-0007de-6Q; Fri, 03 Mar 2023 04:18:36 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-17652f24da7so2297182fac.4; 
 Fri, 03 Mar 2023 01:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wRlHcU+1fxh9LhbaNgVUSFN5nj/D6/o2wL1hSwIokvE=;
 b=RpKZ6Ua9mTAaRCXW2ySXxr2TFeWQNo1kXXf0JkmnG/BuvmfWJfwYsDJBlr5ey5zRHZ
 nbTu1a9L2iiO3ZewURPxsdctIwesiL0Buf5bwEDHrOHqX4qp9T53Qy15mHcqruIfjMHC
 89Iyjz/Z0yylQM2A//M71cnMx80Paht4pa3VlZZrtFwT4EZxfJMQjiO1EBI4naih16Mq
 5A/T4FvDrFLSgi6lHIBIp5yY2IWOtls0x9Sf5TLMhk3GR/CClMv6i0kGWeIDf6hjAxKz
 N9YfLySYaUJ3gyNHvfYvC8N+8GCCQx/+2GRK0eBmVV+jhDzqrwKGQ4cNxFxqgztzDnOy
 z6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wRlHcU+1fxh9LhbaNgVUSFN5nj/D6/o2wL1hSwIokvE=;
 b=uaTVGPRLQGlymLTdnOOFc5cehbDbshG/ATEsbxCG2iFDGiSHY5A3cWFsBmeC9dilte
 o5GbN4lDy9VMlXmZwZvZKVfJ358rdYu+37COuYwSKyJOu5qpaYlQZ3xZbs328W4L+flT
 4nWxpjHUGyd4axaY28zh7d/2OoDhnbRXE5DGlqdfvOOQtkLeBtJB8xtoo9va9NOKdjIx
 7Tm++eAsCgnMlxPChsHIGnPtuEAHADCMXeoLTKRlZnrlwocxPV7yvCq/CfWEYeKrK37U
 9DUBzZ+KBKa9IlT9UKe+A2929oTZWe/gyQ3z5jE1I48Z+PaUt2tlVVcOrzL1MLOsg7XH
 OCDw==
X-Gm-Message-State: AO0yUKXYYcnhyaMWzYcckxjo5VW+1WtAJrhbKONHlxTV81sDWWdXReYn
 gdn88Xr/hFkE3pU4EzpfrOc=
X-Google-Smtp-Source: AK7set/NnrvRdQivGvbtqiLE5liRj53rd0TaLi8IRsxRDIRQw3eU1pKrIYiv+wkn7wWATtH83fUUVQ==
X-Received: by 2002:a05:6870:15d5:b0:176:37eb:e6ed with SMTP id
 k21-20020a05687015d500b0017637ebe6edmr555609oad.39.1677835109637; 
 Fri, 03 Mar 2023 01:18:29 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 26-20020a056870131a00b001728d38a41asm767485oab.55.2023.03.03.01.18.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 01:18:29 -0800 (PST)
Message-ID: <7229b94e-5378-98a1-623b-9391bfec0a32@gmail.com>
Date: Fri, 3 Mar 2023 06:18:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] pnv_phb4_pec: Keep track of instantiated PHBs
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20230302163715.129635-1-fbarrat@linux.ibm.com>
 <20230302163715.129635-2-fbarrat@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230302163715.129635-2-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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
> Add an array on the PEC object to keep track of the PHBs which are
> instantiated. The array can be sparsely populated when using
> user-created PHBs. It will be useful for the next patch to only export
> instantiated PHBs in the device tree.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/pci-host/pnv_phb4_pec.c     | 12 +++++++-----
>   hw/ppc/pnv.c                   |  1 +
>   include/hw/pci-host/pnv_phb4.h |  2 ++
>   3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 43267a428f..97c06bb0a0 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -112,9 +112,9 @@ static const MemoryRegionOps pnv_pec_pci_xscom_ops = {
>       .endianness = DEVICE_BIG_ENDIAN,
>   };
>   
> -static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
> -                                        int stack_no,
> -                                        Error **errp)
> +static PnvPHB *pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
> +                                           int stack_no,
> +                                           Error **errp)
>   {
>       PnvPHB *phb = PNV_PHB(qdev_new(TYPE_PNV_PHB));
>       int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
> @@ -128,8 +128,9 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>                               &error_fatal);
>   
>       if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
> -        return;
> +        return NULL;
>       }
> +    return phb;
>   }
>   
>   static void pnv_pec_realize(DeviceState *dev, Error **errp)
> @@ -148,8 +149,9 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>   
>       /* Create PHBs if running with defaults */
>       if (defaults_enabled()) {
> +        g_assert(pec->num_phbs <= MAX_PHBS_PER_PEC);
>           for (i = 0; i < pec->num_phbs; i++) {
> -            pnv_pec_default_phb_realize(pec, i, errp);
> +            pec->phbs[i] = pnv_pec_default_phb_realize(pec, i, errp);
>           }
>       }
>   
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 44b1fbbc93..24bf8461d6 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -314,6 +314,7 @@ static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
>   
>           for (j = 0; j < pec->num_phbs; j++) {
>               if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
> +                pec->phbs[j] = phb->phb_base;
>                   return pec;
>               }
>           }
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 28d61b96c7..0b72ef1471 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -185,6 +185,8 @@ struct PnvPhb4PecState {
>   
>       /* PHBs */
>       uint32_t num_phbs;
> +#define MAX_PHBS_PER_PEC        3
> +    PnvPHB *phbs[MAX_PHBS_PER_PEC];
>   
>       PnvChip *chip;
>   };

