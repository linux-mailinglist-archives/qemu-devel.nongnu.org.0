Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01D844B2B3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 19:26:09 +0100 (CET)
Received: from localhost ([::1]:54652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVou-0003u5-Au
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 13:26:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mkVnS-0002BI-VG; Tue, 09 Nov 2021 13:24:40 -0500
Received: from [2001:41c9:1:41f::167] (port=33610
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mkVnP-0007zb-N6; Tue, 09 Nov 2021 13:24:38 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mkVn4-0002jV-0A; Tue, 09 Nov 2021 18:24:21 +0000
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
 <20211029202424.175401-4-matheus.ferst@eldorado.org.br>
 <69796ce5-0709-f9da-ff1e-1dd0ac5de414@ilande.co.uk>
 <c799859a-4fdc-9d69-7a87-5e69cee15ef3@eldorado.org.br>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <2b30c716-4718-4363-3c8e-c9a930c6079f@ilande.co.uk>
Date: Tue, 9 Nov 2021 18:24:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c799859a-4fdc-9d69-7a87-5e69cee15ef3@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 03/34] target/ppc: Move load and store floating point
 instructions to decodetree
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.364,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fernando Eckhardt Valle <phervalle@gmail.com>, lucas.castro@eldorado.org.br,
 richard.henderson@linaro.org, groug@kaod.org, luis.pires@eldorado.org.br,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/11/2021 17:32, Matheus K. Ferst wrote:

> On 09/11/2021 10:43, Mark Cave-Ayland wrote:
>> On 29/10/2021 21:23, matheus.ferst@eldorado.org.br wrote:
>>
>>> From: Fernando Eckhardt Valle <phervalle@gmail.com>
>>>
>>> Move load floating point instructions (lfs, lfsu, lfsx, lfsux, lfd, lfdu, lfdx, 
>>> lfdux)
>>> and store floating point instructions(stfs, stfsu, stfsx, stfsux, stfd, stfdu, stfdx,
>>> stfdux) from legacy system to decodetree.
>>>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>
>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>> ---
>>> v2:
>>> - if instead of top-level ternary operator
>>> ---
>>>   target/ppc/insn32.decode           |  24 +++
>>>   target/ppc/translate/fp-impl.c.inc | 247 +++++++++--------------------
>>>   target/ppc/translate/fp-ops.c.inc  |  29 ----
>>>   3 files changed, 95 insertions(+), 205 deletions(-)
>>>
>>> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
>>> index 6aec1c0728..3837b799c8 100644
>>> --- a/target/ppc/insn32.decode
>>> +++ b/target/ppc/insn32.decode
>>> @@ -193,6 +193,30 @@ ADDPCIS         010011 ..... ..... .......... 00010 .   @DX
>>>
>>>   CFUGED          011111 ..... ..... ..... 0011011100 -   @X
>>>
>>> +### Float-Point Load Instructions
>>> +
>>> +LFS             110000 ..... ..... ................     @D
>>> +LFSU            110001 ..... ..... ................     @D
>>> +LFSX            011111 ..... ..... ..... 1000010111 -   @X
>>> +LFSUX           011111 ..... ..... ..... 1000110111 -   @X
>>> +
>>> +LFD             110010 ..... ..... ................     @D
>>> +LFDU            110011 ..... ..... ................     @D
>>> +LFDX            011111 ..... ..... ..... 1001010111 -   @X
>>> +LFDUX           011111 ..... ..... ..... 1001110111 -   @X
>>> +
>>> +### Float-Point Store Instructions
>>> +
>>> +STFS            110100 ..... ...... ...............     @D
>>> +STFSU           110101 ..... ...... ...............     @D
>>> +STFSX           011111 ..... ...... .... 1010010111 -   @X
>>> +STFSUX          011111 ..... ...... .... 1010110111 -   @X
>>> +
>>> +STFD            110110 ..... ...... ...............     @D
>>> +STFDU           110111 ..... ...... ...............     @D
>>> +STFDX           011111 ..... ...... .... 1011010111 -   @X
>>> +STFDUX          011111 ..... ...... .... 1011110111 -   @X
>>> +
>>>   ### Move To/From System Register Instructions
>>>
>>>   SETBC           011111 ..... ..... ----- 0110000000 -   @X_bi
>>> diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
>>> index 9f7868ee28..57a799db1c 100644
>>> --- a/target/ppc/translate/fp-impl.c.inc
>>> +++ b/target/ppc/translate/fp-impl.c.inc
>>> @@ -854,99 +854,6 @@ static void gen_mtfsfi(DisasContext *ctx)
>>>       gen_helper_float_check_status(cpu_env);
>>>   }
>>>
>>> -/***                         Floating-point load                           ***/
>>> -#define GEN_LDF(name, ldop, opc, type)                                        \
>>> -static void glue(gen_, name)(DisasContext *ctx)                               \
>>> -{ \
>>> -    TCGv EA;                                                                  \
>>> -    TCGv_i64 t0;                                                              \
>>> -    if (unlikely(!ctx->fpu_enabled)) {                                        \
>>> -        gen_exception(ctx, POWERPC_EXCP_FPU);                                 \
>>> - return;                                                               \
>>> - } \
>>> -    gen_set_access_type(ctx, ACCESS_FLOAT);                                   \
>>> -    EA = tcg_temp_new();                                                      \
>>> -    t0 = tcg_temp_new_i64();                                                  \
>>> -    gen_addr_imm_index(ctx, EA, 0);                                           \
>>> -    gen_qemu_##ldop(ctx, t0, EA);                                             \
>>> -    set_fpr(rD(ctx->opcode), t0);                                             \
>>> - tcg_temp_free(EA); \
>>> - tcg_temp_free_i64(t0); \
>>> -}
>>> -
>>> -#define GEN_LDUF(name, ldop, opc, type)                                       \
>>> -static void glue(gen_, name##u)(DisasContext *ctx)                            \
>>> -{ \
>>> -    TCGv EA;                                                                  \
>>> -    TCGv_i64 t0;                                                              \
>>> -    if (unlikely(!ctx->fpu_enabled)) {                                        \
>>> -        gen_exception(ctx, POWERPC_EXCP_FPU);                                 \
>>> - return;                                                               \
>>> - } \
>>> -    if (unlikely(rA(ctx->opcode) == 0)) {                                     \
>>> -        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);                   \
>>> - return;                                                               \
>>> - } \
>>> -    gen_set_access_type(ctx, ACCESS_FLOAT);                                   \
>>> -    EA = tcg_temp_new();                                                      \
>>> -    t0 = tcg_temp_new_i64();                                                  \
>>> -    gen_addr_imm_index(ctx, EA, 0);                                           \
>>> -    gen_qemu_##ldop(ctx, t0, EA);                                             \
>>> -    set_fpr(rD(ctx->opcode), t0);                                             \
>>> -    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], EA);                             \
>>> - tcg_temp_free(EA); \
>>> - tcg_temp_free_i64(t0); \
>>> -}
>>> -
>>> -#define GEN_LDUXF(name, ldop, opc, type)                                      \
>>> -static void glue(gen_, name##ux)(DisasContext *ctx)                           \
>>> -{ \
>>> -    TCGv EA;                                                                  \
>>> -    TCGv_i64 t0;                                                              \
>>> -    if (unlikely(!ctx->fpu_enabled)) {                                        \
>>> -        gen_exception(ctx, POWERPC_EXCP_FPU);                                 \
>>> - return;                                                               \
>>> - } \
>>> -    t0 = tcg_temp_new_i64();                                                  \
>>> -    if (unlikely(rA(ctx->opcode) == 0)) {                                     \
>>> -        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);                   \
>>> - return;                                                               \
>>> - } \
>>> -    gen_set_access_type(ctx, ACCESS_FLOAT);                                   \
>>> -    EA = tcg_temp_new();                                                      \
>>> -    gen_addr_reg_index(ctx, EA);                                              \
>>> -    gen_qemu_##ldop(ctx, t0, EA);                                             \
>>> -    set_fpr(rD(ctx->opcode), t0);                                             \
>>> -    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], EA);                             \
>>> - tcg_temp_free(EA); \
>>> - tcg_temp_free_i64(t0); \
>>> -}
>>> -
>>> -#define GEN_LDXF(name, ldop, opc2, opc3, type)                                \
>>> -static void glue(gen_, name##x)(DisasContext *ctx)                            \
>>> -{ \
>>> -    TCGv EA;                                                                  \
>>> -    TCGv_i64 t0;                                                              \
>>> -    if (unlikely(!ctx->fpu_enabled)) {                                        \
>>> -        gen_exception(ctx, POWERPC_EXCP_FPU);                                 \
>>> - return;                                                               \
>>> - } \
>>> -    gen_set_access_type(ctx, ACCESS_FLOAT);                                   \
>>> -    EA = tcg_temp_new();                                                      \
>>> -    t0 = tcg_temp_new_i64();                                                  \
>>> -    gen_addr_reg_index(ctx, EA);                                              \
>>> -    gen_qemu_##ldop(ctx, t0, EA);                                             \
>>> -    set_fpr(rD(ctx->opcode), t0);                                             \
>>> - tcg_temp_free(EA); \
>>> - tcg_temp_free_i64(t0); \
>>> -}
>>> -
>>> -#define GEN_LDFS(name, ldop, op, type)                                        \
>>> -GEN_LDF(name, ldop, op | 0x20, type);                                         \
>>> -GEN_LDUF(name, ldop, op | 0x21, type);                                        \
>>> -GEN_LDUXF(name, ldop, op | 0x01, type);                                       \
>>> -GEN_LDXF(name, ldop, 0x17, op | 0x00, type)
>>> -
>>>   static void gen_qemu_ld32fs(DisasContext *ctx, TCGv_i64 dest, TCGv addr)
>>>   {
>>>       TCGv_i32 tmp = tcg_temp_new_i32();
>>> @@ -955,11 +862,6 @@ static void gen_qemu_ld32fs(DisasContext *ctx, TCGv_i64 dest, 
>>> TCGv addr)
>>>       tcg_temp_free_i32(tmp);
>>>   }
>>>
>>> - /* lfd lfdu lfdux lfdx */
>>> -GEN_LDFS(lfd, ld64_i64, 0x12, PPC_FLOAT);
>>> - /* lfs lfsu lfsux lfsx */
>>> -GEN_LDFS(lfs, ld32fs, 0x10, PPC_FLOAT);
>>> -
>>>   /* lfdepx (external PID lfdx) */
>>>   static void gen_lfdepx(DisasContext *ctx)
>>>   {
>>> @@ -1089,73 +991,6 @@ static void gen_lfiwzx(DisasContext *ctx)
>>>       tcg_temp_free(EA);
>>>       tcg_temp_free_i64(t0);
>>>   }
>>> -/***                         Floating-point store                          ***/
>>> -#define GEN_STF(name, stop, opc, type)                                        \
>>> -static void glue(gen_, name)(DisasContext *ctx)                               \
>>> -{ \
>>> -    TCGv EA;                                                                  \
>>> -    TCGv_i64 t0;                                                              \
>>> -    if (unlikely(!ctx->fpu_enabled)) {                                        \
>>> -        gen_exception(ctx, POWERPC_EXCP_FPU);                                 \
>>> - return;                                                               \
>>> - } \
>>> -    gen_set_access_type(ctx, ACCESS_FLOAT);                                   \
>>> -    EA = tcg_temp_new();                                                      \
>>> -    t0 = tcg_temp_new_i64();                                                  \
>>> -    gen_addr_imm_index(ctx, EA, 0);                                           \
>>> -    get_fpr(t0, rS(ctx->opcode));                                             \
>>> -    gen_qemu_##stop(ctx, t0, EA);                                             \
>>> - tcg_temp_free(EA); \
>>> - tcg_temp_free_i64(t0); \
>>> -}
>>> -
>>> -#define GEN_STUF(name, stop, opc, type)                                       \
>>> -static void glue(gen_, name##u)(DisasContext *ctx)                            \
>>> -{ \
>>> -    TCGv EA;                                                                  \
>>> -    TCGv_i64 t0;                                                              \
>>> -    if (unlikely(!ctx->fpu_enabled)) {                                        \
>>> -        gen_exception(ctx, POWERPC_EXCP_FPU);                                 \
>>> - return;                                                               \
>>> - } \
>>> -    if (unlikely(rA(ctx->opcode) == 0)) {                                     \
>>> -        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);                   \
>>> - return;                                                               \
>>> - } \
>>> -    gen_set_access_type(ctx, ACCESS_FLOAT);                                   \
>>> -    EA = tcg_temp_new();                                                      \
>>> -    t0 = tcg_temp_new_i64();                                                  \
>>> -    gen_addr_imm_index(ctx, EA, 0);                                           \
>>> -    get_fpr(t0, rS(ctx->opcode));                                             \
>>> -    gen_qemu_##stop(ctx, t0, EA);                                             \
>>> -    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], EA);                             \
>>> - tcg_temp_free(EA); \
>>> - tcg_temp_free_i64(t0); \
>>> -}
>>> -
>>> -#define GEN_STUXF(name, stop, opc, type)                                      \
>>> -static void glue(gen_, name##ux)(DisasContext *ctx)                           \
>>> -{ \
>>> -    TCGv EA;                                                                  \
>>> -    TCGv_i64 t0;                                                              \
>>> -    if (unlikely(!ctx->fpu_enabled)) {                                        \
>>> -        gen_exception(ctx, POWERPC_EXCP_FPU);                                 \
>>> - return;                                                               \
>>> - } \
>>> -    if (unlikely(rA(ctx->opcode) == 0)) {                                     \
>>> -        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);                   \
>>> - return;                                                               \
>>> - } \
>>> -    gen_set_access_type(ctx, ACCESS_FLOAT);                                   \
>>> -    EA = tcg_temp_new();                                                      \
>>> -    t0 = tcg_temp_new_i64();                                                  \
>>> -    gen_addr_reg_index(ctx, EA);                                              \
>>> -    get_fpr(t0, rS(ctx->opcode));                                             \
>>> -    gen_qemu_##stop(ctx, t0, EA);                                             \
>>> -    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], EA);                             \
>>> - tcg_temp_free(EA); \
>>> - tcg_temp_free_i64(t0); \
>>> -}
>>>
>>>   #define GEN_STXF(name, stop, opc2, opc3, type)                                \
>>>   static void glue(gen_, name##x)(DisasContext *ctx)                            \
>>> @@ -1176,12 +1011,6 @@ static void glue(gen_, name##x)(DisasContext 
>>> *ctx)                            \
>>> tcg_temp_free_i64(t0); \
>>>   }
>>>
>>> -#define GEN_STFS(name, stop, op, type)                                        \
>>> -GEN_STF(name, stop, op | 0x20, type);                                         \
>>> -GEN_STUF(name, stop, op | 0x21, type);                                        \
>>> -GEN_STUXF(name, stop, op | 0x01, type);                                       \
>>> -GEN_STXF(name, stop, 0x17, op | 0x00, type)
>>> -
>>>   static void gen_qemu_st32fs(DisasContext *ctx, TCGv_i64 src, TCGv addr)
>>>   {
>>>       TCGv_i32 tmp = tcg_temp_new_i32();
>>> @@ -1190,11 +1019,6 @@ static void gen_qemu_st32fs(DisasContext *ctx, TCGv_i64 
>>> src, TCGv addr)
>>>       tcg_temp_free_i32(tmp);
>>>   }
>>>
>>> -/* stfd stfdu stfdux stfdx */
>>> -GEN_STFS(stfd, st64_i64, 0x16, PPC_FLOAT);
>>> -/* stfs stfsu stfsux stfsx */
>>> -GEN_STFS(stfs, st32fs, 0x14, PPC_FLOAT);
>>> -
>>>   /* stfdepx (external PID lfdx) */
>>>   static void gen_stfdepx(DisasContext *ctx)
>>>   {
>>> @@ -1473,6 +1297,77 @@ static void gen_stfqx(DisasContext *ctx)
>>>       tcg_temp_free_i64(t1);
>>>   }
>>>
>>> +/*            Floating-point Load/Store Instructions                         */
>>> +static bool do_lsfpsd(DisasContext *ctx, int rt, int ra, TCGv displ,
>>> +                      bool update, bool store, bool single)
>>> +{
>>> +    TCGv ea;
>>> +    TCGv_i64 t0;
>>> +    REQUIRE_INSNS_FLAGS(ctx, FLOAT);
>>> +    REQUIRE_FPU(ctx);
>>> +    if (update && ra == 0) {
>>> +        gen_invalid(ctx);
>>> +        return true;
>>> +    }
>>> +    gen_set_access_type(ctx, ACCESS_FLOAT);
>>> +    t0 = tcg_temp_new_i64();
>>> +    ea = do_ea_calc(ctx, ra, displ);
>>> +    if (store) {
>>> +        get_fpr(t0, rt);
>>> +        if (single) {
>>> +            gen_qemu_st32fs(ctx, t0, ea);
>>> +        } else {
>>> +            gen_qemu_st64_i64(ctx, t0, ea);
>>> +        }
>>> +    } else {
>>> +        if (single) {
>>> +            gen_qemu_ld32fs(ctx, t0, ea);
>>> +        } else {
>>> +            gen_qemu_ld64_i64(ctx, t0, ea);
>>> +        }
>>> +        set_fpr(rt, t0);
>>> +    }
>>> +    if (update) {
>>> +        tcg_gen_mov_tl(cpu_gpr[rt], ea);
>>> +    }
>>> +    tcg_temp_free_i64(t0);
>>> +    tcg_temp_free(ea);
>>> +    return true;
>>> +}
>>> +
>>> +static bool do_lsfp_D(DisasContext *ctx, arg_D *a, bool update, bool store,
>>> +                      bool single)
>>> +{
>>> +    return do_lsfpsd(ctx, a->rt, a->ra, tcg_constant_tl(a->si), update, store,
>>> +                     single);
>>> +}
>>> +
>>> +static bool do_lsfp_X(DisasContext *ctx, arg_X *a, bool update,
>>> +                      bool store, bool single)
>>> +{
>>> +    return do_lsfpsd(ctx, a->rt, a->ra, cpu_gpr[a->rb], update, store, single);
>>> +}
>>> +
>>> +TRANS(LFS, do_lsfp_D, false, false, true)
>>> +TRANS(LFSU, do_lsfp_D, true, false, true)
>>> +TRANS(LFSX, do_lsfp_X, false, false, true)
>>> +TRANS(LFSUX, do_lsfp_X, true, false, true)
>>> +
>>> +TRANS(LFD, do_lsfp_D, false, false, false)
>>> +TRANS(LFDU, do_lsfp_D, true, false, false)
>>> +TRANS(LFDX, do_lsfp_X, false, false, false)
>>> +TRANS(LFDUX, do_lsfp_X, true, false, false)
>>> +
>>> +TRANS(STFS, do_lsfp_D, false, true, true)
>>> +TRANS(STFSU, do_lsfp_D, true, true, true)
>>> +TRANS(STFSX, do_lsfp_X, false, true, true)
>>> +TRANS(STFSUX, do_lsfp_X, true, true, true)
>>> +
>>> +TRANS(STFD, do_lsfp_D, false, true, false)
>>> +TRANS(STFDU, do_lsfp_D, true, true, false)
>>> +TRANS(STFDX, do_lsfp_X, false, true, false)
>>> +TRANS(STFDUX, do_lsfp_X, true, true, false)
>>> +
>>>   #undef _GEN_FLOAT_ACB
>>>   #undef GEN_FLOAT_ACB
>>>   #undef _GEN_FLOAT_AB
>>> diff --git a/target/ppc/translate/fp-ops.c.inc b/target/ppc/translate/fp-ops.c.inc
>>> index 88fab65628..4260635a12 100644
>>> --- a/target/ppc/translate/fp-ops.c.inc
>>> +++ b/target/ppc/translate/fp-ops.c.inc
>>> @@ -50,43 +50,14 @@ GEN_FLOAT_B(riz, 0x08, 0x0D, 1, PPC_FLOAT_EXT),
>>>   GEN_FLOAT_B(rip, 0x08, 0x0E, 1, PPC_FLOAT_EXT),
>>>   GEN_FLOAT_B(rim, 0x08, 0x0F, 1, PPC_FLOAT_EXT),
>>>
>>> -#define GEN_LDF(name, ldop, opc, type)                                        \
>>> -GEN_HANDLER(name, opc, 0xFF, 0xFF, 0x00000000, type),
>>> -#define GEN_LDUF(name, ldop, opc, type)                                       \
>>> -GEN_HANDLER(name##u, opc, 0xFF, 0xFF, 0x00000000, type),
>>> -#define GEN_LDUXF(name, ldop, opc, type)                                      \
>>> -GEN_HANDLER(name##ux, 0x1F, 0x17, opc, 0x00000001, type),
>>> -#define GEN_LDXF(name, ldop, opc2, opc3, type)                                \
>>> -GEN_HANDLER(name##x, 0x1F, opc2, opc3, 0x00000001, type),
>>> -#define GEN_LDFS(name, ldop, op, type)                                        \
>>> -GEN_LDF(name, ldop, op | 0x20, type)                                          \
>>> -GEN_LDUF(name, ldop, op | 0x21, type)                                         \
>>> -GEN_LDUXF(name, ldop, op | 0x01, type)                                        \
>>> -GEN_LDXF(name, ldop, 0x17, op | 0x00, type)
>>> -
>>> -GEN_LDFS(lfd, ld64, 0x12, PPC_FLOAT)
>>> -GEN_LDFS(lfs, ld32fs, 0x10, PPC_FLOAT)
>>>   GEN_HANDLER_E(lfdepx, 0x1F, 0x1F, 0x12, 0x00000001, PPC_NONE, PPC2_BOOKE206),
>>>   GEN_HANDLER_E(lfiwax, 0x1f, 0x17, 0x1a, 0x00000001, PPC_NONE, PPC2_ISA205),
>>>   GEN_HANDLER_E(lfiwzx, 0x1f, 0x17, 0x1b, 0x1, PPC_NONE, PPC2_FP_CVT_ISA206),
>>>   GEN_HANDLER_E(lfdpx, 0x1F, 0x17, 0x18, 0x00200001, PPC_NONE, PPC2_ISA205),
>>>
>>> -#define GEN_STF(name, stop, opc, type)                                        \
>>> -GEN_HANDLER(name, opc, 0xFF, 0xFF, 0x00000000, type),
>>> -#define GEN_STUF(name, stop, opc, type)                                       \
>>> -GEN_HANDLER(name##u, opc, 0xFF, 0xFF, 0x00000000, type),
>>> -#define GEN_STUXF(name, stop, opc, type)                                      \
>>> -GEN_HANDLER(name##ux, 0x1F, 0x17, opc, 0x00000001, type),
>>>   #define GEN_STXF(name, stop, opc2, opc3, type)                                \
>>>   GEN_HANDLER(name##x, 0x1F, opc2, opc3, 0x00000001, type),
>>> -#define GEN_STFS(name, stop, op, type)                                        \
>>> -GEN_STF(name, stop, op | 0x20, type)                                          \
>>> -GEN_STUF(name, stop, op | 0x21, type)                                         \
>>> -GEN_STUXF(name, stop, op | 0x01, type)                                        \
>>> -GEN_STXF(name, stop, 0x17, op | 0x00, type)
>>>
>>> -GEN_STFS(stfd, st64_i64, 0x16, PPC_FLOAT)
>>> -GEN_STFS(stfs, st32fs, 0x14, PPC_FLOAT)
>>>   GEN_STXF(stfiw, st32fiw, 0x17, 0x1E, PPC_FLOAT_STFIWX)
>>>   GEN_HANDLER_E(stfdepx, 0x1F, 0x1F, 0x16, 0x00000001, PPC_NONE, PPC2_BOOKE206),
>>>   GEN_HANDLER_E(stfdpx, 0x1F, 0x17, 0x1C, 0x00200001, PPC_NONE, PPC2_ISA205),
>>
>> This commit appears to break both MacOS 9 and OS X under qemu-system-ppc in my boot
>> tests: MacOS 9 hangs early on startup, whilst OS X now has black box artifacts on
>> some GUI widgets (see attached).
> 
> It seems that we're updating the wrong register (RT instead of RA). Can you test the 
> attached patch?

Thanks Matheus! I've just done a quick test with both MacOS 9 and OS X and your patch 
seems to fix the issue for me, so:

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

>> Any idea what could be happening here? Note that this series isn't bisectable - it is
>> necessary to forward-port the REQUIRE_FPU macro in order to build this commit for
>> PPC32, and I also found errors relating to undefined times_* functions during 
>> bisection.
> 
> REQUIRE_FPU and the times_* functions come from the DFP patch series, in which this 
> series is based-on, so "target/ppc: Introduce REQUIRE_FPU" was supposed to be merged 
> before this patch. Maybe something went wrong when these series were partially applied

I see, or possibly something got mixed-up in a rebase somewhere? Anyhow it shouldn't 
be an issue unless any other regressions appear during testing...


ATB,

Mark.

