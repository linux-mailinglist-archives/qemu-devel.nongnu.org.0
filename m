Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B190530B5F0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 04:42:38 +0100 (CET)
Received: from localhost ([::1]:51284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6maL-0004Wx-Px
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 22:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mZQ-0003wm-1w
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:41:40 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:49143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mZO-0006nX-Du
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:41:39 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E46945802B3;
 Mon,  1 Feb 2021 22:41:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 01 Feb 2021 22:41:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=z
 gWubHILTqXPfFZigoTqEdFWX3uGkDuKpHghbKbq6yk=; b=lS/0ACEpRh2ij1MDA
 tEUs0wxhxy6hWnbOuh9YHPwtQ1g41S244DltP616zvEX/BPTSKAMoX0GIFusSz0J
 DVeDgCBDr1y9NcGjlvuBYjDWEH3WfKnIxApdvg9qlOw3lmxde8JtEOFc3qHYw/2P
 sOpOD1SF4y3g8MOaIF5TsnXQlkQvBDg8LNw1rmI/64JyQEOQCMYLKvGF0v5+4Y+n
 mU1bqg11jKI5XAaZt2b1jumN9mavNf1WlhFBVDU5pE5XQZEbj+xjTN9SwApQgeHD
 oFwk4gpsdcWi4bXtosrVtaYYbzk3yq6YiqJ6MldoufjlZgG0Vy4hnHtioDTRBa/r
 3wrnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=zgWubHILTqXPfFZigoTqEdFWX3uGkDuKpHghbKbq6
 yk=; b=gVecZFRS3Xwk4ZI4Zx+I/MwNOXVdy6Xkd3f2RLnowXEk0TUeICi0Sl/IB
 U8ed0YBmTj2aYMydHNV9Hi0+M3ym2IsTknRFGlyf45yzXgTuzWT6l6Pozt7+KQqc
 EFVSTrF6ViXfzYLBxbs8l+cP/RhZx65htmEAHtbbCsLMYCb7WFQKeobLWbqvqD0v
 GEvZoNpDGR4dXM4OO4VkHL/Xjz8pxzsASGoos3aOUeu8pA/5+RNGEg8d3jM1gTee
 gVFeeRtmTpZ2Qh3DgMW24SiMP/+fFXLQgknjwUzdWUf1PPTG39m1Yhro4+waOGci
 hgNHfUqMs42n/HKE58VR70mz3nIYA==
X-ME-Sender: <xms:8ckYYK5PrnZCP2bMoZTs0Tg_NZ_WVR2hKcbHpjVsJmpj2o6yg_ZMJQ>
 <xme:8ckYYD5dLMSWzulygE-KFP6nHaz7OG_lckpwLpjJMNwE2A256n4wYzHEiVvnZ3Y0x
 PbGnrnB2fNLO0H1xMc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeduheegrddujedruddvrdelkeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:8ckYYJe_MRPr1zua7CfpvxwoQeoQ-NhYyTduCDRhzuZGl4xPz2ECHg>
 <xmx:8ckYYHKpZ7R8mQicY4xdObiTeLfTlzafCw4zoTjxTg3Ptts5Te3TUA>
 <xmx:8ckYYOJVuz9gTBtFxIlDgmV4NiBOAoqnQW4mpqNj1uYFIIoHcrczFQ>
 <xmx:8ckYYDHLOuGhIx63J7cNS0JgxVouOukDXN5ZSLSv1AdFi64VOti7og>
Received: from [0.0.0.0] (unknown [154.17.12.98])
 by mail.messagingengine.com (Postfix) with ESMTPA id C6A6024005A;
 Mon,  1 Feb 2021 22:41:30 -0500 (EST)
Subject: Re: [PATCH 09/13] target/mips: Let cpu_mips_translate_address() take
 MMUAccessType arg
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210128144125.3696119-1-f4bug@amsat.org>
 <20210128144125.3696119-10-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <c1aa02b7-04c3-cd4f-a9e0-c8a5bb03f30f@flygoat.com>
Date: Tue, 2 Feb 2021 11:41:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128144125.3696119-10-f4bug@amsat.org>
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
> The single caller, do_translate_address(), passes MMUAccessType
> to cpu_mips_translate_address(). Let the prototype use it as
> argument, as it is stricter than an integer.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   target/mips/internal.h   | 2 +-
>   target/mips/tlb_helper.c | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/mips/internal.h b/target/mips/internal.h
> index d09afded5ea..34915c275c4 100644
> --- a/target/mips/internal.h
> +++ b/target/mips/internal.h
> @@ -146,7 +146,7 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>                                       int mmu_idx, MemTxAttrs attrs,
>                                       MemTxResult response, uintptr_t retaddr);
>   hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
> -                                  int rw);
> +                                  MMUAccessType access_type);
>   #endif
>   
>   #define cpu_signal_handler cpu_mips_signal_handler
> diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
> index afcc269750d..e9c3adeade6 100644
> --- a/target/mips/tlb_helper.c
> +++ b/target/mips/tlb_helper.c
> @@ -903,17 +903,17 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>   
>   #ifndef CONFIG_USER_ONLY
>   hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
> -                                  int rw)
> +                                  MMUAccessType access_type)
>   {
>       hwaddr physical;
>       int prot;
>       int ret = 0;
>   
>       /* data access */
> -    ret = get_physical_address(env, &physical, &prot, address, rw,
> +    ret = get_physical_address(env, &physical, &prot, address, access_type,
>                                  cpu_mmu_index(env, false));
>       if (ret != TLBRET_MATCH) {
> -        raise_mmu_exception(env, address, rw, ret);
> +        raise_mmu_exception(env, address, access_type, ret);
>           return -1LL;
>       } else {
>           return physical;


