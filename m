Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62C54ED643
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 10:52:08 +0200 (CEST)
Received: from localhost ([::1]:49172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqXH-00052U-O6
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 04:52:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZqTY-0002z8-Qe
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:48:16 -0400
Received: from [2607:f8b0:4864:20::b32] (port=39815
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZqTX-00089n-AB
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:48:16 -0400
Received: by mail-yb1-xb32.google.com with SMTP id t11so41155723ybi.6
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 01:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ZrNk0J43BCtudfjhSUyUxiqfmD77v8pmpBblyM6khA=;
 b=yzvhJMNzmUZyXkQsDtGVi2X3RO2NtDf0x3rmcyCNt19WyW0KaWCVQ+ZUbRoeuIr30K
 owCIhhI4JMojq8wVEDiIOyGDkcKKw4VfkQ2RFWI64EQx/GzHNCk0xyQWcKBsTlDJkywy
 BMqg9wbNvRg0LPza+tlKw8MxdJoGw8FrrO/u2JE5jbbZItYAENanx9gn/Z3R1qHueCMO
 3wGE0wA1iQb+mLN3eaC9cBU/7werOR2rfuHw2XLNEAUONY7A8Ddvx6weCs6AdyXwb4Xi
 0d8z91Qg9XmFlnCFatN5uG5japWk0K5UlwTKvRfXwFYJErnuA7TkNH0xkiLyO5kTRy8T
 ctTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ZrNk0J43BCtudfjhSUyUxiqfmD77v8pmpBblyM6khA=;
 b=wD751CfzoA16m9gj7S0yOkHhgsv5cgrXRtwEuB75a5tWuKPzTKmZQBdNunwgIRJTFE
 LyKRWGhosbqf8R412xe4GM6f4ZGYAWVwVQdLpuTdGBZYjvcWOOrnlUl9yA4CKZEhpXUI
 mcmVyjDWI3E6pFor5UNAZVs1f3T0hm5LoDxRyWq0Srbp9EBM588lBix7ucT0TWCCGOpY
 A8aYxeBZm1qlFo2rUZrE4YJeIxBkgBvVNtzCi4wHaDtUURu75mzdvqOilib865JI5SBG
 5sRiPyWCKd7mOez0GzVRSRSOLET97v3m4SdXe1KzFE5Gqd9GzHnd33jnZ6HplSbIJwlq
 7tdA==
X-Gm-Message-State: AOAM5301GM5GWYeisGNgOLKly9kQEdmHcyyr8HjeAPwc1s5mXrmw3l1R
 8VJEByc5hvrzLMILWCPEzbvcYWuZJokIRAvwFb9R3A==
X-Google-Smtp-Source: ABdhPJyNM8AHAKNOaleucpebWVRxkSx/2ON+Hrasphu1TQmG0YA++jKORfs63uiecAcquGqb86fCo6KuKTSkyAvuToM=
X-Received: by 2002:a05:6902:701:b0:638:9404:baff with SMTP id
 k1-20020a056902070100b006389404baffmr3345451ybt.479.1648716494291; Thu, 31
 Mar 2022 01:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220329234956.43558-1-richard.henderson@linaro.org>
In-Reply-To: <20220329234956.43558-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 09:48:03 +0100
Message-ID: <CAFEAcA8zbd-PgUXFHGooHvcrkxW+AAe5bxnWQigSf_5ia4Uz0w@mail.gmail.com>
Subject: Re: [PATCH for-7.0?] tcg/aarch64: Use 'ull' suffix to force 64-bit
 constant
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Mar 2022 at 00:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Typo used only 'ul' suffix, which is still 32-bits for windows host.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/947
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.c.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

This seems a safe fix, so I would put it in 7.0 at this point.

thanks
-- PMM

