Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575E73B97A8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 22:32:53 +0200 (CEST)
Received: from localhost ([::1]:59002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz3Mh-0007Jy-Vg
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 16:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz3L1-00068R-RG
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 16:31:08 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz3Kz-00032A-Px
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 16:31:07 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v5so9799022wrt.3
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 13:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hhttAdehvVXapsHTceO47QbpCon/MlGGSJxTJglX/2U=;
 b=uGz230J34egFbOAw7tBp0zPKR27mCK76hpfsq/SRJgzeIOQ9j2USR1KftWHiFRxnSH
 jL/gv/ii8JwHyRqBOJUJcsAQy+FuRjRJZQKNx0RViTZYpbYTFJnVWb6HgdCEHTBYaR2R
 BINmLRdNIR1TJfByHJ2zH/GancFyoABNX80zeYJ71kXGy/UQoxUcHBxk3DcDT6sfKCAH
 5mtqdpgtkVpflpOUG9eBlzBsTm19OW7BKXQxZIJGMsF7L6+iHn5rgInvzK1URr5ap/0n
 NCj/czNWJlzApg9Ox+qOxLmG6wFvfK5NNFTriu+CFDwW2W+JELhI0FSKQhL+PSGyYIWw
 cDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hhttAdehvVXapsHTceO47QbpCon/MlGGSJxTJglX/2U=;
 b=eJXtmxVQV8F6uMk3DeR2lZ0k1l7Fogk3qRcUo3mh/CaIEXrf3x2NYbFs10DwWNjETL
 4gkU7CoZbXNXoo0qEXLSX4uSzo+8+ytrRwpEkHDBUJ9xXqTTQ+fLHN/3Vw9qKZkRcAjE
 gojVP6/tMEqOfBbdMmk23+0pqi5KOuNiMLsE1n1FNr1bxE3f5KgBFjcTBX6G8ppzJdgj
 1F5qamTBGzkN2nJflWQMAtryrqyxBCEljCc9fdhRTi2ahj910lcp4Ou/XSi0dYGCUm9z
 eGyk0PgBUJDc03BFXSNqrk3g1QP73NILr9Eif1SthWfoSKDIT7+ZvJt2lQvZ1GTGi0y3
 oiGQ==
X-Gm-Message-State: AOAM533/TwYsYYwGV12UoJOBsG7nkhx4it2yPd7ht/E6QzuJC3fr/36t
 /6qtxIXpQ0tIUuC0XCDHdpY=
X-Google-Smtp-Source: ABdhPJyH88x6372zfqwioBTtNVGKl9FVA59Ywdq7M0wVz4TO6uU5Rh9sTIFgOV2Zr+okU2RGbkql/Q==
X-Received: by 2002:a5d:4c50:: with SMTP id n16mr1691416wrt.249.1625171464201; 
 Thu, 01 Jul 2021 13:31:04 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id y3sm1022867wru.78.2021.07.01.13.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 13:31:03 -0700 (PDT)
Subject: Re: [PATCH 07/20] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-8-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <248d54fc-ebdd-09e9-22c2-e66307b22705@amsat.org>
Date: Thu, 1 Jul 2021 22:31:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624881885-31692-8-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 2:04 PM, Song Gao wrote:
> This patch implement fixed point arithemtic instruction translation.
> 
> This includes:
> - ADD.{W/D}, SUB.{W/D}
> - ADDI.{W/D}, ADDU16ID
> - ALSL.{W[U]/D}
> - LU12I.W, LU32I.D LU52I.D
> - SLT[U], SLT[U]I
> - PCADDI, PCADDU12I, PCADDU18I, PCALAU12I
> - AND, OR, NOR, XOR, ANDN, ORN
> - MUL.{W/D}, MULH.{W[U]/D[U]}
> - MULW.D.W[U]
> - DIV.{W[U]/D[U]}, MOD.{W[U]/D[U]}
> - ANDI, ORI, XORI
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>  target/loongarch/insns.decode |  89 ++++++++
>  target/loongarch/instmap.h    |  53 +++++
>  target/loongarch/trans.inc.c  | 367 +++++++++++++++++++++++++++++++++
>  target/loongarch/translate.c  | 458 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 967 insertions(+)
>  create mode 100644 target/loongarch/insns.decode
>  create mode 100644 target/loongarch/instmap.h
>  create mode 100644 target/loongarch/trans.inc.c

> diff --git a/target/loongarch/instmap.h b/target/loongarch/instmap.h
> new file mode 100644
> index 0000000..8844333
> --- /dev/null
> +++ b/target/loongarch/instmap.h
> @@ -0,0 +1,53 @@
> +/*
> + * LoongArch emulation for qemu: instruction opcode
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + *
> + * SPDX-License-Identifier: LGPL-2.1+
> + */
> +
> +#ifndef TARGET_LOONGARCH_INSTMAP_H
> +#define TARGET_LOONGARCH_INSTMAP_H
> +
> +/* fixed point opcodes */
> +enum {
> +    LA_OPC_ADD_W     = (0x00020 << 15),
> +    LA_OPC_ADD_D     = (0x00021 << 15),
> +    LA_OPC_SUB_W     = (0x00022 << 15),
> +    LA_OPC_SUB_D     = (0x00023 << 15),
> +    LA_OPC_SLT       = (0x00024 << 15),
> +    LA_OPC_SLTU      = (0x00025 << 15),
> +    LA_OPC_NOR       = (0x00028 << 15),
> +    LA_OPC_AND       = (0x00029 << 15),
> +    LA_OPC_OR        = (0x0002A << 15),
> +    LA_OPC_XOR       = (0x0002B << 15),
> +    LA_OPC_MUL_W     = (0x00038 << 15),
> +    LA_OPC_MULH_W    = (0x00039 << 15),
> +    LA_OPC_MULH_WU   = (0x0003A << 15),
> +    LA_OPC_MUL_D     = (0x0003B << 15),
> +    LA_OPC_MULH_D    = (0x0003C << 15),
> +    LA_OPC_MULH_DU   = (0x0003D << 15),
> +    LA_OPC_DIV_W     = (0x00040 << 15),
> +    LA_OPC_MOD_W     = (0x00041 << 15),
> +    LA_OPC_DIV_WU    = (0x00042 << 15),
> +    LA_OPC_MOD_WU    = (0x00043 << 15),
> +    LA_OPC_DIV_D     = (0x00044 << 15),
> +    LA_OPC_MOD_D     = (0x00045 << 15),
> +    LA_OPC_DIV_DU    = (0x00046 << 15),
> +    LA_OPC_MOD_DU    = (0x00047 << 15),
> +
> +    LA_OPC_ALSL_W    = (0x0002 << 17),
> +    LA_OPC_ALSL_D    = (0x0016 << 17)
> +
> +};
> +
> +/* 12 bit immediate opcodes */
> +enum {
> +    LA_OPC_SLTI      = (0x008 << 22),
> +    LA_OPC_SLTIU     = (0x009 << 22),
> +    LA_OPC_ADDI_W    = (0x00A << 22),
> +    LA_OPC_ADDI_D    = (0x00B << 22),
> +    LA_OPC_ANDI      = (0x00D << 22),
> +    LA_OPC_ORI       = (0x00E << 22),
> +    LA_OPC_XORI      = (0x00F << 22)
> +};

Opcode definitions shouldn't be needed when using decodetree.

> +/* loongarch mul and div */
> +static void gen_loongarch_muldiv(DisasContext *ctx, int opc, int rd,
> +                                 int rj, int rk)
> +{
> +    TCGv t0, t1;
> +
> +    if (rd == 0) {
> +        /* Treat as NOP. */
> +        return;
> +    }
> +
> +    t0 = tcg_temp_new();
> +    t1 = tcg_temp_new();
> +
> +    gen_load_gpr(t0, rj);
> +    gen_load_gpr(t1, rk);
> +
> +    switch (opc) {
> +    case LA_OPC_DIV_W:
> +        {
> +            TCGv t2 = tcg_temp_new();
> +            TCGv t3 = tcg_temp_new();
> +            tcg_gen_ext32s_tl(t0, t0);
> +            tcg_gen_ext32s_tl(t1, t1);
> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, INT_MIN);
> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1);
> +            tcg_gen_and_tl(t2, t2, t3);
> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
> +            tcg_gen_or_tl(t2, t2, t3);
> +            tcg_gen_movi_tl(t3, 0);
> +            tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
> +            tcg_gen_div_tl(cpu_gpr[rd], t0, t1);
> +            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
> +            tcg_temp_free(t3);
> +            tcg_temp_free(t2);
> +        }
> +        break;
> +    case LA_OPC_MOD_W:
> +        {
> +            TCGv t2 = tcg_temp_new();
> +            TCGv t3 = tcg_temp_new();
> +            tcg_gen_ext32s_tl(t0, t0);
> +            tcg_gen_ext32s_tl(t1, t1);
> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, INT_MIN);
> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1);
> +            tcg_gen_and_tl(t2, t2, t3);
> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
> +            tcg_gen_or_tl(t2, t2, t3);
> +            tcg_gen_movi_tl(t3, 0);
> +            tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
> +            tcg_gen_rem_tl(cpu_gpr[rd], t0, t1);
> +            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
> +            tcg_temp_free(t3);
> +            tcg_temp_free(t2);
> +        }
> +        break;
> +    case LA_OPC_DIV_WU:
> +        {
> +            TCGv t2 = tcg_const_tl(0);
> +            TCGv t3 = tcg_const_tl(1);
> +            tcg_gen_ext32u_tl(t0, t0);
> +            tcg_gen_ext32u_tl(t1, t1);
> +            tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
> +            tcg_gen_divu_tl(cpu_gpr[rd], t0, t1);
> +            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
> +            tcg_temp_free(t3);
> +            tcg_temp_free(t2);
> +        }
> +        break;
> +    case LA_OPC_MOD_WU:
> +        {
> +            TCGv t2 = tcg_const_tl(0);
> +            TCGv t3 = tcg_const_tl(1);
> +            tcg_gen_ext32u_tl(t0, t0);
> +            tcg_gen_ext32u_tl(t1, t1);
> +            tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
> +            tcg_gen_remu_tl(cpu_gpr[rd], t0, t1);
> +            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
> +            tcg_temp_free(t3);
> +            tcg_temp_free(t2);
> +        }
> +        break;
> +    case LA_OPC_MUL_W:
> +        {
> +            TCGv_i32 t2 = tcg_temp_new_i32();
> +            TCGv_i32 t3 = tcg_temp_new_i32();
> +            tcg_gen_trunc_tl_i32(t2, t0);
> +            tcg_gen_trunc_tl_i32(t3, t1);
> +            tcg_gen_mul_i32(t2, t2, t3);
> +            tcg_gen_ext_i32_tl(cpu_gpr[rd], t2);
> +            tcg_temp_free_i32(t2);
> +            tcg_temp_free_i32(t3);
> +        }
> +        break;
> +    case LA_OPC_MULH_W:
> +        {
> +            TCGv_i32 t2 = tcg_temp_new_i32();
> +            TCGv_i32 t3 = tcg_temp_new_i32();
> +            tcg_gen_trunc_tl_i32(t2, t0);
> +            tcg_gen_trunc_tl_i32(t3, t1);
> +            tcg_gen_muls2_i32(t2, t3, t2, t3);
> +            tcg_gen_ext_i32_tl(cpu_gpr[rd], t3);
> +            tcg_temp_free_i32(t2);
> +            tcg_temp_free_i32(t3);
> +        }
> +        break;
> +    case LA_OPC_MULH_WU:
> +        {
> +            TCGv_i32 t2 = tcg_temp_new_i32();
> +            TCGv_i32 t3 = tcg_temp_new_i32();
> +            tcg_gen_trunc_tl_i32(t2, t0);
> +            tcg_gen_trunc_tl_i32(t3, t1);
> +            tcg_gen_mulu2_i32(t2, t3, t2, t3);
> +            tcg_gen_ext_i32_tl(cpu_gpr[rd], t3);
> +            tcg_temp_free_i32(t2);
> +            tcg_temp_free_i32(t3);
> +        }
> +        break;
> +    case LA_OPC_DIV_D:
> +        {
> +            TCGv t2 = tcg_temp_new();
> +            TCGv t3 = tcg_temp_new();
> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, -1LL << 63);
> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1LL);
> +            tcg_gen_and_tl(t2, t2, t3);
> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
> +            tcg_gen_or_tl(t2, t2, t3);
> +            tcg_gen_movi_tl(t3, 0);
> +            tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
> +            tcg_gen_div_tl(cpu_gpr[rd], t0, t1);
> +            tcg_temp_free(t3);
> +            tcg_temp_free(t2);
> +        }
> +        break;
> +    case LA_OPC_MOD_D:
> +        {
> +            TCGv t2 = tcg_temp_new();
> +            TCGv t3 = tcg_temp_new();
> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, -1LL << 63);
> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1LL);
> +            tcg_gen_and_tl(t2, t2, t3);
> +            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
> +            tcg_gen_or_tl(t2, t2, t3);
> +            tcg_gen_movi_tl(t3, 0);
> +            tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
> +            tcg_gen_rem_tl(cpu_gpr[rd], t0, t1);
> +            tcg_temp_free(t3);
> +            tcg_temp_free(t2);
> +        }
> +        break;
> +    case LA_OPC_DIV_DU:
> +        {
> +            TCGv t2 = tcg_const_tl(0);
> +            TCGv t3 = tcg_const_tl(1);
> +            tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
> +            tcg_gen_divu_i64(cpu_gpr[rd], t0, t1);
> +            tcg_temp_free(t3);
> +            tcg_temp_free(t2);
> +        }
> +        break;
> +    case LA_OPC_MOD_DU:
> +        {
> +            TCGv t2 = tcg_const_tl(0);
> +            TCGv t3 = tcg_const_tl(1);
> +            tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
> +            tcg_gen_remu_i64(cpu_gpr[rd], t0, t1);
> +            tcg_temp_free(t3);
> +            tcg_temp_free(t2);
> +        }
> +        break;
> +    case LA_OPC_MUL_D:
> +        tcg_gen_mul_i64(cpu_gpr[rd], t0, t1);
> +        break;
> +    case LA_OPC_MULH_D:
> +        {
> +            TCGv t2 = tcg_temp_new();
> +            tcg_gen_muls2_i64(t2, cpu_gpr[rd], t0, t1);
> +            tcg_temp_free(t2);
> +        }
> +        break;
> +    case LA_OPC_MULH_DU:
> +        {
> +            TCGv t2 = tcg_temp_new();
> +            tcg_gen_mulu2_i64(t2, cpu_gpr[rd], t0, t1);
> +            tcg_temp_free(t2);
> +        }
> +        break;
> +    default:
> +        generate_exception_end(ctx, EXCP_INE);
> +        goto out;
> +    }
> + out:
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +
> +    return;
> +}

> +static bool trans_mul_w(DisasContext *ctx, arg_mul_w *a)
> +{
> +    gen_loongarch_muldiv(ctx, LA_OPC_MUL_W, a->rd, a->rj, a->rk);
> +    return true;
> +}
> +
> +static bool trans_mulh_w(DisasContext *ctx, arg_mulh_w *a)
> +{
> +    gen_loongarch_muldiv(ctx, LA_OPC_MULH_W, a->rd, a->rj, a->rk);
> +    return true;
> +}
> +
> +static bool trans_mulh_wu(DisasContext *ctx, arg_mulh_wu *a)
> +{
> +    gen_loongarch_muldiv(ctx, LA_OPC_MULH_WU, a->rd, a->rj, a->rk);
> +    return true;
> +}
> +
> +static bool trans_mul_d(DisasContext *ctx, arg_mul_d *a)
> +{
> +    check_loongarch_64(ctx);
> +    gen_loongarch_muldiv(ctx, LA_OPC_MUL_D, a->rd, a->rj, a->rk);
> +    return true;
> +}
> +
> +static bool trans_mulh_d(DisasContext *ctx, arg_mulh_d *a)
> +{
> +    check_loongarch_64(ctx);
> +    gen_loongarch_muldiv(ctx, LA_OPC_MULH_D, a->rd, a->rj, a->rk);
> +    return true;
> +}
> +
> +static bool trans_mulh_du(DisasContext *ctx, arg_mulh_du *a)
> +{
> +    check_loongarch_64(ctx);
> +    gen_loongarch_muldiv(ctx, LA_OPC_MULH_DU, a->rd, a->rj, a->rk);
> +    return true;
> +}

> +static bool trans_div_w(DisasContext *ctx, arg_div_w *a)
> +{
> +    gen_loongarch_muldiv(ctx, LA_OPC_DIV_W, a->rd, a->rj, a->rk);
> +    return true;
> +}
> +
> +static bool trans_mod_w(DisasContext *ctx, arg_mod_w *a)
> +{
> +    gen_loongarch_muldiv(ctx, LA_OPC_MOD_W, a->rd, a->rj, a->rk);
> +    return true;
> +}
> +
> +static bool trans_div_wu(DisasContext *ctx, arg_div_wu *a)
> +{
> +    gen_loongarch_muldiv(ctx, LA_OPC_DIV_WU, a->rd, a->rj, a->rk);
> +    return true;
> +}
> +
> +static bool trans_mod_wu(DisasContext *ctx, arg_mod_wu *a)
> +{
> +    gen_loongarch_muldiv(ctx, LA_OPC_MOD_WU, a->rd, a->rj, a->rk);
> +    return true;
> +}
> +
> +static bool trans_div_d(DisasContext *ctx, arg_div_d *a)
> +{
> +    check_loongarch_64(ctx);
> +    gen_loongarch_muldiv(ctx, LA_OPC_DIV_D, a->rd, a->rj, a->rk);
> +    return true;
> +}
> +
> +static bool trans_mod_d(DisasContext *ctx, arg_mod_d *a)
> +{
> +    check_loongarch_64(ctx);
> +    gen_loongarch_muldiv(ctx, LA_OPC_MOD_D, a->rd, a->rj, a->rk);
> +    return true;
> +}
> +
> +static bool trans_div_du(DisasContext *ctx, arg_div_du *a)
> +{
> +    check_loongarch_64(ctx);
> +    gen_loongarch_muldiv(ctx, LA_OPC_DIV_DU, a->rd, a->rj, a->rk);
> +    return true;
> +}
> +
> +static bool trans_mod_du(DisasContext *ctx, arg_mod_du *a)
> +{
> +    check_loongarch_64(ctx);
> +    gen_loongarch_muldiv(ctx, LA_OPC_MOD_DU, a->rd, a->rj, a->rk);
> +    return true;
> +}

It seems you are missing what decodetree is for... You should inline
each opcode code from gen_loongarch_muldiv in the opcode handler.

Don't take MIPS as an example =)

