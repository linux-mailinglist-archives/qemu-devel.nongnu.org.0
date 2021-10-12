Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F6F429DF1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 08:46:36 +0200 (CEST)
Received: from localhost ([::1]:33058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maBYZ-0002h0-Ax
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 02:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maBU4-0000Tx-1q
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:41:56 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maBTy-00063D-B3
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:41:55 -0400
Received: by mail-wr1-x432.google.com with SMTP id i12so50816434wrb.7
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 23:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Q93X/w1yQSVJ1RclXa3ZG4UzcR57y1x1DAkQ/dv4vJM=;
 b=JccdU1BoxLZl17xEh0fqufl37oERJq2uv13bmirkiA7//6Vm6z9LHz0jzy267IPy8H
 katxCmUSvqSCfLVEloRRowyi8Ktx/VvPjcW5xcCKXIcctlsYbaUc92R5JQY7cU1r6hJf
 EV6Q4/M5q60IXfqGUa4mFE7yflokzMRdJGjlzut0dCj/a3moUr9kn4Z5FUYlS2Zg+ntx
 l+s2Und+1vSR5x7U0I5KHjD5fiBH3KB0Sj1HePPhnS5nZ7G05VuGvpvxC0za5hYxAquA
 CUP7umWwPSf/j5Vjo1EBq7eLqGeM+/n0145YcMC1onvo19zD9LMFEXT8tgmqd/2eVbEB
 JaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Q93X/w1yQSVJ1RclXa3ZG4UzcR57y1x1DAkQ/dv4vJM=;
 b=KIMc7zLUB5SzZhLqeDeCEF0tDto5Ve1IfJzcbRkB5TVZVKIHQM4CoARP+pQ2aM9hnt
 GbReXKQIN9/7zGRJMg5xp2D46isJkYHY55fSW3mWndGYp63Qhr/eEvTTTLuwF+ilq9KE
 MPX1R5XHc/UubeIoWZW5v/3Btl+xrgcLYkJInBSVialAGReQrhZrL1UfKpymvKKjCikU
 +ak96pDKGmnaNV2S8quei5ncKesGbJnpfoaNXTHWC96UhAQzQhLe4RcOOm//LLvU8o35
 BUWzgbmSoriFzOW/gr5//jprXERxs7rgXtZ3JV8GAxJsyCNZEELYfm5DfXXc5t9oC3dT
 tXeA==
X-Gm-Message-State: AOAM533LYkzvvwTasZWzu/mztpspT/lkV9yPKduV69hfIvjI33IKBFB6
 m8fy4NNbrkjn7aibGQ9HuF5TKw==
X-Google-Smtp-Source: ABdhPJweKGekTN1LlPe3xCG0f//y9rsyNHsoyK/hHvRjrD5C9CnQJQxFTiCzCghp9MyKLqB99TeO4Q==
X-Received: by 2002:a1c:2c2:: with SMTP id 185mr3632381wmc.85.1634020908781;
 Mon, 11 Oct 2021 23:41:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c17sm9566697wrq.4.2021.10.11.23.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 23:41:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 814F01FF96;
 Tue, 12 Oct 2021 07:41:47 +0100 (BST)
References: <20211011185332.166763-1-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/s390x: move tcg_gen_insn_start to
 s390x_tr_insn_start
Date: Tue, 12 Oct 2021 07:41:20 +0100
In-reply-to: <20211011185332.166763-1-richard.henderson@linaro.org>
Message-ID: <87y26ywxqs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

> We use INDEX_op_insn_start to make the start of instruction boundaries.
> If we don't do it in the .insn_start hook things get confused especially
> now plugins want to use that marking to identify the start of instructions
> and will bomb out if it sees instrumented ops before the first instruction
> boundary.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Well that is considerably simpler than my patch... I'll apply it to the
PR and resubmit ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> ---
>  target/s390x/tcg/translate.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index f284870cd2..a2d6fa5cca 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -138,6 +138,7 @@ struct DisasFields {
>  struct DisasContext {
>      DisasContextBase base;
>      const DisasInsn *insn;
> +    TCGOp *insn_start;
>      DisasFields fields;
>      uint64_t ex_value;
>      /*
> @@ -6380,8 +6381,8 @@ static DisasJumpType translate_one(CPUS390XState *e=
nv, DisasContext *s)
>      /* Search for the insn in the table.  */
>      insn =3D extract_insn(env, s);
>=20=20
> -    /* Emit insn_start now that we know the ILEN.  */
> -    tcg_gen_insn_start(s->base.pc_next, s->cc_op, s->ilen);
> +    /* Update insn_start now that we know the ILEN.  */
> +    tcg_set_insn_start_param(s->insn_start, 2, s->ilen);
>=20=20
>      /* Not found means unimplemented/illegal opcode.  */
>      if (insn =3D=3D NULL) {
> @@ -6552,6 +6553,11 @@ static void s390x_tr_tb_start(DisasContextBase *db=
, CPUState *cs)
>=20=20
>  static void s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
>  {
> +    DisasContext *dc =3D container_of(dcbase, DisasContext, base);
> +
> +    /* Delay the set of ilen until we've read the insn. */
> +    tcg_gen_insn_start(dc->base.pc_next, dc->cc_op, 0);
> +    dc->insn_start =3D tcg_last_op();
>  }
>=20=20
>  static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *=
cs)


--=20
Alex Benn=C3=A9e

