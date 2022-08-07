Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4F758B915
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Aug 2022 05:37:45 +0200 (CEST)
Received: from localhost ([::1]:41814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKX6m-0004QP-B2
	for lists+qemu-devel@lfdr.de; Sat, 06 Aug 2022 23:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1oKX5T-000352-4r
 for qemu-devel@nongnu.org; Sat, 06 Aug 2022 23:36:23 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55314 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1oKX5Q-00022n-9i
 for qemu-devel@nongnu.org; Sat, 06 Aug 2022 23:36:22 -0400
Received: from smtpclient.apple (unknown [124.126.138.235])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxSs0rM+9imSYJAA--.19440S3; 
 Sun, 07 Aug 2022 11:36:11 +0800 (CST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] target/loongarch: Remove cpu_fcsr0
From: huqi <huqi@loongson.cn>
In-Reply-To: <20220806170800.373219-1-richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>
Date: Sun, 7 Aug 2022 11:36:10 +0800
Message-Id: <1007796D-FC5D-495F-A290-5973C5387627@loongson.cn>
References: <20220806170800.373219-1-richard.henderson@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: iPhone Mail (19E241)
X-CM-TRANSID: AQAAf9AxSs0rM+9imSYJAA--.19440S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKr4xAw43Ar4kAr48Ww4kZwb_yoWxJFWxpr
 W7Cry0kr48JFZ3Zas7G390gF1DZr48Cay2vayakryFkrsrJF9rZr1kK39F9FWDA3y5Wry0
 vF9YkF17u3WkX3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
 W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r48
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
 W8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUnpnQUUUUU
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQALCV3QvP-MSAABsI
Received-SPF: pass client-ip=114.242.206.163; envelope-from=huqi@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Aug 7, 2022, at 01:09, Richard Henderson <richard.henderson@linaro.org>=
 wrote:
> =EF=BB=BFAll of the fpu operations are defined with TCG_CALL_NO_WG, but th=
ey
> all modify FCSR0.  The most efficient way to fix this is to remove
> cpu_fcsr0, and instead use explicit load and store operations for the
> two instructions that manipulate that value.
>=20
> Cc: Qi Hu <huqi@loongson.cn>
> Cc: Song Gao <gaosong@loongson.cn>
> Reported-by: Feiyang Chen <chenfeiyang@loongson.cn>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> target/loongarch/helper.h                    |  2 +-
> target/loongarch/fpu_helper.c                |  4 +--
> target/loongarch/translate.c                 |  3 --
> tests/tcg/loongarch64/test_fcsr.c            | 15 +++++++++
> target/loongarch/insn_trans/trans_fmov.c.inc | 33 ++++++++++----------
> tests/tcg/loongarch64/Makefile.target        |  1 +
> 6 files changed, 36 insertions(+), 22 deletions(-)
> create mode 100644 tests/tcg/loongarch64/test_fcsr.c
>=20
> diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
> index cbbe008f32..9c01823a26 100644
> --- a/target/loongarch/helper.h
> +++ b/target/loongarch/helper.h
> @@ -91,7 +91,7 @@ DEF_HELPER_2(ftint_w_d, i64, env, i64)
> DEF_HELPER_2(frint_s, i64, env, i64)
> DEF_HELPER_2(frint_d, i64, env, i64)
>=20
> -DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_RWG, void, env, i32)
> +DEF_HELPER_FLAGS_1(set_rounding_mode, TCG_CALL_NO_RWG, void, env)
>=20
> DEF_HELPER_1(rdtime_d, i64, env)
>=20
> diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c=

> index bd76529219..4b9637210a 100644
> --- a/target/loongarch/fpu_helper.c
> +++ b/target/loongarch/fpu_helper.c
> @@ -872,8 +872,8 @@ uint64_t helper_ftint_w_d(CPULoongArchState *env, uint=
64_t fj)
>     return fd;
> }
>=20
> -void helper_set_rounding_mode(CPULoongArchState *env, uint32_t fcsr0)
> +void helper_set_rounding_mode(CPULoongArchState *env)
> {
> -    set_float_rounding_mode(ieee_rm[(fcsr0 >> FCSR0_RM) & 0x3],
> +    set_float_rounding_mode(ieee_rm[(env->fcsr0 >> FCSR0_RM) & 0x3],
>                             &env->fp_status);
> }
> diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
> index c9afd11420..51ba291430 100644
> --- a/target/loongarch/translate.c
> +++ b/target/loongarch/translate.c
> @@ -22,7 +22,6 @@
> /* Global register indices */
> TCGv cpu_gpr[32], cpu_pc;
> static TCGv cpu_lladdr, cpu_llval;
> -TCGv_i32 cpu_fcsr0;
> TCGv_i64 cpu_fpr[32];
>=20
> #include "exec/gen-icount.h"
> @@ -266,8 +265,6 @@ void loongarch_translate_init(void)
>     }
>=20
>     cpu_pc =3D tcg_global_mem_new(cpu_env, offsetof(CPULoongArchState, pc)=
, "pc");
> -    cpu_fcsr0 =3D tcg_global_mem_new_i32(cpu_env,
> -                    offsetof(CPULoongArchState, fcsr0), "fcsr0");
>     cpu_lladdr =3D tcg_global_mem_new(cpu_env,
>                     offsetof(CPULoongArchState, lladdr), "lladdr");
>     cpu_llval =3D tcg_global_mem_new(cpu_env,
> diff --git a/tests/tcg/loongarch64/test_fcsr.c b/tests/tcg/loongarch64/tes=
t_fcsr.c
> new file mode 100644
> index 0000000000..ad3609eb99
> --- /dev/null
> +++ b/tests/tcg/loongarch64/test_fcsr.c
> @@ -0,0 +1,15 @@
> +#include <assert.h>
> +
> +int main()
> +{
> +    unsigned fcsr;
> +
> +    asm("movgr2fcsr $r0,$r0\n\t"
> +        "movgr2fr.d $f0,$r0\n\t"
> +        "fdiv.d     $f0,$f0,$f0\n\t"
> +        "movfcsr2gr %0,$r0"
> +        : "=3Dr"(fcsr) : : "f0");
> +
> +    assert(fcsr & (16 << 16)); /* Invalid */
> +    return 0;
> +}
> diff --git a/target/loongarch/insn_trans/trans_fmov.c.inc b/target/loongar=
ch/insn_trans/trans_fmov.c.inc
> index 24753d4568..5537e3dd35 100644
> --- a/target/loongarch/insn_trans/trans_fmov.c.inc
> +++ b/target/loongarch/insn_trans/trans_fmov.c.inc
> @@ -60,38 +60,39 @@ static bool trans_movgr2fcsr(DisasContext *ctx, arg_mo=
vgr2fcsr *a)
>     TCGv Rj =3D gpr_src(ctx, a->rj, EXT_NONE);
>=20
>     if (mask =3D=3D UINT32_MAX) {
> -        tcg_gen_extrl_i64_i32(cpu_fcsr0, Rj);
> +        tcg_gen_st32_i64(Rj, cpu_env, offsetof(CPULoongArchState, fcsr0))=
;
>     } else {
> +        TCGv_i32 fcsr0 =3D tcg_temp_new_i32();
>         TCGv_i32 temp =3D tcg_temp_new_i32();
>=20
> +        tcg_gen_ld_i32(fcsr0, cpu_env, offsetof(CPULoongArchState, fcsr0)=
);
>         tcg_gen_extrl_i64_i32(temp, Rj);
>         tcg_gen_andi_i32(temp, temp, mask);
> -        tcg_gen_andi_i32(cpu_fcsr0, cpu_fcsr0, ~mask);
> -        tcg_gen_or_i32(cpu_fcsr0, cpu_fcsr0, temp);
> +        tcg_gen_andi_i32(fcsr0, fcsr0, ~mask);
> +        tcg_gen_or_i32(fcsr0, fcsr0, temp);
> +        tcg_gen_st_i32(fcsr0, cpu_env, offsetof(CPULoongArchState, fcsr0)=
);
> +
>         tcg_temp_free_i32(temp);
> -
> -        /*
> -         * Install the new rounding mode to fpu_status, if changed.
> -         * Note that FCSR3 is exactly the rounding mode field.
> -         */
> -        if (mask !=3D FCSR0_M3) {
> -            return true;
> -        }
> +        tcg_temp_free_i32(fcsr0);
>     }
> -    gen_helper_set_rounding_mode(cpu_env, cpu_fcsr0);
>=20
> +    /*
> +     * Install the new rounding mode to fpu_status, if changed.
> +     * Note that FCSR3 is exactly the rounding mode field.
> +     */
> +    if (mask & FCSR0_M3) {
> +        gen_helper_set_rounding_mode(cpu_env);
> +    }
>     return true;
> }
>=20
> static bool trans_movfcsr2gr(DisasContext *ctx, arg_movfcsr2gr *a)
> {
> -    TCGv_i32 temp =3D tcg_temp_new_i32();
>     TCGv dest =3D gpr_dst(ctx, a->rd, EXT_NONE);
>=20
> -    tcg_gen_andi_i32(temp, cpu_fcsr0, fcsr_mask[a->fcsrs]);
> -    tcg_gen_ext_i32_i64(dest, temp);
> +    tcg_gen_ld32u_i64(dest, cpu_env, offsetof(CPULoongArchState, fcsr0));=

> +    tcg_gen_andi_i64(dest, dest, fcsr_mask[a->fcsrs]);
>     gen_set_gpr(a->rd, dest, EXT_NONE);
> -    tcg_temp_free_i32(temp);
>=20
>     return true;
> }
> diff --git a/tests/tcg/loongarch64/Makefile.target b/tests/tcg/loongarch64=
/Makefile.target
> index 0115de78ef..00030a1026 100644
> --- a/tests/tcg/loongarch64/Makefile.target
> +++ b/tests/tcg/loongarch64/Makefile.target
> @@ -15,5 +15,6 @@ LOONGARCH64_TESTS  +=3D test_div
> LOONGARCH64_TESTS  +=3D test_fclass
> LOONGARCH64_TESTS  +=3D test_fpcom
> LOONGARCH64_TESTS  +=3D test_pcadd
> +LOONGARCH64_TESTS  +=3D test_fcsr
>=20
> TESTS +=3D $(LOONGARCH64_TESTS)
> --=20
> 2.34.1

Acked-by: Qi Hu <huqi@loongson.cn>=


