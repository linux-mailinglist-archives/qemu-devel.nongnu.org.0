Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33664518967
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:12:19 +0200 (CEST)
Received: from localhost ([::1]:46482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlv8M-0006Es-7U
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluwH-0004jn-6Q
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:59:49 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:44708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluwF-0001pG-LF
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:59:48 -0400
Received: by mail-yb1-xb31.google.com with SMTP id e12so31784417ybc.11
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 08:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7RkeTIKrefgq+De9VEvrMvcOWMITWIDxKbdSvxqMq7U=;
 b=b4zDUAh8S6Nu6pZs7Rixo8lngzw5iTkiNaMkeTcz+yw385hEK0ASw0KPWwubXaGjE4
 eHOk7+2U+LMUW9/HIK6hBOdCqPjC+31KyQHZnrrxxDZjMqOFUZrQWu7sSXbWhrjU7eRv
 FDg7UnRzFlWOwRVk18EmW6DqnztGT+8EUSbR5P57Z4y1X+mnVe4cbExm6tDrgrdOWLNj
 R831yrmISc9qlfApr2yuiPulP6lxBRwRsCQ1nQwLJlXiWxEizoX8t//B9HqYFXWta3SQ
 lV8ztbYJ7KPYpiiQCCNBvG2xynwga+dPKD3mH/f0TeTC75sM5QWxPiT9WV9WilFhqSmD
 jwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7RkeTIKrefgq+De9VEvrMvcOWMITWIDxKbdSvxqMq7U=;
 b=LsHza2x/3qYwV8J6Lf9jwfoR3vFvGoZf49bsLxXSG0VZ7I7M91ld7Iwzkr1qO+x7KU
 sXd/9lWaF9MEcAGmRhJwvA6J8yw4SUTuXmzQ95byUvHRylbR0YMYgiG7PCODqazHRLDV
 g8D0BZJrmNGKJWY7lq8pgU6UrV3F369S3m0AZQxeOkhjCJo+CP0NlP7h/TxhNph0wNIJ
 E5YaeB5B0XNpFYxJS71cdpCMn152HUNSa9ehHKDCzNTK/2o5FJmG1hcbdSS3QcFyEZGF
 drAi76usO9A3aDXMo/ONe0RFijbgaar1Er1g1krEeOMWUKboAjynIQYq+Mvc8zCEN4zT
 HYaw==
X-Gm-Message-State: AOAM531ImRP0qFWqwpwOIxKZHCP0LTyVg3Bi41Q03CxomKt/53mqiZnl
 pkCgFbHvAg7D5D8ZtshaTCPEe/KQn/amOsmmHYdFsw==
X-Google-Smtp-Source: ABdhPJyzCtoZCWQXLBMoQHFq0yeImo8+v7uDBabSFRem0U8BZtJRrZeZx0XM0Nzsf68GTVAmITekH6Je6beL+74sQdY=
X-Received: by 2002:a25:2fc2:0:b0:647:dcee:b2dd with SMTP id
 v185-20020a252fc2000000b00647dceeb2ddmr13836812ybv.288.1651593586619; Tue, 03
 May 2022 08:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-11-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 16:59:35 +0100
Message-ID: <CAFEAcA_ktw_dR+KH_9h-7X1LqNpdHO_sCjoCuxSc-ps7ERDSWQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/45] target/arm: Drop always-true test in
 define_arm_vh_e2h_redirects_aliases
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

On Sun, 1 May 2022 at 07:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The new_key field is always non-zero -- drop the if.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> @@ -5933,19 +5935,16 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
>          g_assert(src_reg->opaque == NULL);
>
>          /* Create alias before redirection so we dup the right data. */
> -        if (a->new_key) {
> -            ARMCPRegInfo *new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
> -            uint32_t *new_key = g_memdup(&a->new_key, sizeof(uint32_t));
> -            bool ok;
> +        new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
> +        new_key = g_memdup(&a->new_key, sizeof(uint32_t));
>
> -            new_reg->name = a->new_name;
> -            new_reg->type |= ARM_CP_ALIAS;
> -            /* Remove PL1/PL0 access, leaving PL2/PL3 R/W in place.  */
> -            new_reg->access &= PL2_RW | PL3_RW;
> +        new_reg->name = a->new_name;
> +        new_reg->type |= ARM_CP_ALIAS;
> +        /* Remove PL1/PL0 access, leaving PL2/PL3 R/W in place.  */
> +        new_reg->access &= PL2_RW;

This has lost the "| PL3_RW" somehow.

>
> -            ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
> -            g_assert(ok);
> -        }
> +        ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
> +        g_assert(ok);

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

