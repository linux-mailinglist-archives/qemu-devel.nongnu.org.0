Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3DC30B606
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 04:46:20 +0100 (CET)
Received: from localhost ([::1]:57118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6mdv-0006z2-U0
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 22:46:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mcC-00068Y-6n
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:44:32 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:33515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mc9-000835-B1
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:44:32 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id DD1D05803E9;
 Mon,  1 Feb 2021 22:44:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 01 Feb 2021 22:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=s
 E/rjxOWFB4fqE1YR+k+d0eWoJeqo3JuHcicQLdn/Tc=; b=rfe32EOyCQzqh8hH1
 Xi1mIkdFVh/wJNJdkCLUnIluHMOmfDm4yYkcOd5hO+gdSlrSKqGSo0NW+pFr5AnX
 VoFYg3ngotpVTXp2z/VuLntJcRLNR1Er8uLLIPHhX6DlViLl+FL+EGVRmCBildRP
 UCntDJvy2FpS1UnrKVpTqb4pOT4wNDn+aHsvaLS9yu403vdbldwhcLYyoEjmlSd6
 y8yU4bipOE2M2o5uwgxauCcv+c+SxI+fv5GVPexeFxJ7+9Gc4wLxJbLnKE4q2PRY
 1dKwRTXOlx8H7ZrWg68p4ZXfKgw3R1d4aFOrw0UOIYMZa+34TGGVaKRajafNkRws
 sO83g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=sE/rjxOWFB4fqE1YR+k+d0eWoJeqo3JuHcicQLdn/
 Tc=; b=g31auNb21haP2ZUTBdJ2WL7+BoQsGMR+Wy2Zip9UZDEK4gXVavRoro2lE
 9mc/Z1XtF/Cl94dDIZg6PHG4r0FHh46BAZ5Wbt/qG2hLllvAYl0sCcTU2wlKOYgq
 rihOegyqiHrrgKjl54nfnymxr5hBpxFV43bzlyEC1MGlNFg/R6Z5Nn15nAfDoiUA
 ypAVIErob7N3yVLgGg7sevy9+Ls8M8jUGK+PmCBzdRHoqaKG8+yeOuKwdbkNerwV
 xXRb4orFRUleIUjPLhdrnPgrUpNJ1dSEy4Y4WsFQ3baxtd9++JoFqfpx6eOm0vAB
 58dcIiCBpqVG5cpR0Z9BAKDqHDJOg==
X-ME-Sender: <xms:nMoYYK0ykN22xYUM3BgO40XTYAvVr5z7mkYbYa_RK3RiRzN6hJIc-g>
 <xme:nMoYYNCC3gnWYxtgyeHRZfIoSX_UOMp6pwpsqFAtn78rg1PrAZK_RPGmwVYgpOvmE
 h-Bj7LrliwjoLZ_LDE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeduheegrddujedruddvrdelkeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:nMoYYPyHKbZthWvw5QKevypl-JjVXt7LlE-arryEDdufvLZ2nPMk0Q>
 <xmx:nMoYYDk71oUIMsZ3AdrN11buSmC75pc5EUMeWoej7uFCT3Z4tDqZIQ>
 <xmx:nMoYYMF294rgW4M84KTydyGImsmo9rTXbmsGDDDq-MLurk9lPAY-_A>
 <xmx:nMoYYEr7ySZx5owFxgSC6y0ZwtjP7hNzmzPO7eyFS-sHCjOs5I_Xlw>
Received: from [0.0.0.0] (unknown [154.17.12.98])
 by mail.messagingengine.com (Postfix) with ESMTPA id F36D51080057;
 Mon,  1 Feb 2021 22:44:25 -0500 (EST)
Subject: Re: [PATCH 13/13] target/mips: Let CPUMIPSTLBContext::map_address()
 take MMUAccessType
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210128144125.3696119-1-f4bug@amsat.org>
 <20210128144125.3696119-14-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <4a2b73d6-1541-5e8e-06ff-30ab2dabc99e@flygoat.com>
Date: Tue, 2 Feb 2021 11:44:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128144125.3696119-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=66.111.4.224;
 envelope-from=jiaxun.yang@flygoat.com; helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021/1/28 下午10:41, Philippe Mathieu-Daudé 写道:
> get_seg_physical_address() calls CPUMIPSTLBContext::map_address()
> handlers passing a MMUAccessType type. Update the prototype
> handlers to take a MMUAccessType argument, as it is stricter than
> an integer.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   target/mips/internal.h   |  8 ++++----
>   target/mips/tlb_helper.c | 12 ++++++------
>   2 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/target/mips/internal.h b/target/mips/internal.h
> index 34915c275c4..99264b8bf6a 100644
> --- a/target/mips/internal.h
> +++ b/target/mips/internal.h
> @@ -111,7 +111,7 @@ struct CPUMIPSTLBContext {
>       uint32_t nb_tlb;
>       uint32_t tlb_in_use;
>       int (*map_address)(struct CPUMIPSState *env, hwaddr *physical, int *prot,
> -                       target_ulong address, int rw);
> +                       target_ulong address, MMUAccessType access_type);
>       void (*helper_tlbwi)(struct CPUMIPSState *env);
>       void (*helper_tlbwr)(struct CPUMIPSState *env);
>       void (*helper_tlbp)(struct CPUMIPSState *env);
> @@ -126,11 +126,11 @@ struct CPUMIPSTLBContext {
>   };
>   
>   int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
> -                       target_ulong address, int rw);
> +                       target_ulong address, MMUAccessType access_type);
>   int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
> -                          target_ulong address, int rw);
> +                          target_ulong address, MMUAccessType access_type);
>   int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
> -                    target_ulong address, int rw);
> +                    target_ulong address, MMUAccessType access_type);
>   void r4k_helper_tlbwi(CPUMIPSState *env);
>   void r4k_helper_tlbwr(CPUMIPSState *env);
>   void r4k_helper_tlbp(CPUMIPSState *env);
> diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
> index 14f5b1a0a9c..2dc8ecafc3b 100644
> --- a/target/mips/tlb_helper.c
> +++ b/target/mips/tlb_helper.c
> @@ -39,7 +39,7 @@ enum {
>   
>   /* no MMU emulation */
>   int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
> -                       target_ulong address, int rw)
> +                       target_ulong address, MMUAccessType access_type)
>   {
>       *physical = address;
>       *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> @@ -48,7 +48,7 @@ int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
>   
>   /* fixed mapping MMU emulation */
>   int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
> -                          target_ulong address, int rw)
> +                          target_ulong address, MMUAccessType access_type)
>   {
>       if (address <= (int32_t)0x7FFFFFFFUL) {
>           if (!(env->CP0_Status & (1 << CP0St_ERL))) {
> @@ -68,7 +68,7 @@ int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
>   
>   /* MIPS32/MIPS64 R4000-style MMU emulation */
>   int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
> -                    target_ulong address, int rw)
> +                    target_ulong address, MMUAccessType access_type)
>   {
>       uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
>       uint32_t MMID = env->CP0_MemoryMapID;
> @@ -97,13 +97,13 @@ int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
>               if (!(n ? tlb->V1 : tlb->V0)) {
>                   return TLBRET_INVALID;
>               }
> -            if (rw == MMU_INST_FETCH && (n ? tlb->XI1 : tlb->XI0)) {
> +            if (access_type == MMU_INST_FETCH && (n ? tlb->XI1 : tlb->XI0)) {
>                   return TLBRET_XI;
>               }
> -            if (rw == MMU_DATA_LOAD && (n ? tlb->RI1 : tlb->RI0)) {
> +            if (access_type == MMU_DATA_LOAD && (n ? tlb->RI1 : tlb->RI0)) {
>                   return TLBRET_RI;
>               }
> -            if (rw != MMU_DATA_STORE || (n ? tlb->D1 : tlb->D0)) {
> +            if (access_type != MMU_DATA_STORE || (n ? tlb->D1 : tlb->D0)) {
>                   *physical = tlb->PFN[n] | (address & (mask >> 1));
>                   *prot = PAGE_READ;
>                   if (n ? tlb->D1 : tlb->D0) {


