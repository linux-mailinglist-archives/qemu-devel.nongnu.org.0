Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7BE3A6608
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 13:51:29 +0200 (CEST)
Received: from localhost ([::1]:60552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsl7o-00044d-C0
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 07:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lsl6L-0003Hp-Oz
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:49:57 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lsl6J-0001Mk-QD
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:49:57 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so12818893wmd.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 04:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=l7N04QTNbYD4IkJrOR8StOp/TgvwQUTV+/iq4P62Bjc=;
 b=y539nMdnLW9w6/EznQEoxq4tGzm5ZzbHbVYbhW3WfSNQeOycih7CuEgaxQB8ijztDM
 p5R5wuAi/1jo5RdcC6Qg7/mqrcikgkNRjx7VMbVkSzTP2vdPYL9YeDrWI5YIY9Z3HHHw
 ajYDUfQmAdneqmaetdcHZzrMvcJPegMUAISd73h2eXbuQ9P8JoU2Gbe9HYff6kuUCnPx
 98d4HDk1By25Oxlzr7x9iiBms4a/o1i+ZbdKPydjF1QA9NzQnkXwnn4T2UDznx8CThpo
 CfDuuVyfjXhbR+J+NHkM84Rd2Z1W3HlLPrj9RTJS7VycXUJR93OQlHAEP2T2HI4EaOTf
 ZIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=l7N04QTNbYD4IkJrOR8StOp/TgvwQUTV+/iq4P62Bjc=;
 b=kYa/Qedru0+pt3RaMVahosgPffM3ozAkwW2MiRfCtkPG+8cie46DGJaijl8VtYA85P
 EFzxm/4tGNaLm4QSEEcA1LbaIwHWNG9bUfzxZZnH0nUtRcj8IlQCTvcNkmlR/zY0374l
 UQpky37Dz78gQNZo3Qy+zlsIqv/FWHGnHUbbm9dkKv/CVpfGXL5txISU0mY1DJFSatoC
 f6cYLRFnTlArUR0hX022CwMtX/KH1qyYtz2RCq9l+WK//JzpH4Rmq1/xYJpV29t+VPrN
 vRRxhac9yY+Aevtn09OOjVgkh5jhtlJjXpDwdkOBXk+COU8tXJ+MxmVaAnKgsJgdC+/Y
 nJzQ==
X-Gm-Message-State: AOAM530vwfw3AKTpEQiQaa6IdzDghVhnPhUCSoci3PyVwhIV72yrBFeG
 ma7g8FqNzHD4WG//i7p+pyhy2Q==
X-Google-Smtp-Source: ABdhPJw2u8qJoSKQrCNjiLfkyiEM9vXUZlE3wB36qkZKl5NGykLNbSHzCovG3V/DSvB0RINfG4i7Ug==
X-Received: by 2002:a05:600c:4285:: with SMTP id
 v5mr32217372wmc.184.1623671393624; 
 Mon, 14 Jun 2021 04:49:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q11sm15593141wrx.80.2021.06.14.04.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 04:49:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CFD9B1FF7E;
 Mon, 14 Jun 2021 12:49:51 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 01/28] tcg: Add flags argument to bswap opcodes
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-2-richard.henderson@linaro.org>
Date: Mon, 14 Jun 2021 12:49:51 +0100
In-Reply-To: <20210614083800.1166166-2-richard.henderson@linaro.org> (Richard
 Henderson's message of "Mon, 14 Jun 2021 01:37:33 -0700")
Message-ID: <87h7i0k6n4.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> This will eventually simplify front-end usage, and will allow
> backends to unset TCG_TARGET_HAS_MEMORY_BSWAP without loss of
> optimization.
>
> The argument is added during expansion, not currently exposed
> to the front end translators.  Non-zero values are not yet
> supported by any backends.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-opc.h | 10 +++++-----
>  include/tcg/tcg.h     | 12 ++++++++++++
>  tcg/tcg-op.c          | 13 ++++++++-----
>  tcg/README            | 18 ++++++++++--------
>  4 files changed, 35 insertions(+), 18 deletions(-)
>
> diff --git a/include/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
> index bbb0884af8..fddcc42cbd 100644
> --- a/include/tcg/tcg-opc.h
> +++ b/include/tcg/tcg-opc.h
> @@ -96,8 +96,8 @@ DEF(ext8s_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_ext8s_i32))
>  DEF(ext16s_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_ext16s_i32))
>  DEF(ext8u_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_ext8u_i32))
>  DEF(ext16u_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_ext16u_i32))
> -DEF(bswap16_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_bswap16_i32))
> -DEF(bswap32_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_bswap32_i32))
> +DEF(bswap16_i32, 1, 1, 1, IMPL(TCG_TARGET_HAS_bswap16_i32))
> +DEF(bswap32_i32, 1, 1, 1, IMPL(TCG_TARGET_HAS_bswap32_i32))
>  DEF(not_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_not_i32))
>  DEF(neg_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_i32))
>  DEF(andc_i32, 1, 2, 0, IMPL(TCG_TARGET_HAS_andc_i32))
> @@ -165,9 +165,9 @@ DEF(ext32s_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS=
_ext32s_i64))
>  DEF(ext8u_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_ext8u_i64))
>  DEF(ext16u_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_ext16u_i64))
>  DEF(ext32u_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_ext32u_i64))
> -DEF(bswap16_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_bswap16_i64))
> -DEF(bswap32_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_bswap32_i64))
> -DEF(bswap64_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_bswap64_i64))
> +DEF(bswap16_i64, 1, 1, 1, IMPL64 | IMPL(TCG_TARGET_HAS_bswap16_i64))
> +DEF(bswap32_i64, 1, 1, 1, IMPL64 | IMPL(TCG_TARGET_HAS_bswap32_i64))
> +DEF(bswap64_i64, 1, 1, 1, IMPL64 | IMPL(TCG_TARGET_HAS_bswap64_i64))
>  DEF(not_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_not_i64))
>  DEF(neg_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_neg_i64))
>  DEF(andc_i64, 1, 2, 0, IMPL64 | IMPL(TCG_TARGET_HAS_andc_i64))
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index 064dab383b..7a060e532d 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -430,6 +430,18 @@ typedef enum {
>      TCG_COND_GTU    =3D 8 | 4 | 0 | 1,
>  } TCGCond;
>=20=20
> +/*
> + * Flags for the bswap opcodes.
> + * If IZ, the input is zero-extended, otherwise unknown.
> + * If OZ or OS, the output is zero- or sign-extended respectively,
> + * otherwise the high bits are undefined.
> + */
> +enum {
> +    TCG_BSWAP_IZ =3D 1,
> +    TCG_BSWAP_OZ =3D 2,
> +    TCG_BSWAP_OS =3D 4,
> +};
> +

So is a TCG_BSWAP_IZ only really for cases where we have loaded up a
narrower width value into the "natural" TCG sized register? We seem to
assume this is always the case even though the TCG bswap op doesn't have
visibility of how the arg value was loaded.


>  /* Invert the sense of the comparison.  */
>  static inline TCGCond tcg_invert_cond(TCGCond c)
>  {
> diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
> index dcc2ed0bbc..dc65577e2f 100644
> --- a/tcg/tcg-op.c
> +++ b/tcg/tcg-op.c
> @@ -1005,7 +1005,8 @@ void tcg_gen_ext16u_i32(TCGv_i32 ret, TCGv_i32 arg)
>  void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg)
>  {
>      if (TCG_TARGET_HAS_bswap16_i32) {
> -        tcg_gen_op2_i32(INDEX_op_bswap16_i32, ret, arg);
> +        tcg_gen_op3i_i32(INDEX_op_bswap16_i32, ret, arg,
> +                         TCG_BSWAP_IZ | TCG_BSWAP_OZ);
>      } else {
>          TCGv_i32 t0 =3D tcg_temp_new_i32();
>=20=20
> @@ -1020,7 +1021,7 @@ void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg)
>  void tcg_gen_bswap32_i32(TCGv_i32 ret, TCGv_i32 arg)
>  {
>      if (TCG_TARGET_HAS_bswap32_i32) {
> -        tcg_gen_op2_i32(INDEX_op_bswap32_i32, ret, arg);
> +        tcg_gen_op3i_i32(INDEX_op_bswap32_i32, ret, arg, 0);
>      } else {
>          TCGv_i32 t0 =3D tcg_temp_new_i32();
>          TCGv_i32 t1 =3D tcg_temp_new_i32();
> @@ -1661,7 +1662,8 @@ void tcg_gen_bswap16_i64(TCGv_i64 ret, TCGv_i64 arg)
>          tcg_gen_bswap16_i32(TCGV_LOW(ret), TCGV_LOW(arg));
>          tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
>      } else if (TCG_TARGET_HAS_bswap16_i64) {
> -        tcg_gen_op2_i64(INDEX_op_bswap16_i64, ret, arg);
> +        tcg_gen_op3i_i64(INDEX_op_bswap16_i64, ret, arg,
> +                         TCG_BSWAP_IZ | TCG_BSWAP_OZ);
>      } else {
>          TCGv_i64 t0 =3D tcg_temp_new_i64();
>=20=20
> @@ -1680,7 +1682,8 @@ void tcg_gen_bswap32_i64(TCGv_i64 ret, TCGv_i64 arg)
>          tcg_gen_bswap32_i32(TCGV_LOW(ret), TCGV_LOW(arg));
>          tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
>      } else if (TCG_TARGET_HAS_bswap32_i64) {
> -        tcg_gen_op2_i64(INDEX_op_bswap32_i64, ret, arg);
> +        tcg_gen_op3i_i64(INDEX_op_bswap32_i64, ret, arg,
> +                         TCG_BSWAP_IZ | TCG_BSWAP_OZ);
>      } else {
>          TCGv_i64 t0 =3D tcg_temp_new_i64();
>          TCGv_i64 t1 =3D tcg_temp_new_i64();
> @@ -1717,7 +1720,7 @@ void tcg_gen_bswap64_i64(TCGv_i64 ret, TCGv_i64 arg)
>          tcg_temp_free_i32(t0);
>          tcg_temp_free_i32(t1);
>      } else if (TCG_TARGET_HAS_bswap64_i64) {
> -        tcg_gen_op2_i64(INDEX_op_bswap64_i64, ret, arg);
> +        tcg_gen_op3i_i64(INDEX_op_bswap64_i64, ret, arg, 0);
>      } else {
>          TCGv_i64 t0 =3D tcg_temp_new_i64();
>          TCGv_i64 t1 =3D tcg_temp_new_i64();
> diff --git a/tcg/README b/tcg/README
> index 8510d823e3..19fbf6ca52 100644
> --- a/tcg/README
> +++ b/tcg/README
> @@ -295,19 +295,21 @@ ext32u_i64 t0, t1
>=20=20
>  8, 16 or 32 bit sign/zero extension (both operands must have the same ty=
pe)
>=20=20
> -* bswap16_i32/i64 t0, t1
> +* bswap16_i32/i64 t0, t1, flags
>=20=20
> -16 bit byte swap on a 32/64 bit value. It assumes that the two/six high =
order
> -bytes are set to zero.
> +16 bit byte swap on a 32/64 bit value.  The flags values control how
> +the input and output sign- or zero-extension is treated.
>=20=20
> -* bswap32_i32/i64 t0, t1
> +* bswap32_i32/i64 t0, t1, flags
>=20=20
> -32 bit byte swap on a 32/64 bit value. With a 64 bit value, it assumes t=
hat
> -the four high order bytes are set to zero.
> +32 bit byte swap on a 32/64 bit value.  For 32-bit value, the flags
> +are ignored; for a 64-bit value the flags values control how the
> +input and output sign- or zero-extension is treated.
>=20=20
> -* bswap64_i64 t0, t1
> +* bswap64_i64 t0, t1, flags
>=20=20
> -64 bit byte swap
> +64 bit byte swap.  The flags are ignored -- the argument is present
> +for consistency with the smaller bswaps.
>=20=20
>  * discard_i32/i64 t0

--=20
Alex Benn=C3=A9e

