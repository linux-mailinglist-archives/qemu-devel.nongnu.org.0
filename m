Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AEA37A3C4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:35:16 +0200 (CEST)
Received: from localhost ([::1]:55650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOnL-0006Zr-HN
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgONR-0005rA-1E
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:08:29 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:45826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgONO-0005h6-V1
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:08:28 -0400
Received: by mail-ej1-x62b.google.com with SMTP id c22so550791ejd.12
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 02:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wrwO0kBPFt2SrzVRLwLy84GfK+eQ74QzZdGSn0uzGaE=;
 b=R6l6gUWx/GVu2hexFmoy7zkXfbKBYbF1VkK6isJRMfjel4gByeIfsavJ4he9eJhnvE
 hATZl+3IphVi4DIn1ORxNyApFyWl6gPxwYau2mH3CsCuF0+6KtIpg7HnLSUzDH6aBTqD
 sGDk5fvwQDxKFkUOH1uq6pU5lZoV/Zp5w+juUS81izBjTqmrk0Xt1bYCNVfoQPXybWiL
 DOEoSAzZG2nzhMF4oY5Yvrm4/r6xvM/aXXYdd1JPiMiHtR4TlNpZKnrVS5IoQJlD15qZ
 HRDz3gyrNDMwk9dgMC2NdoQLior03LnW+R20tXtZUBt5Vx6yKM/YE9/y4tCUAKGEjqba
 AJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wrwO0kBPFt2SrzVRLwLy84GfK+eQ74QzZdGSn0uzGaE=;
 b=J6lJFem8Eo8AzwtPtkx/7ggxoOULcbollZC4/hyx7vZHFJMjj7+x0A7xonQFAM/X0O
 XeksXz6t0QoOuxA2CfPsYvVAU6m4ynvEUpfgr9/pVn2eWa26TL/rRw5OC8byoKOB9vnu
 ZartJsh2/79GdnWLKeGu0+TTJfR7QVYsIO15G6MhNWq6C4DOZ+iefe3Ip5ImvHCPz/a3
 1TqyAJxWpbc6mW/G0O9uYM2c6PXd4n8EKXmDH3L4ht6MEd+ihEcm/sxYA+R1z7OUyvbG
 7/9p8U7bJPH29Ay0ZdyXt+oIAnDusdfcxeEhGnL/no9SDDTEZB4Ni9VcxDvOMEb7B73G
 nF0g==
X-Gm-Message-State: AOAM530KYO+hcLlX90eKDUYy7nJqwwdLCjXGze89bA+7ylMeFbXOjRvv
 BmqHKZ9iZnAn0wlHYELwxLG4a79vtZmBTbsg1X5Eig==
X-Google-Smtp-Source: ABdhPJzTLVLL2uMd7d1p0SbObWNsoJf0j2o4k0spN/UhpIfQNsFfYKjZfXryVAKhjafmQ9+QBhE7L5avjwBpUD/MKAE=
X-Received: by 2002:a17:906:11cc:: with SMTP id
 o12mr30782664eja.85.1620724105171; 
 Tue, 11 May 2021 02:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-10-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 10:07:12 +0100
Message-ID: <CAFEAcA_CuY7D+FEfW-g=da1yd6wSZOSyiDVEBZft4qjLw_kYXw@mail.gmail.com>
Subject: Re: [PATCH v6 09/82] target/arm: Implement SVE2 saturating
 add/subtract (predicated)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 21:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  54 +++++++++++
>  target/arm/sve.decode      |  11 +++
>  target/arm/sve_helper.c    | 194 ++++++++++++++++++++++++++-----------
>  target/arm/translate-sve.c |   7 ++
>  4 files changed, 210 insertions(+), 56 deletions(-)
>

> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 7cc559d950..12a2078edb 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -678,6 +678,135 @@ DO_ZPZZ(sve2_uhsub_zpzz_h, uint16_t, H1_2, DO_HSUB_BHS)
>  DO_ZPZZ(sve2_uhsub_zpzz_s, uint32_t, H1_4, DO_HSUB_BHS)
>  DO_ZPZZ_D(sve2_uhsub_zpzz_d, uint64_t, DO_HSUB_D)
>
> +static inline int32_t do_sat_bhs(int64_t val, int64_t min, int64_t max)
> +{
> +    return val >= max ? max : val <= min ? min : val;
> +}
> +
> +#define DO_SQADD_B(n, m) do_sat_bhs((int64_t)n + m, INT8_MIN, INT8_MAX)
> +#define DO_SQADD_H(n, m) do_sat_bhs((int64_t)n + m, INT16_MIN, INT16_MAX)
> +#define DO_SQADD_S(n, m) do_sat_bhs((int64_t)n + m, INT32_MIN, INT32_MAX)
> +
> +static inline int64_t do_sqadd_d(int64_t n, int64_t m)
> +{
> +    int64_t r = n + m;
> +    if (((r ^ n) & ~(n ^ m)) < 0) {
> +        /* Signed overflow.  */
> +        return r < 0 ? INT64_MAX : INT64_MIN;
> +    }
> +    return r;
> +}
> +
> +DO_ZPZZ(sve2_sqadd_zpzz_b, int8_t, H1_2, DO_SQADD_B)

H1_2...

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

