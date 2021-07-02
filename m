Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CC43B9D71
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 10:18:16 +0200 (CEST)
Received: from localhost ([::1]:52078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzENL-0000It-1r
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 04:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lzEL5-0007Oq-Ce
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 04:15:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:37146 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lzEKw-0004Po-PV
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 04:15:54 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP0Mcy95gDHsbAA--.11425S3; 
 Fri, 02 Jul 2021 16:15:25 +0800 (CST)
Subject: Re: [PATCH 07/20] target/loongarch: Add fixed point arithmetic
 instruction translation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-8-git-send-email-gaosong@loongson.cn>
 <248d54fc-ebdd-09e9-22c2-e66307b22705@amsat.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <fcc6a9cd-2fa9-d976-3326-bda0efedea5f@loongson.cn>
Date: Fri, 2 Jul 2021 16:15:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <248d54fc-ebdd-09e9-22c2-e66307b22705@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP0Mcy95gDHsbAA--.11425S3
X-Coremail-Antispam: 1UD129KBjvJXoW3ZFW8WF18CF4DCFy5uFy7trb_yoWkury5pF
 1jqr4xXFyDtry3Ary3Xw45Crn8XF4Ikr4293sIvay5CrW0vw1vyFs5K3ya9FySyw4rWrWY
 vF9rurnFg3WUJa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzx
 vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 JVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm
 -wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E
 3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCT
 nIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, maobibo@loongson.cn, laurent@vivier.eu,
 alistair.francis@wdc.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 
On 07/02/2021 04:31 AM, Philippe Mathieu-Daudé wrote:
> On 6/28/21 2:04 PM, Song Gao wrote:
>> This patch implement fixed point arithemtic instruction translation.
>>
>> This includes:
>> - ADD.{W/D}, SUB.{W/D}
>> - ADDI.{W/D}, ADDU16ID
>> - ALSL.{W[U]/D}
>> - LU12I.W, LU32I.D LU52I.D
>> - SLT[U], SLT[U]I
>> - PCADDI, PCADDU12I, PCADDU18I, PCALAU12I
>> - AND, OR, NOR, XOR, ANDN, ORN
>> - MUL.{W/D}, MULH.{W[U]/D[U]}
>> - MULW.D.W[U]
>> - DIV.{W[U]/D[U]}, MOD.{W[U]/D[U]}
>> - ANDI, ORI, XORI
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>  target/loongarch/insns.decode |  89 ++++++++
>>  target/loongarch/instmap.h    |  53 +++++
>>  target/loongarch/trans.inc.c  | 367 +++++++++++++++++++++++++++++++++
>>  target/loongarch/translate.c  | 458 ++++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 967 insertions(+)
>>  create mode 100644 target/loongarch/insns.decode
>>  create mode 100644 target/loongarch/instmap.h
>>  create mode 100644 target/loongarch/trans.inc.c
> 
>> diff --git a/target/loongarch/instmap.h b/target/loongarch/instmap.h
>> new file mode 100644
>> index 0000000..8844333
>> --- /dev/null
>> +++ b/target/loongarch/instmap.h
>> @@ -0,0 +1,53 @@
>> +/*
>> + * LoongArch emulation for qemu: instruction opcode
>> + *
>> + * Copyright (c) 2021 Loongson Technology Corporation Limited
>> + *
>> + * SPDX-License-Identifier: LGPL-2.1+
>> + */
>> +
>> +#ifndef TARGET_LOONGARCH_INSTMAP_H
>> +#define TARGET_LOONGARCH_INSTMAP_H
>> +
>> +/* fixed point opcodes */
>> +enum {
>> +    LA_OPC_ADD_W     = (0x00020 << 15),
>> +    LA_OPC_ADD_D     = (0x00021 << 15),
>> +    LA_OPC_SUB_W     = (0x00022 << 15),
>> +    LA_OPC_SUB_D     = (0x00023 << 15),
>> +    LA_OPC_SLT       = (0x00024 << 15),
>> +    LA_OPC_SLTU      = (0x00025 << 15),
>> +    LA_OPC_NOR       = (0x00028 << 15),
>> +    LA_OPC_AND       = (0x00029 << 15),
>> +    LA_OPC_OR        = (0x0002A << 15),
>> +    LA_OPC_XOR       = (0x0002B << 15),
>> +    LA_OPC_MUL_W     = (0x00038 << 15),
>> +    LA_OPC_MULH_W    = (0x00039 << 15),
>> +    LA_OPC_MULH_WU   = (0x0003A << 15),
>> +    LA_OPC_MUL_D     = (0x0003B << 15),
>> +    LA_OPC_MULH_D    = (0x0003C << 15),
>> +    LA_OPC_MULH_DU   = (0x0003D << 15),
>> +    LA_OPC_DIV_W     = (0x00040 << 15),
>> +    LA_OPC_MOD_W     = (0x00041 << 15),
>> +    LA_OPC_DIV_WU    = (0x00042 << 15),
>> +    LA_OPC_MOD_WU    = (0x00043 << 15),
>> +    LA_OPC_DIV_D     = (0x00044 << 15),
>> +    LA_OPC_MOD_D     = (0x00045 << 15),
>> +    LA_OPC_DIV_DU    = (0x00046 << 15),
>> +    LA_OPC_MOD_DU    = (0x00047 << 15),
>> +
>> +    LA_OPC_ALSL_W    = (0x0002 << 17),
>> +    LA_OPC_ALSL_D    = (0x0016 << 17)
>> +
>> +};
>> +
>> +/* 12 bit immediate opcodes */
>> +enum {
>> +    LA_OPC_SLTI      = (0x008 << 22),
>> +    LA_OPC_SLTIU     = (0x009 << 22),
>> +    LA_OPC_ADDI_W    = (0x00A << 22),
>> +    LA_OPC_ADDI_D    = (0x00B << 22),
>> +    LA_OPC_ANDI      = (0x00D << 22),
>> +    LA_OPC_ORI       = (0x00E << 22),
>> +    LA_OPC_XORI      = (0x00F << 22)
>> +};
> 
> Opcode definitions shouldn't be needed when using decodetree.
> >> +/* loongarch mul and div */
>> +static void gen_loongarch_muldiv(DisasContext *ctx, int opc, int rd,
>> +                                 int rj, int rk)
>> +{
>> +    TCGv t0, t1;
>> +
>> +    if (rd == 0) {
>> +        /* Treat as NOP. */
>> +        return;
>> +    }
>> +
>> +    t0 = tcg_temp_new();
>> +    t1 = tcg_temp_new();
>> +
>> +    gen_load_gpr(t0, rj);
>> +    gen_load_gpr(t1, rk);
>> +
>> +    switch (opc) {
>> +    case LA_OPC_DIV_W:
>> +        {
>> +            TCGv t2 = tcg_temp_new();
>> +            TCGv t3 = tcg_temp_new();
>> +            tcg_gen_ext32s_tl(t0, t0);
>> +            tcg_gen_ext32s_tl(t1, t1);
>> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, INT_MIN);
>> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1);
>> +            tcg_gen_and_tl(t2, t2, t3);
>> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
>> +            tcg_gen_or_tl(t2, t2, t3);
>> +            tcg_gen_movi_tl(t3, 0);
>> +            tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
>> +            tcg_gen_div_tl(cpu_gpr[rd], t0, t1);
>> +            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
>> +            tcg_temp_free(t3);
>> +            tcg_temp_free(t2);
>> +        }
>> +        break;
>> +    case LA_OPC_MOD_W:
>> +        {
>> +            TCGv t2 = tcg_temp_new();
>> +            TCGv t3 = tcg_temp_new();
>> +            tcg_gen_ext32s_tl(t0, t0);
>> +            tcg_gen_ext32s_tl(t1, t1);
>> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, INT_MIN);
>> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1);
>> +            tcg_gen_and_tl(t2, t2, t3);
>> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
>> +            tcg_gen_or_tl(t2, t2, t3);
>> +            tcg_gen_movi_tl(t3, 0);
>> +            tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
>> +            tcg_gen_rem_tl(cpu_gpr[rd], t0, t1);
>> +            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
>> +            tcg_temp_free(t3);
>> +            tcg_temp_free(t2);
>> +        }
>> +        break;
>> +    case LA_OPC_DIV_WU:
>> +        {
>> +            TCGv t2 = tcg_const_tl(0);
>> +            TCGv t3 = tcg_const_tl(1);
>> +            tcg_gen_ext32u_tl(t0, t0);
>> +            tcg_gen_ext32u_tl(t1, t1);
>> +            tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
>> +            tcg_gen_divu_tl(cpu_gpr[rd], t0, t1);
>> +            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
>> +            tcg_temp_free(t3);
>> +            tcg_temp_free(t2);
>> +        }
>> +        break;
>> +    case LA_OPC_MOD_WU:
>> +        {
>> +            TCGv t2 = tcg_const_tl(0);
>> +            TCGv t3 = tcg_const_tl(1);
>> +            tcg_gen_ext32u_tl(t0, t0);
>> +            tcg_gen_ext32u_tl(t1, t1);
>> +            tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
>> +            tcg_gen_remu_tl(cpu_gpr[rd], t0, t1);
>> +            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
>> +            tcg_temp_free(t3);
>> +            tcg_temp_free(t2);
>> +        }
>> +        break;
>> +    case LA_OPC_MUL_W:
>> +        {
>> +            TCGv_i32 t2 = tcg_temp_new_i32();
>> +            TCGv_i32 t3 = tcg_temp_new_i32();
>> +            tcg_gen_trunc_tl_i32(t2, t0);
>> +            tcg_gen_trunc_tl_i32(t3, t1);
>> +            tcg_gen_mul_i32(t2, t2, t3);
>> +            tcg_gen_ext_i32_tl(cpu_gpr[rd], t2);
>> +            tcg_temp_free_i32(t2);
>> +            tcg_temp_free_i32(t3);
>> +        }
>> +        break;
>> +    case LA_OPC_MULH_W:
>> +        {
>> +            TCGv_i32 t2 = tcg_temp_new_i32();
>> +            TCGv_i32 t3 = tcg_temp_new_i32();
>> +            tcg_gen_trunc_tl_i32(t2, t0);
>> +            tcg_gen_ext_i32_tl(cpu_gpr[rd], t3);
>> +            tcg_temp_free_i32(t2);
>> +            tcg_temp_free_i32(t3);
>> +        }
>> +        break;
>> +    case LA_OPC_MULH_WU:
>> +        {
>> +            TCGv_i32 t2 = tcg_temp_new_i32();
>> +            TCGv_i32 t3 = tcg_temp_new_i32();
>> +            tcg_gen_trunc_tl_i32(t2, t0);
>> +            tcg_gen_trunc_tl_i32(t3, t1);
>> +            tcg_gen_mulu2_i32(t2, t3, t2, t3);
>> +            tcg_gen_ext_i32_tl(cpu_gpr[rd], t3);
>> +            tcg_temp_free_i32(t2);
>> +            tcg_temp_free_i32(t3);
>> +        }
>> +        break;
>> +    case LA_OPC_DIV_D:
>> +        {
>> +            TCGv t2 = tcg_temp_new();
>> +            TCGv t3 = tcg_temp_new();
>> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, -1LL << 63);
>> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1LL);
>> +            tcg_gen_and_tl(t2, t2, t3);
>> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
>> +            tcg_gen_or_tl(t2, t2, t3);
>> +            tcg_gen_movi_tl(t3, 0);
>> +            tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
>> +            tcg_gen_div_tl(cpu_gpr[rd], t0, t1);
>> +            tcg_temp_free(t3);
>> +            tcg_temp_free(t2);
>> +        }
>> +        break;
>> +    case LA_OPC_MOD_D:
>> +        {
>> +            TCGv t2 = tcg_temp_new();
>> +            TCGv t3 = tcg_temp_new();
>> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, -1LL << 63);
>> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1LL);
>> +            tcg_gen_and_tl(t2, t2, t3);
>> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
>> +            tcg_gen_or_tl(t2, t2, t3);
>> +            tcg_gen_movi_tl(t3, 0);
>> +            tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
>> +            tcg_gen_rem_tl(cpu_gpr[rd], t0, t1);
>> +            tcg_temp_free(t3);
>> +            tcg_temp_free(t2);
>> +        }
>> +        break;
>> +    case LA_OPC_DIV_DU:
>> +        {
>> +            TCGv t2 = tcg_const_tl(0);
>> +            TCGv t3 = tcg_const_tl(1);
>> +            tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
>> +            tcg_gen_divu_i64(cpu_gpr[rd], t0, t1);
>> +            tcg_temp_free(t3);
>> +            tcg_temp_free(t2);
>> +        }
>> +        break;
>> +    case LA_OPC_MOD_DU:
>> +        {
>> +            TCGv t2 = tcg_const_tl(0);
>> +            TCGv t3 = tcg_const_tl(1);
>> +            tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
>> +            tcg_gen_remu_i64(cpu_gpr[rd], t0, t1);
>> +            tcg_temp_free(t3);
>> +            tcg_temp_free(t2);
>> +        }
>> +        break;
>> +    case LA_OPC_MUL_D:
>> +        tcg_gen_mul_i64(cpu_gpr[rd], t0, t1);
>> +        break;
>> +    case LA_OPC_MULH_D:
>> +        {
>> +            TCGv t2 = tcg_temp_new();
>> +            tcg_gen_muls2_i64(t2, cpu_gpr[rd], t0, t1);
>> +            tcg_temp_free(t2);
>> +        }
>> +        break;
>> +    case LA_OPC_MULH_DU:
>> +        {
>> +            TCGv t2 = tcg_temp_new();
>> +            tcg_gen_mulu2_i64(t2, cpu_gpr[rd], t0, t1);
>> +            tcg_temp_free(t2);
>> +        }
>> +        break;
>> +    default:
>> +        generate_exception_end(ctx, EXCP_INE);
>> +        goto out;
>> +    }
>> + out:
>> +    tcg_temp_free(t0);
>> +    tcg_temp_free(t1);
>> +
>> +    return;
>> +}
> 
>> +static bool trans_mul_w(DisasContext *ctx, arg_mul_w *a)
>> +{
>> +    gen_loongarch_muldiv(ctx, LA_OPC_MUL_W, a->rd, a->rj, a->rk);
>> +    return true;
>> +}
>> +
>> +static bool trans_mulh_w(DisasContext *ctx, arg_mulh_w *a)
>> +{
>> +    gen_loongarch_muldiv(ctx, LA_OPC_MULH_W, a->rd, a->rj, a->rk);
>> +    return true;
>> +}
>> +
>> +static bool trans_mulh_wu(DisasContext *ctx, arg_mulh_wu *a)
>> +{
>> +    gen_loongarch_muldiv(ctx, LA_OPC_MULH_WU, a->rd, a->rj, a->rk);
>> +    return true;
>> +}
>> +
>> +static bool trans_mul_d(DisasContext *ctx, arg_mul_d *a)
>> +{
>> +    check_loongarch_64(ctx);
>> +    gen_loongarch_muldiv(ctx, LA_OPC_MUL_D, a->rd, a->rj, a->rk);
>> +    return true;
>> +}
>> +
>> +static bool trans_mulh_d(DisasContext *ctx, arg_mulh_d *a)
>> +{
>> +    check_loongarch_64(ctx);
>> +    gen_loongarch_muldiv(ctx, LA_OPC_MULH_D, a->rd, a->rj, a->rk);
>> +    return true;
>> +}
>> +
>> +static bool trans_mulh_du(DisasContext *ctx, arg_mulh_du *a)
>> +{
>> +    check_loongarch_64(ctx);
>> +    gen_loongarch_muldiv(ctx, LA_OPC_MULH_DU, a->rd, a->rj, a->rk);
>> +    return true;
>> +}
> 
>> +static bool trans_div_w(DisasContext *ctx, arg_div_w *a)
>> +{
>> +    gen_loongarch_muldiv(ctx, LA_OPC_DIV_W, a->rd, a->rj, a->rk);
>> +    return true;
>> +}
>> +
>> +static bool trans_mod_w(DisasContext *ctx, arg_mod_w *a)
>> +{
>> +    gen_loongarch_muldiv(ctx, LA_OPC_MOD_W, a->rd, a->rj, a->rk);
>> +    return true;
>> +}
>> +
>> +static bool trans_div_wu(DisasContext *ctx, arg_div_wu *a)
>> +{
>> +    gen_loongarch_muldiv(ctx, LA_OPC_DIV_WU, a->rd, a->rj, a->rk);
>> +    return true;
>> +}
>> +
>> +static bool trans_mod_wu(DisasContext *ctx, arg_mod_wu *a)
>> +{
>> +    gen_loongarch_muldiv(ctx, LA_OPC_MOD_WU, a->rd, a->rj, a->rk);
>> +    return true;
>> +}
>> +
>> +static bool trans_div_d(DisasContext *ctx, arg_div_d *a)
>> +{
>> +    check_loongarch_64(ctx);
>> +    gen_loongarch_muldiv(ctx, LA_OPC_DIV_D, a->rd, a->rj, a->rk);
>> +    return true;
>> +}
>> +
>> +static bool trans_mod_d(DisasContext *ctx, arg_mod_d *a)
>> +{
>> +    check_loongarch_64(ctx);
>> +    gen_loongarch_muldiv(ctx, LA_OPC_MOD_D, a->rd, a->rj, a->rk);
>> +    return true;
>> +}
>> +
>> +static bool trans_div_du(DisasContext *ctx, arg_div_du *a)
>> +{
>> +    check_loongarch_64(ctx);
>> +    gen_loongarch_muldiv(ctx, LA_OPC_DIV_DU, a->rd, a->rj, a->rk);
>> +    return true;
>> +}
>> +
>> +static bool trans_mod_du(DisasContext *ctx, arg_mod_du *a)
>> +{
>> +    check_loongarch_64(ctx);
>> +    gen_loongarch_muldiv(ctx, LA_OPC_MOD_DU, a->rd, a->rj, a->rk);
>> +    return true;
>> +}
> 
> It seems you are missing what decodetree is for... You should inline
> each opcode code from gen_loongarch_muldiv in the opcode handler.
> 
> Don't take MIPS as an example =)
> 
Hi, Philippe,

I‘m not sure I understand right.  Here is an example of my modification

    static bool trans_xxx(DisasContext *ctx, arg_mul_w *a)
    {
        gen_loongarch_muldiv(ctx, a->rd, a->rj, a->rk);
        return true;
    }
    ...

    static void gen_loongarch_muldiv(DisasContext *ctx, int rd,
                                     int rj, int rk)
    {
        TCGv t0, t1;

        if (rd == 0) {
            /* Treat as NOP. */
            return;
        }

        t0 = tcg_temp_new();
        t1 = tcg_temp_new();

        gen_load_gpr(t0, rj);
        gen_load_gpr(t1, rk);

        switch (ctx->opcode) {
        case  xxx_opcode:
             /* translate  xxx  */
        ...

    }

Is that right？
    

Have a nice weekend!
Song Gao


