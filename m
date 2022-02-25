Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDD34C4A7A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:21:24 +0100 (CET)
Received: from localhost ([::1]:40004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNdLO-00065m-NV
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:21:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNdCN-0006Sg-Rp; Fri, 25 Feb 2022 11:12:06 -0500
Received: from [2607:f8b0:4864:20::c30] (port=38709
 helo=mail-oo1-xc30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNdCL-0005be-Qg; Fri, 25 Feb 2022 11:12:03 -0500
Received: by mail-oo1-xc30.google.com with SMTP id
 i10-20020a4aab0a000000b002fccf890d5fso6786562oon.5; 
 Fri, 25 Feb 2022 08:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vALx1zhW6wzdMDSIA/GBu53mnIRbBkiCm8ULZYEbXVc=;
 b=QzkIY4rAATZ69c0ZfimN2ooY9LeJj/u4JpuJml6oL2VSGxtcY+NoisM1oO7R6yYCCP
 pBY5ECc3f19HnwGS/o5wnNEAt1HIncmor7isvoCvhG4EbX17BQM6CUOedlBshReo79dL
 jFnG4ceQ51AXiGVCbRTxcjKKvBmrZx0fxoDqa47CK7cy0tqmz8GU9o/sZsaKmj8zSpTb
 HsoMg137aqfsQk+yku9dh4kYsQCaVT6WggaNUG3lbtWNHbBpXa8Im/Tr6mKNHvitHry5
 Q6mTUE/nY1wy/5XaiKU5v0xen2dcDIkkErPTWLO3rmKyTcrDLYEFoSZRYiK7I+4CwGQa
 uwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vALx1zhW6wzdMDSIA/GBu53mnIRbBkiCm8ULZYEbXVc=;
 b=W7vXR6Bo3kulVa8sDu/O3YMNWTGm6c6WRJiiqFkA6LrA0igthbFzidgu/vYIsR5ii3
 2R1wi+Dp1HAG5gbBsDHLaDdXMOq9wKAENU7aBucnZ5PiydG4bNgY2dr7GL0e7079LgPI
 VhnNGTstWDCVlKHSCabquvi3a4/EhmJtxPZ7eTmnkY+YeVec4+mQ7B8lh7oAr2+N64++
 CSB7jq3PHOoLP0mw004jWTzmcIXGQYGnE0Ooon8ZcVvPPNMaOLe4d2mVj64zWTLmgHqL
 CxzHLUCXrV1EVeeAVaX6bVd4Ng/ZsyPq6FOtas0NQxbBWDZHEJozFecFG/OMsLSRizIO
 s+MA==
X-Gm-Message-State: AOAM531W1IunR/FlEb/Ca5r7v8c5acr13Li28ogaXcMhhypnWtaGPARf
 lWx82ZGB6Jxr3doFUGuxDnr3o8bL6Hs=
X-Google-Smtp-Source: ABdhPJxKodZOpQxmfFqQTSlmJAsttF9uZc/C2OFojjMIdgpz1UV12kmGn0gJ/W9Xg3eju7Z+xNqXyw==
X-Received: by 2002:a05:6870:ab8b:b0:d1:2e2a:7f4f with SMTP id
 gs11-20020a056870ab8b00b000d12e2a7f4fmr1600440oab.274.1645805520002; 
 Fri, 25 Feb 2022 08:12:00 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377?
 ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a4aa649000000b0031ca80c6e60sm1214654oom.24.2022.02.25.08.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 08:11:59 -0800 (PST)
Message-ID: <f29e09cb-6903-44f8-99fe-019a615ce3b5@gmail.com>
Date: Fri, 25 Feb 2022 13:11:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 12/18] ppc/pnv: Add support for PHB5 "Address-based
 trigger" mode
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211126115349.2737605-1-clg@kaod.org>
 <20211126115349.2737605-13-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211126115349.2737605-13-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/26/21 08:53, Cédric Le Goater wrote:
> When the Address-Based Interrupt Trigger mode is activated, the PHB
> maps the interrupt source number into the interrupt command address.
> The PHB directly triggers the IC ESB page of the interrupt number and
> not the notify page of the IC anymore.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/pci-host/pnv_phb4_regs.h |  2 +
>   hw/pci-host/pnv_phb4.c              | 73 ++++++++++++++++++++++++++---
>   hw/pci-host/trace-events            |  2 +
>   3 files changed, 71 insertions(+), 6 deletions(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb4_regs.h b/include/hw/pci-host/pnv_phb4_regs.h
> index 64f326b7158e..4a0d3b28efb3 100644
> --- a/include/hw/pci-host/pnv_phb4_regs.h
> +++ b/include/hw/pci-host/pnv_phb4_regs.h
> @@ -220,12 +220,14 @@
>   #define   PHB_PAPR_ERR_INJ_MASK_MMIO            PPC_BITMASK(16, 63)
>   #define PHB_ETU_ERR_SUMMARY             0x2c8
>   #define PHB_INT_NOTIFY_ADDR             0x300
> +#define   PHB_INT_NOTIFY_ADDR_64K       PPC_BIT(1)   /* P10 */
>   #define PHB_INT_NOTIFY_INDEX            0x308
>   
>   /* Fundamental register set B */
>   #define PHB_VERSION                     0x800
>   #define PHB_CTRLR                       0x810
>   #define   PHB_CTRLR_IRQ_PQ_DISABLE      PPC_BIT(9)   /* P10 */
> +#define   PHB_CTRLR_IRQ_ABT_MODE        PPC_BIT(10)  /* P10 */
>   #define   PHB_CTRLR_IRQ_PGSZ_64K        PPC_BIT(11)
>   #define   PHB_CTRLR_IRQ_STORE_EOI       PPC_BIT(12)
>   #define   PHB_CTRLR_MMIO_RD_STRICT      PPC_BIT(13)
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index cf506d1623c3..353ce6617743 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1259,10 +1259,54 @@ static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
>       return phb->bus_path;
>   }
>   
> -static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
> -                                 bool pq_checked)
> +/*
> + * Address base trigger mode (POWER10)
> + *
> + * Trigger directly the IC ESB page
> + */
> +static void pnv_phb4_xive_notify_abt(PnvPHB4 *phb, uint32_t srcno,
> +                                     bool pq_checked)
> +{
> +    uint64_t notif_port = phb->regs[PHB_INT_NOTIFY_ADDR >> 3];
> +    uint64_t data = 0; /* trigger data : don't care */
> +    hwaddr addr;
> +    MemTxResult result;
> +    int esb_shift;
> +
> +    if (notif_port & PHB_INT_NOTIFY_ADDR_64K) {
> +        esb_shift = 16;
> +    } else {
> +        esb_shift = 12;
> +    }


I would be nice to have macros for these 12/16 values.


The rest LGTM


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> +
> +    /* Compute the address of the IC ESB management page */
> +    addr = (notif_port & ~PHB_INT_NOTIFY_ADDR_64K);
> +    addr |= (1ull << (esb_shift + 1)) * srcno;
> +    addr |= (1ull << esb_shift);
> +
> +    /*
> +     * When the PQ state bits are checked on the PHB, the associated
> +     * PQ state bits on the IC should be ignored. Use the unconditional
> +     * trigger offset to inject a trigger on the IC. This is always
> +     * the case for LSIs
> +     */
> +    if (pq_checked) {
> +        addr |= XIVE_ESB_INJECT;
> +    }
> +
> +    trace_pnv_phb4_xive_notify_ic(addr, data);
> +
> +    address_space_stq_be(&address_space_memory, addr, data,
> +                         MEMTXATTRS_UNSPECIFIED, &result);
> +    if (result != MEMTX_OK) {
> +        phb_error(phb, "trigger failed @%"HWADDR_PRIx "\n", addr);
> +        return;
> +    }
> +}
> +
> +static void pnv_phb4_xive_notify_ic(PnvPHB4 *phb, uint32_t srcno,
> +                                    bool pq_checked)
>   {
> -    PnvPHB4 *phb = PNV_PHB4(xf);
>       uint64_t notif_port = phb->regs[PHB_INT_NOTIFY_ADDR >> 3];
>       uint32_t offset = phb->regs[PHB_INT_NOTIFY_INDEX >> 3];
>       uint64_t data = offset | srcno;
> @@ -1272,7 +1316,7 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
>           data |= XIVE_TRIGGER_PQ;
>       }
>   
> -    trace_pnv_phb4_xive_notify(notif_port, data);
> +    trace_pnv_phb4_xive_notify_ic(notif_port, data);
>   
>       address_space_stq_be(&address_space_memory, notif_port, data,
>                            MEMTXATTRS_UNSPECIFIED, &result);
> @@ -1282,6 +1326,18 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
>       }
>   }
>   
> +static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
> +                                 bool pq_checked)
> +{
> +    PnvPHB4 *phb = PNV_PHB4(xf);
> +
> +    if (phb->regs[PHB_CTRLR >> 3] & PHB_CTRLR_IRQ_ABT_MODE) {
> +        pnv_phb4_xive_notify_abt(phb, srcno, pq_checked);
> +    } else {
> +        pnv_phb4_xive_notify_ic(phb, srcno, pq_checked);
> +    }
> +}
> +
>   static Property pnv_phb4_properties[] = {
>           DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
>           DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
> @@ -1442,10 +1498,15 @@ void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
>   
>   void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon)
>   {
> +    uint64_t notif_port =
> +        phb->regs[PHB_INT_NOTIFY_ADDR >> 3] & ~PHB_INT_NOTIFY_ADDR_64K;
>       uint32_t offset = phb->regs[PHB_INT_NOTIFY_INDEX >> 3];
> +    bool abt = !!(phb->regs[PHB_CTRLR >> 3] & PHB_CTRLR_IRQ_ABT_MODE);
>   
> -    monitor_printf(mon, "PHB4[%x:%x] Source %08x .. %08x\n",
> +    monitor_printf(mon, "PHB4[%x:%x] Source %08x .. %08x %s @%"HWADDR_PRIx"\n",
>                      phb->chip_id, phb->phb_id,
> -                   offset, offset + phb->xsrc.nr_irqs - 1);
> +                   offset, offset + phb->xsrc.nr_irqs - 1,
> +                   abt ? "ABT" : "",
> +                   notif_port);
>       xive_source_pic_print_info(&phb->xsrc, 0, mon);
>   }
> diff --git a/hw/pci-host/trace-events b/hw/pci-host/trace-events
> index 630e9fcc5e77..6e5d8d335525 100644
> --- a/hw/pci-host/trace-events
> +++ b/hw/pci-host/trace-events
> @@ -32,3 +32,5 @@ unin_read(uint64_t addr, uint64_t value) "addr=0x%" PRIx64 " val=0x%"PRIx64
>   
>   # pnv_phb4.c
>   pnv_phb4_xive_notify(uint64_t notif_port, uint64_t data) "notif=@0x%"PRIx64" data=0x%"PRIx64
> +pnv_phb4_xive_notify_ic(uint64_t addr, uint64_t data) "addr=@0x%"PRIx64" data=0x%"PRIx64
> +pnv_phb4_xive_notify_abt(uint64_t notif_port, uint64_t data) "notif=@0x%"PRIx64" data=0x%"PRIx64

