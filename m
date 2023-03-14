Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B976B8B0E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 07:17:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbxxn-0004lr-Oe; Tue, 14 Mar 2023 02:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pbxxj-0004kt-Ry
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:16:43 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pbxxi-00078h-0K
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:16:43 -0400
Received: by mail-vs1-xe35.google.com with SMTP id k11so4343254vsq.13
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 23:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678774600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HsVvyUyn6Fneyf/S7hO5W2+Jxv0XMyvZP5AWcLDFYmI=;
 b=jPqgi6sh+E1v8kNLa3g0V6f9+Kbt+wcRuFrzMIj0ljrIQPSm7HVU4WRhu1JJqKtW0L
 tX6iRFEBxzUe4AZGkya0tsFeLK5z51rahLO5EZjJuHjksIV9uGf0b4X/cIOVHOylOo4O
 mWIcYuWdxQYxFYejw3rYh5Rdkfxl+ThgqAcZRZEoy/dUlklIDg94lDUZIgBeNrUAi6My
 k4UXFxcTa0AOav4hGr1quWK8XdDE+VOd0c4RN5gUHTbIGj/PMchS13jEQNtOAJxWp/Gu
 yG3XXQTfcEwAMh8uA2XDtNt3/ytlE8DuE/i7Dmzl16MHO4jPBDugTOcCWBxZXznlaSDb
 YQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678774600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HsVvyUyn6Fneyf/S7hO5W2+Jxv0XMyvZP5AWcLDFYmI=;
 b=rPKEw7/Deuq0eKOgbeu9A7l/ejAPxq8KL1fIHaNger1wiKPV5tXYlTd1KqOOIB/MrL
 3IHZ4QB70+gAzTviUFtLV8Rprpp6GjvOF9fZGX9hHnBwND948jXfeC5V1IlsYXJGx42+
 DYY5/IqwYBLlGKssWxrbdYTfP78KuvDqRszH1rUG7o766xseS60+U3ytRwpUhQkS28ZN
 FeHJ1jU8nww8iuXVDgmUFKyxnperzRyVquc8JO2tj9p8pYrMneu55zBh3lHsVfPqbvXJ
 ALIwdmjmqjQzN4D+Z6VIpqJB6Ne6CXtrg8+3Gz/xToP2vxGoRRq5OAyNxfeC+oGHZq1b
 xHVw==
X-Gm-Message-State: AO0yUKWsJ5WBAG19AH5seRoHKyauezlewEGZqpLtXsJCw9xBPoZCG8ag
 R1lqAg+r/efRslN1g0TrpT13es2puwpsL7MrqHj9p4mFsS4=
X-Google-Smtp-Source: AK7set+il3Md0NYyuoDC/Twz+KjxrcnB/mVIdGvJqb7ySgRC4UQL2mmV1QWMCpAr0oT2JcKW1asTjd/XGS3xxokGVVc=
X-Received: by 2002:a67:eb86:0:b0:422:1654:7737 with SMTP id
 e6-20020a67eb86000000b0042216547737mr12447148vso.3.1678774600503; Mon, 13 Mar
 2023 23:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230307180708.302867-1-philipp.tomsich@vrull.eu>
 <20230307180708.302867-2-philipp.tomsich@vrull.eu>
In-Reply-To: <20230307180708.302867-2-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Mar 2023 16:16:14 +1000
Message-ID: <CAKmqyKN8w3W3C1zjnT=ABtaMX9CdQx56A30QGvfs3VpV1MLZ4Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] target/riscv: refactor Zicond support
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 8, 2023 at 4:10=E2=80=AFAM Philipp Tomsich <philipp.tomsich@vru=
ll.eu> wrote:
>
> After the original Zicond support was stuck/fell through the cracks on
> the mailing list at v3 (and a different implementation was merged in
> the meanwhile), we need to refactor Zicond to prepare it to be reused
> by XVentanaCondOps.
>
> This commit lifts the common logic out into gen_czero and uses this
> via gen_logic and 2 helper functions (effectively partial closures).
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Changes in v5:
> - fix a rebase artifact
> - drop the 'inline' specifiers (as per review comments)
>
> Changes in v4:
> - rebase onto master
>
> Changes in v3:
> - don't add this to MAINTAINERS, as it is an official extension
>
> Changes in v2:
> - gates availability of the instructions through a REQUIRE_ZICOND
>   macro (these were previously always enabled)
>
>  target/riscv/insn_trans/trans_rvzicond.c.inc | 36 ++++++++++++--------
>  1 file changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvzicond.c.inc b/target/riscv/=
insn_trans/trans_rvzicond.c.inc
> index 645260164e..c8e43fa325 100644
> --- a/target/riscv/insn_trans/trans_rvzicond.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzicond.c.inc
> @@ -2,6 +2,7 @@
>   * RISC-V translation routines for the Zicond Standard Extension.
>   *
>   * Copyright (c) 2020-2023 PLCT Lab
> + * Copyright (c) 2022 VRULL GmbH.
>   *
>   * This program is free software; you can redistribute it and/or modify =
it
>   * under the terms and conditions of the GNU General Public License,
> @@ -22,28 +23,33 @@
>      }                                     \
>  } while (0)
>
> -static bool trans_czero_eqz(DisasContext *ctx, arg_czero_eqz *a)
> +/* Emits "$rd =3D ($rs2 <cond> $zero) ? $zero : $rs1" */
> +static void gen_czero(TCGv dest, TCGv src1, TCGv src2, TCGCond cond)
>  {
> -    REQUIRE_ZICOND(ctx);
> +    TCGv zero =3D tcg_constant_tl(0);
> +    tcg_gen_movcond_tl(cond, dest, src2, zero, zero, src1);
> +}
>
> -    TCGv dest =3D dest_gpr(ctx, a->rd);
> -    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
> -    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
> +static void gen_czero_eqz(TCGv dest, TCGv src1, TCGv src2)
> +{
> +    gen_czero(dest, src1, src2, TCG_COND_EQ);
> +}
>
> -    tcg_gen_movcond_tl(TCG_COND_EQ, dest, src2, ctx->zero, ctx->zero, sr=
c1);
> -    gen_set_gpr(ctx, a->rd, dest);
> -    return true;
> +static void gen_czero_nez(TCGv dest, TCGv src1, TCGv src2)
> +{
> +    gen_czero(dest, src1, src2, TCG_COND_NE);
>  }
>
> -static bool trans_czero_nez(DisasContext *ctx, arg_czero_nez *a)
> +static bool trans_czero_eqz(DisasContext *ctx, arg_r *a)
>  {
>      REQUIRE_ZICOND(ctx);
>
> -    TCGv dest =3D dest_gpr(ctx, a->rd);
> -    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
> -    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
> +    return gen_logic(ctx, a, gen_czero_eqz);
> +}
> +
> +static bool trans_czero_nez(DisasContext *ctx, arg_r *a)
> +{
> +    REQUIRE_ZICOND(ctx);
>
> -    tcg_gen_movcond_tl(TCG_COND_NE, dest, src2, ctx->zero, ctx->zero, sr=
c1);
> -    gen_set_gpr(ctx, a->rd, dest);
> -    return true;
> +    return gen_logic(ctx, a, gen_czero_nez);
>  }
> --
> 2.34.1
>
>

