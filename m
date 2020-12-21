Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877D02E0199
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 21:37:42 +0100 (CET)
Received: from localhost ([::1]:45090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krRw5-00012E-JW
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 15:37:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1krRuN-0007zs-4f; Mon, 21 Dec 2020 15:35:55 -0500
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:44220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1krRuJ-0003i8-QJ; Mon, 21 Dec 2020 15:35:54 -0500
Received: by mail-qt1-x82d.google.com with SMTP id u21so7523938qtw.11;
 Mon, 21 Dec 2020 12:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oXwll2BOrzU4es4pd8p7n0axQHw8zIk9/L8/J55rAfc=;
 b=ceL7ID8OtxMoC8CXhkHB5NOnft/oF37YPmxDDs2Fyb46YHfu9f0GoaJk5CVzgl+tcR
 Z0KMDuSbrCuBSY23KCYf3F6LhpUFUH417ivEaXs3bM4d8bLbUJOcpcvXOOFwxWikzqSb
 LJQIzHqNVtCUNKnFcLDnsCDbvLgDwrkWaRRXuVIG1o+ypc9kGaROhWQrb59IZ9GJKd7E
 3ReSC5KRKa0/mxI5qnAZDMTqEhx51zuoGqxy6lf5gN34BdqM+ZckEOQNZDv7UT5PZTcz
 6495xSv9KhfzMzcl+qg9p7rLbMWCexcA0MyCOuBXx40s9jPB62iPZPfZwTfElxUJnOUR
 dD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oXwll2BOrzU4es4pd8p7n0axQHw8zIk9/L8/J55rAfc=;
 b=D8sM35i86xTxf9wsD4u9oPN6fOipSu8XfynYQ72hZGrt8ujzz6lUFRJ+QY1C+0cGKI
 lNOCowErrrKo9wFd5/ZJ1a+p6FhedWNS3rHLjVCGlHoH8GYhVC5tNzvPI+052Mm747Tg
 PVTB/GbpdHMTYSbEVQVfZpCqsdNd3aoUUHza/4sOitzSwt+p8ocvYnkJEnicoYjkXdRK
 U/4WpgsGFl3ftIHYShVWexW0FheXbmdfXRP4Zsmo5uz5d0QvUWpKlqzHHV9cZNJb5Mvb
 5RIYNn1aqRPXYWCE8S66sgeCVjzwBa15BDn16NxRH52XjdGzuVFccduMKkA+0F9Agb58
 UhkA==
X-Gm-Message-State: AOAM53004w+jsyEbiIgs8R14uCl1E6TmQnocaBwLlfjwVUUDNHCwkdFX
 H4utYrCqCDwJxpPM4sJ1pg8=
X-Google-Smtp-Source: ABdhPJxhfz4TFAyweSU9oagC+Gjx8VsHVvYWlwk21ElsXlMj5mG69lWi1BVQKdtH7RgD/YlNiBiTVA==
X-Received: by 2002:ac8:3ac5:: with SMTP id x63mr18337467qte.376.1608582950590; 
 Mon, 21 Dec 2020 12:35:50 -0800 (PST)
Received: from ?IPv6:2804:431:c7c6:556d:fa44:43b8:486b:f066?
 ([2804:431:c7c6:556d:fa44:43b8:486b:f066])
 by smtp.gmail.com with ESMTPSA id 184sm2701659qkg.92.2020.12.21.12.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 12:35:49 -0800 (PST)
Subject: Re: [PATCH 3/6] spapr: Introduce spapr_drc_reset_all()
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20201218103400.689660-1-groug@kaod.org>
 <20201218103400.689660-4-groug@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <09c16282-941c-a9d1-3fef-1cedf5e08ecd@gmail.com>
Date: Mon, 21 Dec 2020 17:35:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218103400.689660-4-groug@kaod.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.233,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/18/20 7:33 AM, Greg Kurz wrote:
> No need to expose the way DRCs are traversed outside of spapr_drc.c.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/spapr_drc.h |  6 ++++++
>   hw/ppc/spapr_drc.c         | 31 +++++++++++++++++++++++++++++
>   hw/ppc/spapr_hcall.c       | 40 ++++++--------------------------------
>   3 files changed, 43 insertions(+), 34 deletions(-)
> 
> diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
> index 5d80019f82e2..8982927d5c24 100644
> --- a/include/hw/ppc/spapr_drc.h
> +++ b/include/hw/ppc/spapr_drc.h
> @@ -245,6 +245,12 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask);
>   void spapr_drc_attach(SpaprDrc *drc, DeviceState *d);
>   void spapr_drc_detach(SpaprDrc *drc);
>   
> +/*
> + * Reset all DRCs, causing pending hot-plug/unplug requests to complete.
> + * Safely handles potential DRC removal (eg. PHBs or PCI bridges).
> + */
> +void spapr_drc_reset_all(struct SpaprMachineState *spapr);
> +
>   static inline bool spapr_drc_unplug_requested(SpaprDrc *drc)
>   {
>       return drc->unplug_requested;
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 5b5e2ac58a7e..a4d2608017c5 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -949,6 +949,37 @@ out:
>       return ret;
>   }
>   
> +void spapr_drc_reset_all(SpaprMachineState *spapr)
> +{
> +    Object *drc_container;
> +    ObjectProperty *prop;
> +    ObjectPropertyIterator iter;
> +
> +    drc_container = container_get(object_get_root(), DRC_CONTAINER_PATH);
> +restart:
> +    object_property_iter_init(&iter, drc_container);
> +    while ((prop = object_property_iter_next(&iter))) {
> +        SpaprDrc *drc;
> +
> +        if (!strstart(prop->type, "link<", NULL)) {
> +            continue;
> +        }
> +        drc = SPAPR_DR_CONNECTOR(object_property_get_link(drc_container,
> +                                                          prop->name,
> +                                                          &error_abort));
> +
> +        /*
> +         * This will complete any pending plug/unplug requests.
> +         * In case of a unplugged PHB or PCI bridge, this will
> +         * cause some DRCs to be destroyed and thus potentially
> +         * invalidate the iterator.
> +         */
> +        if (spapr_drc_reset(drc)) {
> +            goto restart;
> +        }
> +    }
> +}
> +
>   /*
>    * RTAS calls
>    */
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index aa22830ac4bd..e5dfc1ba7acc 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1632,39 +1632,6 @@ static uint32_t cas_check_pvr(PowerPCCPU *cpu, uint32_t max_compat,
>       return best_compat;
>   }
>   
> -static void spapr_handle_transient_dev_before_cas(SpaprMachineState *spapr)
> -{
> -    Object *drc_container;
> -    ObjectProperty *prop;
> -    ObjectPropertyIterator iter;
> -
> -    drc_container = container_get(object_get_root(), "/dr-connector");
> -restart:
> -    object_property_iter_init(&iter, drc_container);
> -    while ((prop = object_property_iter_next(&iter))) {
> -        SpaprDrc *drc;
> -
> -        if (!strstart(prop->type, "link<", NULL)) {
> -            continue;
> -        }
> -        drc = SPAPR_DR_CONNECTOR(object_property_get_link(drc_container,
> -                                                          prop->name,
> -                                                          &error_abort));
> -
> -        /*
> -         * This will complete any pending plug/unplug requests.
> -         * In case of a unplugged PHB or PCI bridge, this will
> -         * cause some DRCs to be destroyed and thus potentially
> -         * invalidate the iterator.
> -         */
> -        if (spapr_drc_reset(drc)) {
> -            goto restart;
> -        }
> -    }
> -
> -    spapr_clear_pending_hotplug_events(spapr);
> -}
> -
>   target_ulong do_client_architecture_support(PowerPCCPU *cpu,
>                                               SpaprMachineState *spapr,
>                                               target_ulong vec,
> @@ -1822,7 +1789,12 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
>   
>       spapr_irq_update_active_intc(spapr);
>   
> -    spapr_handle_transient_dev_before_cas(spapr);
> +    /*
> +     * Process all pending hot-plug/unplug requests now. An updated full
> +     * rendered FDT will be returned to the guest.
> +     */
> +    spapr_drc_reset_all(spapr);
> +    spapr_clear_pending_hotplug_events(spapr);
>   
>       /*
>        * If spapr_machine_reset() did not set up a HPT but one is necessary
> 

