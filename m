Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1920F5599CF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 14:46:35 +0200 (CEST)
Received: from localhost ([::1]:57956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ihl-0006rA-Ge
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 08:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4ieI-0004t7-M2; Fri, 24 Jun 2022 08:42:58 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:41580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4ieF-0002yo-PD; Fri, 24 Jun 2022 08:42:58 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-101bb9275bcso3572759fac.8; 
 Fri, 24 Jun 2022 05:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ptBjLkxx7QZFTmi93DJXG/oU9/+FB5nERIzob1QUBd8=;
 b=i84GQym0+UhIhP/zZQ6epJQrRgoyaUOcjGZfTFFcjHNddWsW5F6hXgIzm07ADNE4Gu
 4D97kCaa/1kcUyRgiCwJ/RpChVbBJF4RKJXJrKLv1ee5gkKKqpwptTOq9NALbUgXgYCr
 13fSAYrzP+/4YT/kOkoCC5vYMWKWRhsYxY965LmZJdLOEpCc450BIcQ44I91RR21d42X
 PbK4GSx6aWCVoudckVANLjgoBMcnbFekOHNLYPvDnRiPgoXlaZhas1yi/NMgZLiVyCu+
 m+muTLQ/HamRzeY+DZgZ1AlivDmylAwc0LcaTmkOkXF8UvPFCfc3QNC0ywiEhFWFy25s
 6/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ptBjLkxx7QZFTmi93DJXG/oU9/+FB5nERIzob1QUBd8=;
 b=6SGBRCZ0DzCw6RkqVq6W7jmIaUIMQwqcTVXkRfyScrmFryNVRhje0JtElvdjb2ak3o
 SeqDsOlBYgED7zJf1uJH9BNb2qzA8MANZK98TWeHnEO8PXotM2Ns8BfBcSX48yBiAywx
 2dLe1ypX8UKlDs5MZMIGVtjARxYsmeymfbNPE/1S7AbLzmOX27hTqpZ05N0nYBKtt1gt
 wc1WhYeLs8Xc4x7p3Hq6RqePfd6Hj9ZX+BW52r8IUmF/H+oQ/tHSu4McBnOiHZJHJHtz
 oRxy2nrprSW19Zj2ONMd/pvDCD2h3h5ZKTieAhJHktdxWZ7FRoOsKfCZ0Now5iTz+h8z
 NyuQ==
X-Gm-Message-State: AJIora9I6EcrrhnZExSh3lCzg4jijK31FQHdieZRoQaY4hXgVu9FbAxp
 t2qVN81qLa+HP6E4b6AvjEh6OWNsNdE=
X-Google-Smtp-Source: AGRyM1uAHiF468xHqhMYUm/aQZL6LGrlxyq2/As0vMjJmkd3ga/NcPVGHuln+dGpu9D09U+GOwNiBw==
X-Received: by 2002:a05:6870:b616:b0:e2:f8bb:5eb with SMTP id
 cm22-20020a056870b61600b000e2f8bb05ebmr1932530oab.218.1656074574054; 
 Fri, 24 Jun 2022 05:42:54 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05683019cd00b00614c1c39a84sm1501664otp.11.2022.06.24.05.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 05:42:53 -0700 (PDT)
Message-ID: <623b7f7d-6e88-40e9-a0f6-e0131cdd1069@gmail.com>
Date: Fri, 24 Jun 2022 09:42:51 -0300
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
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
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

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

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

