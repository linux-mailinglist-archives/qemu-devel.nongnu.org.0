Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A14141A951
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 09:08:34 +0200 (CEST)
Received: from localhost ([::1]:51760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV7E9-0007oq-3L
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 03:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mV7Co-0006oJ-0y
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 03:07:10 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:43821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mV7Cl-0008Nc-It
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 03:07:09 -0400
Received: by mail-io1-xd30.google.com with SMTP id p80so25952838iod.10
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 00:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7VqEwsJUlDcdo7Yjnq/8Djdr1Na34Jt3S0v6V9M2hk4=;
 b=YhjgxtImGKAe7P6d6jle1ColZuReHgVzV45DxiPcWwIJAeUmmgc0bM50rMlfQvEnxN
 j96x3LXvnCnh1rEFFagCQpgsMOc9sLpKa8G3RR4Mgofups5Srw9wYH16kfK9VOt2UyKv
 Bj8kJQMwO+R73XLnB2eJbd6kcGsWZIWOI5mMedB9KvZ3l53jzl4wEKSwAKwet8iDiJye
 d5wy26JGZ0RU63ilE/SNIUgcS2P1rlF42+byIjT28PhrEFQVTKoB9ZDJnfrCwPGsZHwl
 9B2A/t1MFH/thwMgZ0fNnD+MSe0yIXgTGckjJxrcDNyS+vCn+SqvhI4nO2dwasj52GlI
 h60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7VqEwsJUlDcdo7Yjnq/8Djdr1Na34Jt3S0v6V9M2hk4=;
 b=5N3Ymt5LanJlmhefat4IY6rKPk4+p4/sK+kEpo+6vMBy9RdhgbaTZlUUYxvZurjOYy
 Fq/qsH7XasQfWHkI9maIY43tnWuHRXliZpHN/XGwN79TBcA+I2hU5naHv16jY25iD8G6
 qunKvRu2Mwv25+Xk2DZ5XRX9zwAxxIqtcBy9WRKfS8LiNN8OZbvl5ie0iQeSaGfYCUR0
 zKWsBGzs9x9/ACYQ2bEh0Ookb0LpKx+WXbK80uuCrYBWgt76g/JVu/FNbI7yJA6Hw8hX
 aiMK6QArQ4eqo2G6z5e5BZxNGCFRtUn53qFXMdxG0/I9mIbk8YkOcAtm26smq1hJo1O1
 tCUQ==
X-Gm-Message-State: AOAM532+ghO/U23kzF4E6BgMfvbWvSM0JYE2tmKdvBHN+Ysx6VRvTIVh
 QgOE8CLvc5QweOBEO1FItKrwsZQTHVKyytq/ZLY=
X-Google-Smtp-Source: ABdhPJx7rLIjtporIOUylsUbTvAGfRgjaOAVscBaSt5r6xs9F9DhL1s/cG/LqPkPzHNz7ZFB8xXvJlHjY+W3R7fpzWg=
X-Received: by 2002:a5e:c101:: with SMTP id v1mr2894473iol.90.1632812826179;
 Tue, 28 Sep 2021 00:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
 <20210911140016.834071-12-philipp.tomsich@vrull.eu>
In-Reply-To: <20210911140016.834071-12-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 28 Sep 2021 17:06:39 +1000
Message-ID: <CAKmqyKM7b9Xz0C7YN7QyARUJSAuDqxWk4VnwHfMB+5tTHGvy4w@mail.gmail.com>
Subject: Re: [PATCH v11 11/16] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 12, 2021 at 12:07 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The 1.0.0 version of Zbb does not contain gorc/gorci.  Instead, a
> orc.b instruction (equivalent to the orc.b pseudo-instruction built on
> gorci from pre-0.93 draft-B) is available, mainly targeting
> string-processing workloads.
>
> This commit adds the new orc.b instruction and removed gorc/gorci.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

I'm seeing this warning when building with gcc (GCC) 11.2.1

/var/mnt/scratch/alistair/software/qemu/include/tcg/tcg.h:1267:5:
warning: overflow in conversion from =E2=80=98long long unsigned int=E2=80=
=99 to
=E2=80=98int32_t=E2=80=99 {aka =E2=80=98int=E2=80=99} changes value from =
=E2=80=9872340172838076673=E2=80=99 to
=E2=80=9816843009=E2=80=99 [-Woverflow]
 1267 |     (__builtin_constant_p(VECE)                                    =
\
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
 1268 |      ? (  (VECE) =3D=3D MO_8  ? 0x0101010101010101ull * (uint8_t)(C=
)   \
      |      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
 1269 |         : (VECE) =3D=3D MO_16 ? 0x0001000100010001ull * (uint16_t)(=
C)  \
      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
 1270 |         : (VECE) =3D=3D MO_32 ? 0x0000000100000001ull * (uint32_t)(=
C)  \
      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
 1271 |         : (VECE) =3D=3D MO_64 ? (uint64_t)(C)                      =
    \
      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
 1272 |         : (qemu_build_not_reached_always(), 0))                    =
\
      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
 1273 |      : dup_const(VECE, C))
      |      ~~~~~~~~~~~~~~~~~~~~~
../target/riscv/insn_trans/trans_rvb.c.inc:301:34: note: in expansion
of macro =E2=80=98dup_const=E2=80=99
  301 |     TCGv  ones =3D tcg_constant_tl(dup_const(MO_8, 0x01));
      |                                  ^~~~~~~~~
[78/87] Compiling C object
libqemu-riscv32-linux-user.fa.p/target_riscv_translate.c.o
In file included from
/var/mnt/scratch/alistair/software/qemu/include/tcg/tcg-op.h:28,
                 from ../target/riscv/translate.c:22:

Alistair

>
> ---
>
> (no changes since v9)
>
> Changes in v9:
> - Picked up Alistair's Reviewed-by, after patman had failed to catch
>   it for v8.
>
> Changes in v8:
> - Optimize orc.b further by reordering the shift/and, updating the
>   comment to reflect that we put the truth-value into the LSB, and
>   putting the (now only) constant in a temporary
> - Fold the final bitwise-not into the second and, using and andc.
>
> Changes in v7:
> - Free TCG temporary in gen_orc_b().
>
> Changes in v6:
> - Fixed orc.b (now passes SPEC w/ optimized string functions) by
>   adding the missing final negation.
>
> Changes in v4:
> - Change orc.b to implementation suggested by Richard Henderson
>
> Changes in v3:
> - Moved orc.b and gorc/gorci changes into separate commit.
> - Using the simpler orc.b implementation suggested by Richard Henderson
>
>  target/riscv/bitmanip_helper.c          | 26 -----------------
>  target/riscv/helper.h                   |  2 --
>  target/riscv/insn32.decode              |  6 +---
>  target/riscv/insn_trans/trans_rvb.c.inc | 39 +++++++++++--------------
>  4 files changed, 18 insertions(+), 55 deletions(-)
>
> diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helpe=
r.c
> index 73be5a81c7..bb48388fcd 100644
> --- a/target/riscv/bitmanip_helper.c
> +++ b/target/riscv/bitmanip_helper.c
> @@ -64,32 +64,6 @@ target_ulong HELPER(grevw)(target_ulong rs1, target_ul=
ong rs2)
>      return do_grev(rs1, rs2, 32);
>  }
>
> -static target_ulong do_gorc(target_ulong rs1,
> -                            target_ulong rs2,
> -                            int bits)
> -{
> -    target_ulong x =3D rs1;
> -    int i, shift;
> -
> -    for (i =3D 0, shift =3D 1; shift < bits; i++, shift <<=3D 1) {
> -        if (rs2 & shift) {
> -            x |=3D do_swap(x, adjacent_masks[i], shift);
> -        }
> -    }
> -
> -    return x;
> -}
> -
> -target_ulong HELPER(gorc)(target_ulong rs1, target_ulong rs2)
> -{
> -    return do_gorc(rs1, rs2, TARGET_LONG_BITS);
> -}
> -
> -target_ulong HELPER(gorcw)(target_ulong rs1, target_ulong rs2)
> -{
> -    return do_gorc(rs1, rs2, 32);
> -}
> -
>  target_ulong HELPER(clmul)(target_ulong rs1, target_ulong rs2)
>  {
>      target_ulong result =3D 0;
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 8a318a2dbc..a9bda2c8ac 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -61,8 +61,6 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i6=
4)
>  /* Bitmanip */
>  DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> -DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> -DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index a509cfee11..59202196dc 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -681,6 +681,7 @@ max        0000101 .......... 110 ..... 0110011 @r
>  maxu       0000101 .......... 111 ..... 0110011 @r
>  min        0000101 .......... 100 ..... 0110011 @r
>  minu       0000101 .......... 101 ..... 0110011 @r
> +orc_b      001010 000111 ..... 101 ..... 0010011 @r2
>  orn        0100000 .......... 110 ..... 0110011 @r
>  rol        0110000 .......... 001 ..... 0110011 @r
>  ror        0110000 .......... 101 ..... 0110011 @r
> @@ -702,19 +703,14 @@ pack       0000100 .......... 100 ..... 0110011 @r
>  packu      0100100 .......... 100 ..... 0110011 @r
>  packh      0000100 .......... 111 ..... 0110011 @r
>  grev       0110100 .......... 101 ..... 0110011 @r
> -gorc       0010100 .......... 101 ..... 0110011 @r
> -
>  grevi      01101. ........... 101 ..... 0010011 @sh
> -gorci      00101. ........... 101 ..... 0010011 @sh
>
>  # *** RV64B Standard Extension (in addition to RV32B) ***
>  packw      0000100 .......... 100 ..... 0111011 @r
>  packuw     0100100 .......... 100 ..... 0111011 @r
>  grevw      0110100 .......... 101 ..... 0111011 @r
> -gorcw      0010100 .......... 101 ..... 0111011 @r
>
>  greviw     0110100 .......... 101 ..... 0011011 @sh5
> -gorciw     0010100 .......... 101 ..... 0011011 @sh5
>
>  # *** RV32 Zbc Standard Extension ***
>  clmul      0000101 .......... 001 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
> index bdfb495f24..951b3d7073 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -295,16 +295,27 @@ static bool trans_grevi(DisasContext *ctx, arg_grev=
i *a)
>      return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_grevi);
>  }
>
> -static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
> +static void gen_orc_b(TCGv ret, TCGv source1)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shift(ctx, a, EXT_ZERO, gen_helper_gorc);
> +    TCGv  tmp =3D tcg_temp_new();
> +    TCGv  ones =3D tcg_constant_tl(dup_const(MO_8, 0x01));
> +
> +    /* Set lsb in each byte if the byte was zero. */
> +    tcg_gen_sub_tl(tmp, source1, ones);
> +    tcg_gen_andc_tl(tmp, tmp, source1);
> +    tcg_gen_shri_tl(tmp, tmp, 7);
> +    tcg_gen_andc_tl(tmp, ones, tmp);
> +
> +    /* Replicate the lsb of each byte across the byte. */
> +    tcg_gen_muli_tl(ret, tmp, 0xff);
> +
> +    tcg_temp_free(tmp);
>  }
>
> -static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
> +static bool trans_orc_b(DisasContext *ctx, arg_orc_b *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_gorc);
> +    REQUIRE_ZBB(ctx);
> +    return gen_unary(ctx, a, EXT_ZERO, gen_orc_b);
>  }
>
>  #define GEN_SHADD(SHAMT)                                       \
> @@ -476,22 +487,6 @@ static bool trans_greviw(DisasContext *ctx, arg_grev=
iw *a)
>      return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_grev);
>  }
>
> -static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    ctx->w =3D true;
> -    return gen_shift(ctx, a, EXT_ZERO, gen_helper_gorc);
> -}
> -
> -static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    ctx->w =3D true;
> -    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_gorc);
> -}
> -
>  #define GEN_SHADD_UW(SHAMT)                                       \
>  static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
>  {                                                                 \
> --
> 2.25.1
>
>

