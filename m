Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3BF45C5CB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:59:30 +0100 (CET)
Received: from localhost ([::1]:40486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpso5-0001bA-9b
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:59:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpsVc-0004gP-EL; Wed, 24 Nov 2021 08:40:24 -0500
Received: from [2607:f8b0:4864:20::a2a] (port=44612
 helo=mail-vk1-xa2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpsVa-0002Ng-B7; Wed, 24 Nov 2021 08:40:24 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id u68so1507364vke.11;
 Wed, 24 Nov 2021 05:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zIOhxdgObhI/lSelV1pZWAKRNcjuTnEXIOjjyfzlYPA=;
 b=FxLTH7Vbl3uCxcfMS7Ic73uALLc39VmjNu5rdpBbvXyJdvb31lWxtJSvXg1sue4Cq0
 pcgVWjs8oY1UhhhKRqavGTjXHyCGRR6s+3hOAVY1BVKYinOp5HY3c9mvZY9n99/p0aPX
 fXbJ0v+VF87QbSKJ1A3T61S7H2aYbkkllPZpN1SrirSpkQfF+KYZLNrU4z1Kt5aOYQAH
 9i9JZKGPe70moJNjJ2kAZlWwtt1ARVagXPywn+t4ImhMu0N9VJmQmUoFHtJ6Sr/sXIs/
 0kXzg2cJkXYozjvSV5waLIxkC8i4htdYz6DQ6eKU+Qvu+AvqjecFiGXDO8l3apD4nWNT
 nQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zIOhxdgObhI/lSelV1pZWAKRNcjuTnEXIOjjyfzlYPA=;
 b=3IxWwWhgg+Al6jU8166BMaaAgMIKKg7468MflVxHn9geZjv+/WQVfF5D4kQueu1Hes
 0Och9nDTAF1L5J7st7MRutMny9rH7b0eC7r1bkEGCe2hUIFDFLrULyGVi2sS3z8WPZsw
 5uSnGHeq3e+nH2iYqnpsdJEFeZxIA0R1bPLaH1bX1JEhx8A4puBMvfo5iGWQtLXdNWQy
 l4JX54bJdKv9L9JAJ8azBSIAyUbMdb/JuTDt2Pizafxu6/boDSoHPonC/497O83SfyXZ
 eYbLM4TovYGOJmS1snyGqwVOf00ddHNBxt3+ubSKeb/SoG+I3yxvgtJarret+lZyD15t
 CUWA==
X-Gm-Message-State: AOAM531DQYIIF/FnJsaoGa+935/sWpcTmLWXr0Q3+SPqK1RNRnC+2Js2
 USOoCNcHhQhq9P3hXn99NxI=
X-Google-Smtp-Source: ABdhPJyK2GBCXWcP/eTNxCChS0UNxCJuLvQ2cMaisNDRYuyn4Z0jqswt+c4AgeGGWTSS0R+eEvGdwQ==
X-Received: by 2002:a1f:3853:: with SMTP id f80mr26533505vka.0.1637761220781; 
 Wed, 24 Nov 2021 05:40:20 -0800 (PST)
Received: from [192.168.10.222] ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id g28sm7810741vkl.16.2021.11.24.05.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 05:40:20 -0800 (PST)
Message-ID: <00546896-2466-007f-b73c-fe4f889fac2f@gmail.com>
Date: Wed, 24 Nov 2021 10:40:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] target/ppc: fix Hash64 MMU update of PTE bit R
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211124120046.6831-1-leandro.lupori@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211124120046.6831-1-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2a.google.com
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



On 11/24/21 09:00, Leandro Lupori wrote:
> When updating the R bit of a PTE, the Hash64 MMU was using a wrong byte
> offset, causing the first byte of the adjacent PTE to be corrupted.
> This caused a panic when booting FreeBSD, using the Hash MMU.

If you add a "Fixes:" tag with the commit that introduced the code you're
fixing, we can push it right away as a bug fix in 6.2 (assuming it doesn't
break anything else, of course).

The commit to be fixed in the case seems to be a2dd4e83e76b ("ppc/hash64:
Rework R and C bit updates")

One more comment below:

> 
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>   target/ppc/mmu-hash64.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 19832c4b46..f165ac691a 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -786,7 +786,7 @@ static void ppc_hash64_set_dsi(CPUState *cs, int mmu_idx, uint64_t dar, uint64_t
>   
>   static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
>   {
> -    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 16;
> +    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 14;

Instead of adding a '14' you should add a new #define in mmu-hash64.h with this
value, something like "HPTE64_R_R_SHIFT". This will avoid hardcoding literals
around the code and forcing us to go to the ISA every time we wonder what's
an apparently random number represents. There's also a "HPTE64_R_R" defined
there but I'm not sure if it's usable here, so feel free to create a new
macro if needed.

In that note, the original commit that added this code also added a lot of
hardcoded "15" values for the C bit update in spapr_hpte_set_c() and
ppc_hash64_set_c(), and a "14" value like you're changing here in spapr_hpte_set_r().
If you're feeling generous I believe that another patch replacing these hardcoded values
with bit shift macros is warranted as well.


Thanks,


Daniel

>   
>       if (cpu->vhyp) {
>           PPCVirtualHypervisorClass *vhc =
> 

