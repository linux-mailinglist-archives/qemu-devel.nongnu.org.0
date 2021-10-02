Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22F741FDD2
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 20:53:22 +0200 (CEST)
Received: from localhost ([::1]:42314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWk8P-0006S5-Q9
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 14:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mWk6U-0004yG-Jd
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 14:51:22 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:39859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mWk6S-00038N-Pi
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 14:51:22 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 546C85C009F;
 Sat,  2 Oct 2021 14:51:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sat, 02 Oct 2021 14:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=V
 9qyZXk1Mp8MAdVhTceRiFCqaPExR/hP+MCRRA/bTPI=; b=hGZ/D8+Ue8OojyZF8
 3CUu84NJ3EXWO3WNa7FpRPocvSU6iQ4gTTk6n/3G9g0zwEZAI3AHt6Z3iWtrezNU
 B8K+gMCixz1hhWWs5xj/ZO9yl/nS4nQl7K2r1OjzFxkv1Og5G7wcnFc1GNrEqmik
 q6zruwOOJvjBxbrbbWjLHxivA5irmgwg572tssJ0EbV31mcflzQWfh7WpXDHMIdF
 OcxU5VPYwihsv7tB7EuWuM8xmBm0mMLsCGsA5JuC0/tLuHgGeP5/DChNPcYwi1Du
 fIbseNUHXX+sZchTmQAIbBvZKe9qMorkh1tjIr6wAAKUjIsjOLeKOAR5LcUwyF+4
 RjiNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=V9qyZXk1Mp8MAdVhTceRiFCqaPExR/hP+MCRRA/bT
 PI=; b=MPxUkqA1C6HMyWDE3LzBsmBgslx77K7X/5elAqZOt6HRiUE8DpIu8Y8Hf
 yuRKVyW7SSwDePQZeaCbW+AGmWQEMTSs1KFoHKUVssHQEA4dfUnlDk09xU7H5dZs
 9OqkN7LAKuVTVc1CuolWnb19LV1lL3DgiE18Lj7F5aqUcMpeVVBVLHYj3+A6yP98
 8Sz+iuDrMgBoE/JsJ9k9zlq2wEh6SFqpiUZIKIyfONbfZTG7po6GNPdmgnTgSz1p
 LdckU+xxf0GR1J/XKDKBeSGfZPE2OTGYWkhhMZVE8vWpCqoEomIy0OUWKZtqKxso
 /qPxyXUaWuR903lkSi+HYYW6Kg1zQ==
X-ME-Sender: <xms:KKpYYTPU2VKIX9HUrMjj_vso6pSKBhShI80Lk-fLRTSP7lXKhfbb5Q>
 <xme:KKpYYd9HXxyQrWnRD6phdGQry8U2SR8hRmwklVt4iMgsQpk8EYSJstCkMGRk_81v2
 nFUkx9BPlxXjgeVw-o>
X-ME-Received: <xmr:KKpYYSRMGErIEZI3BJA6z8dKDKxZQkWkH_H-n7DLOPU5bXtDNsWODSkEj_i3C5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekkedguddvlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepheeiuddvvefhkeejfedttdekieethfdukedvieeuueelgfel
 ieejgeehvdekudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:KKpYYXsv1A7Tdh_PbHDTfnN5k8tdPdPGbaVNnFhd8dV32SDPtA9Uxw>
 <xmx:KKpYYbd9qJ62dhdgwSGx-88VjewMJSSmbSR70TdImirQ9IMDTxRGCA>
 <xmx:KKpYYT2NSgYCnvoLyTcEK3cCL83jnsARAGddjz_JWNEzxlDWF72QTg>
 <xmx:KKpYYS5CZkz4VgbUvJSoCnRhhwINN1OEDOLtnWd1Wj4huHLdqCyX3w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Oct 2021 14:51:19 -0400 (EDT)
Message-ID: <fa43f81a-ca61-20f0-41a3-6b2442dbd08b@flygoat.com>
Date: Sat, 2 Oct 2021 19:51:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] target/mips: remove gen_mfc0_load64() and use
 tcg_gen_ld32s_tl()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211002133753.3432668-1-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20211002133753.3432668-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=jiaxun.yang@flygoat.com;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.413,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Leon Alrae <leon.alrae@imgtec.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/10/2 14:37, Philippe Mathieu-Daudé 写道:
> From: Leon Alrae <leon.alrae@imgtec.com>
>
> Remove misleading gen_mfc0_load64() which actually loads 32 or 64 bits
> depending whether MIPS32 or MIPS64 and also replace the pair of
> tcg_gen_ld_tl() + tcg_gen_ext32s_tl() with single tcg_gen_ld32s_tl().
>
> Patch partly generated using the following spatch script:
>
>      @@
>      expression reg, env, ofs;
>      @@
>      -tcg_gen_ld_tl(reg, env, ofs);
>      -tcg_gen_ext32s_tl(reg, reg);
>      +tcg_gen_ld32s_tl(reg, env, ofs);
>
> Signed-off-by: Leon Alrae <leon.alrae@imgtec.com>
> [PMD: Rebased and used Coccinelle spatch to complete]
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

That seems much more clear!
Thanks.

- Jiaxun
> ---
>   target/mips/tcg/translate.c | 68 ++++++++++++++++---------------------
>   1 file changed, 29 insertions(+), 39 deletions(-)
>
> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index 148afec9dc0..40b350d6e17 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -5382,12 +5382,6 @@ static inline void gen_mfc0_load32(TCGv arg, target_ulong off)
>       tcg_temp_free_i32(t0);
>   }
>   
> -static inline void gen_mfc0_load64(TCGv arg, target_ulong off)
> -{
> -    tcg_gen_ld_tl(arg, cpu_env, off);
> -    tcg_gen_ext32s_tl(arg, arg);
> -}
> -
>   static inline void gen_mtc0_store32(TCGv arg, target_ulong off)
>   {
>       TCGv_i32 t0 = tcg_temp_new_i32();
> @@ -5679,17 +5673,19 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
>               break;
>           case CP0_REG01__YQMASK:
>               CP0_CHECK(ctx->insn_flags & ASE_MT);
> -            gen_mfc0_load64(arg, offsetof(CPUMIPSState, CP0_YQMask));
> +            tcg_gen_ld32s_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_YQMask));
>               register_name = "YQMask";
>               break;
>           case CP0_REG01__VPESCHEDULE:
>               CP0_CHECK(ctx->insn_flags & ASE_MT);
> -            gen_mfc0_load64(arg, offsetof(CPUMIPSState, CP0_VPESchedule));
> +            tcg_gen_ld32s_tl(arg, cpu_env,
> +                             offsetof(CPUMIPSState, CP0_VPESchedule));
>               register_name = "VPESchedule";
>               break;
>           case CP0_REG01__VPESCHEFBACK:
>               CP0_CHECK(ctx->insn_flags & ASE_MT);
> -            gen_mfc0_load64(arg, offsetof(CPUMIPSState, CP0_VPEScheFBack));
> +            tcg_gen_ld32s_tl(arg, cpu_env,
> +                             offsetof(CPUMIPSState, CP0_VPEScheFBack));
>               register_name = "VPEScheFBack";
>               break;
>           case CP0_REG01__VPEOPT:
> @@ -5790,8 +5786,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
>       case CP0_REGISTER_04:
>           switch (sel) {
>           case CP0_REG04__CONTEXT:
> -            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_Context));
> -            tcg_gen_ext32s_tl(arg, arg);
> +            tcg_gen_ld32s_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_Context));
>               register_name = "Context";
>               break;
>           case CP0_REG04__CONTEXTCONFIG:
> @@ -5801,9 +5796,8 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
>               goto cp0_unimplemented;
>           case CP0_REG04__USERLOCAL:
>               CP0_CHECK(ctx->ulri);
> -            tcg_gen_ld_tl(arg, cpu_env,
> -                          offsetof(CPUMIPSState, active_tc.CP0_UserLocal));
> -            tcg_gen_ext32s_tl(arg, arg);
> +            tcg_gen_ld32s_tl(arg, cpu_env,
> +                             offsetof(CPUMIPSState, active_tc.CP0_UserLocal));
>               register_name = "UserLocal";
>               break;
>           case CP0_REG04__MMID:
> @@ -5828,20 +5822,20 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
>               break;
>           case CP0_REG05__SEGCTL0:
>               CP0_CHECK(ctx->sc);
> -            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_SegCtl0));
> -            tcg_gen_ext32s_tl(arg, arg);
> +            tcg_gen_ld32s_tl(arg, cpu_env,
> +                             offsetof(CPUMIPSState, CP0_SegCtl0));
>               register_name = "SegCtl0";
>               break;
>           case CP0_REG05__SEGCTL1:
>               CP0_CHECK(ctx->sc);
> -            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_SegCtl1));
> -            tcg_gen_ext32s_tl(arg, arg);
> +            tcg_gen_ld32s_tl(arg, cpu_env,
> +                             offsetof(CPUMIPSState, CP0_SegCtl1));
>               register_name = "SegCtl1";
>               break;
>           case CP0_REG05__SEGCTL2:
>               CP0_CHECK(ctx->sc);
> -            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_SegCtl2));
> -            tcg_gen_ext32s_tl(arg, arg);
> +            tcg_gen_ld32s_tl(arg, cpu_env,
> +                             offsetof(CPUMIPSState, CP0_SegCtl2));
>               register_name = "SegCtl2";
>               break;
>           case CP0_REG05__PWBASE:
> @@ -5917,8 +5911,8 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
>       case CP0_REGISTER_08:
>           switch (sel) {
>           case CP0_REG08__BADVADDR:
> -            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_BadVAddr));
> -            tcg_gen_ext32s_tl(arg, arg);
> +            tcg_gen_ld32s_tl(arg, cpu_env,
> +                             offsetof(CPUMIPSState, CP0_BadVAddr));
>               register_name = "BadVAddr";
>               break;
>           case CP0_REG08__BADINSTR:
> @@ -5975,8 +5969,8 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
>       case CP0_REGISTER_10:
>           switch (sel) {
>           case CP0_REG10__ENTRYHI:
> -            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EntryHi));
> -            tcg_gen_ext32s_tl(arg, arg);
> +            tcg_gen_ld32s_tl(arg, cpu_env,
> +                             offsetof(CPUMIPSState, CP0_EntryHi));
>               register_name = "EntryHi";
>               break;
>           default:
> @@ -6032,8 +6026,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
>       case CP0_REGISTER_14:
>           switch (sel) {
>           case CP0_REG14__EPC:
> -            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EPC));
> -            tcg_gen_ext32s_tl(arg, arg);
> +            tcg_gen_ld32s_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EPC));
>               register_name = "EPC";
>               break;
>           default:
> @@ -6048,15 +6041,14 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
>               break;
>           case CP0_REG15__EBASE:
>               check_insn(ctx, ISA_MIPS_R2);
> -            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EBase));
> -            tcg_gen_ext32s_tl(arg, arg);
> +            tcg_gen_ld32s_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EBase));
>               register_name = "EBase";
>               break;
>           case CP0_REG15__CMGCRBASE:
>               check_insn(ctx, ISA_MIPS_R2);
>               CP0_CHECK(ctx->cmgcr);
> -            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_CMGCRBase));
> -            tcg_gen_ext32s_tl(arg, arg);
> +            tcg_gen_ld32s_tl(arg, cpu_env,
> +                             offsetof(CPUMIPSState, CP0_CMGCRBase));
>               register_name = "CMGCRBase";
>               break;
>           default:
> @@ -6163,8 +6155,8 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
>           case CP0_REG20__XCONTEXT:
>   #if defined(TARGET_MIPS64)
>               check_insn(ctx, ISA_MIPS3);
> -            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_XContext));
> -            tcg_gen_ext32s_tl(arg, arg);
> +            tcg_gen_ld32s_tl(arg, cpu_env,
> +                             offsetof(CPUMIPSState, CP0_XContext));
>               register_name = "XContext";
>               break;
>   #endif
> @@ -6227,8 +6219,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
>           switch (sel) {
>           case CP0_REG24__DEPC:
>               /* EJTAG support */
> -            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_DEPC));
> -            tcg_gen_ext32s_tl(arg, arg);
> +            tcg_gen_ld32s_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_DEPC));
>               register_name = "DEPC";
>               break;
>           default:
> @@ -6341,8 +6332,8 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
>       case CP0_REGISTER_30:
>           switch (sel) {
>           case CP0_REG30__ERROREPC:
> -            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_ErrorEPC));
> -            tcg_gen_ext32s_tl(arg, arg);
> +            tcg_gen_ld32s_tl(arg, cpu_env,
> +                             offsetof(CPUMIPSState, CP0_ErrorEPC));
>               register_name = "ErrorEPC";
>               break;
>           default:
> @@ -6363,9 +6354,8 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
>           case CP0_REG31__KSCRATCH5:
>           case CP0_REG31__KSCRATCH6:
>               CP0_CHECK(ctx->kscrexist & (1 << sel));
> -            tcg_gen_ld_tl(arg, cpu_env,
> -                          offsetof(CPUMIPSState, CP0_KScratch[sel - 2]));
> -            tcg_gen_ext32s_tl(arg, arg);
> +            tcg_gen_ld32s_tl(arg, cpu_env,
> +                             offsetof(CPUMIPSState, CP0_KScratch[sel - 2]));
>               register_name = "KScratch";
>               break;
>           default:


