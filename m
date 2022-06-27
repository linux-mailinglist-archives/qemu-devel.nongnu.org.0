Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C61D55BC38
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 23:46:35 +0200 (CEST)
Received: from localhost ([::1]:50978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5wZ0-000540-Bz
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 17:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o5wTm-0007bo-RB; Mon, 27 Jun 2022 17:41:10 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:43540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o5wTl-0007dg-0c; Mon, 27 Jun 2022 17:41:10 -0400
Received: by mail-oi1-x22c.google.com with SMTP id q11so14633380oih.10;
 Mon, 27 Jun 2022 14:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6gQAlcMabLRTGfP2t4jNUzt7pV3giPefBPvRA10xUh4=;
 b=qWmHEnTg6WQHogGNYvBAGdFEKrXsl2+rPB9UF1VNJJ5m9GU8vIIYYRgLfmkM9sHJ+T
 uoQoFrftL5fNK8nO++vArKofQ+HxfGEJgZSEbGFHpTzZ3ltQ90Z77UHQwhTesO44lMjW
 zV+fptpO5z75Mf755rzExFGfXy1RCSQ2k7f6GPdUuoMsXrZ5gVxfJVFQkjAGv+izGu3e
 wYOLt32K1hLLDz6FPxmMtjAUPEVBJlzB5kDRSQl8ex1BuPhMEdZUOGRKdWIO+eH37WtP
 hXrbCbKamAFhu0n/pmk3om8/u/ddWSLdx9yS+upWGuG+ZJNjlboxH+iZHHtVtD18y/6W
 hXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6gQAlcMabLRTGfP2t4jNUzt7pV3giPefBPvRA10xUh4=;
 b=7oPG1tAwkG5MLsi1rLbpGI6Qm0NBanT7hymFcDz5YmbTKsw93GvTYeC5EBOT8OHHcu
 z9ur1jZZBb3skG9HLAYFOYPDPozkyu+bgFMbfTNgdEUyHq/g+SIwCiBR+fTOiKbJIcUN
 kWKb2FVy4VeirE1lcewnhIhJRunjSIVLn/s6Bn7inBCZLBZtDFGmSV5Rv4qu4A7bJSMD
 tZ6d2HZKyCFCkZqBN3AllIwj9ELw7jl9KxzUYx9APBxAqXf633Boh+eQWpYi1NTfQ6XM
 3tQodEcHArTSTBTCw7PcSVaoMU+D/9bo+Xan74ImLkTjN6HHFPK88QUnwMS1uHquUFit
 ku4w==
X-Gm-Message-State: AJIora/32nHWarlPrY4Cdgx7aAvrvw+wpGC9qF0x+K32ZbUc5uZIfaEu
 13LMJB/yCHtZ5DCStKv0tM+JtW5FN6A=
X-Google-Smtp-Source: AGRyM1tXaqX/XIGmK0CoxwY3elcxdOcODH/YWfjXg1m94H4iwG5nTR4qBe8LrAnzB0NnyM0y/EcD5Q==
X-Received: by 2002:a05:6808:1b2a:b0:32e:df2a:cfc4 with SMTP id
 bx42-20020a0568081b2a00b0032edf2acfc4mr8696252oib.288.1656366067653; 
 Mon, 27 Jun 2022 14:41:07 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a9d7298000000b0061691db3807sm5053763otj.23.2022.06.27.14.41.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 14:41:07 -0700 (PDT)
Message-ID: <77f0af29-f2aa-d122-236e-56dcf237ef1f@gmail.com>
Date: Mon, 27 Jun 2022 18:41:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH qemu v2] spapr/ddw: Reset DMA when the last non-default
 window is removed
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220622052955.1069903-1-aik@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220622052955.1069903-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 6/22/22 02:29, Alexey Kardashevskiy wrote:
> PAPR+/LoPAPR says:
> ===
> The platform must restore the default DMA window for the PE on a call
> to the ibm,remove-pe-dma-window RTAS call when all of the following
> are true:
>   a. The call removes the last DMA window remaining for the PE.
>   b. The DMA window being removed is not the default window
> 
> ===
> 
> This resets DMA as PAPR mandates.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> Changes:
> v2:
> * reverted changes to spapr_tce_table_enable()
> ---
>   include/hw/ppc/spapr.h  |  1 +
>   hw/ppc/spapr_iommu.c    |  3 ++-
>   hw/ppc/spapr_pci.c      |  1 +
>   hw/ppc/spapr_rtas_ddw.c | 15 +++++++++++++++
>   4 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 072dda2c7265..4ba2b27b8c4f 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -902,6 +902,7 @@ struct SpaprTceTable {
>       bool bypass;
>       bool need_vfio;
>       bool skipping_replay;
> +    bool def_win;
>       int fd;
>       MemoryRegion root;
>       IOMMUMemoryRegion iommu;
> diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
> index 81e5a1aea3a6..63e34d457a0e 100644
> --- a/hw/ppc/spapr_iommu.c
> +++ b/hw/ppc/spapr_iommu.c
> @@ -279,7 +279,7 @@ static const VMStateDescription vmstate_spapr_tce_table_ex = {
>   
>   static const VMStateDescription vmstate_spapr_tce_table = {
>       .name = "spapr_iommu",
> -    .version_id = 2,
> +    .version_id = 3,
>       .minimum_version_id = 2,
>       .pre_save = spapr_tce_table_pre_save,
>       .post_load = spapr_tce_table_post_load,
> @@ -292,6 +292,7 @@ static const VMStateDescription vmstate_spapr_tce_table = {
>           VMSTATE_BOOL(bypass, SpaprTceTable),
>           VMSTATE_VARRAY_UINT32_ALLOC(mig_table, SpaprTceTable, mig_nb_table, 0,
>                                       vmstate_info_uint64, uint64_t),
> +        VMSTATE_BOOL_V(def_win, SpaprTceTable, 3),
>   
>           VMSTATE_END_OF_LIST()
>       },
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index b2f5fbef0c83..5e95d7940fc8 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -2067,6 +2067,7 @@ void spapr_phb_dma_reset(SpaprPhbState *sphb)
>       tcet = spapr_tce_find_by_liobn(sphb->dma_liobn[0]);
>       spapr_tce_table_enable(tcet, SPAPR_TCE_PAGE_SHIFT, sphb->dma_win_addr,
>                              sphb->dma_win_size >> SPAPR_TCE_PAGE_SHIFT);
> +    tcet->def_win = true;
>   }
>   
>   static void spapr_phb_reset(DeviceState *qdev)
> diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
> index 13d339c807c1..bb7d91b6d1af 100644
> --- a/hw/ppc/spapr_rtas_ddw.c
> +++ b/hw/ppc/spapr_rtas_ddw.c
> @@ -215,6 +215,7 @@ static void rtas_ibm_remove_pe_dma_window(PowerPCCPU *cpu,
>       SpaprPhbState *sphb;
>       SpaprTceTable *tcet;
>       uint32_t liobn;
> +    bool def_win_removed;
>   
>       if ((nargs != 1) || (nret != 1)) {
>           goto param_error_exit;
> @@ -231,9 +232,23 @@ static void rtas_ibm_remove_pe_dma_window(PowerPCCPU *cpu,
>           goto param_error_exit;
>       }
>   
> +    def_win_removed = tcet->def_win;
>       spapr_tce_table_disable(tcet);
>       trace_spapr_iommu_ddw_remove(liobn);
>   
> +    /*
> +     * PAPR+/LoPAPR says:
> +     * The platform must restore the default DMA window for the PE on a call
> +     * to the ibm,remove-pe-dma-window RTAS call when all of the following
> +     * are true:
> +     * a. The call removes the last DMA window remaining for the PE.
> +     * b. The DMA window being removed is not the default window
> +     */
> +    if (spapr_phb_get_active_win_num(sphb) == 0 && !def_win_removed) {
> +        spapr_phb_dma_reset(sphb);
> +        trace_spapr_iommu_ddw_reset(sphb->buid, 0);
> +    }
> +
>       rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>       return;
>   

