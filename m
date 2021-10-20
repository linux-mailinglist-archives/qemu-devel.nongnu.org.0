Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC70434FE5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 18:13:40 +0200 (CEST)
Received: from localhost ([::1]:51460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdEDi-0007P3-KZ
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 12:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdEBJ-0005xy-H9
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 12:11:09 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdEBE-0000Jk-MI
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 12:11:09 -0400
Received: by mail-wm1-x330.google.com with SMTP id g39so16011070wmp.3
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 09:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jAqk8kFxn3e8uYdW3tlVNIP3LHAi8+EjzPn5SNa4+tU=;
 b=I/WnFhGXoLpdJjcy/ZDIwTyTtg2ke0sd2B8RQ8QXrrcgPRkuKl8lWRPdjkG9i64ZyD
 F9ZJc4IJZ0XJaLRw+YQZLhznJYQDMU4q68yz6XR/ptxt+4NfGT9LpAcWhqzEUz0+DUaB
 H9DaK1dTSx+Kok04t3am0k3Np2cL44H3/WRaQxAEsVsw50gMPndbT/3CNIOFYq78M2uH
 3AumIgZd0nZqrYodkgMd2XOtWTuvZuyWcqYUKFkmSqmc0aRyul8JKJUTDhj2zF5+j3V2
 oooVDeN2GTGA2TvniS6yQlSNqiWTTMmOHqsU6R3OjAdfXfZ4xz2PUgC6MO/YrD0sm9B3
 AqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jAqk8kFxn3e8uYdW3tlVNIP3LHAi8+EjzPn5SNa4+tU=;
 b=oH0eG3xvhvPglqyOO5IepGCTQuiSMKOg6BUeY+ex19hg8Eto5fkNgdp2wT/V9ZNIEx
 fIi+4ac0j+K3CFcjhlfXBb0zcRrH9j2i39ocTAEBaPiPtZGncPzNwuwh6U1KzDoVVudH
 j7OGKHzfp7T7GU9UMIBvGMoTmKutnhWAx1my/38hrmgj0rQVbENow6Uhh8esN5eLQAnA
 0XWRuW7GVG7Ab97CnAYl1HQ2NFzuiNcG+oiLCfH7iFDWvspyjFYCtgRZGs6Ck82Ka3mn
 Gxr3c0wRi/800CdlY2TmZ+e3GkScOS+DGlpXKxeK0Xo/RBVVAQJEUnTlofxDq4YmAEwn
 P0uQ==
X-Gm-Message-State: AOAM5335HvgZaZOpSHTJnvIQ5F30+4nv7WnFFUNDXaDMGBz1JLoQyAay
 HbztqC7HIL4CLQfWI5ghXGxxmg==
X-Google-Smtp-Source: ABdhPJxQsysy7KAGKhcGEBYzNQ3LX60D3plouP5V4QRhSdKpmGSE+QQQoNccJRu8OO5zg/5MiLdn0g==
X-Received: by 2002:adf:a2d8:: with SMTP id t24mr136464wra.91.1634746261687;
 Wed, 20 Oct 2021 09:11:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t12sm2858237wmq.44.2021.10.20.09.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 09:11:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2ECDA1FF96;
 Wed, 20 Oct 2021 17:11:00 +0100 (BST)
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-9-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 08/48] tcg/optimize: Split out fold_call
Date: Wed, 20 Oct 2021 17:05:41 +0100
In-reply-to: <20211007195456.1168070-9-richard.henderson@linaro.org>
Message-ID: <87pmrzvfqj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

> Calls are special in that they have a variable number
> of arguments, and need to be able to clobber globals.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 63 ++++++++++++++++++++++++++++++++------------------
>  1 file changed, 41 insertions(+), 22 deletions(-)
>
> diff --git a/tcg/optimize.c b/tcg/optimize.c
> index fad6f5de1f..74b9aa025a 100644
> --- a/tcg/optimize.c
> +++ b/tcg/optimize.c
> @@ -624,10 +624,42 @@ static void copy_propagate(OptContext *ctx, TCGOp *=
op,
>      }
>  }
>=20=20
> +static bool fold_call(OptContext *ctx, TCGOp *op)
> +{
> +    TCGContext *s =3D ctx->tcg;
> +    int nb_oargs =3D TCGOP_CALLO(op);
> +    int nb_iargs =3D TCGOP_CALLI(op);
> +    int flags, i;
> +
> +    init_arguments(ctx, op, nb_oargs + nb_iargs);
> +    copy_propagate(ctx, op, nb_oargs, nb_iargs);
> +
> +    /* If the function reads or writes globals, reset temp data. */
> +    flags =3D tcg_call_flags(op);
> +    if (!(flags & (TCG_CALL_NO_READ_GLOBALS | TCG_CALL_NO_WRITE_GLOBALS)=
)) {
> +        int nb_globals =3D s->nb_globals;

Aren't we missing a trick here?

If the helper is going to read global registers we need to ensure any
temps holding their data is written but we don't need to throw the
existing temps away if the helper is TCG_CALL_NO_WRITE_GLOBALS?

I guess we have to handle the case of temps that are about to get smahed
by the call though....

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

