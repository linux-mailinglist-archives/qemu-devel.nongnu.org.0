Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6A04B9F09
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 12:38:26 +0100 (CET)
Received: from localhost ([::1]:35460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKf7B-0001h9-Ju
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 06:38:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nKeyD-0003YE-IT; Thu, 17 Feb 2022 06:29:11 -0500
Received: from [2607:f8b0:4864:20::c30] (port=43845
 helo=mail-oo1-xc30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nKeyA-0004mV-Nm; Thu, 17 Feb 2022 06:29:08 -0500
Received: by mail-oo1-xc30.google.com with SMTP id
 w10-20020a4ae08a000000b0031bdf7a6d76so4416155oos.10; 
 Thu, 17 Feb 2022 03:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Gb9RJeUf4ykWaXZIcSjaJydt1g2rcu3b3ZfeWqmKV44=;
 b=cn9LaF25eWaYUOqJHgMSJ1/H8TuRqrtMcrfWLhfjJO7AW86uCx9nxgs81LD4MO+4HL
 7q+CqfEoe2k6OaOUb4XC5dLrbzZY6+PTuDIvUE/40t4BakE0oAWOOy+ZAcDOmRpDcUtZ
 ZcZyNuIggJnR+LdubAHKH4TFrVqFQ0xYC04OfBCmjk9vH0J54CzrMizAch7ODPgvvBB8
 gucWV5ICZr6hHKUnP/36EdNvuK1FOYKDKe9UMtk5+CePeHI0p0pbnwvCFBejDl2l8nHt
 56sO5aXmaj1ebHJwTIP0baJ69MUtV5xJDYz35u/fp0RiKfMjH/QbVggR2V+5Zbr55x7V
 aSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gb9RJeUf4ykWaXZIcSjaJydt1g2rcu3b3ZfeWqmKV44=;
 b=WrpXbAGMejFu+vtssIUgbzCawZzrCbKvn319U87uZbcxMR+4CdulxRohjhBtSpqIJJ
 Y0CFPR0qbFzDunCCOPmsNUgTfFf6/o23zSGtx/50JbVENd7avPGwAb4Fajng9OlezJ12
 adyNdN/Ha8NDq37KVQKbDX6iOD54SymquG7wUWHDjVwY+FegD+p/Hlari2LKr3nfOkTV
 bDKNO6cBG/K4y41RvjgTaLHGa8QzHQqzEWsFK/lb1a/cWrS/D2Mca65BeBO12FFJmZ+g
 AQFmMCxNMP2x0ZRhCBbqHd0r62nHHd8WyOCgJlEfjGcqhGd4moSthAaqGi6bcLkRjjsE
 Kzyw==
X-Gm-Message-State: AOAM533eChzEHD2K4b5qfibdM1rYhia4l+F3E8UAYV4htszcfGAAH+BY
 8oHsks1+EfnWsvcv4aj3o28=
X-Google-Smtp-Source: ABdhPJyzSLrjA66D8Ibb51lzsEQYY7U5pB/FmutBgEgqgVNl69MlQ4x/3a2frsoJtiRt76kHx0ngdQ==
X-Received: by 2002:a4a:e0d5:0:b0:2e3:9eea:5d20 with SMTP id
 e21-20020a4ae0d5000000b002e39eea5d20mr581899oot.49.1645097342524; 
 Thu, 17 Feb 2022 03:29:02 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:367f:eb9c:8725:6b7f:76b3?
 ([2804:431:c7c6:367f:eb9c:8725:6b7f:76b3])
 by smtp.gmail.com with ESMTPSA id f43sm1716240otf.3.2022.02.17.03.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 03:29:02 -0800 (PST)
Message-ID: <d38d9e08-8988-6aa3-40f6-408b6eb823b0@gmail.com>
Date: Thu, 17 Feb 2022 08:28:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ppc/spapr: Advertise StoreEOI for POWER10 compat guests
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220214141157.3800212-1-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220214141157.3800212-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/14/22 11:11, Cédric Le Goater wrote:
> When an interrupt has been handled, the OS notifies the interrupt
> controller with a EOI sequence. On a POWER9 and POWER10 systems using
> the XIVE interrupt controller, this can be done with a load or a store
> operation on the ESB interrupt management page of the interrupt. The
> StoreEOI operation has less latency and improves interrupt handling
> performance but it was deactivated during the POWER9 DD2.0 timeframe
> because of ordering issues. POWER9 systems use the LoadEOI instead.
> POWER10 compat guests should have fixed the issue with
> Load-after-Store ordering and StoreEOI can be activated for them
> again.
> 
> To maintain performance, this ordering is only enforced for the
> XIVE_ESB_SET_PQ_10 load operation. This operation can be used to
> disable temporarily an interrupt source. If StoreEOI is active, a
> source could be left enabled if the load and store operations come
> out of order.
> 
> Add a check in our XIVE emulation model for Load-after-Store when
> StoreEOI is active. It should catch unreliable sequences. Other load
> operations should be fine without it.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/spapr_xive.h |  1 +
>   include/hw/ppc/xive.h       |  8 ++++++++
>   hw/intc/spapr_xive.c        | 15 +++++++++++++++
>   hw/intc/spapr_xive_kvm.c    | 15 +++++++++++++++
>   hw/intc/xive.c              |  6 ++++++
>   hw/ppc/spapr_hcall.c        |  7 +++++++
>   6 files changed, 52 insertions(+)
> 
> diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> index b282960ad90d..9c247d8bf57d 100644
> --- a/include/hw/ppc/spapr_xive.h
> +++ b/include/hw/ppc/spapr_xive.h
> @@ -73,6 +73,7 @@ void spapr_xive_map_mmio(SpaprXive *xive);
>   
>   int spapr_xive_end_to_target(uint8_t end_blk, uint32_t end_idx,
>                                uint32_t *out_server, uint8_t *out_prio);
> +void spapr_xive_enable_store_eoi(SpaprXive *xive, bool enable);
>   
>   /*
>    * KVM XIVE device helpers
> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
> index 126e4e2c3a17..133f308c2792 100644
> --- a/include/hw/ppc/xive.h
> +++ b/include/hw/ppc/xive.h
> @@ -285,6 +285,14 @@ uint8_t xive_esb_set(uint8_t *pq, uint8_t value);
>   #define XIVE_ESB_SET_PQ_10      0xe00 /* Load */
>   #define XIVE_ESB_SET_PQ_11      0xf00 /* Load */
>   
> +/*
> + * Load-after-store ordering
> + *
> + * Adding this offset to the load address will enforce
> + * load-after-store ordering. This is required to use with StoreEOI.
> + */
> +#define XIVE_ESB_LD_ST_MO       0x40 /* Load-after-store ordering */
> +
>   uint8_t xive_source_esb_get(XiveSource *xsrc, uint32_t srcno);
>   uint8_t xive_source_esb_set(XiveSource *xsrc, uint32_t srcno, uint8_t pq);
>   
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index dc641cc604bf..0b8a246ad594 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -25,6 +25,7 @@
>   #include "hw/ppc/xive_regs.h"
>   #include "hw/qdev-properties.h"
>   #include "trace.h"
> +#include "cpu-models.h"
>   
>   /*
>    * XIVE Virtualization Controller BAR and Thread Managment BAR that we
> @@ -1854,3 +1855,17 @@ void spapr_xive_hcall_init(SpaprMachineState *spapr)
>       spapr_register_hypercall(H_INT_SYNC, h_int_sync);
>       spapr_register_hypercall(H_INT_RESET, h_int_reset);
>   }
> +
> +/*
> + * Advertise StoreEOI for a P10 compat guest. OS is required to
> + * enforce load-after-store ordering.
> + */
> +void spapr_xive_enable_store_eoi(SpaprXive *xive, bool enable)
> +{
> +    if (enable) {
> +        xive->source.esb_flags |= XIVE_SRC_STORE_EOI;
> +    } else {
> +        xive->source.esb_flags &= ~XIVE_SRC_STORE_EOI;
> +    }
> +
> +}
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index 61fe7bd2d322..bd023407bd7f 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -296,6 +296,21 @@ static uint64_t xive_esb_rw(XiveSource *xsrc, int srcno, uint32_t offset,
>   
>   static uint8_t xive_esb_read(XiveSource *xsrc, int srcno, uint32_t offset)
>   {
> +    /*
> +     * The XIVE_ESB_SET_PQ_10 load operation is used to disable
> +     * temporarily an interrupt source. If StoreEOI is active, a
> +     * source could be left enabled if the load and store operations
> +     * come out of order.
> +     *
> +     * As we don't know the characteristics of the host source
> +     * interrupts (StoreEOI or not), enforce the load-after-store
> +     * ordering always. The performance penalty will be very small for
> +     * QEMU.
> +     */
> +    if (offset == XIVE_ESB_SET_PQ_10) {
> +        offset |= XIVE_ESB_LD_ST_MO;
> +    }
> +
>       return xive_esb_rw(xsrc, srcno, offset, 0, 0) & 0x3;
>   }
>   
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index b8e4c7294d59..d62881873b1b 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -1024,6 +1024,12 @@ static uint64_t xive_source_esb_read(void *opaque, hwaddr addr, unsigned size)
>       case XIVE_ESB_SET_PQ_01 ... XIVE_ESB_SET_PQ_01 + 0x0FF:
>       case XIVE_ESB_SET_PQ_10 ... XIVE_ESB_SET_PQ_10 + 0x0FF:
>       case XIVE_ESB_SET_PQ_11 ... XIVE_ESB_SET_PQ_11 + 0x0FF:
> +        if (offset == XIVE_ESB_SET_PQ_10 &&
> +            xsrc->esb_flags & XIVE_SRC_STORE_EOI) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "XIVE: load-after-store ordering "
> +                          "not enforced with Store EOI active for IRQ %d\n",
> +                          srcno);
> +        }
>           ret = xive_source_esb_set(xsrc, srcno, (offset >> 8) & 0x3);
>           break;
>       default:
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 8ffb13ada08e..6b888c963ac4 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1210,11 +1210,18 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
>        * otherwise terminate the boot.
>        */
>       if (guest_xive) {
> +        bool enable;
> +
>           if (!spapr->irq->xive) {
>               error_report(
>   "Guest requested unavailable interrupt mode (XIVE), try the ic-mode=xive or ic-mode=dual machine property");
>               exit(EXIT_FAILURE);
>           }
> +
> +        /* Advertise StoreEOI for a P10 compat guest. */
> +        enable = ppc_check_compat(cpu, CPU_POWERPC_LOGICAL_3_10, 0,
> +                                  cpu->compat_pvr);
> +        spapr_xive_enable_store_eoi(spapr->xive, enable);
>       } else {
>           if (!spapr->irq->xics) {
>               error_report(

