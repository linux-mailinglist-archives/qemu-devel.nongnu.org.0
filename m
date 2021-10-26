Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D902B43B746
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:34:34 +0200 (CEST)
Received: from localhost ([::1]:58202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPPF-0005O7-VX
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPNb-0003kh-5q
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:32:51 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:46748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPNY-0004HV-VL
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:32:50 -0400
Received: by mail-lf1-x136.google.com with SMTP id c28so17404308lfv.13
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=bde3vkAqmUKII5gp95zh6eDbLURrx73+WulnJnzd+iQ=;
 b=gC6MHNPjlYJZQw/CuTHFWR1TryExf5YTEdr4eGUvOV3BUWWIaubthDVEoVZ+BR6NfS
 A1Tw3xPzDUb9CaygstbkF6O7bGsp28QEN/xh+48dZ1y08sP4ZCGMxnVyOrmv1AHImPgD
 kTup40v4yPIUmw4cLAO9+C05W4Fh3KCjX6zDvrsbsviVzA2ziyD5YsY8piJAPMTmk0NP
 NssGsThsaL7pAQQM6piqbLcni4T0mwOQ2mTyuokq7kvqh7WmV8fn1k04nbYnWFfsrNyW
 RkkVFowZq+YrtWzpLfSkuzUeE33L1eJxBC8EGAJCsnPl2FkmbaN3/S1S98cjyzVX4NDV
 Dikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=bde3vkAqmUKII5gp95zh6eDbLURrx73+WulnJnzd+iQ=;
 b=wkkmj8L0dRJRZCRM4wgKs/lNMySxnAih3jydmylOJ1wfBCoOeerZeAiQNA+CnFdYUx
 zL7HdpCybBAglyuyVomEFIW/h5yexAQ70jURJT+1c1SOAkCUhnfY99ZuqztGHwJ1tAU1
 1hppVzdjFsPMhKwzaVGGhkglYSwB3pm6Rwn4WW3zj91QbtCRp9d8/LJAdAm0PEv2Ty21
 0inBZphJxbJkCu0dcp6LcfcP1nKsvPH0LQydBr2gayJL6C6Iis+k7AxZGaFus8BAMGFR
 itOFDCLxAwtjlW+WXTccJ09RBP2HSVi/FcEosfkyxv2/UOYqKmVosBJ88P1/FZkY6EmM
 lg6g==
X-Gm-Message-State: AOAM53383Vbp02FuMnrl6n6UxpNEYNV+uGY5kDovmoJq9fswjtK2sMW5
 1aDVRUvoqNlLDoHokihWEBW10g==
X-Google-Smtp-Source: ABdhPJzRFnG7wCjYrJvgdJWx9gwsgqZl5hCmKTx2YV0bwBZwDsBBX30ua9+YSMh5B6e98euizxtH0w==
X-Received: by 2002:a05:6512:a82:: with SMTP id
 m2mr7195938lfu.212.1635265966832; 
 Tue, 26 Oct 2021 09:32:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n19sm1973748lfu.207.2021.10.26.09.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 09:32:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6A1601FF96;
 Tue, 26 Oct 2021 17:32:44 +0100 (BST)
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-42-richard.henderson@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 41/48] tcg/optimize: Sink commutative operand
 swapping into fold functions
Date: Tue, 26 Oct 2021 17:27:23 +0100
In-reply-to: <20211021210539.825582-42-richard.henderson@linaro.org>
Message-ID: <87o87bzqz7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x136.google.com
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
Cc: luis.pires@eldorado.org.br, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Most of these are handled by creating a fold_const2_commutative
> to handle all of the binary operators.  The rest were already
> handled on a case-by-case basis in the switch, and have their
> own fold function in which to place the call.
>
> We now have only one major switch on TCGOpcode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 128 ++++++++++++++++++++++---------------------------
>  1 file changed, 56 insertions(+), 72 deletions(-)
>
> diff --git a/tcg/optimize.c b/tcg/optimize.c
> index ba068e7d3e..92b35a8c3f 100644
> --- a/tcg/optimize.c
> +++ b/tcg/optimize.c
> @@ -696,6 +696,12 @@ static bool fold_const2(OptContext *ctx, TCGOp *op)
>      return false;
>  }
>=20=20
> +static bool fold_const2_commutative(OptContext *ctx, TCGOp *op)
> +{
> +    swap_commutative(op->args[0], &op->args[1], &op->args[2]);
> +    return fold_const2(ctx, op);
> +}
> +
>  static bool fold_masks(OptContext *ctx, TCGOp *op)
>  {
>      uint64_t a_mask =3D ctx->a_mask;
> @@ -832,7 +838,7 @@ static bool fold_xx_to_x(OptContext *ctx, TCGOp *op)
>=20=20
>  static bool fold_add(OptContext *ctx, TCGOp *op)
>  {
> -    if (fold_const2(ctx, op) ||
> +    if (fold_const2_commutative(ctx, op) ||
>          fold_xi_to_x(ctx, op, 0)) {
>          return true;
>      }
> @@ -891,6 +897,9 @@ static bool fold_addsub2(OptContext *ctx, TCGOp *op, =
bool add)
>=20=20
>  static bool fold_add2(OptContext *ctx, TCGOp *op)
>  {
> +    swap_commutative(op->args[0], &op->args[2], &op->args[4]);
> +    swap_commutative(op->args[1], &op->args[3], &op->args[5]);
> +
>      return fold_addsub2(ctx, op, true);
>  }
>=20=20
> @@ -898,7 +907,7 @@ static bool fold_and(OptContext *ctx, TCGOp *op)
>  {
>      uint64_t z1, z2;
>=20=20
> -    if (fold_const2(ctx, op) ||
> +    if (fold_const2_commutative(ctx, op) ||
>          fold_xi_to_i(ctx, op, 0) ||
>          fold_xi_to_x(ctx, op, -1) ||
>          fold_xx_to_x(ctx, op)) {
> @@ -950,8 +959,13 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
>  static bool fold_brcond(OptContext *ctx, TCGOp *op)
>  {
>      TCGCond cond =3D op->args[2];
> -    int i =3D do_constant_folding_cond(ctx->type, op->args[0], op->args[=
1], cond);
> +    int i;
>=20=20
> +    if (swap_commutative(-1, &op->args[0], &op->args[1])) {

I find this a bit magical. I couldn't find anything about TCGArg except
it's type:

  typedef tcg_target_ulong TCGArg;

so I'm not sure what to make of -1 in this case. I guess it just means
we never have a (sum =3D=3D 0 && dest =3D=3D a2) leg but it's not obvious
reading the fold code.
>=20=20
> +    if (swap_commutative(-1, &op->args[1], &op->args[2])) {
> +        op->args[5] =3D cond =3D tcg_swap_cond(cond);
> +    }

Also here.

<snip>

--=20
Alex Benn=C3=A9e

