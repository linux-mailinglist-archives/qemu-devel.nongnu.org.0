Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1A830B5CF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 04:27:42 +0100 (CET)
Received: from localhost ([::1]:34620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6mLu-00056h-0z
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 22:27:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mKw-0004IF-BB
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:26:44 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:53729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mKr-0001C7-DD
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:26:42 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 24E3E58031C;
 Mon,  1 Feb 2021 22:26:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 01 Feb 2021 22:26:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=5
 g3z7xy8Jl4GTmrfxIu4hpZESwUYyyDPA6vhhA9nMxQ=; b=YL9jlFA7gwwIE8Oqn
 SWWNhZCODabCDQ4ky+sLpcdf3/n88F8+nvuEy0tVyhO9obMfXc+ZnIMzHca0EI6B
 7ysIEeYTq0gljsQ0fAdWnCLZv1vNj8Xcuiq1zlISEJGBDdHka634sqzu5+6AO2Hf
 sP2YekR3zTCzJlHhS8XZcua9hM7VJvTrcwJrbYg6gIZJXvNwegjQ+sbeAD1WVqp/
 U9l6FbLet8iAiO+4/WM3A5zdq2BvL+Yx9VwriFV033+5038ZzBoRcxJnHo6pVQva
 zMpkN2basBFt9und2KkfM/SK47k4SrAhkjCDtdrmCqAYDJbM9NKJQ8bvAUc5N3L8
 4n1nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=5g3z7xy8Jl4GTmrfxIu4hpZESwUYyyDPA6vhhA9nM
 xQ=; b=JWguVapjjEc5icyaEtFUgF6VklIuVe7hJMsY4OnD4VWsmEBKUosfyzR3O
 w6CH8UUQ4zaTcbxkVjshzS/xjg8RqlqD7hcLjjh09Ro1a+GoZc9IWuAsXg6NZZFW
 SMn0p9sIVoBydjvFDTmI7XXcb9hPqOpG1wMuPAMD7BkF5LlzX6T/A6/a5D9ZWAnu
 KnSGiNYP9X/3vBhNMlNBIMQG3bWKzfADC916eOldrSm5QtsbfEalhF0sRDRDQd9l
 Q+3cxTH7InP2kAMe4RG0PY/JW/yPwAj5HwsYevt4t2RbuwaUmnWaOeUdNQqy0qsK
 PGAC5Y8NSutI03fmcE4jKKmVI63tw==
X-ME-Sender: <xms:a8YYYEmtm0Ov6gIv-Mlum8pxadkMBhR4RrqAXATwOj9Z0LfudO4I-g>
 <xme:a8YYYD16OvwzCX1B1RKojFnwe_ZWKt6aAg-YQDetLrduUAo1F1WSj9-Da8wFxt4-U
 AIB0y8wBG8fUEAXukM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeduheegrddujedruddvrdelkeenucevlhhushhtvghrufhiii
 gvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:a8YYYCoyVXxZ83uWosohxv5ZqfBFVpAbBU3XTKgq2shWs4AAMDDM7g>
 <xmx:a8YYYAmE82p9xbHu9JyAEApre9G_tdxTwJNpYufFABw6Oj61zL3IPQ>
 <xmx:a8YYYC0S3xSvuiXqDCaRQv4DhJH3pK33JpsFDj_hqlF5s5ijM833mw>
 <xmx:a8YYYFQpQwYy0SWWFILrGc-ENmd1qvEyEesCHHgBooOLRU8kkt2Brw>
Received: from [0.0.0.0] (unknown [154.17.12.98])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7562A1080057;
 Mon,  1 Feb 2021 22:26:33 -0500 (EST)
Subject: Re: [PATCH 03/13] target/mips: Remove access_type arg from
 get_segctl_physical_address()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210128144125.3696119-1-f4bug@amsat.org>
 <20210128144125.3696119-4-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <461f7c66-6498-18f6-8682-c76a13c3ef85@flygoat.com>
Date: Tue, 2 Feb 2021 11:26:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128144125.3696119-4-f4bug@amsat.org>
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
> get_segctl_physical_address() doesn't use the 'access_type' argument,
> remove it to simplify.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   target/mips/tlb_helper.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
> index 9906292440c..d89ad87cb9d 100644
> --- a/target/mips/tlb_helper.c
> +++ b/target/mips/tlb_helper.c
> @@ -245,7 +245,7 @@ static int get_seg_physical_address(CPUMIPSState *env, hwaddr *physical,
>   
>   static int get_segctl_physical_address(CPUMIPSState *env, hwaddr *physical,
>                                          int *prot, target_ulong real_address,
> -                                       int rw, int access_type, int mmu_idx,
> +                                       int rw, int mmu_idx,
>                                          uint16_t segctl, target_ulong segmask)
>   {
>       unsigned int am = (segctl & CP0SC_AM_MASK) >> CP0SC_AM;
> @@ -306,7 +306,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
>               segctl = env->CP0_SegCtl2 >> 16;
>           }
>           ret = get_segctl_physical_address(env, physical, prot,
> -                                          real_address, rw, access_type,
> +                                          real_address, rw,
>                                             mmu_idx, segctl, 0x3FFFFFFF);
>   #if defined(TARGET_MIPS64)
>       } else if (address < 0x4000000000000000ULL) {
> @@ -370,26 +370,26 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
>   #endif
>       } else if (address < KSEG1_BASE) {
>           /* kseg0 */
> -        ret = get_segctl_physical_address(env, physical, prot, real_address, rw,
> -                                          access_type, mmu_idx,
> +        ret = get_segctl_physical_address(env, physical, prot, real_address,
> +                                          rw, mmu_idx,
>                                             env->CP0_SegCtl1 >> 16, 0x1FFFFFFF);
>       } else if (address < KSEG2_BASE) {
>           /* kseg1 */
> -        ret = get_segctl_physical_address(env, physical, prot, real_address, rw,
> -                                          access_type, mmu_idx,
> +        ret = get_segctl_physical_address(env, physical, prot, real_address,
> +                                          rw, mmu_idx,
>                                             env->CP0_SegCtl1, 0x1FFFFFFF);
>       } else if (address < KSEG3_BASE) {
>           /* sseg (kseg2) */
> -        ret = get_segctl_physical_address(env, physical, prot, real_address, rw,
> -                                          access_type, mmu_idx,
> +        ret = get_segctl_physical_address(env, physical, prot, real_address,
> +                                          rw, mmu_idx,
>                                             env->CP0_SegCtl0 >> 16, 0x1FFFFFFF);
>       } else {
>           /*
>            * kseg3
>            * XXX: debug segment is not emulated
>            */
> -        ret = get_segctl_physical_address(env, physical, prot, real_address, rw,
> -                                          access_type, mmu_idx,
> +        ret = get_segctl_physical_address(env, physical, prot, real_address,
> +                                          rw, mmu_idx,
>                                             env->CP0_SegCtl0, 0x1FFFFFFF);
>       }
>       return ret;


