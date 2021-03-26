Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA8034A83B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 14:37:56 +0100 (CET)
Received: from localhost ([::1]:42006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPmex-00079a-Gq
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 09:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPmcJ-0004rV-Ri
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:35:13 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:42769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPmcH-0005AC-J3
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:35:11 -0400
Received: by mail-ed1-x531.google.com with SMTP id l18so6324760edc.9
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 06:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C40hR8+I1ugYv9Jdyl3eKoQu7BMieAYF97m8ERsIqTQ=;
 b=RrrF3DBlYUnCro6zVfRToXcwSo/0zzpH4rTdQ6zTumG1+jjt4ZaWIvtjB3tBHjNQyl
 se/EUlN6FobNkXtSVze5l5w33T5mVPhVAAwILewzdbjF7IZbOG5RcKZ/LqPKRIkRvp0f
 LQKqdfXH1sDLwbLIpZvAjUlctnGLbaIxfaSqDfbp3cxuHZACS8DFkraa2bWh4100EyNF
 Kr6Xj3wy1YwwJP6OMfAWTK5j+jOEv4SLa90gqR9xy5dlEUhNVxKpXY1kzukXXJrd+7XG
 qDu2e6nxIasA1lnKsP0JQ7S5J1rhe7P2mPcGFoTeKSszoIzBHXZxg4VNL9QT1YHQyzXh
 ZJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C40hR8+I1ugYv9Jdyl3eKoQu7BMieAYF97m8ERsIqTQ=;
 b=GIvLpKI+vpvI1yumWf4Q1/65otq3lR/IXw7I8C48fcAHPiLQBu6mdfPPx6ZeXLwRDd
 xqtGJZR/C/mIVnT4KqcdxowHKgzyjouxmauU1z9MxCW828n5SgDdyD7UDVm2A/vRenHR
 DCwlkiXsjSSqWO7N7mpEa2BtDf2Rh+sHB6wIAT7iMJbrNd12Dtkcc0hSS81wYnrszVYy
 meUBAQwZncNgpU2y2XgjTbA9UCUN2ywnx+/QJ+Fer/IknKLY59clHDDflbw5aGA07viO
 eqWVjb+QwbTrKvTEoPEYEI8rAUZ3zEe7tuo1veJOYk1JyYJhimwugopa2plvMVCLl46P
 M56g==
X-Gm-Message-State: AOAM531KwuOqkS/Fq9PTEYOY5wJacJNlZZR+EHuF1T5mDZVSPNYA8hE2
 Od4FUw832JVctVYGimrJnzcYSjkdgRaAZlyAymJVEdWxTtu/fA==
X-Google-Smtp-Source: ABdhPJyxqHxwIbIJ/QSWCpNEvGfSCaol0tEhkTjD3H8I4kIFBE/3Rng8LIZzP6PdREkiYLk6I0q5f0I2P21/l6JsnYo=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr14813128edu.100.1616765707605; 
 Fri, 26 Mar 2021 06:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210319162458.13760-1-peter.maydell@linaro.org>
In-Reply-To: <20210319162458.13760-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 13:34:39 +0000
Message-ID: <CAFEAcA9hz5ZsetCWMGJd+aX0td6vE7YiAW+x2C=K3mCsdWiJ8w@mail.gmail.com>
Subject: Re: [PATCH for-6.0] hw/timer/renesas_tmr: Add default-case asserts in
 read_tcnt()
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping for review?

thanks
-- PMM

On Fri, 19 Mar 2021 at 16:24, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In commit 81b3ddaf8772ec we fixed a use of uninitialized data
> in read_tcnt(). However this change wasn't enough to placate
> Coverity, which is not smart enough to see that if we read a
> 2 bit field and then handle cases 0, 1, 2 and 3 then there cannot
> be a flow of execution through the switch default. Add explicit
> default cases which assert that they can't be reached, which
> should help silence Coverity.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/renesas_tmr.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
> index eed39917fec..d96002e1ee6 100644
> --- a/hw/timer/renesas_tmr.c
> +++ b/hw/timer/renesas_tmr.c
> @@ -146,6 +146,8 @@ static uint16_t read_tcnt(RTMRState *tmr, unsigned size, int ch)
>          case CSS_CASCADING:
>              tcnt[1] = tmr->tcnt[1];
>              break;
> +        default:
> +            g_assert_not_reached();
>          }
>          switch (FIELD_EX8(tmr->tccr[0], TCCR, CSS)) {
>          case CSS_INTERNAL:
> @@ -159,6 +161,8 @@ static uint16_t read_tcnt(RTMRState *tmr, unsigned size, int ch)
>          case CSS_EXTERNAL: /* QEMU doesn't implement this */
>              tcnt[0] = tmr->tcnt[0];
>              break;
> +        default:
> +            g_assert_not_reached();
>          }
>      } else {
>          tcnt[0] = tmr->tcnt[0];
> --
> 2.20.1

