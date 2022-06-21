Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DB45538D9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 19:26:29 +0200 (CEST)
Received: from localhost ([::1]:56874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3he0-0006AO-IY
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 13:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3hbJ-0004Wh-TO
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 13:23:43 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:37814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3hbI-0000bp-0D
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 13:23:41 -0400
Received: by mail-yb1-xb31.google.com with SMTP id w6so25646273ybl.4
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 10:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/dYsGrgRzHNBwe6t8AZYBArxopH0NdT/0/e+BsMAF8=;
 b=EXSCwMYNOH5EqISuu7CtQgRsb7hnYaocFGQZ+0uNs8tm70tMKbCADBE0/7Phob+vz9
 dcNwFFQgS86dAZM5FhiTmTUCwRJPosYcuQJ7cbnh4TFxhcRp1U/cPg5elv+gt/L6yqb+
 1LxnEwRlbUn+irkZjNCu3XZIdY3+LMPJWlFsvydj1QGrHP1WdoKVA8xX5xEOWtmNe4yN
 x8s1W6iv08rvhgBXK0PSntdtLJN8f166EZpRPYQDGqCh3BqC9e+2r124WipTroBd6Ew+
 G2HLZeJ5gK0wlM8evn3RwTdK29uv/7h63M8faj+sputD32JBF8ATHFi47F/+mBVAmSaW
 ngFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/dYsGrgRzHNBwe6t8AZYBArxopH0NdT/0/e+BsMAF8=;
 b=JwoItsOQp1mQExyXfHnYzJu6EKsZtP5Kqa03+5580pTSVvVyi3PZwlXaL4n0h+oL1V
 lW6xpVXYWwBFdoNVWSNO9t8L4U150G1e5rrxHeUkbpqCX1v5GdKMWsUSzuahdQiihyst
 aJ8pjHxmhq6T+efZ3bCChe9zeseP7lGa/sPg3JHgtH5V8I7JupjDtbYXBxPRI4QRAKLo
 CmJ7XJo04NEYxgu+Gf7cxiT+DjvTmaQLgWxld+xoETYXeDUkYDQe3AyPjUwnPe3b71dG
 0pXYSTwmZXG66Nj04KIsLdd6TKiWIqgDm6fM0nNr7hfcAor/bMkGWws/P6jwyBzWs5jC
 Li7g==
X-Gm-Message-State: AJIora+SsQjmra0ihj65D9ZDPs2XyH2nnokkNDdLk5JRxHDDFhTge3xv
 lS4qaq1TpEIJBF8LiwQ6L2gbKlFoxMYXJZzY1xdwEg==
X-Google-Smtp-Source: AGRyM1sM9nD/T1BP+YNjPjvoCEaKgUoHtQtCEaGzGhUQN8MtnUJ7We7H5s2sPav1v0kyXv41PTNUqXRBYHzq2eNzc/c=
X-Received: by 2002:a5b:14c:0:b0:64f:c826:a76b with SMTP id
 c12-20020a5b014c000000b0064fc826a76bmr31547619ybp.479.1655832218630; Tue, 21
 Jun 2022 10:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-24-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 18:23:01 +0100
Message-ID: <CAFEAcA_f1dtuiTLuwZL+MTeNsJc1fiWUZmRzvZBHAFpbDzu4hg@mail.gmail.com>
Subject: Re: [PATCH v3 23/51] target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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

On Mon, 20 Jun 2022 at 19:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These SME instructions are nominally within the SVE decode space,
> so we add them to sve.decode and translate-sve.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.h |  1 +
>  target/arm/sve.decode      |  5 ++++-
>  target/arm/translate-a64.c | 15 +++++++++++++++
>  target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 58 insertions(+), 1 deletion(-)

> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 62b5f3040c..13bdd027a5 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -1286,6 +1286,19 @@ static bool trans_ADDVL(DisasContext *s, arg_ADDVL *a)
>      return true;
>  }
>
> +static bool trans_ADDSVL(DisasContext *s, arg_ADDSVL *a)
> +{
> +    if (!dc_isar_feature(aa64_sme, s)) {
> +        return false;
> +    }
> +    if (sme_enabled_check(s)) {
> +        TCGv_i64 rd = cpu_reg_sp(s, a->rd);
> +        TCGv_i64 rn = cpu_reg_sp(s, a->rn);
> +        tcg_gen_addi_i64(rd, rn, a->imm * s->svl);
> +    }
> +    return true;
> +}
> +
>  static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a)
>  {
>      if (!dc_isar_feature(aa64_sve, s)) {
> @@ -1299,6 +1312,19 @@ static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a)
>      return true;
>  }
>
> +static bool trans_ADDSPL(DisasContext *s, arg_ADDSPL *a)
> +{
> +    if (!dc_isar_feature(aa64_sme, s)) {
> +        return false;
> +    }
> +    if (sme_enabled_check(s)) {
> +        TCGv_i64 rd = cpu_reg_sp(s, a->rd);
> +        TCGv_i64 rn = cpu_reg_sp(s, a->rn);
> +        tcg_gen_addi_i64(rd, rn, a->imm * (s->svl / 8));
> +    }
> +    return true;
> +}
> +
>  static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
>  {
>      if (!dc_isar_feature(aa64_sve, s)) {
> @@ -1311,6 +1337,18 @@ static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
>      return true;
>  }
>
> +static bool trans_RDSVL(DisasContext *s, arg_RDSVL *a)
> +{
> +    if (!dc_isar_feature(aa64_sme, s)) {
> +        return false;
> +    }
> +    if (sme_enabled_check(s)) {
> +        TCGv_i64 reg = cpu_reg(s, a->rd);
> +        tcg_gen_movi_i64(reg, a->imm * s->svl);
> +    }
> +    return true;
> +}

I think we should define functions that parallel the SVE
vec_full_reg_size() and pred_full_reg_size() rather than directly
looking at s->svl, for consistency with how we did the SVE code.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

