Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AB455BC36
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 23:44:37 +0200 (CEST)
Received: from localhost ([::1]:45976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5wX6-0001f5-LB
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 17:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o5wTI-00070U-EQ; Mon, 27 Jun 2022 17:40:44 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:44896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o5wTG-0007aI-Sg; Mon, 27 Jun 2022 17:40:40 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-101e1a33fe3so14585999fac.11; 
 Mon, 27 Jun 2022 14:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=w+nSnw2ApuqEtOL4HTAiLPnZF6ze9e+UsqWBQ6eU+A8=;
 b=X3dJEBSzwB2LkyTZTCi9cqu8s6Dx/AU1cta21kYoeG0h4jaiNxxCiQbjI4YYXRpGiu
 orE+ks4J8Sz7b9gZds3wE5OlvM4DuCCYN7AEiZIehrpB3hox0OXCzDBHv95OKhcFdhvt
 NqGaOfLMdnqbG0ej0c5pawf8cag7XOYFG/N/rvZOEgZSJ05mTUiZx/2zWQC3tObnSi44
 V/fLcPTut5R8xT8SH2t2qjqDvs3bKRfL3MBNE1qYANkwSS1RT4kiLknG82wl9uNK76qZ
 PacuOoQ40BcXp2CJpcaUIiy5V+p8r/03oL9PQQU57sVGJRpisagmdk214FnE3veqJq3i
 xPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=w+nSnw2ApuqEtOL4HTAiLPnZF6ze9e+UsqWBQ6eU+A8=;
 b=ixH6Rxsh6wKMxfyyo+Pm0QZ2GXF+te8ebtL6lkLnqQi+CeM0baQN+x7d2TiDhFNf3X
 K26p8H7rUcfUxMcWFcnAhdbzKLaRU0rSkRQMGKii6cMh0CADXkznKbADHCtO03Ut7g7P
 +U3rD+JMad+AyyVeHXVxuO4bSeKDgA2rh1nr1h33NExNq5LwdP8L4XlE0jQ0wV8yMOCQ
 XXaG8qqTupslThLtOCTBHEegWRKqJSVAFL3xru/sv1OOfu8E+l1p1Nf+kgcNPMI0zMuk
 2wap51GXrBKIa7kc4UzKgB3Znd6g2Jvb505vaE9JC51k2UGsVdHaW3XVnILHCm91REBc
 ZYpA==
X-Gm-Message-State: AJIora+53L5bNCjDSAT/Gmd4eZB+cngmr+R6rJ+dIp/or4SRBPtYzmo8
 6MMXUGOUAHHNAyY2XwUDX4PvdBJGHB0=
X-Google-Smtp-Source: AGRyM1vVt78+4acC7R3yfJlBq3ErlopqqkRJLaCiQONbnISdIFX9f+BQNIcr2ZDDjOy4dMRqk6Hkhg==
X-Received: by 2002:a05:6870:461b:b0:e9:a015:36a6 with SMTP id
 z27-20020a056870461b00b000e9a01536a6mr10854274oao.185.1656366036690; 
 Mon, 27 Jun 2022 14:40:36 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a05680809b300b0032efb577cbasm5974126oig.8.2022.06.27.14.40.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 14:40:36 -0700 (PDT)
Message-ID: <eaf36385-90dd-908c-4772-2397690ad01d@gmail.com>
Date: Mon, 27 Jun 2022 18:40:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH qemu] spapr/ddw: Implement 64bit query extension
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220623073136.1380214-1-aik@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220623073136.1380214-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
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

On 6/23/22 04:31, Alexey Kardashevskiy wrote:
> PAPR 2.8 (2018) defines an extension to return 64bit value for
> the largest TCE block in "ibm,query-pe-dma-window". Recent Linux kernels
> support this already.
> 
> This adds the extension and supports the older format.
> 
> This advertises a bigger window for the new format as the biggest
> window with 2M pages below the start of the 64bit window as it is
> the maximum we will see in practice.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>   hw/ppc/spapr_pci.c      |  5 +++--
>   hw/ppc/spapr_rtas_ddw.c | 19 +++++++++++++++----
>   2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 5e95d7940fc8..67e9d468aa9c 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -2360,8 +2360,9 @@ int spapr_dt_phb(SpaprMachineState *spapr, SpaprPhbState *phb,
>           cpu_to_be32(RTAS_IBM_REMOVE_PE_DMA_WINDOW)
>       };
>       uint32_t ddw_extensions[] = {
> -        cpu_to_be32(1),
> -        cpu_to_be32(RTAS_IBM_RESET_PE_DMA_WINDOW)
> +        cpu_to_be32(2),
> +        cpu_to_be32(RTAS_IBM_RESET_PE_DMA_WINDOW),
> +        cpu_to_be32(1), /* 1: ibm,query-pe-dma-window 6 outputs, PAPR 2.8 */
>       };
>       SpaprTceTable *tcet;
>       SpaprDrc *drc;
> diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
> index bb7d91b6d1af..7ba11382bc3f 100644
> --- a/hw/ppc/spapr_rtas_ddw.c
> +++ b/hw/ppc/spapr_rtas_ddw.c
> @@ -100,7 +100,7 @@ static void rtas_ibm_query_pe_dma_window(PowerPCCPU *cpu,
>       uint64_t buid;
>       uint32_t avail, addr, pgmask = 0;
>   
> -    if ((nargs != 3) || (nret != 5)) {
> +    if ((nargs != 3) || ((nret != 5) && (nret != 6))) {
>           goto param_error_exit;
>       }
>   
> @@ -118,9 +118,20 @@ static void rtas_ibm_query_pe_dma_window(PowerPCCPU *cpu,
>   
>       rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>       rtas_st(rets, 1, avail);
> -    rtas_st(rets, 2, 0x80000000); /* The largest window we can possibly have */
> -    rtas_st(rets, 3, pgmask);
> -    rtas_st(rets, 4, 0); /* DMA migration mask, not supported */
> +    if (nret == 6) {
> +        /*
> +         * Set the Max TCE number as 1<<(58-21) = 0x20.0000.0000
> +         * 1<<59 is the huge window start and 21 is 2M page shift.
> +         */
> +        rtas_st(rets, 2, 0x00000020);
> +        rtas_st(rets, 3, 0x00000000);
> +        rtas_st(rets, 4, pgmask);
> +        rtas_st(rets, 5, 0); /* DMA migration mask, not supported */
> +    } else {
> +        rtas_st(rets, 2, 0x80000000);
> +        rtas_st(rets, 3, pgmask);
> +        rtas_st(rets, 4, 0); /* DMA migration mask, not supported */
> +    }
>   
>       trace_spapr_iommu_ddw_query(buid, addr, avail, 0x80000000, pgmask);
>       return;

