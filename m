Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1D06B8B26
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 07:20:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pby16-0006TR-J9; Tue, 14 Mar 2023 02:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pby14-0006T8-N0
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:20:10 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pby12-0007Un-Uy
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:20:10 -0400
Received: by mail-ua1-x935.google.com with SMTP id h34so9855411uag.4
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 23:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678774808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OzwwtPBgE/8kl7QCVOptpvUhARmhIGN0YRyurMspuwk=;
 b=ceDkdUAcKbzBoP5EMoncN/hlgltiz1NzV0eN0zxG36bR905saRNBMkF5UQvV1crsYx
 CNy8doqU9/1UzPCKdvNenomm0NkXA0WJYcss0UNcpy05mfQN/iSwacq/saenX425RRCR
 X0VcZ6cw6yjgu+Wh9GyeON5XlKb8Cpobj8wkCCyIongsw6PL1ISzVSd7KRHt6gFip3/U
 rgMMECXEMfne30mGx6ZuM3I0onIrRscdKWOW1TuX/kJJ9pF7/c5fziQwDySHwiL6a61h
 Cwm0+/JZS6eDCmvge2lDmGLAkcXjBZTBuj9x750WUb465PwH/ewHu/BZuWn0Z+Laov19
 fGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678774808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OzwwtPBgE/8kl7QCVOptpvUhARmhIGN0YRyurMspuwk=;
 b=Bkm1SwixhhiaXwNrqml2KBMuuMWBJN001T25XKXMWmn8WnqFxPS3DlDCm22qM/kru9
 BSKlI1Ini4o3i43iKmI2v4OsSbWGJId9GUWpGq3jpp0sxeNShcqd/73wDR4to8gEzv79
 Zs+VDiIGVQZ7Zmo/JWKQ5yVYDvE+lDavQkMZ+ZdEJz+44fAuplYJfwN9MaHXyuacyRYF
 javJ8P4CDyxESTpwUM5JpprSyU+ydppj3Pr4c7KGwe+i75mARB8p7gIZaacojs4bYWJC
 ZRvABeHpkC59hMmSF5S9zfXzLvYWxDUZiSNNz7FAtQpUmnCuaFUWki9FGxK+QpGDwx0i
 jf8Q==
X-Gm-Message-State: AO0yUKWFZHj9GLJj5Ep/GChcSPpc55y72pfumjEqpbP9HTSJ679eMeMD
 /ABq1MBgY4zMhMwYQlGz9+Z0lhN3PhlZezAYZMs=
X-Google-Smtp-Source: AK7set9cZUcrezuJ03EgNIh0huDnIV5bLsLmBgUqYAazjC1eP3yaqRUMNlxK4w+H0NDN0JpVTXdJNx5mEzb1v2O6jWc=
X-Received: by 2002:a1f:c507:0:b0:401:2297:b2e0 with SMTP id
 v7-20020a1fc507000000b004012297b2e0mr21615003vkf.0.1678774807757; Mon, 13 Mar
 2023 23:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230307180708.302867-1-philipp.tomsich@vrull.eu>
 <20230307180708.302867-3-philipp.tomsich@vrull.eu>
In-Reply-To: <20230307180708.302867-3-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Mar 2023 16:19:41 +1000
Message-ID: <CAKmqyKOY6v51+XgcuUVPcKYY_zQTQ1sTJ-eNMM27OgTmY+VYBg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] target/riscv: redirect XVentanaCondOps to use the
 Zicond functions
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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
> The Zicond standard extension implements the same instruction
> semantics as XVentanaCondOps, although using different mnemonics and
> opcodes.
>
> Point XVentanaCondOps to the (newly implemented) Zicond implementation
> to reduce the future maintenance burden.
>
> Also updating MAINTAINERS as trans_xventanacondops.c.inc.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Don't downgrade to "Odd Fixes", but rather to "Maintained" (we are
>   not being paid to look after this, but will look after it
>   nonetheless).
>
> Changes in v2:
> - Calls into the gen_czero_{eqz,nez} helpers instead of calling
>   trans_czero_{eqz,nez} to bypass the require-check and ensure that
>   XVentanaCondOps can be enabled/disabled independently of Zicond.
>
>  MAINTAINERS                                    |  2 +-
>  .../insn_trans/trans_xventanacondops.c.inc     | 18 +++---------------
>  2 files changed, 4 insertions(+), 16 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 011fd85a09..1ad3c6fc9a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -311,7 +311,7 @@ F: target/riscv/xthead*.decode
>  RISC-V XVentanaCondOps extension
>  M: Philipp Tomsich <philipp.tomsich@vrull.eu>
>  L: qemu-riscv@nongnu.org
> -S: Supported
> +S: Maintained
>  F: target/riscv/XVentanaCondOps.decode
>  F: target/riscv/insn_trans/trans_xventanacondops.c.inc
>
> diff --git a/target/riscv/insn_trans/trans_xventanacondops.c.inc b/target=
/riscv/insn_trans/trans_xventanacondops.c.inc
> index 16849e6d4e..38c15f2825 100644
> --- a/target/riscv/insn_trans/trans_xventanacondops.c.inc
> +++ b/target/riscv/insn_trans/trans_xventanacondops.c.inc
> @@ -1,7 +1,7 @@
>  /*
>   * RISC-V translation routines for the XVentanaCondOps extension.
>   *
> - * Copyright (c) 2021-2022 VRULL GmbH.
> + * Copyright (c) 2021-2023 VRULL GmbH.
>   *
>   * This program is free software; you can redistribute it and/or modify =
it
>   * under the terms and conditions of the GNU General Public License,
> @@ -16,24 +16,12 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>
> -static bool gen_vt_condmask(DisasContext *ctx, arg_r *a, TCGCond cond)
> -{
> -    TCGv dest =3D dest_gpr(ctx, a->rd);
> -    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
> -    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
> -
> -    tcg_gen_movcond_tl(cond, dest, src2, ctx->zero, src1, ctx->zero);
> -
> -    gen_set_gpr(ctx, a->rd, dest);
> -    return true;
> -}
> -
>  static bool trans_vt_maskc(DisasContext *ctx, arg_r *a)
>  {
> -    return gen_vt_condmask(ctx, a, TCG_COND_NE);
> +    return gen_logic(ctx, a, gen_czero_eqz);
>  }
>
>  static bool trans_vt_maskcn(DisasContext *ctx, arg_r *a)
>  {
> -    return gen_vt_condmask(ctx, a, TCG_COND_EQ);
> +    return gen_logic(ctx, a, gen_czero_nez);
>  }
> --
> 2.34.1
>
>

