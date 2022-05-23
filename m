Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 425E4530EC7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 15:10:06 +0200 (CEST)
Received: from localhost ([::1]:50166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt7oz-0001i7-4s
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 09:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt7XU-00006V-GA
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:52:00 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:38081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt7XM-00010C-3C
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:51:54 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2ff7b90e635so80815457b3.5
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8XT9898Iy4+tQ6cFvs53DFxmFi5BqF6WzZcJnMs1x0Q=;
 b=zE9gZXi1jP/dPewH0mRKQqxIv3/IYG4b9h0TGMD9Kj+gxdyolUH59Lg3QFMYsc1czn
 qbUAylulV03iYwSVF439ZcPbDwQmhdS51MuNPnYMFqdM+WZfFIvVKbJ9RRMqF9LY06iN
 +Y0uDJVLCwjAgjUJaDfRuHiMErE8vz/tKh2Ky8dnO3d7MlRtlgnjAEJ+bhEwFc2J9YsM
 XApV7ak+YZ65osZVaX5cC7Lpp8Us7BjtGUyWY0LuaqzeE4wcpmSEULvLGdKuwkizzmvW
 L2Kx1VRze9SHo1EBSmK+LpIxd1ZjY/XKfOxj4pju4KWNjOo35CTe1gD0d3wlhbnw4iPV
 fhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8XT9898Iy4+tQ6cFvs53DFxmFi5BqF6WzZcJnMs1x0Q=;
 b=iIBgIPxl0chEirTqIZedntATZ7lZ0r1WGY3fnY2enhzRX0UxH/AZybZ0ADEpJK4rNd
 f+06shFa91En0t8/0xP98u0Plkh+8strE7WSUUGTQDQKafJ8U54sWnKZCii6bWq0bCZt
 IgxjyX725YcCkBTTsmBJYv0rqloYDn9Bkx2Me3IHaafReUMMpnxX11rIsej1Pn6b8LF7
 umFmE8DtrFBCyw239+dwULsQpYtklj05Po18sCZwF3COnhf2etX/wLTiSbmtS/s+Yvbi
 R9DenzkAysys078mbNIhMgkFiKSAvRFxe52Kj426xnZ1gfDf8Ruc/M4kYSAmQCL9mr5S
 oaLg==
X-Gm-Message-State: AOAM530/+HQbUt5/eoxvL8xmJ20H9S+R8xwkbFZd9mST/i/AGyn0VaFn
 e3kUhMAHPEGx9GLUqhKqhIl16AjeqSeuuJRQccC1aA==
X-Google-Smtp-Source: ABdhPJyh7bjOO0V4pNFNItnxImb7cTx6R0KHS71w5sbeU1NYhnuSmS3hs+B8g8ifjJStQSq9aXjlOG5ZEImFXKRhL0w=
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr23214073ywc.329.1653310311138; Mon, 23
 May 2022 05:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-21-richard.henderson@linaro.org>
In-Reply-To: <20220521000400.454525-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 13:51:39 +0100
Message-ID: <CAFEAcA_kPbHMrO17LjkQAvtBcyQ0oC7XwuhxDOuqQuAPmUJuzA@mail.gmail.com>
Subject: Re: [PATCH v3 20/49] semihosting: Split out common_semi_has_synccache
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 21 May 2022 at 01:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We already have some larger ifdef blocks for ARM and RISCV;
> split out a boolean test for SYS_SYNCCACHE.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  semihosting/arm-compat-semi.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 9ea985beee..c53cb1891f 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -224,6 +224,12 @@ static inline target_ulong common_semi_stack_bottom(CPUState *cs)
>      CPUARMState *env = &cpu->env;
>      return is_a64(env) ? env->xregs[31] : env->regs[13];
>  }
> +
> +static inline bool common_semi_has_synccache(CPUArchState *env)
> +{
> +    /* Invalid for A32/T32. */
> +    return !is_a64(env);
> +}

Condition seems to be inverted ?

-- PMM

