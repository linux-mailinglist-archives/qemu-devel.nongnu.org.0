Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB936FAE8D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 13:45:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvzI5-0008Rg-HV; Mon, 08 May 2023 07:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pvzI2-0008RY-9a
 for qemu-devel@nongnu.org; Mon, 08 May 2023 07:44:26 -0400
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pvzI0-0008QR-1l
 for qemu-devel@nongnu.org; Mon, 08 May 2023 07:44:26 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N3Kc6-1qMhHn217y-010Jx0; Mon, 08 May 2023 13:44:09 +0200
Message-ID: <41dc0697-167e-30b2-afd2-a5f5dbbd0a03@vivier.eu>
Date: Mon, 8 May 2023 13:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
 <20230505212447.374546-6-richard.henderson@linaro.org>
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 05/42] target/m68k: Finish conversion to tcg_gen_qemu_{ld, 
 st}_*
In-Reply-To: <20230505212447.374546-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZzVDQjyw6mxsIWMx5zExwvOOzmp6gP798RSiCQZsAd7SXFATjW+
 HkK4NpF68KvMdpV/Si+wdpt7Ux5SnJAYPqTbjefkhnhbQUTmq/YyCsovXaAKmYgJXcvLuCD
 Hj+mThlwW6LwNAcelTNj9EaBKahebfSWHDIOMj4eLjTVqysyIQaYQyPlanOsd8+M4UEBIWD
 x4XUOiOE6Ts31bgVTGJ7A==
UI-OutboundReport: notjunk:1;M01:P0:afz58AzSw68=;CaYumHiI7H6xQ/H4WQoku2LE0aw
 vDXmiLTG5w1oVbs02Iot/zULObWUM6q2NDdKTj2L75b0NiV9yao2fchx/uyKVvx79iGmvaf/u
 1jUIZhj0Lx4Qy8iGHbMzR2sgnM5aYpUNn0YaUm8c4/1u/0ngGqe9CfRBDYlr45IihtsVIiNQl
 ZU1PNlpaBdsX94wmmPMEk5ap6/Z/kUPr0/qPU6KxCuKKdThFLvoxUKy1KkzY3xhjvDX3GDzsX
 9siTH4g0DlmQoYj2eMYvu/xFfeRe7XHd6436rprNLJwCfclOujs2K0rVVFqcvt6hoL65JmQTD
 2HXIit8xjcnUu0h6o6o3zswQZrX2OtzhQe0rxFjRP9mgrxPBP7Qj19zyMzsbWrlC8ja+dbfro
 YycMkl0aWI29PtxVz5gBVC2TUzT9urp0TvvGQBR8pIPpA+HfWK5nP8y4k3xd3GBMB+Mf1GANX
 BwWrbrPAF8O6pitz4o/0LhUaofZREwivZMaNXBl/ZO8BinpC/+5xS2UZVCMVKTm3GAsOB1SwV
 0I6PqKDnPMjLTx/NTeV0lVXMqyeC4EdF05SJK0TweCRe0ZO5Ao5oOGQQlHkcsNO7tU8WVBxP8
 iGlKkeaunqnA+Q2Oxs3n4nbUAAjeoRWmnOOyWqyoHmfAOfMbUquV6L4Ji2rmSQcrIasrKafqJ
 fmVrP275g85FrpaRPbDTtmkfAT33Ao6dt+hX43+INA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.802,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 05/05/2023 à 23:24, Richard Henderson a écrit :
> Convert away from the old interface with the implicit
> MemOp argument.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Anton Johansson <anjo@rev.ng>
> Message-Id: <20230502135741.1158035-5-richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 76 ++++++++++++++---------------------------
>   1 file changed, 25 insertions(+), 51 deletions(-)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 422f4652f1..744eb3748b 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -304,23 +304,14 @@ static inline void gen_addr_fault(DisasContext *s)
>   static inline TCGv gen_load(DisasContext *s, int opsize, TCGv addr,
>                               int sign, int index)
>   {
> -    TCGv tmp;
> -    tmp = tcg_temp_new_i32();
> -    switch(opsize) {
> +    TCGv tmp = tcg_temp_new_i32();
> +
> +    switch (opsize) {
>       case OS_BYTE:
> -        if (sign)
> -            tcg_gen_qemu_ld8s(tmp, addr, index);
> -        else
> -            tcg_gen_qemu_ld8u(tmp, addr, index);
> -        break;
>       case OS_WORD:
> -        if (sign)
> -            tcg_gen_qemu_ld16s(tmp, addr, index);
> -        else
> -            tcg_gen_qemu_ld16u(tmp, addr, index);
> -        break;
>       case OS_LONG:
> -        tcg_gen_qemu_ld32u(tmp, addr, index);
> +        tcg_gen_qemu_ld_tl(tmp, addr, index,
> +                           opsize | (sign ? MO_SIGN : 0) | MO_TE);
>           break;
>       default:
>           g_assert_not_reached();
> @@ -332,15 +323,11 @@ static inline TCGv gen_load(DisasContext *s, int opsize, TCGv addr,
>   static inline void gen_store(DisasContext *s, int opsize, TCGv addr, TCGv val,
>                                int index)
>   {
> -    switch(opsize) {
> +    switch (opsize) {
>       case OS_BYTE:
> -        tcg_gen_qemu_st8(val, addr, index);
> -        break;
>       case OS_WORD:
> -        tcg_gen_qemu_st16(val, addr, index);
> -        break;
>       case OS_LONG:
> -        tcg_gen_qemu_st32(val, addr, index);
> +        tcg_gen_qemu_st_tl(val, addr, index, opsize | MO_TE);
>           break;
>       default:
>           g_assert_not_reached();
> @@ -971,23 +958,16 @@ static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
>       tmp = tcg_temp_new();
>       switch (opsize) {
>       case OS_BYTE:
> -        tcg_gen_qemu_ld8s(tmp, addr, index);
> -        gen_helper_exts32(cpu_env, fp, tmp);
> -        break;
>       case OS_WORD:
> -        tcg_gen_qemu_ld16s(tmp, addr, index);
> -        gen_helper_exts32(cpu_env, fp, tmp);
> -        break;
> -    case OS_LONG:
> -        tcg_gen_qemu_ld32u(tmp, addr, index);
> +        tcg_gen_qemu_ld_tl(tmp, addr, index, opsize | MO_SIGN | MO_TE);
>           gen_helper_exts32(cpu_env, fp, tmp);
>           break;
>       case OS_SINGLE:
> -        tcg_gen_qemu_ld32u(tmp, addr, index);
> +        tcg_gen_qemu_ld_tl(tmp, addr, index, MO_TEUL);
>           gen_helper_extf32(cpu_env, fp, tmp);
>           break;
>       case OS_DOUBLE:
> -        tcg_gen_qemu_ld64(t64, addr, index);
> +        tcg_gen_qemu_ld_i64(t64, addr, index, MO_TEUQ);
>           gen_helper_extf64(cpu_env, fp, t64);
>           break;
>       case OS_EXTENDED:
> @@ -995,11 +975,11 @@ static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
>               gen_exception(s, s->base.pc_next, EXCP_FP_UNIMP);
>               break;
>           }
> -        tcg_gen_qemu_ld32u(tmp, addr, index);
> +        tcg_gen_qemu_ld_i32(tmp, addr, index, MO_TEUL);
>           tcg_gen_shri_i32(tmp, tmp, 16);
>           tcg_gen_st16_i32(tmp, fp, offsetof(FPReg, l.upper));
>           tcg_gen_addi_i32(tmp, addr, 4);
> -        tcg_gen_qemu_ld64(t64, tmp, index);
> +        tcg_gen_qemu_ld_i64(t64, tmp, index, MO_TEUQ);
>           tcg_gen_st_i64(t64, fp, offsetof(FPReg, l.lower));
>           break;
>       case OS_PACKED:
> @@ -1024,24 +1004,18 @@ static void gen_store_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
>       tmp = tcg_temp_new();
>       switch (opsize) {
>       case OS_BYTE:
> -        gen_helper_reds32(tmp, cpu_env, fp);
> -        tcg_gen_qemu_st8(tmp, addr, index);
> -        break;
>       case OS_WORD:
> -        gen_helper_reds32(tmp, cpu_env, fp);
> -        tcg_gen_qemu_st16(tmp, addr, index);
> -        break;
>       case OS_LONG:
>           gen_helper_reds32(tmp, cpu_env, fp);
> -        tcg_gen_qemu_st32(tmp, addr, index);
> +        tcg_gen_qemu_st_tl(tmp, addr, index, opsize | MO_TE);
>           break;
>       case OS_SINGLE:
>           gen_helper_redf32(tmp, cpu_env, fp);
> -        tcg_gen_qemu_st32(tmp, addr, index);
> +        tcg_gen_qemu_st_tl(tmp, addr, index, MO_TEUL);
>           break;
>       case OS_DOUBLE:
>           gen_helper_redf64(t64, cpu_env, fp);
> -        tcg_gen_qemu_st64(t64, addr, index);
> +        tcg_gen_qemu_st_i64(t64, addr, index, MO_TEUQ);
>           break;
>       case OS_EXTENDED:
>           if (m68k_feature(s->env, M68K_FEATURE_CF_FPU)) {
> @@ -1050,10 +1024,10 @@ static void gen_store_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
>           }
>           tcg_gen_ld16u_i32(tmp, fp, offsetof(FPReg, l.upper));
>           tcg_gen_shli_i32(tmp, tmp, 16);
> -        tcg_gen_qemu_st32(tmp, addr, index);
> +        tcg_gen_qemu_st_i32(tmp, addr, index, MO_TEUL);
>           tcg_gen_addi_i32(tmp, addr, 4);
>           tcg_gen_ld_i64(t64, fp, offsetof(FPReg, l.lower));
> -        tcg_gen_qemu_st64(t64, tmp, index);
> +        tcg_gen_qemu_st_i64(t64, tmp, index, MO_TEUQ);
>           break;
>       case OS_PACKED:
>           /*
> @@ -2079,14 +2053,14 @@ DISAS_INSN(movep)
>       if (insn & 0x80) {
>           for ( ; i > 0 ; i--) {
>               tcg_gen_shri_i32(dbuf, reg, (i - 1) * 8);
> -            tcg_gen_qemu_st8(dbuf, abuf, IS_USER(s));
> +            tcg_gen_qemu_st_i32(dbuf, abuf, IS_USER(s), MO_UB);
>               if (i > 1) {
>                   tcg_gen_addi_i32(abuf, abuf, 2);
>               }
>           }
>       } else {
>           for ( ; i > 0 ; i--) {
> -            tcg_gen_qemu_ld8u(dbuf, abuf, IS_USER(s));
> +            tcg_gen_qemu_ld_tl(dbuf, abuf, IS_USER(s), MO_UB);
>               tcg_gen_deposit_i32(reg, reg, dbuf, (i - 1) * 8, 8);
>               if (i > 1) {
>                   tcg_gen_addi_i32(abuf, abuf, 2);
> @@ -4337,14 +4311,14 @@ static void m68k_copy_line(TCGv dst, TCGv src, int index)
>       t1 = tcg_temp_new_i64();
>   
>       tcg_gen_andi_i32(addr, src, ~15);
> -    tcg_gen_qemu_ld64(t0, addr, index);
> +    tcg_gen_qemu_ld_i64(t0, addr, index, MO_TEUQ);
>       tcg_gen_addi_i32(addr, addr, 8);
> -    tcg_gen_qemu_ld64(t1, addr, index);
> +    tcg_gen_qemu_ld_i64(t1, addr, index, MO_TEUQ);
>   
>       tcg_gen_andi_i32(addr, dst, ~15);
> -    tcg_gen_qemu_st64(t0, addr, index);
> +    tcg_gen_qemu_st_i64(t0, addr, index, MO_TEUQ);
>       tcg_gen_addi_i32(addr, addr, 8);
> -    tcg_gen_qemu_st64(t1, addr, index);
> +    tcg_gen_qemu_st_i64(t1, addr, index, MO_TEUQ);
>   }
>   
>   DISAS_INSN(move16_reg)
> @@ -4767,7 +4741,7 @@ static void gen_qemu_store_fcr(DisasContext *s, TCGv addr, int reg)
>   
>       tmp = tcg_temp_new();
>       gen_load_fcr(s, tmp, reg);
> -    tcg_gen_qemu_st32(tmp, addr, index);
> +    tcg_gen_qemu_st_tl(tmp, addr, index, MO_TEUL);
>   }
>   
>   static void gen_qemu_load_fcr(DisasContext *s, TCGv addr, int reg)
> @@ -4776,7 +4750,7 @@ static void gen_qemu_load_fcr(DisasContext *s, TCGv addr, int reg)
>       TCGv tmp;
>   
>       tmp = tcg_temp_new();
> -    tcg_gen_qemu_ld32u(tmp, addr, index);
> +    tcg_gen_qemu_ld_tl(tmp, addr, index, MO_TEUL);
>       gen_store_fcr(s, tmp, reg);
>   }
>   

This patch introduces a problem:

ERROR:.../target/m68k/translate.c:993:gen_load_fp: code should not be reached
Bail out! ERROR:.../target/m68k/translate.c:993:gen_load_fp: code should not be reached

$ wget http://vivier.eu/debian/ROMS/m68k-virt.petitboot
$ wget http://vivier.eu/debian/ROMS/m68k-virt.vmlinux

$ qemu-system-m68k -M virt   -m 3399672K   -chardev stdio,signal=off,mux=on,id=char0   -serial 
chardev:char0   -mon chardev=char0,mode=readline   -device virtio-rng-device  -kernel 
m68k-virt.vmlinux -initrd m68k-virt.petitboot

Thanks,
Laurent

