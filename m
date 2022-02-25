Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549E24C4A2A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:09:00 +0100 (CET)
Received: from localhost ([::1]:47870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNd9N-0008KP-Ov
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:08:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNd1e-0006GJ-Ml; Fri, 25 Feb 2022 11:00:59 -0500
Received: from [2607:f8b0:4864:20::22c] (port=43602
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNd1c-0000gG-6v; Fri, 25 Feb 2022 11:00:58 -0500
Received: by mail-oi1-x22c.google.com with SMTP id s5so7894880oic.10;
 Fri, 25 Feb 2022 08:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JLEgrapy7GNkG9KP4FtYhsMq56v8HZ15I9UB0Dn4kgA=;
 b=g0d6/Z84eLKT5nCTqnlIWiK0GRxFSOqOv4zFi55Pjwbonll7QUW4RCv/GkMyEJJ6Jx
 sZvxRYMrZBcrmm0Z4Gm2dsXv1iR980dIju8bGOfOCizhnwDiI+AdWDOUpy05SYpb8izV
 WwDRvnWXKc0C8wfce6LnvPCpE6DqZBq6QAW3Rf1t6/ruLsXltg8wMlpumtwcE7n+1PHs
 001efXdTYWs+SDv1Tpcq/Fve3QHOxz/12PoP1aaDD8Ire5Ygq7Y0uQUPljM31pWlHAVy
 cyEofIjsBm5MIZJ8Z95+cV0P+pGWJLuobcLoECPWjxpgnqaME1oWJZXbNnpOmmYBuOsb
 Jwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JLEgrapy7GNkG9KP4FtYhsMq56v8HZ15I9UB0Dn4kgA=;
 b=rc9PCkdsk5zSNRZuAA+vHxXBRA/6H4m/CmVYjkRRKvY+ok21HGZUzOq/6cKUoQhE3V
 KTKAVO3PMdYY9EbmcHvfmkkYwF5cqWxl/gudNMBV37rfAI8Vra2dXfs49FFQaNNHE/Ae
 /Ag/dLD6gFrq+f4XM+jjxWVUjEHGv8uWamn5JLBnIB9Zwo34k4cfascAPF4h72JPcU1M
 YSFdB2Vdx4YCBv1e406JLGPXsmlXVS+6cKFDSm9pXB5SZvsq2gCgcoxH7gueNCsMa+Ln
 LYuZ+3JQSnSfL6xSDfsH7OXvbgrsQ3CmOfiE3F+kng0QXLUAnt5yxhL1oec536Ho1J2V
 Vg6Q==
X-Gm-Message-State: AOAM530mt3xTDos/UfHfvh1ts9YfdNT8IEHAjudkMnZrsoCgstsCQOtK
 J+3UDn0i6+szoPN8y4/sk3wkpmcAaGE=
X-Google-Smtp-Source: ABdhPJxpiFNgvWhC/8YRLRCvnYH4QSKzRwtyUAVZaMjmYBQc/BVf7Ln4rmcyVkgJcfrEQjqOFLlURQ==
X-Received: by 2002:a05:6808:118e:b0:2cf:3699:1c7b with SMTP id
 j14-20020a056808118e00b002cf36991c7bmr2001121oil.246.1645804852936; 
 Fri, 25 Feb 2022 08:00:52 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377?
 ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 a32-20020a056870a1a000b000d458b1469dsm1579875oaf.10.2022.02.25.08.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 08:00:52 -0800 (PST)
Message-ID: <a04e97cc-250b-ff14-bc9b-d40c81dd4c1e@gmail.com>
Date: Fri, 25 Feb 2022 13:00:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 10/18] ppc/xive: Add support for PQ state bits offload
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211126115349.2737605-1-clg@kaod.org>
 <20211126115349.2737605-11-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211126115349.2737605-11-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
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
> The trigger message coming from a HW source contains a special bit
> informing the XIVE interrupt controller that the PQ bits have been
> checked at the source or not. Depending on the value, the IC can
> perform the check and the state transition locally using its own PQ
> state bits.
> 
> The following changes add new accessors to the XiveRouter required to
> query and update the PQ state bits. This only applies to the PowerNV
> machine. sPAPR accessors are provided but the pSeries machine should
> not be concerned by such complex configuration for the moment.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/xive.h  |  8 +++++--
>   include/hw/ppc/xive2.h |  6 +++++-
>   hw/intc/pnv_xive.c     | 37 +++++++++++++++++++++++++++++---
>   hw/intc/pnv_xive2.c    | 37 +++++++++++++++++++++++++++++---
>   hw/intc/spapr_xive.c   | 25 ++++++++++++++++++++++
>   hw/intc/xive.c         | 48 ++++++++++++++++++++++++++++++++++++------
>   hw/intc/xive2.c        | 42 +++++++++++++++++++++++++++++++++++-
>   hw/pci-host/pnv_phb4.c |  9 ++++++--
>   hw/ppc/pnv_psi.c       |  8 +++++--
>   9 files changed, 199 insertions(+), 21 deletions(-)
> 
> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
> index 875c7f639689..649b58a08f0c 100644
> --- a/include/hw/ppc/xive.h
> +++ b/include/hw/ppc/xive.h
> @@ -160,7 +160,7 @@ DECLARE_CLASS_CHECKERS(XiveNotifierClass, XIVE_NOTIFIER,
>   
>   struct XiveNotifierClass {
>       InterfaceClass parent;
> -    void (*notify)(XiveNotifier *xn, uint32_t lisn);
> +    void (*notify)(XiveNotifier *xn, uint32_t lisn, bool pq_checked);
>   };
>   
>   /*
> @@ -386,6 +386,10 @@ struct XiveRouterClass {
>       /* XIVE table accessors */
>       int (*get_eas)(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_idx,
>                      XiveEAS *eas);
> +    int (*get_pq)(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_idx,
> +                  uint8_t *pq);
> +    int (*set_pq)(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_idx,
> +                  uint8_t *pq);
>       int (*get_end)(XiveRouter *xrtr, uint8_t end_blk, uint32_t end_idx,
>                      XiveEND *end);
>       int (*write_end)(XiveRouter *xrtr, uint8_t end_blk, uint32_t end_idx,
> @@ -407,7 +411,7 @@ int xive_router_get_nvt(XiveRouter *xrtr, uint8_t nvt_blk, uint32_t nvt_idx,
>                           XiveNVT *nvt);
>   int xive_router_write_nvt(XiveRouter *xrtr, uint8_t nvt_blk, uint32_t nvt_idx,
>                             XiveNVT *nvt, uint8_t word_number);
> -void xive_router_notify(XiveNotifier *xn, uint32_t lisn);
> +void xive_router_notify(XiveNotifier *xn, uint32_t lisn, bool pq_checked);
>   
>   /*
>    * XIVE Presenter
> diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
> index e881c039d9c0..9222b5b36979 100644
> --- a/include/hw/ppc/xive2.h
> +++ b/include/hw/ppc/xive2.h
> @@ -31,6 +31,10 @@ typedef struct Xive2RouterClass {
>       /* XIVE table accessors */
>       int (*get_eas)(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
>                      Xive2Eas *eas);
> +    int (*get_pq)(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
> +                  uint8_t *pq);
> +    int (*set_pq)(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
> +                  uint8_t *pq);
>       int (*get_end)(Xive2Router *xrtr, uint8_t end_blk, uint32_t end_idx,
>                      Xive2End *end);
>       int (*write_end)(Xive2Router *xrtr, uint8_t end_blk, uint32_t end_idx,
> @@ -53,7 +57,7 @@ int xive2_router_get_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
>   int xive2_router_write_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
>                             Xive2Nvp *nvp, uint8_t word_number);
>   
> -void xive2_router_notify(XiveNotifier *xn, uint32_t lisn);
> +void xive2_router_notify(XiveNotifier *xn, uint32_t lisn, bool pq_checked);
>   
>   /*
>    * XIVE2 Presenter (POWER10)
> diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
> index ad43483612e5..5022f85350f4 100644
> --- a/hw/intc/pnv_xive.c
> +++ b/hw/intc/pnv_xive.c
> @@ -393,6 +393,34 @@ static int pnv_xive_get_eas(XiveRouter *xrtr, uint8_t blk, uint32_t idx,
>       return pnv_xive_vst_read(xive, VST_TSEL_IVT, blk, idx, eas);
>   }
>   
> +static int pnv_xive_get_pq(XiveRouter *xrtr, uint8_t blk, uint32_t idx,
> +                           uint8_t *pq)
> +{
> +    PnvXive *xive = PNV_XIVE(xrtr);
> +
> +    if (pnv_xive_block_id(xive) != blk) {
> +        xive_error(xive, "VST: EAS %x is remote !?", XIVE_EAS(blk, idx));
> +        return -1;
> +    }
> +
> +    *pq = xive_source_esb_get(&xive->ipi_source, idx);
> +    return 0;
> +}
> +
> +static int pnv_xive_set_pq(XiveRouter *xrtr, uint8_t blk, uint32_t idx,
> +                           uint8_t *pq)
> +{
> +    PnvXive *xive = PNV_XIVE(xrtr);
> +
> +    if (pnv_xive_block_id(xive) != blk) {
> +        xive_error(xive, "VST: EAS %x is remote !?", XIVE_EAS(blk, idx));
> +        return -1;
> +    }
> +
> +    *pq = xive_source_esb_set(&xive->ipi_source, idx, *pq);
> +    return 0;
> +}
> +
>   /*
>    * One bit per thread id. The first register PC_THREAD_EN_REG0 covers
>    * the first cores 0-15 (normal) of the chip or 0-7 (fused). The
> @@ -489,12 +517,12 @@ static PnvXive *pnv_xive_tm_get_xive(PowerPCCPU *cpu)
>    * event notification to the Router. This is required on a multichip
>    * system.
>    */
> -static void pnv_xive_notify(XiveNotifier *xn, uint32_t srcno)
> +static void pnv_xive_notify(XiveNotifier *xn, uint32_t srcno, bool pq_checked)
>   {
>       PnvXive *xive = PNV_XIVE(xn);
>       uint8_t blk = pnv_xive_block_id(xive);
>   
> -    xive_router_notify(xn, XIVE_EAS(blk, srcno));
> +    xive_router_notify(xn, XIVE_EAS(blk, srcno), pq_checked);
>   }
>   
>   /*
> @@ -1336,7 +1364,8 @@ static void pnv_xive_ic_hw_trigger(PnvXive *xive, hwaddr addr, uint64_t val)
>       blk = XIVE_EAS_BLOCK(val);
>       idx = XIVE_EAS_INDEX(val);
>   
> -    xive_router_notify(XIVE_NOTIFIER(xive), XIVE_EAS(blk, idx));
> +    xive_router_notify(XIVE_NOTIFIER(xive), XIVE_EAS(blk, idx),
> +                       !!(val & XIVE_TRIGGER_PQ));
>   }
>   
>   static void pnv_xive_ic_notify_write(void *opaque, hwaddr addr, uint64_t val,
> @@ -1956,6 +1985,8 @@ static void pnv_xive_class_init(ObjectClass *klass, void *data)
>       device_class_set_props(dc, pnv_xive_properties);
>   
>       xrc->get_eas = pnv_xive_get_eas;
> +    xrc->get_pq = pnv_xive_get_pq;
> +    xrc->set_pq = pnv_xive_set_pq;
>       xrc->get_end = pnv_xive_get_end;
>       xrc->write_end = pnv_xive_write_end;
>       xrc->get_nvt = pnv_xive_get_nvt;
> diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
> index b9abd022cf08..186ab66e105d 100644
> --- a/hw/intc/pnv_xive2.c
> +++ b/hw/intc/pnv_xive2.c
> @@ -284,6 +284,34 @@ static int pnv_xive2_vst_write(PnvXive2 *xive, uint32_t type, uint8_t blk,
>       return 0;
>   }
>   
> +static int pnv_xive2_get_pq(Xive2Router *xrtr, uint8_t blk, uint32_t idx,
> +                             uint8_t *pq)
> +{
> +    PnvXive2 *xive = PNV_XIVE2(xrtr);
> +
> +    if (pnv_xive2_block_id(xive) != blk) {
> +        xive2_error(xive, "VST: EAS %x is remote !?", XIVE_EAS(blk, idx));
> +        return -1;
> +    }
> +
> +    *pq = xive_source_esb_get(&xive->ipi_source, idx);
> +    return 0;
> +}
> +
> +static int pnv_xive2_set_pq(Xive2Router *xrtr, uint8_t blk, uint32_t idx,
> +                             uint8_t *pq)
> +{
> +    PnvXive2 *xive = PNV_XIVE2(xrtr);
> +
> +    if (pnv_xive2_block_id(xive) != blk) {
> +        xive2_error(xive, "VST: EAS %x is remote !?", XIVE_EAS(blk, idx));
> +        return -1;
> +    }
> +
> +    *pq = xive_source_esb_set(&xive->ipi_source, idx, *pq);
> +    return 0;
> +}
> +
>   static int pnv_xive2_get_end(Xive2Router *xrtr, uint8_t blk, uint32_t idx,
>                                Xive2End *end)
>   {
> @@ -486,12 +514,12 @@ static PnvXive2 *pnv_xive2_tm_get_xive(PowerPCCPU *cpu)
>    * source interrupt number before forwarding the source event
>    * notification to the Router. This is required on a multichip system.
>    */
> -static void pnv_xive2_notify(XiveNotifier *xn, uint32_t srcno)
> +static void pnv_xive2_notify(XiveNotifier *xn, uint32_t srcno, bool pq_checked)
>   {
>       PnvXive2 *xive = PNV_XIVE2(xn);
>       uint8_t blk = pnv_xive2_block_id(xive);
>   
> -    xive2_router_notify(xn, XIVE_EAS(blk, srcno));
> +    xive2_router_notify(xn, XIVE_EAS(blk, srcno), pq_checked);
>   }
>   
>   /*
> @@ -1380,7 +1408,8 @@ static void pnv_xive2_ic_hw_trigger(PnvXive2 *xive, hwaddr addr,
>       blk = XIVE_EAS_BLOCK(val);
>       idx = XIVE_EAS_INDEX(val);
>   
> -    xive2_router_notify(XIVE_NOTIFIER(xive), XIVE_EAS(blk, idx));
> +    xive2_router_notify(XIVE_NOTIFIER(xive), XIVE_EAS(blk, idx),
> +                         !!(val & XIVE_TRIGGER_PQ));
>   }
>   
>   static void pnv_xive2_ic_notify_write(void *opaque, hwaddr offset,
> @@ -1879,6 +1908,8 @@ static void pnv_xive2_class_init(ObjectClass *klass, void *data)
>       device_class_set_props(dc, pnv_xive2_properties);
>   
>       xrc->get_eas   = pnv_xive2_get_eas;
> +    xrc->get_pq    = pnv_xive2_get_pq;
> +    xrc->set_pq    = pnv_xive2_set_pq;
>       xrc->get_end   = pnv_xive2_get_end;
>       xrc->write_end = pnv_xive2_write_end;
>       xrc->get_nvp   = pnv_xive2_get_nvp;
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index 4ec659b93e13..9ea7c83f3cc3 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -480,6 +480,29 @@ static uint8_t spapr_xive_get_block_id(XiveRouter *xrtr)
>       return SPAPR_XIVE_BLOCK_ID;
>   }
>   
> +static int spapr_xive_get_pq(XiveRouter *xrtr, uint8_t blk, uint32_t idx,
> +                             uint8_t *pq)
> +{
> +    SpaprXive *xive = SPAPR_XIVE(xrtr);
> +
> +    assert(SPAPR_XIVE_BLOCK_ID == blk);
> +
> +    *pq = xive_source_esb_get(&xive->source, idx);
> +    return 0;
> +}
> +
> +static int spapr_xive_set_pq(XiveRouter *xrtr, uint8_t blk, uint32_t idx,
> +                             uint8_t *pq)
> +{
> +    SpaprXive *xive = SPAPR_XIVE(xrtr);
> +
> +    assert(SPAPR_XIVE_BLOCK_ID == blk);
> +
> +    *pq = xive_source_esb_set(&xive->source, idx, *pq);
> +    return 0;
> +}
> +
> +
>   static const VMStateDescription vmstate_spapr_xive_end = {
>       .name = TYPE_SPAPR_XIVE "/end",
>       .version_id = 1,
> @@ -788,6 +811,8 @@ static void spapr_xive_class_init(ObjectClass *klass, void *data)
>       dc->vmsd    = &vmstate_spapr_xive;
>   
>       xrc->get_eas = spapr_xive_get_eas;
> +    xrc->get_pq  = spapr_xive_get_pq;
> +    xrc->set_pq  = spapr_xive_set_pq;
>       xrc->get_end = spapr_xive_get_end;
>       xrc->write_end = spapr_xive_write_end;
>       xrc->get_nvt = spapr_xive_get_nvt;
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index 2c73ab5ca9d6..3cc439a84655 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -938,7 +938,7 @@ static void xive_source_notify(XiveSource *xsrc, int srcno)
>       XiveNotifierClass *xnc = XIVE_NOTIFIER_GET_CLASS(xsrc->xive);
>   
>       if (xnc->notify) {
> -        xnc->notify(xsrc->xive, srcno);
> +        xnc->notify(xsrc->xive, srcno, true);
>       }
>   }
>   
> @@ -1369,6 +1369,24 @@ int xive_router_get_eas(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_idx,
>       return xrc->get_eas(xrtr, eas_blk, eas_idx, eas);
>   }
>   
> +static
> +int xive_router_get_pq(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_idx,
> +                       uint8_t *pq)
> +{
> +    XiveRouterClass *xrc = XIVE_ROUTER_GET_CLASS(xrtr);
> +
> +    return xrc->get_pq(xrtr, eas_blk, eas_idx, pq);
> +}
> +
> +static
> +int xive_router_set_pq(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_idx,
> +                       uint8_t *pq)
> +{
> +    XiveRouterClass *xrc = XIVE_ROUTER_GET_CLASS(xrtr);
> +
> +    return xrc->set_pq(xrtr, eas_blk, eas_idx, pq);
> +}
> +
>   int xive_router_get_end(XiveRouter *xrtr, uint8_t end_blk, uint32_t end_idx,
>                           XiveEND *end)
>   {
> @@ -1720,7 +1738,7 @@ do_escalation:
>                              xive_get_field32(END_W5_ESC_END_DATA,  end.w5));
>   }
>   
> -void xive_router_notify(XiveNotifier *xn, uint32_t lisn)
> +void xive_router_notify(XiveNotifier *xn, uint32_t lisn, bool pq_checked)
>   {
>       XiveRouter *xrtr = XIVE_ROUTER(xn);
>       uint8_t eas_blk = XIVE_EAS_BLOCK(lisn);
> @@ -1733,11 +1751,27 @@ void xive_router_notify(XiveNotifier *xn, uint32_t lisn)
>           return;
>       }
>   
> -    /*
> -     * The IVRE checks the State Bit Cache at this point. We skip the
> -     * SBC lookup because the state bits of the sources are modeled
> -     * internally in QEMU.
> -     */
> +    if (!pq_checked) {
> +        bool notify;
> +        uint8_t pq;
> +
> +        /* PQ cache lookup */
> +        if (xive_router_get_pq(xrtr, eas_blk, eas_idx, &pq)) {
> +            /* Set FIR */
> +            g_assert_not_reached();
> +        }
> +
> +        notify = xive_esb_trigger(&pq);
> +
> +        if (xive_router_set_pq(xrtr, eas_blk, eas_idx, &pq)) {
> +            /* Set FIR */
> +            g_assert_not_reached();
> +        }
> +
> +        if (!notify) {
> +            return;
> +        }
> +    }
>   
>       if (!xive_eas_is_valid(&eas)) {
>           qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid LISN %x\n", lisn);
> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
> index d474476b5a55..26af08a5de07 100644
> --- a/hw/intc/xive2.c
> +++ b/hw/intc/xive2.c
> @@ -170,6 +170,24 @@ int xive2_router_get_eas(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
>       return xrc->get_eas(xrtr, eas_blk, eas_idx, eas);
>   }
>   
> +static
> +int xive2_router_get_pq(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
> +                       uint8_t *pq)
> +{
> +    Xive2RouterClass *xrc = XIVE2_ROUTER_GET_CLASS(xrtr);
> +
> +    return xrc->get_pq(xrtr, eas_blk, eas_idx, pq);
> +}
> +
> +static
> +int xive2_router_set_pq(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
> +                       uint8_t *pq)
> +{
> +    Xive2RouterClass *xrc = XIVE2_ROUTER_GET_CLASS(xrtr);
> +
> +    return xrc->set_pq(xrtr, eas_blk, eas_idx, pq);
> +}
> +
>   int xive2_router_get_end(Xive2Router *xrtr, uint8_t end_blk, uint32_t end_idx,
>                            Xive2End *end)
>   {
> @@ -479,7 +497,7 @@ do_escalation:
>                              xive_get_field32(END2_W5_ESC_END_DATA,  end.w5));
>   }
>   
> -void xive2_router_notify(XiveNotifier *xn, uint32_t lisn)
> +void xive2_router_notify(XiveNotifier *xn, uint32_t lisn, bool pq_checked)
>   {
>       Xive2Router *xrtr = XIVE2_ROUTER(xn);
>       uint8_t eas_blk = XIVE_EAS_BLOCK(lisn);
> @@ -492,6 +510,28 @@ void xive2_router_notify(XiveNotifier *xn, uint32_t lisn)
>           return;
>       }
>   
> +    if (!pq_checked) {
> +        bool notify;
> +        uint8_t pq;
> +
> +        /* PQ cache lookup */
> +        if (xive2_router_get_pq(xrtr, eas_blk, eas_idx, &pq)) {
> +            /* Set FIR */
> +            g_assert_not_reached();
> +        }
> +
> +        notify = xive_esb_trigger(&pq);
> +
> +        if (xive2_router_set_pq(xrtr, eas_blk, eas_idx, &pq)) {
> +            /* Set FIR */
> +            g_assert_not_reached();
> +        }
> +
> +        if (!notify) {
> +            return;
> +        }
> +    }
> +
>       if (!xive2_eas_is_valid(&eas)) {
>           qemu_log_mask(LOG_GUEST_ERROR, "XIVE: Invalid LISN %x\n", lisn);
>           return;
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 5c375a9f285d..3edd5845ebde 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1250,14 +1250,19 @@ static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
>       return phb->bus_path;
>   }
>   
> -static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno)
> +static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
> +                                 bool pq_checked)
>   {
>       PnvPHB4 *phb = PNV_PHB4(xf);
>       uint64_t notif_port = phb->regs[PHB_INT_NOTIFY_ADDR >> 3];
>       uint32_t offset = phb->regs[PHB_INT_NOTIFY_INDEX >> 3];
> -    uint64_t data = XIVE_TRIGGER_PQ | offset | srcno;
> +    uint64_t data = offset | srcno;
>       MemTxResult result;
>   
> +    if (pq_checked) {
> +        data |= XIVE_TRIGGER_PQ;
> +    }
> +
>       trace_pnv_phb4_xive_notify(notif_port, data);
>   
>       address_space_stq_be(&address_space_memory, notif_port, data,
> diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
> index 737486046d5a..466fb7979887 100644
> --- a/hw/ppc/pnv_psi.c
> +++ b/hw/ppc/pnv_psi.c
> @@ -653,7 +653,7 @@ static const TypeInfo pnv_psi_power8_info = {
>   #define PSIHB10_ESB_CI_BASE              PSIHB9_ESB_CI_BASE
>   #define   PSIHB10_ESB_CI_64K             PPC_BIT(1)
>   
> -static void pnv_psi_notify(XiveNotifier *xf, uint32_t srcno)
> +static void pnv_psi_notify(XiveNotifier *xf, uint32_t srcno, bool pq_checked)
>   {
>       PnvPsi *psi = PNV_PSI(xf);
>       uint64_t notif_port = psi->regs[PSIHB_REG(PSIHB9_ESB_NOTIF_ADDR)];
> @@ -662,9 +662,13 @@ static void pnv_psi_notify(XiveNotifier *xf, uint32_t srcno)
>   
>       uint32_t offset =
>           (psi->regs[PSIHB_REG(PSIHB9_IVT_OFFSET)] >> PSIHB9_IVT_OFF_SHIFT);
> -    uint64_t data = XIVE_TRIGGER_PQ | offset | srcno;
> +    uint64_t data = offset | srcno;
>       MemTxResult result;
>   
> +    if (pq_checked) {
> +        data |= XIVE_TRIGGER_PQ;
> +    }
> +
>       if (!valid) {
>           return;
>       }

