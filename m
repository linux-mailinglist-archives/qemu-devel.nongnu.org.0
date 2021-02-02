Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC3830B5C7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 04:23:24 +0100 (CET)
Received: from localhost ([::1]:58834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6mHj-0003Bg-GR
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 22:23:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mGh-0002hM-Mj
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:22:19 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:55851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mGc-000852-Kp
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:22:19 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id D0F2858031C;
 Mon,  1 Feb 2021 22:22:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 01 Feb 2021 22:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=H
 sTI7R70J6sfNc/ki01f+ZAGFHUtCKEM284DGaC1J3c=; b=DVOi0C4Y3XaPHHL4i
 4iOrkXZwL4Zvno3WFCH3VpuRL0FvNrf47QlPAlA/DOfbxHmOA0l7jWvYuhO7IFi7
 GKLs0YWU5LhdSNrJx6gudOqBBPrLHNsertb3AxScV4SodOuBIbHuC7m9J1JVym7M
 8SbCB8zyaM0J1czbXPQUuiptfvxAhdYPza3aUlmue5NXg9++pEWWpOEGvGoHS7zc
 yzbcR8zmRh/joFLsUc9aJqembveapw39758acdPrZGP4sf2d8KxiXuaC9IcPfbKh
 cTSdOnfXxbRVo8MpKNJqyxLo/PenCO9gaBvj8eb/A3cZ6vbWcR8hGIiGqPg7EDDs
 dJ40A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=HsTI7R70J6sfNc/ki01f+ZAGFHUtCKEM284DGaC1J
 3c=; b=QzJzcGQPCU9jVzQ/r5884UOba3yE43PWAGq6I5wB6rxcZ2i1n4rhn+X/e
 O6URO2g3hhZSJ8MKW0WbfykH643g15y48iTQtgrwhTQCChp+i2Kd5qZ90i4qop4f
 Ql6iwVE9ByVeAkEITEocO0dalz4qax97udwEv95vbk73u38CEBdNw0JdzP3ev/97
 BDUr/U7vro+JhNP8Z5eNM3Te5MbAYeiu3vbM60+LiRWQm5NaZ93Y/xuUTYQKLdgi
 Rka1CF4yfrvpVMRRUmC+zwCIYe81UjNISJP7fgwgOsSlwYMENdTT3TIn6t52mYyp
 I9zyqCjOyPmWrbte9g0kSyxmEJ7Gg==
X-ME-Sender: <xms:YcUYYKgJ1H5lHtclBuGiNXPDk8b23nF9NVELRip6q8TmWLxLu_CDIw>
 <xme:YcUYYLAoy1_QGZUQ5WAoEOird6Z7oUvyyGG8ckdGgiAlSDoqAHRoN2pg5CyzJkaqT
 OgGpUKI6_cm2zIy_h8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeduheegrddujedruddvrdelkeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:YcUYYCHLrmkn8SYSfE37j5gwtpm654K0CMxIugivRNzYKfRTOfRpaA>
 <xmx:YcUYYDSPOy8vWyAiJ7H8YYIwII2fRFKNQyrd3iSLv-GXEmLvavpa3A>
 <xmx:YcUYYHx1OPeEDN7mZy2XtYcoApyFunXpmTMTM4Lv3auXYT1zQCO2Ow>
 <xmx:YsUYYJsgur6gdYexGkkubHr1hYfPAEGZSTd7iGUo84GoTh0qG0XytQ>
Received: from [0.0.0.0] (unknown [154.17.12.98])
 by mail.messagingengine.com (Postfix) with ESMTPA id 615061080057;
 Mon,  1 Feb 2021 22:22:07 -0500 (EST)
Subject: Re: [PATCH 01/13] target/mips: Remove access_type argument from
 map_address() handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210128144125.3696119-1-f4bug@amsat.org>
 <20210128144125.3696119-2-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <fb5de051-a279-886a-7fef-a567b32785fd@flygoat.com>
Date: Tue, 2 Feb 2021 11:22:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128144125.3696119-2-f4bug@amsat.org>
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
> TLB map_address() handlers don't use the 'access_type' argument,
> remove it to simplify.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   target/mips/internal.h   |  8 ++++----
>   target/mips/tlb_helper.c | 15 +++++++--------
>   2 files changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/target/mips/internal.h b/target/mips/internal.h
> index 5dd17ff7333..d09afded5ea 100644
> --- a/target/mips/internal.h
> +++ b/target/mips/internal.h
> @@ -111,7 +111,7 @@ struct CPUMIPSTLBContext {
>       uint32_t nb_tlb;
>       uint32_t tlb_in_use;
>       int (*map_address)(struct CPUMIPSState *env, hwaddr *physical, int *prot,
> -                       target_ulong address, int rw, int access_type);
> +                       target_ulong address, int rw);
>       void (*helper_tlbwi)(struct CPUMIPSState *env);
>       void (*helper_tlbwr)(struct CPUMIPSState *env);
>       void (*helper_tlbp)(struct CPUMIPSState *env);
> @@ -126,11 +126,11 @@ struct CPUMIPSTLBContext {
>   };
>   
>   int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
> -                       target_ulong address, int rw, int access_type);
> +                       target_ulong address, int rw);
>   int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
> -                          target_ulong address, int rw, int access_type);
> +                          target_ulong address, int rw);
>   int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
> -                    target_ulong address, int rw, int access_type);
> +                    target_ulong address, int rw);
>   void r4k_helper_tlbwi(CPUMIPSState *env);
>   void r4k_helper_tlbwr(CPUMIPSState *env);
>   void r4k_helper_tlbp(CPUMIPSState *env);
> diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
> index 082c17928d3..1af2dc969d6 100644
> --- a/target/mips/tlb_helper.c
> +++ b/target/mips/tlb_helper.c
> @@ -39,7 +39,7 @@ enum {
>   
>   /* no MMU emulation */
>   int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
> -                       target_ulong address, int rw, int access_type)
> +                       target_ulong address, int rw)
>   {
>       *physical = address;
>       *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> @@ -48,7 +48,7 @@ int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
>   
>   /* fixed mapping MMU emulation */
>   int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
> -                          target_ulong address, int rw, int access_type)
> +                          target_ulong address, int rw)
>   {
>       if (address <= (int32_t)0x7FFFFFFFUL) {
>           if (!(env->CP0_Status & (1 << CP0St_ERL))) {
> @@ -68,7 +68,7 @@ int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
>   
>   /* MIPS32/MIPS64 R4000-style MMU emulation */
>   int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
> -                    target_ulong address, int rw, int access_type)
> +                    target_ulong address, int rw)
>   {
>       uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
>       uint32_t MMID = env->CP0_MemoryMapID;
> @@ -234,8 +234,7 @@ static int get_seg_physical_address(CPUMIPSState *env, hwaddr *physical,
>           return mapped;
>       } else if (mapped) {
>           /* The segment is TLB mapped */
> -        return env->tlb->map_address(env, physical, prot, real_address, rw,
> -                                     access_type);
> +        return env->tlb->map_address(env, physical, prot, real_address, rw);
>       } else {
>           /* The segment is unmapped */
>           *physical = physical_base | (real_address & segmask);
> @@ -314,7 +313,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
>           /* xuseg */
>           if (UX && address <= (0x3FFFFFFFFFFFFFFFULL & env->SEGMask)) {
>               ret = env->tlb->map_address(env, physical, prot,
> -                                        real_address, rw, access_type);
> +                                        real_address, rw);
>           } else {
>               ret = TLBRET_BADADDR;
>           }
> @@ -323,7 +322,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
>           if ((supervisor_mode || kernel_mode) &&
>               SX && address <= (0x7FFFFFFFFFFFFFFFULL & env->SEGMask)) {
>               ret = env->tlb->map_address(env, physical, prot,
> -                                        real_address, rw, access_type);
> +                                        real_address, rw);
>           } else {
>               ret = TLBRET_BADADDR;
>           }
> @@ -364,7 +363,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
>           if (kernel_mode && KX &&
>               address <= (0xFFFFFFFF7FFFFFFFULL & env->SEGMask)) {
>               ret = env->tlb->map_address(env, physical, prot,
> -                                        real_address, rw, access_type);
> +                                        real_address, rw);
>           } else {
>               ret = TLBRET_BADADDR;
>           }


