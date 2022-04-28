Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0B4512F83
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:39:14 +0200 (CEST)
Received: from localhost ([::1]:55234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0cE-0001pW-2J
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0aB-0007xv-NJ
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:37:07 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:46648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0aA-0006Yp-7H
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:37:07 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id i38so7909221ybj.13
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/U8Y+5VJQJlv/bkcVEgTJN9v3lp9VOytkHG7POenUYs=;
 b=ntottCfCJHAQn/T2u1UePoZ+0mFyyZBRnTz/YBr9ywXCihx3279+yl/cghJ/7PFDZf
 jHu0X+GNTZnLAhVmCgId3z8T6m2dkRnPvtTLEqtowYY91CWZCwTVw3CFPIolwjH/8N9a
 ttlfPjjxWPFdnh3x2vl2WAnAq9glOCJRlcY8Ad7sR4yQP7uOiCFxNAhUjr/MHtQbV7HB
 UcTQ5KJgq8qvrVB5rWqXYsTS4qQqr+LGpwI4VwRkdiBwAiM0Ekb29WJcD9YjNj4IS2MN
 PUmIqiipzE7zJ6eWDG5Sif9RQR6wzuaD7t1JDax9ooWQiVJ16yh4/FeuLg3XW0nLhax0
 CYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/U8Y+5VJQJlv/bkcVEgTJN9v3lp9VOytkHG7POenUYs=;
 b=U6TTD/8jtFfIwosS03LmWh45EufTZernDc6Q0ZcBqjjDkIjwsdYRJ2YW453cBf/CBR
 fx0Ag4BvWWtAZHqrK1lJMn81oYzfZmqHJvQGDXuzHEbW6ybNwFTZqoOMHhlSfofUO/v9
 vQY8pHTtfepaIeGS8WTlS6xBzCmRd3E82G1+bTh0QKXSTehaA92R/HLQrRGPVx7h1qxx
 03xxaGlLiNUAApCP3CtpLgFSRoMtqjVnbor4J0HRT2PS2dVE0xgqSSDhhG3NjGK0Z7iW
 BpuE2SYQB8Nwbr4zlrsiAaaZ4bNWDFCmyZ6IWSxBIvueUSn41VZUl+KxZHWeeb2N2026
 aHaQ==
X-Gm-Message-State: AOAM533IZJYfeH0jpPUPRAbvrDWouHOe6U4CXG1rXdCG5EbZppovBUcl
 qPEo+z62hdZE9DG7clCr9leXXs2dOkJcXWoZwri2Cg==
X-Google-Smtp-Source: ABdhPJx0PR/iZIEGthaLu/fi6+1FAhspn/yMJR6Wwc0MsszPW19z4Lj2XOsYoyHQ/5dYcWZz4lntOrC9gEki3+Pewsw=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr28693339ybg.140.1651138625283; Thu, 28
 Apr 2022 02:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-3-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:36:54 +0100
Message-ID: <CAFEAcA-cSWRezf2G3AL3C+b1D3y8GBOn7Fm-FLHzm_xiGKO44g@mail.gmail.com>
Subject: Re: [PATCH 02/47] target/arm: Use tcg_constant in gen_mte_check*
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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

On Tue, 26 Apr 2022 at 17:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

