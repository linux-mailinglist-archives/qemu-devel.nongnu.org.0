Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9175512F92
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:43:12 +0200 (CEST)
Received: from localhost ([::1]:60176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0g3-0005Is-KF
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0cI-0003dJ-4b
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:39:18 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:33431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0cG-0006oh-H1
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:39:17 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2f863469afbso22303717b3.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a/J1MLys9tDiAt4oRRVNvqQhqt31312LiWNP2kHFZDA=;
 b=H4g8piqr1vktDVcnFPsEMlLfekigKNCQwjrdhh2UjUNp67jSYiTsKkWOZdcIkZsYc9
 +xzUWm9Li4MfeDBV2i/+GCP5e7/8BihkcyATmwmHWvAgB4qHvlc413UGsK7Hqpt7FCMv
 Os7iYq+pFzhFLOriYP/oUwl1QcFAS2NtuJM+568g+1CyOcajzZ73Yg+gYFkZ5ZcrMKSh
 +4VY+2aZ87myKTKlye4GHRTUhowcdi6J0xV9M0h2CfYEW04CJ/JENTaRDYgQNq6Il0f5
 MLyUzjRRjl+WVANedFp1tKuuXFM4kHggc4SPkL40tefvzCXkYM4TllQA9kn8k3KoGAKK
 1CHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a/J1MLys9tDiAt4oRRVNvqQhqt31312LiWNP2kHFZDA=;
 b=etVr2ObqDsDY0iP6eHz2trf5bhKbtbGE6I46dsjXseM/km5awJqusn5fOg5/C3/q7O
 czZiiGkrJVERrnhm27KT4jh0a3AW8ckhc1AqXph54vgVVQdGQlQOA/eXy6N6gwWqgokz
 KZFtpoSwp2Sy8emxKUrUYaYIS1elu1NFTjtvdKiNrqSUkSb9quUMPvqXXJ939uzMtafZ
 Qkd3Aa6bAlrYKZIclH3Z3u2cyHNdw/fOk0OexbmZQpkpsg9YPNBdmDhUJk6U+/ujvimv
 L3frhCShjkn3Yd7mnX2qKRTcwIhect8c8YD55ny8Se8tAeivWqn36ZLHHKXpZdtjk8Dt
 Jr0Q==
X-Gm-Message-State: AOAM533aaRDY0mLX7X6Bu5hD7Ubi32+KRxzAPr2uFGzKay4yfdqk+OMa
 0xwWU2poYJAWA3b727uRIuUu5rPrxJECPeM6mnHFKA==
X-Google-Smtp-Source: ABdhPJzblaoZSkr4Y6BwBdSnPENgYorWVrck7CL69WJ78i92zJuAS0Cppyd+EBxWIynkvCnqml/0IeRirFyEFY8fQb8=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr31605019ywj.329.1651138755749; Thu, 28
 Apr 2022 02:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-5-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:39:04 +0100
Message-ID: <CAFEAcA9RTEbFODhgmLvgfrt9oWu4DGYBPfXAQeFpLbk+P_z=5Q@mail.gmail.com>
Subject: Re: [PATCH 04/47] target/arm: Use tcg_constant in gen_adc_CC
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Note that tmp was doing double-duty as zero
> and then later as a temporary in its own right.
> Split the use of 0 to a new variable 'zero'.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

