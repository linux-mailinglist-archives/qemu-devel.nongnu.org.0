Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530E445E0EA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 20:19:43 +0100 (CET)
Received: from localhost ([::1]:38224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqKHV-0005H4-QF
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 14:19:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqKG0-0004P4-VX; Thu, 25 Nov 2021 14:18:08 -0500
Received: from [2607:f8b0:4864:20::a2d] (port=35650
 helo=mail-vk1-xa2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqKFz-0005te-7t; Thu, 25 Nov 2021 14:18:08 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id q21so4548562vkn.2;
 Thu, 25 Nov 2021 11:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hkIyIM0jeHEXHnmYPlBIe59+HxuuTIYXfLPRP195iQ8=;
 b=Vh+RFsY8I638MbIMCAvxOFH34YLmcoN4WIKuKZDn8gw2rCsAw5rTsW0IA3/6eXu1NZ
 lN9PbqBkKUqeRl69FZAji2sIcxwd24ubJWEFBwhDMJJU3IPrwGb5GZ3XbRh4Z9UClUAJ
 yqJY26et/q25/U9RhuVTRPpQOE9zyRWCjDRG62vFcmwmIIWkkRGDqLp8rDEH89kg2xiv
 n/mkfOc3ALPb7jsWcDBsXY7bmzSzhIpNPv75U5lzrcdOa8ZtX6R/GQ/b1vvQtqYYaT2r
 TiVuNKlUaye3m7xM9aiWrHiooXgoIRZNiYOIGYvyV/sRI+98PqbPrvRhC0Ij1eWMFzMz
 P72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hkIyIM0jeHEXHnmYPlBIe59+HxuuTIYXfLPRP195iQ8=;
 b=k0sCsjEU0rP/HSSBLuliXq+oxiWIKzn/f2ZadRCK5wKWUQNHGsroAsR/9LggQ8ekjH
 OXfrN/cryO7B6rlQZV1ZpAWak3ZLl8nROR907aHrVcW+c3kEjbFwRLvWNzkbo0M1iEFd
 6s7L2AWYLCwsPo3wWrxgpeb2Ttf3XsbhIKbEZmrNXdHJnQmen5mtPURx42F1eNbBRngu
 qtiveVmvzWJR/c0llS4sBtXUwLu/sldftdYEB70bYkOufcg6u9StxdIys49ocOu9SsyU
 i8mqjgmRlwSZiKFtD19b1Tw8ql1TxiQs1x2i+jBI4XP4aOm3lVeZf9tfOIhLvBQ8+BDP
 YpoA==
X-Gm-Message-State: AOAM532mWLDzP0BWOjgeS2FSydqbj0EnOIwdF9hyON+ciqIQKAHyUxkT
 NDyVS9UjpykI6UqqDdr56QU=
X-Google-Smtp-Source: ABdhPJy7CIFHTKRtXkCYGfNGKFkY0QjFOkhq5Q4fbxnzPHesyLwOGEalobQUMQvuvzlpLXWTVgLGIg==
X-Received: by 2002:a1f:298b:: with SMTP id p133mr14526139vkp.29.1637867885598; 
 Thu, 25 Nov 2021 11:18:05 -0800 (PST)
Received: from [192.168.10.222] ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id n10sm2528027uaj.20.2021.11.25.11.18.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 11:18:05 -0800 (PST)
Message-ID: <ba1b72df-29e4-3a13-5cfc-be02f2b13b4a@gmail.com>
Date: Thu, 25 Nov 2021 16:18:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] target/ppc: fix Hash64 MMU update of PTE bit R
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211125183322.47230-1-leandro.lupori@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211125183322.47230-1-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.1,
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
Cc: groug@kaod.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/25/21 15:33, Leandro Lupori wrote:
> When updating the R bit of a PTE, the Hash64 MMU was using a wrong byte
> offset, causing the first byte of the adjacent PTE to be corrupted.
> This caused a panic when booting FreeBSD, using the Hash MMU.
> 
> Fixes: a2dd4e83e76b ("ppc/hash64: Rework R and C bit updates")
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> Changes from v1:
> - Add and use a new define for the byte offset of PTE bit R
> ---
>   target/ppc/mmu-hash64.c | 2 +-
>   target/ppc/mmu-hash64.h | 3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 19832c4b46..0968927744 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -786,7 +786,7 @@ static void ppc_hash64_set_dsi(CPUState *cs, int mmu_idx, uint64_t dar, uint64_t
>   
>   static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
>   {
> -    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 16;
> +    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + HPTE64_R_R_BYTE_OFFSET;
>   
>       if (cpu->vhyp) {
>           PPCVirtualHypervisorClass *vhc =
> diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
> index c5b2f97ff7..40bb901262 100644
> --- a/target/ppc/mmu-hash64.h
> +++ b/target/ppc/mmu-hash64.h
> @@ -97,6 +97,9 @@ void ppc_hash64_finalize(PowerPCCPU *cpu);
>   #define HPTE64_V_1TB_SEG        0x4000000000000000ULL
>   #define HPTE64_V_VRMA_MASK      0x4001ffffff000000ULL
>   
> +/* PTE byte offsets */
> +#define HPTE64_R_R_BYTE_OFFSET  14
> +
>   /* Format changes for ARCH v3 */
>   #define HPTE64_V_COMMON_BITS    0x000fffffffffffffULL
>   #define HPTE64_R_3_0_SSIZE_SHIFT 58
> 

