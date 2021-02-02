Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746BA30B5CD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 04:27:16 +0100 (CET)
Received: from localhost ([::1]:32900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6mLT-0004P1-G6
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 22:27:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mKK-0003uH-R2
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:26:04 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:55757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mKJ-0000vp-7K
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:26:04 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 765BE58030B;
 Mon,  1 Feb 2021 22:26:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 01 Feb 2021 22:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=a
 twb+G1oHGMuy7JDWTjuDUwpKtxdN8GCPpbuy3+ZBcw=; b=ywJ1K+ARzMlyEpOP4
 Bwg2oDSrbqxUKwa80lxOY+4LN41ZzJugcTy3iL/Nqi8JAKiXpustZOng2Ujdu3IO
 VBw9r2LkE43pAOLuMJbZplFXJ9C/ZPZdEHvHniEJ2mfHi0kCto/Skvy/cyO9/7ks
 bue+sukUaWga0rJuR9HEk3buGXZRWMJd+JUAwexNgClaffHe4t7koffvSmPY0fX/
 NnU7XlHjYDJ0nv62DTGPHolVJxr0TUrUyWjprQcJcCZw8sYeXJ8G+sj/V+JRLtoG
 4AdbBJpj6nIsp4i8iUM8Fhealt5hivmx4NqofP07SCGtbpSa80KduPjDsVSEzkKt
 Gb44Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=atwb+G1oHGMuy7JDWTjuDUwpKtxdN8GCPpbuy3+ZB
 cw=; b=ap5ZlM/jaTffm3FL98wNTQUrJ/nc/nT2kUlJgH/AajC4MkNGSbfrLxXKI
 veqfJN4aw32uXKDkbWnxkwN7Z3P2G0vuCP1IgBILwHaT0BOD5X85KDJOUifwDC7g
 e+6Qhl+STyZNuOgbSJ2G7wva6Y4abSzIbyB0Fl2OLTPTG8mS3SVCyjQE2IFHJ9WB
 HDd41wz95hIpDvYrvOlnplmZjKBQuFCO+JoMoMhUl7WRN7Y5nKiaZZ92LHb4nqoN
 XS7rcT3aBS3GEgp1J+xmBQY1Br/+AQMbB2ap+tElP4woJ3QTugPMrpyHDEeAv35l
 VJeQDXJKvVWcpgUUCCoQpGl0Q+nyg==
X-ME-Sender: <xms:ScYYYIhvIT5cWRjZm4Bq4yvSSueEQLQsjjXAEiTOjc5o9b2veT9hlg>
 <xme:ScYYYBDJxoc2jWkcENp-tfdtwZkQ4m1i5CfrFeeIhSQN67BojfhloYqnkXbAw4Trb
 nTARE8YclliQeEQabU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeduheegrddujedruddvrdelkeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:ScYYYAFUaJoBtXfRC7V7Ec3bw7FDfk0ZIKlgBlFxVm7Gz2GccJTEfw>
 <xmx:ScYYYJQWtA1eGhK3a15mpi3mig904BAdPidX_M11_tDSrgPxnkrLVw>
 <xmx:ScYYYFxZqgY2cTipTG7AvwVfHb_LJHKA0C0jVN1XDCjxEwk-lGU2Og>
 <xmx:SsYYYHtTc8IqZX3NWwO8_U2UiRizzDB6K_Cn3-pBeHEshKqdkno0Gg>
Received: from [0.0.0.0] (unknown [154.17.12.98])
 by mail.messagingengine.com (Postfix) with ESMTPA id 02C8124005B;
 Mon,  1 Feb 2021 22:25:58 -0500 (EST)
Subject: Re: [PATCH 02/13] target/mips: Remove access_type argument from
 get_seg_physical_address
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210128144125.3696119-1-f4bug@amsat.org>
 <20210128144125.3696119-3-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <f559101d-fe6c-2867-4b9b-50e1148de31e@flygoat.com>
Date: Tue, 2 Feb 2021 11:25:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128144125.3696119-3-f4bug@amsat.org>
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
> get_seg_physical_address() doesn't use the 'access_type' argument,
> remove it to simplify.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   target/mips/tlb_helper.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
> index 1af2dc969d6..9906292440c 100644
> --- a/target/mips/tlb_helper.c
> +++ b/target/mips/tlb_helper.c
> @@ -222,7 +222,7 @@ static int is_seg_am_mapped(unsigned int am, bool eu, int mmu_idx)
>   
>   static int get_seg_physical_address(CPUMIPSState *env, hwaddr *physical,
>                                       int *prot, target_ulong real_address,
> -                                    int rw, int access_type, int mmu_idx,
> +                                    int rw, int mmu_idx,
>                                       unsigned int am, bool eu,
>                                       target_ulong segmask,
>                                       hwaddr physical_base)
> @@ -253,7 +253,7 @@ static int get_segctl_physical_address(CPUMIPSState *env, hwaddr *physical,
>       hwaddr pa = ((hwaddr)segctl & CP0SC_PA_MASK) << 20;
>   
>       return get_seg_physical_address(env, physical, prot, real_address, rw,
> -                                    access_type, mmu_idx, am, eu, segmask,
> +                                    mmu_idx, am, eu, segmask,
>                                       pa & ~(hwaddr)segmask);
>   }
>   
> @@ -349,7 +349,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
>               /* Does CP0_Status.KX/SX/UX permit the access mode (am) */
>               if (env->CP0_Status & am_ksux[am]) {
>                   ret = get_seg_physical_address(env, physical, prot,
> -                                               real_address, rw, access_type,
> +                                               real_address, rw,
>                                                  mmu_idx, am, false, env->PAMask,
>                                                  0);
>               } else {


