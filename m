Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93FC50B46C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:51:22 +0200 (CEST)
Received: from localhost ([::1]:39598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhpwg-00006L-2I
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpkQ-0006op-Ma
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:38:42 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:34677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpkO-0007KS-6g
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:38:42 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2f18982c255so79509477b3.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 02:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+CP6keH7/+9xKiUbRH0Lx60A8S1DsT9zTHXVPKGIe3U=;
 b=y56ZXQU3/5nUjUUDMhMP9YPPJfGAIxvy5dLLYtLuA0VI9es03DIIFxFANqvYDR1xum
 CkaPzP8cVPzqjyVb2Cd5DrY0Hw6EdEGQVpkzm2Kl0yGGEQt4XbGNTHKitIbz3mzv/ctl
 ClsL0LSRjg40ynKCkD+AAHGuWLpb+yuB2onGlJy/L6q+ytynMO/uLYMXQnspWzzmhxJX
 7/j4C1PVkrUDX1ch10nIrjXTHQWUuzQGRp6y8KHThCo8TQnxhH7LmKNXphRczIhBEXvf
 TJ6nZgj3NanHUyYwodq8wv7RMtkTHyq9zhC+kDcDAdBvf9icPdmaHQIQ6WggjVRseb2X
 3adw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+CP6keH7/+9xKiUbRH0Lx60A8S1DsT9zTHXVPKGIe3U=;
 b=0QVriht/aPMiLaRomOREsJT8NtRtp1gU8I9rH7GjRfhlkr5pehys7F2r4m2LsSGIu/
 FMXCA1Hk2zb4YmUNiTeetOIiuJ0RyE4Xgpb9XiKwKPY8Fm2wXfONuJGDaRdDfXSvT1ya
 M9yvdsdHzTzJPIYHX7R0oCQ6aGXeWacRcsv0aT4ky5cqhJwP+Fx4FNcW55uKcUvgIAjc
 B6IBTYhFpcyHz24VOO6E0oUFA0tNpL9AWUBq9ivzxzwW8syFisNZr6cG99ZeHIeDJym/
 15kj7NSKQijeUqjjHdwpPItgPbHouJ6I3XMfXDecREPeuRJTDqr8OVKZZM56j6vz9UDQ
 JuXw==
X-Gm-Message-State: AOAM533B+luSYGYet9b/dGFKEOweq3ACAYtX9FyJfiWLa5B8T7bcIJoo
 /6iBwyUT7GLoj2eJQvwem0cp0fTG3fnw3Kkpleekmg==
X-Google-Smtp-Source: ABdhPJz8ZtXTXg5qtjZRR2PfEgD+za9ArnkBJe9Goq/5nXbBssFJpqFL7Athqutliw9pIT/dva/PzC2MVdxZLm4I494=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr3783753ywj.329.1650620319315; Fri, 22
 Apr 2022 02:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-28-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 10:38:28 +0100
Message-ID: <CAFEAcA-Vi6ugRvve7yE0TLOVuPgxX-PaXGNC9GX8=tSSs44bFQ@mail.gmail.com>
Subject: Re: [PATCH v3 27/60] target/arm: Make some more cpreg data static
 const
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Sun, 17 Apr 2022 at 19:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These particular data structures are not modified at runtime.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

