Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CA3566B7C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 14:07:10 +0200 (CEST)
Received: from localhost ([::1]:52432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8hKf-0001GF-7S
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 08:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8hJE-0008Ii-Ur
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:05:40 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:42918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8hJA-0004of-5N
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:05:40 -0400
Received: by mail-yb1-xb29.google.com with SMTP id g4so21416504ybg.9
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T5uh004xHAS+Dvz7+Ps6RyFRfJNa3YTXOVgBkRFiqq8=;
 b=Ox+sE89fQ/XRice4h+3Z3lOugXMmZ33jK0MNHEhvBSPW4IJEHZG1JT0HsqJdN4gXXs
 4Sl1auADrkE1b9c1q3jIGfrL0n8gwf4unEvJmL+kJPC9Y5e7A0HiquW5DgeEF8LOOcT7
 67edj2FRZ099uM/3numW0i0GYPnQC28ZpFTmKTfzxUhoHV8fh84TERu9UX3hbo8bnA5m
 yZzyLXy3fZGClhakSLLgQB22i1i/fPBNR8a1XBQAaleUTm1wXFi4mf6ga9z0xZqa1pW0
 xnBUVIo/VMRlOl1pg1gyy30xWPk4Q5A5fjWP66/DlEMBsesfQZg9/qFBEc/NVnJ+Wsmv
 dfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T5uh004xHAS+Dvz7+Ps6RyFRfJNa3YTXOVgBkRFiqq8=;
 b=PnJ5gX0+CIDenudEVKM4JyeOjxKO5swPxvaxzKncZUvdI2oAhOvvSUjH9koHDCD9FB
 lUu21VUWB8dCG2QmfqczX8a8TEK+PDtu9H5EPPBmlkglI0lE0wgLH9SLjmcs6ZDHXonM
 HrDzAHQ5yqsSvNBoPfGwh2yElxQojfpAMVf2EfdIMjLXX22XVDuXdZ6am9QZg0F4cwuR
 gVgdvK8Hu2HaTbPld5ptdFwlLsT2ODVgfcYKYI1wdhSAmoJ9X6I6WFONa97MXgS6qgoI
 TunQC8Zr7RwxFiHgNocVTdxeIh1stpvxLMlDiyNEuA/DEFQTHw152zdUiFmwCEYuTAra
 5gSg==
X-Gm-Message-State: AJIora9ohKNyNfrr2PshysBHAJBmMrDgjz17FnuzQX+Y30Q5x4Cnpyxt
 aXAGp9l864sOdiqAe8gk6MkJcFtn2FyYWdpwxhZCJQ==
X-Google-Smtp-Source: AGRyM1vgsJhpoJNvYIZK+fJgH3XXERao7rsda2PWEiYasAS8IDBmBBRHeh5YlaIBhYR2vyDS9VxVc2Zq0CkMfa6ZRl8=
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr17960460ybf.67.1657022734890; Tue, 05
 Jul 2022 05:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-4-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 13:05:24 +0100
Message-ID: <CAFEAcA9rawNH8PJFU5dXZbafhJYjG4vuS8r0gATj9aXJYLC_kw@mail.gmail.com>
Subject: Re: [PATCH 03/62] target/arm: Fix MTE check in sve_ldnfff1_r
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sun, 3 Jul 2022 at 09:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The comment was correct, but the test was not:
> disable mte if tagged is *not* set.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 1654c0bbf9..db15d03ded 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -5986,7 +5986,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
>       * Disable MTE checking if the Tagged bit is not set.  Since TBI must
>       * be set within MTEDESC for MTE, !mtedesc => !mte_active.
>       */
> -    if (arm_tlb_mte_tagged(&info.page[0].attrs)) {
> +    if (!arm_tlb_mte_tagged(&info.page[0].attrs)) {
>          mtedesc = 0;
>      }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Since this is a standalone bugfix I've put it in target-arm.next
so it doesn't get held up while we review the rest of the series.

thanks
-- PMM

