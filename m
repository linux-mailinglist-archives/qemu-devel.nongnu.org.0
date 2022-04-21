Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5FA50A8C3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:07:35 +0200 (CEST)
Received: from localhost ([::1]:43306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhc9O-00005E-Qw
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc0L-0008Rf-AN
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:58:13 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:41710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc0J-0000Hc-A1
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:58:12 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2ebf4b91212so62364937b3.8
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 11:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qj/nHI3qZsguMXXkfdW3xQqvOkV+57RWuo0wJN+zWbA=;
 b=U/yQQ6lHLukqnzjoCHzQzT6Sxj3eHO7y3giCDfTuBVlRAbmJHkfzwJ2VUc6qyyiVEF
 VEsGOIEWfqs7Rh7j53zfTU8kSI07NzzsBtiOYLeZZe90x5pBYjvzesd52UMbauj8ly2o
 CZDfrXacto6iF0zdwkIeC+pUnq9xqk1KYqdTpSEa16ctACTQZboo5d1EvvL/M2qqEmA8
 fWi3+Lba/zbIALXLJ5x17PDVV/Sczuj+j8zym1x4vEVKx9BIVhGBVFMN9Vwr+qlc3JPO
 tS9IqNut+HhpIyJcafQYN6pdYFHTg0cgMyoBmJoVpGON8mwMrp9MEi7tclQydGf8Oljm
 bkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qj/nHI3qZsguMXXkfdW3xQqvOkV+57RWuo0wJN+zWbA=;
 b=uQQNd7/LeY5Eyl3yvod6ky8SG/5CVG5ki9+71N7v8NYsA1W+FuCkMSNWWpYq8LjU0+
 kpV2GxKzl41IjDXK1qSRQkkxb5LX3xIk1+7AVEpgzKZhjvNXfE/pAOkfORZ3ME+SGxDT
 5mVFvqBjJRsToTvzAMXJc34koTQey+eC8nk2nJltQYXkZWZF4aM1H6uvjhJdelRg8k5x
 f6AeARnOsT/L19WTsJ2Ghhmt4sdaC7M9UxGE7+hNSHYnHgga8XOAWwOBAnGd3n69pd1+
 qjirpekKRbucLNQqrlzlv0LXpR+dt8uW1yApJWaItJpHlkcGXco/Tmbj+gQpb3u4d3wA
 UcKA==
X-Gm-Message-State: AOAM531mYtKG5yURRJDWkWUXekFtYmzj4KGAfxsPE4nRCallpyBhPl5i
 S03zS9S51YxDRRpecORTjCSD447ieWTwV7BUPOw2eFN4Gag=
X-Google-Smtp-Source: ABdhPJyUjgwnQcOARxmKxfE5jKXinGRrZi3UsLxcSxNyZht3BvScSrGRy6W+eJ15SsjP05ioKoSeMX5jn8IUxetDg5A=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr1173717ywj.329.1650567490246; Thu, 21
 Apr 2022 11:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-16-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 19:57:59 +0100
Message-ID: <CAFEAcA9a5y4+RTpx5eL3sJdv4oDrqi4vT59gc+Dok2kQD96W8g@mail.gmail.com>
Subject: Re: [PATCH v3 15/60] target/arm: Simplify gen_sar
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 18:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use tcg_gen_umin_i32 instead of tcg_gen_movcond_i32.
> Use tcg_constant_i32 while we're at it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 57631c9fa1..8d6534f9a5 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -568,12 +568,10 @@ GEN_SHIFT(shr)
>
>  static void gen_sar(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
>  {
> -    TCGv_i32 tmp1, tmp2;
> -    tmp1 = tcg_temp_new_i32();
> +    TCGv_i32 tmp1 = tcg_temp_new_i32();
> +
>      tcg_gen_andi_i32(tmp1, t1, 0xff);
> -    tmp2 = tcg_const_i32(0x1f);
> -    tcg_gen_movcond_i32(TCG_COND_GTU, tmp1, tmp1, tmp2, tmp2, tmp1);
> -    tcg_temp_free_i32(tmp2);
> +    tcg_gen_umin_i32(tmp1, tmp1, tcg_constant_i32(31));
>      tcg_gen_sar_i32(dest, t0, tmp1);
>      tcg_temp_free_i32(tmp1);
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

