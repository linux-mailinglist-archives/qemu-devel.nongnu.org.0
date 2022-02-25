Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEC44C4A31
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:11:55 +0100 (CET)
Received: from localhost ([::1]:53082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNdCD-0003fB-WC
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:11:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNd7b-0000pj-20; Fri, 25 Feb 2022 11:07:08 -0500
Received: from [2607:f8b0:4864:20::c35] (port=33504
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNd7X-0001mj-E1; Fri, 25 Feb 2022 11:07:05 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 r41-20020a4a966c000000b0031bf85a4124so6845862ooi.0; 
 Fri, 25 Feb 2022 08:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YTBsr/2Ym0iKcgJWWVtDG8oaqa6wreoKBeNdAvm2uO0=;
 b=VqBSp28MAmdva6KYdSsCrk3aLVlO1wMsEpF5eWasgBtPJ6RleMHwjNsRCYQXb1gh1Y
 QU8LV/OBSoYD405FhLej3nz3j6SIFL7LuCKaoQ80izaHm0WDNEzEzGp0U1O9WVqzWFaF
 IIp1bcIvpj8uYYsXn5rPbpwS8AgvdtvzeZfW5/YF6+L/4B9pg1ZTW47WPdIBJn6yO9Jy
 A7uSUHDrp1pehxd0j9vLTb9isXxy8Gj/SZd/04sUE+7hhhV/DswZctRqM1EGQSu+45DW
 HAPgmYdDVJCwVfHQhx3e68KG8C8BdlMJ3DcPbIKFbXvCxTdwBQWyoFIin1XbPBAD77bl
 KlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YTBsr/2Ym0iKcgJWWVtDG8oaqa6wreoKBeNdAvm2uO0=;
 b=hJ1kIXZW9+W3GdzKPkg6WmSiF2Gblv2B5D4XftN2s+JHg8IYtz4rCn4McQZUgr7Fhc
 /iFzWjf9dp1EiXxrrn/R8oPtdImCHrY81Kd06Fh0pF3QrSQZFKdQG+K9iGZ7SfkAEVgK
 158Tj55pzZHsQ7nR9CAgZUp102C6SMIs5FyjNB7ofMy5xE1/woxT5hVVknL1zGV/HU9i
 SwKNvxGxw8HpXDk6j1+uRRt2hSu+BgFWGOycIJ/0/w4aPOIoM+bfF44FpC0JvB7Hm4JY
 x/4UWu03Pe82Y9wRirAGu64TqYeS13LiyPZ0y0qjY0TSMZpi/f+xFbjXgs9S94fHtscC
 13RQ==
X-Gm-Message-State: AOAM531Lvbj8NL4XKTlatCRq+i8MgjBwMcq2/llkoiBQAI1mvUw259W8
 ItICKDPZ1+Lz0OQSGbnhv/c=
X-Google-Smtp-Source: ABdhPJzNmLG0/Npouc68k3MbaZpz+5dSGRo4d3RWXPV5i35PAjqsZjnGJqG3I8flPEnY9GEg75nmsw==
X-Received: by 2002:a05:6870:b51e:b0:d6:fb31:176e with SMTP id
 v30-20020a056870b51e00b000d6fb31176emr213870oap.191.1645805221993; 
 Fri, 25 Feb 2022 08:07:01 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377?
 ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 j25-20020a4ad199000000b003171dfeb5bfsm1211736oor.15.2022.02.25.08.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 08:07:01 -0800 (PST)
Message-ID: <35880774-be14-764e-cfac-0cdd83d87882@gmail.com>
Date: Fri, 25 Feb 2022 13:06:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 11/18] ppc/pnv: Add support for PQ offload on PHB5
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211126115349.2737605-1-clg@kaod.org>
 <20211126115349.2737605-12-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211126115349.2737605-12-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc35.google.com
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
> The PQ_disable configuration bit disables the check done on the PQ
> state bits when processing new MSI interrupts. When bit 9 is enabled,
> the PHB forwards any MSI trigger to the XIVE interrupt controller
> without checking the PQ state bits. The XIVE IC knows from the trigger
> message that the PQ bits have not been checked and performs the check
> locally.
> 
> This configuration bit only applies to MSIs and LSIs are still checked
> on the PHB to handle the assertion level.
> 
> PQ_disable enablement is a requirement for StoreEOI.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/pci-host/pnv_phb4_regs.h |  1 +
>   include/hw/ppc/xive.h               |  1 +
>   hw/intc/xive.c                      | 22 +++++++++++++++++++++-
>   hw/pci-host/pnv_phb4.c              |  9 +++++++++
>   4 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb4_regs.h b/include/hw/pci-host/pnv_phb4_regs.h
> index 55df2c3e5ece..64f326b7158e 100644
> --- a/include/hw/pci-host/pnv_phb4_regs.h
> +++ b/include/hw/pci-host/pnv_phb4_regs.h
> @@ -225,6 +225,7 @@
>   /* Fundamental register set B */
>   #define PHB_VERSION                     0x800
>   #define PHB_CTRLR                       0x810
> +#define   PHB_CTRLR_IRQ_PQ_DISABLE      PPC_BIT(9)   /* P10 */
>   #define   PHB_CTRLR_IRQ_PGSZ_64K        PPC_BIT(11)
>   #define   PHB_CTRLR_IRQ_STORE_EOI       PPC_BIT(12)
>   #define   PHB_CTRLR_MMIO_RD_STRICT      PPC_BIT(13)
> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
> index 649b58a08f0c..126e4e2c3a17 100644
> --- a/include/hw/ppc/xive.h
> +++ b/include/hw/ppc/xive.h
> @@ -176,6 +176,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XiveSource, XIVE_SOURCE)
>    */
>   #define XIVE_SRC_H_INT_ESB     0x1 /* ESB managed with hcall H_INT_ESB */
>   #define XIVE_SRC_STORE_EOI     0x2 /* Store EOI supported */
> +#define XIVE_SRC_PQ_DISABLE    0x4 /* Disable check on the PQ state bits */
>   
>   struct XiveSource {
>       DeviceState parent;
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index 3cc439a84655..4f3d67f246b5 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -886,6 +886,16 @@ static bool xive_source_lsi_trigger(XiveSource *xsrc, uint32_t srcno)
>       }
>   }
>   
> +/*
> + * Sources can be configured with PQ offloading in which case the check
> + * on the PQ state bits of MSIs is disabled
> + */
> +static bool xive_source_esb_disabled(XiveSource *xsrc, uint32_t srcno)
> +{
> +    return (xsrc->esb_flags & XIVE_SRC_PQ_DISABLE) &&
> +        !xive_source_irq_is_lsi(xsrc, srcno);
> +}
> +
>   /*
>    * Returns whether the event notification should be forwarded.
>    */
> @@ -895,6 +905,10 @@ static bool xive_source_esb_trigger(XiveSource *xsrc, uint32_t srcno)
>   
>       assert(srcno < xsrc->nr_irqs);
>   
> +    if (xive_source_esb_disabled(xsrc, srcno)) {
> +        return true;
> +    }
> +
>       ret = xive_esb_trigger(&xsrc->status[srcno]);
>   
>       if (xive_source_irq_is_lsi(xsrc, srcno) &&
> @@ -915,6 +929,11 @@ static bool xive_source_esb_eoi(XiveSource *xsrc, uint32_t srcno)
>   
>       assert(srcno < xsrc->nr_irqs);
>   
> +    if (xive_source_esb_disabled(xsrc, srcno)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid EOI for IRQ %d\n", srcno);
> +        return false;
> +    }
> +
>       ret = xive_esb_eoi(&xsrc->status[srcno]);
>   
>       /*
> @@ -936,9 +955,10 @@ static bool xive_source_esb_eoi(XiveSource *xsrc, uint32_t srcno)
>   static void xive_source_notify(XiveSource *xsrc, int srcno)
>   {
>       XiveNotifierClass *xnc = XIVE_NOTIFIER_GET_CLASS(xsrc->xive);
> +    bool pq_checked = !xive_source_esb_disabled(xsrc, srcno);
>   
>       if (xnc->notify) {
> -        xnc->notify(xsrc->xive, srcno, true);
> +        xnc->notify(xsrc->xive, srcno, pq_checked);
>       }
>   }
>   
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 3edd5845ebde..cf506d1623c3 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -475,6 +475,15 @@ static void pnv_phb4_update_xsrc(PnvPHB4 *phb)
>           flags = 0;
>       }
>   
> +    /*
> +     * When the PQ disable configuration bit is set, the check on the
> +     * PQ state bits is disabled on the PHB side (for MSI only) and it
> +     * is performed on the IC side instead.
> +     */
> +    if (phb->regs[PHB_CTRLR >> 3] & PHB_CTRLR_IRQ_PQ_DISABLE) {
> +        flags |= XIVE_SRC_PQ_DISABLE;
> +    }
> +
>       phb->xsrc.esb_shift = shift;
>       phb->xsrc.esb_flags = flags;
>   

