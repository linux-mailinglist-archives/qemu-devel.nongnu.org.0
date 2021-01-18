Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B142F96C2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 01:42:36 +0100 (CET)
Received: from localhost ([::1]:54116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Ics-0003b7-W5
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 19:42:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1Ibn-0003B2-Ts
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 19:41:27 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:56307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1Ibl-0003TP-QY
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 19:41:27 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 03729580670;
 Sun, 17 Jan 2021 19:41:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 17 Jan 2021 19:41:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=I
 f/PDr1Gi4hly3XBVQHF9YX9e1tBtowAjiwKNA5ehmE=; b=BYh8FewZXWR+cwWM1
 DavjK6HlnOdcdgHMcNoYis4hQ0uzevOaGdXelhvy3AYwinKwVSocVN0ztQV8hojr
 ZBk4RCEtPeBQ1KbWVOa4KvT7eTyncDp90FhKGV8ZME+tN4xTstPaaUMgmzNPwoy3
 pADePWEqId3137Xo+JFwDaBhIqWGaXeLcpa3Tici9J2D3KfknD+W3hvL+QHI+D4M
 llTkPUjXgEWEp04svF+z4p45SovswRTD7r4V7ZKhcKw52jmFmYEt0uB+0zo5kDOu
 jcW4ITLI3Kl7rsLzEXd3L+0nDjEjJEK4ElLH4jR+CZMlAe3N6mdk+TmaBWBOpWBy
 y+hvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=If/PDr1Gi4hly3XBVQHF9YX9e1tBtowAjiwKNA5eh
 mE=; b=jru9SQdH//ONefesD9DYHTdnVwKxmjhGaavM55h8koZb6A7vtGrh+HCJ7
 9//zpNHc9D0q8KGpHaXtBuT0V3GK1LQZFLKW+/24DRmvzynu/PCyil6K3gvmW8gZ
 Y5VF8FJWXayT2pXHLhG03knVLEMhUPd8VDpK77HRXE4LM9EpwaIg7LMYUJaGFzyd
 mhKYMamIMeIZJuIqdBPN76ALeYY1eIkhMIaKYNuozAMTHrPKUVjJyZPNydeLdfQo
 ZGQ78NDpJ+6nJ3PrLkpe4cYNJWfwVfYho9ngUwukvMmEQZKCFhvqAsyf7ShXGQq6
 xUa1cgLxHWBls4fmOjqr/FiA7nZ8g==
X-ME-Sender: <xms:MNkEYAKyfLsuA7zUILZZKBmIj8oH8fs2hsHWHIWWv1VC_lrF6rDgaw>
 <xme:MNkEYAKz0_lBx4_j2xpb5-eZcHF3uD5Ldnbv8Asm8SlIF-ki_cP8TO4ZiJyg7I5u8
 er6OfWdOihImKKuESY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeeghedrfeefrdehtddrvdehgeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:MNkEYAtcL0sd35nWaogJrLtw2vtTd2GXgV58TG4miAKTWUiz_CHl5g>
 <xmx:MNkEYNZ-4zhNoTybdiVG5G1gTcgrWVPZ4KuaWA765qpYZAMVJ11Vlg>
 <xmx:MNkEYHYJXVo2dkeFwxE6ZEc8WbcccSxZ7R8pYRnznAN891ObTMvRZg>
 <xmx:MdkEYGX9Q0FWK-uhHkOUpIrzU0TCf2e_RvLXv_eRllTsGzSLkIA7lA>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2C452240057;
 Sun, 17 Jan 2021 19:41:17 -0500 (EST)
Subject: Re: [PATCH] target/mips: fetch code with translator_ld
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210116181328.3890849-1-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <f4c55393-c980-44d0-cc8c-63e5e6420b30@flygoat.com>
Date: Mon, 18 Jan 2021 08:41:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210116181328.3890849-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=66.111.4.229;
 envelope-from=jiaxun.yang@flygoat.com; helo=new3-smtp.messagingengine.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.252,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Emilio G . Cota" <cota@braap.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021/1/17 上午2:13, Philippe Mathieu-Daudé 写道:
> Similarly to commits ae82adc8e29..7f93879e444, use the
> translator_ld*() API introduced in commit 409c1a0bf0f
> to fetch the code on the MIPS target.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Jiaxun Yang  <jiaxun.yang@flygoat.com>

> ---
>   target/mips/tlb_helper.c | 16 ++++++++--------
>   target/mips/translate.c  | 20 ++++++++++----------
>   2 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
> index 082c17928d3..f855453ca4d 100644
> --- a/target/mips/tlb_helper.c
> +++ b/target/mips/tlb_helper.c
> @@ -21,7 +21,7 @@
>   #include "cpu.h"
>   #include "internal.h"
>   #include "exec/exec-all.h"
> -#include "exec/cpu_ldst.h"
> +#include "exec/translator.h"
>   #include "exec/log.h"
>   #include "hw/mips/cpudevs.h"
>   
> @@ -526,9 +526,9 @@ static bool get_pte(CPUMIPSState *env, uint64_t vaddr, int entry_size,
>           return false;
>       }
>       if (entry_size == 64) {
> -        *pte = cpu_ldq_code(env, vaddr);
> +        *pte = translator_ldq(env, vaddr);
>       } else {
> -        *pte = cpu_ldl_code(env, vaddr);
> +        *pte = translator_ldl(env, vaddr);
>       }
>       return true;
>   }
> @@ -941,14 +941,14 @@ static inline void set_badinstr_registers(CPUMIPSState *env)
>   {
>       if (env->insn_flags & ISA_NANOMIPS32) {
>           if (env->CP0_Config3 & (1 << CP0C3_BI)) {
> -            uint32_t instr = (cpu_lduw_code(env, env->active_tc.PC)) << 16;
> +            uint32_t instr = (translator_lduw(env, env->active_tc.PC)) << 16;
>               if ((instr & 0x10000000) == 0) {
> -                instr |= cpu_lduw_code(env, env->active_tc.PC + 2);
> +                instr |= translator_lduw(env, env->active_tc.PC + 2);
>               }
>               env->CP0_BadInstr = instr;
>   
>               if ((instr & 0xFC000000) == 0x60000000) {
> -                instr = cpu_lduw_code(env, env->active_tc.PC + 4) << 16;
> +                instr = translator_lduw(env, env->active_tc.PC + 4) << 16;
>                   env->CP0_BadInstrX = instr;
>               }
>           }
> @@ -960,11 +960,11 @@ static inline void set_badinstr_registers(CPUMIPSState *env)
>           return;
>       }
>       if (env->CP0_Config3 & (1 << CP0C3_BI)) {
> -        env->CP0_BadInstr = cpu_ldl_code(env, env->active_tc.PC);
> +        env->CP0_BadInstr = translator_ldl(env, env->active_tc.PC);
>       }
>       if ((env->CP0_Config3 & (1 << CP0C3_BP)) &&
>           (env->hflags & MIPS_HFLAG_BMASK)) {
> -        env->CP0_BadInstrP = cpu_ldl_code(env, env->active_tc.PC - 4);
> +        env->CP0_BadInstrP = translator_ldl(env, env->active_tc.PC - 4);
>       }
>   }
>   
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index a5cf1742a8b..a6e835809aa 100644
> --- a/target/mips/translate.c
> +++ b/target/mips/translate.c
> @@ -26,7 +26,7 @@
>   #include "cpu.h"
>   #include "internal.h"
>   #include "tcg/tcg-op.h"
> -#include "exec/cpu_ldst.h"
> +#include "exec/translator.h"
>   #include "exec/helper-proto.h"
>   #include "exec/helper-gen.h"
>   #include "hw/semihosting/semihost.h"
> @@ -13911,7 +13911,7 @@ static void decode_i64_mips16(DisasContext *ctx,
>   
>   static int decode_extended_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
>   {
> -    int extend = cpu_lduw_code(env, ctx->base.pc_next + 2);
> +    int extend = translator_lduw(env, ctx->base.pc_next + 2);
>       int op, rx, ry, funct, sa;
>       int16_t imm, offset;
>   
> @@ -14161,7 +14161,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
>           /* No delay slot, so just process as a normal instruction */
>           break;
>       case M16_OPC_JAL:
> -        offset = cpu_lduw_code(env, ctx->base.pc_next + 2);
> +        offset = translator_lduw(env, ctx->base.pc_next + 2);
>           offset = (((ctx->opcode & 0x1f) << 21)
>                     | ((ctx->opcode >> 5) & 0x1f) << 16
>                     | offset) << 2;
> @@ -16295,7 +16295,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
>       uint32_t op, minor, minor2, mips32_op;
>       uint32_t cond, fmt, cc;
>   
> -    insn = cpu_lduw_code(env, ctx->base.pc_next + 2);
> +    insn = translator_lduw(env, ctx->base.pc_next + 2);
>       ctx->opcode = (ctx->opcode << 16) | insn;
>   
>       rt = (ctx->opcode >> 21) & 0x1f;
> @@ -21350,7 +21350,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
>       int offset;
>       int imm;
>   
> -    insn = cpu_lduw_code(env, ctx->base.pc_next + 2);
> +    insn = translator_lduw(env, ctx->base.pc_next + 2);
>       ctx->opcode = (ctx->opcode << 16) | insn;
>   
>       rt = extract32(ctx->opcode, 21, 5);
> @@ -21469,7 +21469,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
>           break;
>       case NM_P48I:
>           {
> -            insn = cpu_lduw_code(env, ctx->base.pc_next + 4);
> +            insn = translator_lduw(env, ctx->base.pc_next + 4);
>               target_long addr_off = extract32(ctx->opcode, 0, 16) | insn << 16;
>               switch (extract32(ctx->opcode, 16, 5)) {
>               case NM_LI48:
> @@ -29087,17 +29087,17 @@ static void mips_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>   
>       is_slot = ctx->hflags & MIPS_HFLAG_BMASK;
>       if (ctx->insn_flags & ISA_NANOMIPS32) {
> -        ctx->opcode = cpu_lduw_code(env, ctx->base.pc_next);
> +        ctx->opcode = translator_lduw(env, ctx->base.pc_next);
>           insn_bytes = decode_nanomips_opc(env, ctx);
>       } else if (!(ctx->hflags & MIPS_HFLAG_M16)) {
> -        ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
> +        ctx->opcode = translator_ldl(env, ctx->base.pc_next);
>           insn_bytes = 4;
>           decode_opc(env, ctx);
>       } else if (ctx->insn_flags & ASE_MICROMIPS) {
> -        ctx->opcode = cpu_lduw_code(env, ctx->base.pc_next);
> +        ctx->opcode = translator_lduw(env, ctx->base.pc_next);
>           insn_bytes = decode_micromips_opc(env, ctx);
>       } else if (ctx->insn_flags & ASE_MIPS16) {
> -        ctx->opcode = cpu_lduw_code(env, ctx->base.pc_next);
> +        ctx->opcode = translator_lduw(env, ctx->base.pc_next);
>           insn_bytes = decode_mips16_opc(env, ctx);
>       } else {
>           gen_reserved_instruction(ctx);


