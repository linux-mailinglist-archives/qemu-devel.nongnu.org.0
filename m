Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A1E46692D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:31:43 +0100 (CET)
Received: from localhost ([::1]:42994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspvq-0002WX-JJ
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:31:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mspu9-0001Ko-NP; Thu, 02 Dec 2021 12:29:57 -0500
Received: from [2607:f8b0:4864:20::732] (port=41524
 helo=mail-qk1-x732.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mspu7-0003xW-4T; Thu, 02 Dec 2021 12:29:56 -0500
Received: by mail-qk1-x732.google.com with SMTP id t83so656942qke.8;
 Thu, 02 Dec 2021 09:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZzVx5VWbQj1hhVAEyk0+Oey7GRoFbWjnpTzTqyf1lkQ=;
 b=at3LxkOH8ucdCYwyZ9T5Yl9i048zuiAuqV/xPLmmDAHkgw/fjeabzgigiuS4gleN6t
 FVdbyxN56pwefxiv8jiULaVj5KRGa9HvoLoOMu6twcAuriSdqNf1ewwu5mLZkFirRDnM
 lH0tXoiW404GcQYzVwsIQF32hvx4KRqIa/K8hU1iLn9YKFxCAE9adEuYB3ly1ci06AGI
 7dFO2OJo78nzco5MZytdttHhItLVovuejlIVNh/LunZqnnIMkkfw4DXb/JjDgWyJ4bqD
 0FI/ysZd/rIRAYTlzNFqErTQWtp6cIalkl9SFaUuxWzhUjeZhIe7K/ChViEDvP01Z65j
 JWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZzVx5VWbQj1hhVAEyk0+Oey7GRoFbWjnpTzTqyf1lkQ=;
 b=CY/2ZIyVB3wP8srI1RyRS7wZHaYMYlaty9vwrJOWZQMtq1UkzoB5euyKsnVeKEF/7M
 C4UFilOAc9dQ3OxwA/eE1pTKxx4oO56kHhjpxfjUC2CHPTrrOEOcrl3Awc1EtgOntNCU
 fPU/askxs7hodUJ0omphZgOk832ly5kelGbhdapcn+xrL7mi0UblNWGU8rysxGPoDA0+
 BXw3SlDreyUfEO/K1U6GPNBZI3MOe1Nkm33SRFduXhn9bqj0LGjOERyM6W1Qj2BogH5U
 3EFnf1EevSmi8Kkl+PoOer02OWw21ZX7Mt3YH/hdOdwQ4DLCl9pw+F2mNySeEI5c3ADN
 SCmA==
X-Gm-Message-State: AOAM5314x+r3GdvRdeHndGuGLYHVPJeAh/pO6WD3zAKKRAd3TBmtNbuv
 izM7ftREDkhVusxu6Re/i2nuJuQy87I=
X-Google-Smtp-Source: ABdhPJycxv3cimg5mLOqUujhCaH+bKqnijV/RwP0I8v3Sq6/5M9aWDiaUU3BDllHMhLXqMX62ytP8Q==
X-Received: by 2002:a37:68ce:: with SMTP id
 d197mr13158587qkc.693.1638466193360; 
 Thu, 02 Dec 2021 09:29:53 -0800 (PST)
Received: from [192.168.10.222] ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id g12sm246084qtk.69.2021.12.02.09.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 09:29:53 -0800 (PST)
Message-ID: <7a4086bd-d8bd-d95b-ac96-f31eb3f6b3c7@gmail.com>
Date: Thu, 2 Dec 2021 14:29:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 03/14] ppc/pnv: Move mapping of the PHB3 CQ regions under
 pnv_pbcq_realize()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-4-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211202144235.1276352-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::732
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.3,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/2/21 11:42, Cédric Le Goater wrote:
> This requires a link to the chip to add the regions under the XSCOM
> address space. This change will help us providing support for user
> created PHB3 devices.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/pci-host/pnv_phb3.h |  3 +++
>   hw/pci-host/pnv_phb3.c         |  1 +
>   hw/pci-host/pnv_phb3_pbcq.c    | 11 +++++++++++
>   hw/ppc/pnv.c                   | 14 ++------------
>   4 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
> index e2a2e3624532..e9c13e6bd821 100644
> --- a/include/hw/pci-host/pnv_phb3.h
> +++ b/include/hw/pci-host/pnv_phb3.h
> @@ -16,6 +16,7 @@
>   #include "qom/object.h"
>   
>   typedef struct PnvPHB3 PnvPHB3;
> +typedef struct PnvChip PnvChip;
>   
>   /*
>    * PHB3 XICS Source for MSIs
> @@ -157,6 +158,8 @@ struct PnvPHB3 {
>       PnvPHB3RootPort root;
>   
>       QLIST_HEAD(, PnvPhb3DMASpace) dma_spaces;
> +
> +    PnvChip *chip;
>   };
>   
>   uint64_t pnv_phb3_reg_read(void *opaque, hwaddr off, unsigned size);
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index a7f96850055a..3aa42ef9d4b9 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1092,6 +1092,7 @@ static const char *pnv_phb3_root_bus_path(PCIHostState *host_bridge,
>   static Property pnv_phb3_properties[] = {
>           DEFINE_PROP_UINT32("index", PnvPHB3, phb_id, 0),
>           DEFINE_PROP_UINT32("chip-id", PnvPHB3, chip_id, 0),
> +        DEFINE_PROP_LINK("chip", PnvPHB3, chip, TYPE_PNV_CHIP, PnvChip *),
>           DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/hw/pci-host/pnv_phb3_pbcq.c b/hw/pci-host/pnv_phb3_pbcq.c
> index a0526aa1eca3..c7426cd27a20 100644
> --- a/hw/pci-host/pnv_phb3_pbcq.c
> +++ b/hw/pci-host/pnv_phb3_pbcq.c
> @@ -284,6 +284,17 @@ static void pnv_pbcq_realize(DeviceState *dev, Error **errp)
>       pnv_xscom_region_init(&pbcq->xscom_spci_regs, OBJECT(dev),
>                             &pnv_pbcq_spci_xscom_ops, pbcq, name,
>                             PNV_XSCOM_PBCQ_SPCI_SIZE);
> +
> +    /* Populate the XSCOM address space. */
> +    pnv_xscom_add_subregion(phb->chip,
> +                            PNV_XSCOM_PBCQ_NEST_BASE + 0x400 * phb->phb_id,
> +                            &pbcq->xscom_nest_regs);
> +    pnv_xscom_add_subregion(phb->chip,
> +                            PNV_XSCOM_PBCQ_PCI_BASE + 0x400 * phb->phb_id,
> +                            &pbcq->xscom_pci_regs);
> +    pnv_xscom_add_subregion(phb->chip,
> +                            PNV_XSCOM_PBCQ_SPCI_BASE + 0x040 * phb->phb_id,
> +                            &pbcq->xscom_spci_regs);
>   }
>   
>   static int pnv_pbcq_dt_xscom(PnvXScomInterface *dev, void *fdt,
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 988b305398b2..de277c457838 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1221,25 +1221,15 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
>       /* PHB3 controllers */
>       for (i = 0; i < chip->num_phbs; i++) {
>           PnvPHB3 *phb = &chip8->phbs[i];
> -        PnvPBCQState *pbcq = &phb->pbcq;
>   
>           object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
>           object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
>                                   &error_fatal);
> +        object_property_set_link(OBJECT(phb), "chip", OBJECT(chip),
> +                                 &error_fatal);
>           if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
>               return;
>           }
> -
> -        /* Populate the XSCOM address space. */
> -        pnv_xscom_add_subregion(chip,
> -                                PNV_XSCOM_PBCQ_NEST_BASE + 0x400 * phb->phb_id,
> -                                &pbcq->xscom_nest_regs);
> -        pnv_xscom_add_subregion(chip,
> -                                PNV_XSCOM_PBCQ_PCI_BASE + 0x400 * phb->phb_id,
> -                                &pbcq->xscom_pci_regs);
> -        pnv_xscom_add_subregion(chip,
> -                                PNV_XSCOM_PBCQ_SPCI_BASE + 0x040 * phb->phb_id,
> -                                &pbcq->xscom_spci_regs);
>       }
>   }
>   
> 

