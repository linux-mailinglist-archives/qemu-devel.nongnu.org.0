Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE0B5599D5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 14:50:13 +0200 (CEST)
Received: from localhost ([::1]:36468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ilH-0003aY-Gp
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 08:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4ihk-0000EV-3y; Fri, 24 Jun 2022 08:46:32 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:47008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4ihh-0003ya-GF; Fri, 24 Jun 2022 08:46:31 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1013ecaf7e0so3548151fac.13; 
 Fri, 24 Jun 2022 05:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qVdY6wOKCfPCq8QakcyBc9SNKHu7vHuxUq+Z0WM70Uw=;
 b=M57/vT7AKCg67KNKIrzqZwPrrIPh//1BytOmYQqaT8XgwOqVhklWlOu9T5GUNFgxs9
 Eh6tAsEOXcuIP03ZQO0X7CzZKI0Y5DTLyTpGEt1s+8bTokN8H+EVdFSaC5hT/bMeO/sZ
 SUiRbAzGkqSvspPR7dS/ELNj9LhWTuhUbBixmSXIX3cyLUt6jjDoZa+fa7m3kyH/K/u0
 uhXgz0rLYrjEDfTik6RTKk0ptNdR4tkIMCt7+ZM/p1aRPoaSUTmFCht07janT8g62TfV
 2cZUfEH2hnIOuECFxUjvl0YywRgTrdKyVkm1temuOhZCvNK4fSwR4V3hm4AgcZytCqHk
 0cYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qVdY6wOKCfPCq8QakcyBc9SNKHu7vHuxUq+Z0WM70Uw=;
 b=F3lSw9VkWQj2E3PRlMONS/dwuIf0I+eMkUtHGxTTornT1r6uv5lnG3PMwjRQnlGwm8
 ZOGm3mVyQzE5hR7ZTaC8LTTS7K9nq5+gRiHitbAcisfM1c0gOAJRRCg88Oxb4QEO14CQ
 oMJRKgVR/00pcr7RZM84Um+JRqeInhHPO2Qg4RkQ91+d2ws2WW4MwcnDQT92YbczQYMA
 Xi2JQVBtjsoJQniLMdiVVGVfGs/4SL7sAcIJXV/Jd8kyga2szvMmX6XXt7mynDktd9QA
 nhDv1TCHXJ8/W7u6NrFTQOhuZqNwTxa6MrwK91UcGhvi/EvudkWnRDvyinn26Uw2wzrB
 sTkQ==
X-Gm-Message-State: AJIora+feG5tuLD9KbbE1Y6afhTsyh8H48tN0JhGXkR3VLrCO3AgzlTd
 iX0hiWUJhSPhNePMyFbe69Dl/6SmYoo=
X-Google-Smtp-Source: AGRyM1t/gEaHCe8CxK4Zd/KYBXsHxbtkuHbr/HQ2jqzjy1tADaXE/GpQRCGql1HUazD4DBM37JbCWg==
X-Received: by 2002:a05:6870:311:b0:f2:d46a:b363 with SMTP id
 m17-20020a056870031100b000f2d46ab363mr1947786oaf.103.1656074787615; 
 Fri, 24 Jun 2022 05:46:27 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a05687101ca00b000fb2aa6eef2sm1709458oad.32.2022.06.24.05.46.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 05:46:27 -0700 (PDT)
Message-ID: <a78b9688-4e70-21a1-2b28-0e573a6ac227@gmail.com>
Date: Fri, 24 Jun 2022 09:46:23 -0300
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
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
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

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

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

