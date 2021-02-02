Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 247C530B601
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 04:45:08 +0100 (CET)
Received: from localhost ([::1]:55180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6mcl-0006Bl-7n
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 22:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6maR-0005KL-U8
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:42:43 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:38741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6maQ-0007Gx-5Z
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:42:43 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id AA05C5802B3;
 Mon,  1 Feb 2021 22:42:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 01 Feb 2021 22:42:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=v
 +7IUSSGCpn8hQfukYY1fbxeD/0bpFLgEHfO1zb4vj8=; b=O/0kw4UUgGTKdS4dy
 6CaFJSA59GoggrtyNn5E7QlBRNdfT06dyariXrTR+rs4oMtbUkQ4+9mO7lGnrs7N
 tmMx/K75OssoivSJjfdxfdnNyO9IWm1RT/7WaPTl7ItzUdCheqDRVIfzfPubPo3p
 sxQffng+d9MC6u5ufkdaRBdrcWGeVRhh6jAE5MvtY9vzibwHkZuQYCYMlb+FYapQ
 6G3peRUsITAFdCmpxCarPiPcFJHVIjKdVukrH6iDlGqsf2OVy+ADQHJSHthSZtif
 mFcbRwinEAQFwo+2G7hTERs+XtbjeAsxYOtpmAiLz/1OjYbzE0k7JWk+WQZeg8db
 e9lSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=v+7IUSSGCpn8hQfukYY1fbxeD/0bpFLgEHfO1zb4v
 j8=; b=pktUReMSWlJ/Erd95uF1SUjoJb3uKQSyRKuWFU1Q5Qt+E77OOzo0YHacO
 xLf73h8NMDJDsQcVywM253N/5Scxlim7iuu+ATD92N7PLhlw4+xm5Qod3UKRHcOZ
 XCrRZjXVSQLtIBtGS9cuVCYktWn31IiPGzkl8EgowuUfPVBv4lvmrp6S2zAxkmII
 GzsmDgxnm4BdIcn1NhXpMq4BSt6qLhuzNZ6yb3vunRvV3STJznQsLJ42zxc/MyHW
 dRzzQw8OMo/rbocI6QLGQwA/NCE9943ctAdtFAAsS3n1OLvQva5GYcwmMz8PLNzr
 BQGRzpzIGgviGazOEhyRY/8kRxNuw==
X-ME-Sender: <xms:McoYYNdvZJHYtTOngPkD75QbZIccngxSY1Tbp47dTY1YbwH_U83AAQ>
 <xme:McoYYLPkaPiF7nrutwyUQxXNWx8up9aFxzRxKEoqKgGHRjylWL3NJ2xYYce3-uME7
 5TLkAjk_xi-7u0CXQ4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeduheegrddujedruddvrdelkeenucevlhhushhtvghrufhiii
 gvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:McoYYGiKhgja7zVwq0mkFtHBU5BknvPkBAOtv4dmisg_6R9gPVFBKA>
 <xmx:McoYYG_KZY6tK3-tvOGXeGmk2oUMrHjTCKIdDbt-Z-sAbDKgVGrhvw>
 <xmx:McoYYJuvzjFGtUHRdt87WRB4A3T20Db2JfjqzK8o9AYOUVtSEP4SnQ>
 <xmx:McoYYDJt99AgB1ehKODMH4nJUG3SH1F_HshgmbUGdo36egMC6EvuMw>
Received: from [0.0.0.0] (unknown [154.17.12.98])
 by mail.messagingengine.com (Postfix) with ESMTPA id E84F3240067;
 Mon,  1 Feb 2021 22:42:38 -0500 (EST)
Subject: Re: [PATCH 11/13] target/mips: Let get_physical_address() take
 MMUAccessType argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210128144125.3696119-1-f4bug@amsat.org>
 <20210128144125.3696119-12-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <1604decf-fe10-1f02-e1bc-dd32b535a7b6@flygoat.com>
Date: Tue, 2 Feb 2021 11:42:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128144125.3696119-12-f4bug@amsat.org>
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
> All these functions:
> - mips_cpu_get_phys_page_debug()
> - cpu_mips_translate_address()
> - mips_cpu_tlb_fill()
> - page_table_walk_refill()
> - walk_directory()
> call get_physical_address() passing a MMUAccessType type. Let the
> prototype use it as argument, as it is stricter than an integer.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   target/mips/tlb_helper.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
> index 21b7d38f11c..64e89591abc 100644
> --- a/target/mips/tlb_helper.c
> +++ b/target/mips/tlb_helper.c
> @@ -259,7 +259,7 @@ static int get_segctl_physical_address(CPUMIPSState *env, hwaddr *physical,
>   
>   static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
>                                   int *prot, target_ulong real_address,
> -                                int rw, int mmu_idx)
> +                                MMUAccessType access_type, int mmu_idx)
>   {
>       /* User mode can only access useg/xuseg */
>   #if defined(TARGET_MIPS64)
> @@ -306,14 +306,14 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
>               segctl = env->CP0_SegCtl2 >> 16;
>           }
>           ret = get_segctl_physical_address(env, physical, prot,
> -                                          real_address, rw,
> +                                          real_address, access_type,
>                                             mmu_idx, segctl, 0x3FFFFFFF);
>   #if defined(TARGET_MIPS64)
>       } else if (address < 0x4000000000000000ULL) {
>           /* xuseg */
>           if (UX && address <= (0x3FFFFFFFFFFFFFFFULL & env->SEGMask)) {
>               ret = env->tlb->map_address(env, physical, prot,
> -                                        real_address, rw);
> +                                        real_address, access_type);
>           } else {
>               ret = TLBRET_BADADDR;
>           }
> @@ -322,7 +322,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
>           if ((supervisor_mode || kernel_mode) &&
>               SX && address <= (0x7FFFFFFFFFFFFFFFULL & env->SEGMask)) {
>               ret = env->tlb->map_address(env, physical, prot,
> -                                        real_address, rw);
> +                                        real_address, access_type);
>           } else {
>               ret = TLBRET_BADADDR;
>           }
> @@ -349,7 +349,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
>               /* Does CP0_Status.KX/SX/UX permit the access mode (am) */
>               if (env->CP0_Status & am_ksux[am]) {
>                   ret = get_seg_physical_address(env, physical, prot,
> -                                               real_address, rw,
> +                                               real_address, access_type,
>                                                  mmu_idx, am, false, env->PAMask,
>                                                  0);
>               } else {
> @@ -363,7 +363,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
>           if (kernel_mode && KX &&
>               address <= (0xFFFFFFFF7FFFFFFFULL & env->SEGMask)) {
>               ret = env->tlb->map_address(env, physical, prot,
> -                                        real_address, rw);
> +                                        real_address, access_type);
>           } else {
>               ret = TLBRET_BADADDR;
>           }
> @@ -371,17 +371,17 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
>       } else if (address < KSEG1_BASE) {
>           /* kseg0 */
>           ret = get_segctl_physical_address(env, physical, prot, real_address,
> -                                          rw, mmu_idx,
> +                                          access_type, mmu_idx,
>                                             env->CP0_SegCtl1 >> 16, 0x1FFFFFFF);
>       } else if (address < KSEG2_BASE) {
>           /* kseg1 */
>           ret = get_segctl_physical_address(env, physical, prot, real_address,
> -                                          rw, mmu_idx,
> +                                          access_type, mmu_idx,
>                                             env->CP0_SegCtl1, 0x1FFFFFFF);
>       } else if (address < KSEG3_BASE) {
>           /* sseg (kseg2) */
>           ret = get_segctl_physical_address(env, physical, prot, real_address,
> -                                          rw, mmu_idx,
> +                                          access_type, mmu_idx,
>                                             env->CP0_SegCtl0 >> 16, 0x1FFFFFFF);
>       } else {
>           /*
> @@ -389,7 +389,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
>            * XXX: debug segment is not emulated
>            */
>           ret = get_segctl_physical_address(env, physical, prot, real_address,
> -                                          rw, mmu_idx,
> +                                          access_type, mmu_idx,
>                                             env->CP0_SegCtl0, 0x1FFFFFFF);
>       }
>       return ret;


