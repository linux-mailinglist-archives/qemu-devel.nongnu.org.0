Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC0D2B2DF1
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 16:26:51 +0100 (CET)
Received: from localhost ([::1]:51110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdxRy-0002SJ-AM
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 10:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdxQZ-0001Zx-Q8
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 10:25:23 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:37214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdxQW-0001gG-27
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 10:25:22 -0500
Received: by mail-ej1-x631.google.com with SMTP id f20so18147199ejz.4
 for <qemu-devel@nongnu.org>; Sat, 14 Nov 2020 07:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D18LXjpbq8NK27JyVJRex389IDyb7gZtOYO1sFFOk/c=;
 b=DkrMH9ApqMlnVdJcT9wLaBr+jYYvvbfIzRJWy2ArXQxbXQ02tZ9ctmle5vBdoR8Vxv
 6PID7n36nH2c+46AO/euSGAlofL7iQyjRTLZ9NJ7NPls+T+X9O9fQGeyXfqwmN/Pd2RF
 RkHvIUEedmumrlyO1CGYrgwA65H9J7wmtvS2tu4NqOAj8xAOSziJUKApwfWplEpGnjqO
 htnbXqjj9aUhlS8eKcTggxvap4pCCR0fV0jUL/3ns4JhJ8wJNja/TaUqxx6N/pXEtoIh
 YrD6B/Sdd3hFv3/a9EUN53Ub+sbqeSj5jPtJHdYmBvP78M68jHHDX4EBVUyECK8P3kyb
 SJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D18LXjpbq8NK27JyVJRex389IDyb7gZtOYO1sFFOk/c=;
 b=kK3BmINJ4L87U6rnFNNauV7QNDOhsVsJXAZQojHLwJZ5SJQdnB77WqVix5iUC/HGOe
 3gKT87AvSoPHoJRRr4u+3ouQT3roD9FiyuNpcqQbNeHLnLYz3KpOabUp8ywn7B0TSulH
 JC0ZeVV/WMLsDXdRRzDS9+3qTSL1bqLoiLo3r6JsnoT4xW2BP4F9UN3T1Hi/pWmxbkUQ
 dezSLOzB2PWG+BbsG2rLkv6fD/l01k9yHIeaoGQfve1nkIA94gVVgL0AzsqkC+THlV6j
 QZSXuFyyeB1V/L38bxI6ljcKJn+Q6hraLbkyLhAgMVWtEpNwma/K56e5yDo9hxcX+3/9
 xwyw==
X-Gm-Message-State: AOAM533fzwtjV0jPyueuHvHVnCvlSRNIjvmyb4V8MX0gOQ16g58LFpvm
 sEKSOQQmtV72toXUSVcG6GMG64fGR0s95Oz+MZTQ4Q==
X-Google-Smtp-Source: ABdhPJyqofIyoDI7/z0841BIx+qJwbOEscgGt38m7pmoFIxaxQ1BORJ+n0KA6o0e3+hlAqZ/wWP9X6iGG+njGaDkDC0=
X-Received: by 2002:a17:906:5a88:: with SMTP id
 l8mr6763021ejq.407.1605367517411; 
 Sat, 14 Nov 2020 07:25:17 -0800 (PST)
MIME-Version: 1.0
References: <20201114054509.180352-1-alistair.francis@wdc.com>
In-Reply-To: <20201114054509.180352-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 14 Nov 2020 15:25:06 +0000
Message-ID: <CAFEAcA9nwYWNWVZ7Mn7K6rhyJhadukU2CnmZzWwMKnz+yqy8Bg@mail.gmail.com>
Subject: Re: [PULL 0/2] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair23@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 14 Nov 2020 at 05:56, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit 5ececc3a0b0086c6168e12f4d032809477b30fe5:
>
>   Merge remote-tracking branch 'remotes/dgilbert/tags/pull-hmp-20201113' into staging (2020-11-13 13:40:23 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20201113-1
>
> for you to fetch changes up to deef3d2568a7fbaa62d9bee07708cf3a4dc3ac53:
>
>   intc/ibex_plic: Ensure we don't loose interrupts (2020-11-13 21:43:48 -0800)
>
> ----------------------------------------------------------------
> Two small additional fixes for the Ibex PLIC.
>
> ----------------------------------------------------------------
> Alistair Francis (2):
>       intc/ibex_plic: Fix some typos in the comments
>       intc/ibex_plic: Ensure we don't loose interrupts


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

