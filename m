Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F31B530EBB
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 14:54:50 +0200 (CEST)
Received: from localhost ([::1]:54280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt7aB-00011s-IB
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 08:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt7Vw-0007Ih-Cm
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:50:24 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:36240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt7Vu-0000ih-SD
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:50:24 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2fee9fe48c2so146910757b3.3
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 05:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PgxVeUuGk6ylF1oYes5stwEMPPvFJcZqB+IRErCvQH4=;
 b=RYYU4Ho78D4z+fu9pMbeglYytFz5vaJ9YokUFVbWfhk573qMI9NoF++fRVtLD6+pq7
 +39hVNvvB3DTvRDv2FU5yCswID7iVh/aAqTf+G+TLTXaAwbnEy0oIyKVy/ujAP877K0K
 02CPjxdMkIKUNMMXT0msiTfnJIFWfNiLBMs72X23BhTT9dmzgYBZAnmvYvVaMtTmLWSl
 Q+ywq1JkTAD13AkHwcnTQTvXlYo6WGdbp1fGgZtgSXFLbM4fODpK9IN0BN3u1kK3wf1R
 VcLm2LUh3shieYu53bKSohCPs8GN4LH2dGiH2GKUXSDCsQ003Wbi3L+dL3PlSY78ldDI
 wUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PgxVeUuGk6ylF1oYes5stwEMPPvFJcZqB+IRErCvQH4=;
 b=4zFQ3UoXp9phwbYSUiZMnUHSA950zWtq9ufld0WyQX0WgEeg9gUxi6XVnxV7Zl0Auj
 FCqTEE2syxSqwqLktbw2xKkSOJWqnv97FubPHlSybLyliG+y2lqIVVzyaiDnlwZ9I6Wu
 n5FbaST2FxYOzDxHiG1Uwi3NjAHmwXLhwsMhKOwyZEiF9RUDMXJd+YzoARjwsNWkn/Vm
 nusc6h5lhzZsNvTInGzOqNWxmnhF7f8kQSj/faOM27giw13okUKTkhci+veIeD4VI5X6
 tRPfAQ8D3/aTcK9K5bMPzMizptWyoo9HkXZM/vSXC8HF6CxUpr+SNzFvcyrFMmAaulXG
 zkZQ==
X-Gm-Message-State: AOAM530dIeu1WMgda7/g7nYiSNl+RAoLK0ln1HR0kkQgpACUEHYbMCJ7
 Z+KbxhcZ2xTL4cwcGNLFjqucaW8x+mXxjCetkRNrquEnp7E=
X-Google-Smtp-Source: ABdhPJyPQnz1cSfHEXtYswUB41mpQhl+uDkF10ZRIUg2XNhFzVsApIoUXF4JfYMuRfXiiTHqoq0p1P3ac3iqJk0R1Ds=
X-Received: by 2002:a0d:caca:0:b0:2ff:47bc:ed48 with SMTP id
 m193-20020a0dcaca000000b002ff47bced48mr22673873ywd.64.1653310221774; Mon, 23
 May 2022 05:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-20-richard.henderson@linaro.org>
In-Reply-To: <20220521000400.454525-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 13:50:10 +0100
Message-ID: <CAFEAcA9-DbF2Kk3oi_cwfLqxzcGOV=yr7QcB2=qBA0voDFDaWA@mail.gmail.com>
Subject: Re: [PATCH v3 19/49] semihosting: Split common_semi_flen_buf per
 target
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 21 May 2022 at 01:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We already have some larger ifdef blocks for ARM and RISCV;
> split out common_semi_stack_bottom per target.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  semihosting/arm-compat-semi.c | 44 +++++++++++++++++------------------
>  1 file changed, 21 insertions(+), 23 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

