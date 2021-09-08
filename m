Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CF14033B7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 07:24:22 +0200 (CEST)
Received: from localhost ([::1]:51988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNq4L-0000c1-FW
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 01:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNq36-0007dX-Ci
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:23:04 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:46726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNq35-00024q-1j
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:23:04 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id k65so1741195yba.13
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 22:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N0HXXyRl2B9yvGroDRenrHBiXEuuH890xsBIFzf87w8=;
 b=SSvZ+pqvxwKALq614Kq0XUppfS7r9hOjZRHIf6efth2xIMbylevfx78ldbOUlBcrM3
 hT8kjecKE3boA6oioROZoww8Qi+wk0yqKoGoqlAEZMHS7Ys9Ic/2E7g4msb6uUl9GZeM
 De6faPmBiC0TNjFQIuRTQiTt6AIVbLv225GCQWBCzVvjiEbU5hfLfkLZfxDvT+Z87mWt
 HlPlwBi6gW/1cEWweLZB5J/UydZJIAqhcs7VcR5r6u5ugnsMw2ZLsRNygIS5kW0vY7LI
 pmgMZXzlVJ9Xpn3RlMUrwGzhKK1S7QpT8LAYmNJLHYG7HU+eWeQpLHdqj40shg1F4Khv
 lwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N0HXXyRl2B9yvGroDRenrHBiXEuuH890xsBIFzf87w8=;
 b=Gk1msDyQ3M7ceSCLu/+V0jnwHPWf6bdZ9wv9ezn3E+RCIXUfv15eDb5MONAjvQOBCt
 0MCJwf4GVUiXyDqUTXFF3c/p6dHvHoRwkQFrc13KcwxaIAz0fcaMw7CZ9oYpEw6Ep/LU
 Rt8CwEIZElnhWVfPIMr6bZJGXcyv6QHGE5eq2Yaun7dejdlOCXbbLKmf2EdqdS+83yov
 goUlPqPjXA0ISE/jXoTyrS+BB8C00+BsV0SI22Z1P3GEQmbbN4nnCADPBskbaFzVgX9k
 1skqdyGoP1fEBEN/KNRQhE6BuCk/RKz5t1bhH62GEsrrOHC+XgyEInwW+xWg3oMqaIsD
 sv1w==
X-Gm-Message-State: AOAM531n8n1y0RQYgYK9zmh3Thx4BmETw1BUtD1itqNP8MHG4/2FylC7
 SoHCxvJ6wZ9LFT+g5IpQreR2fTmH+rPPCY/b72I=
X-Google-Smtp-Source: ABdhPJxX/4WSbTuYMMr7HJIqO+48Gd+EfDwHwwR4usUMVGeg4ajMPfb6gCyTVIDRUO212ld2g6CzbY4aHvyEg0PgI8w=
X-Received: by 2002:a25:1b89:: with SMTP id b131mr2796384ybb.40.1631078582185; 
 Tue, 07 Sep 2021 22:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-9-philipp.tomsich@vrull.eu>
In-Reply-To: <20210904203516.2570119-9-philipp.tomsich@vrull.eu>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Sep 2021 13:22:52 +0800
Message-ID: <CAEUhbmXpbTmoRw11Xorn5UaSw=r-DK-oS_b+g=WueTeo+MN9gQ@mail.gmail.com>
Subject: Re: [PATCH v10 08/16] target/riscv: Reassign instructions to the
 Zbs-extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 5, 2021 at 4:43 AM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> The following instructions are part of Zbs:
>  - b{set,clr,ext,inv}
>  - b{set,clr,ext,inv}i
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> - The changes to the Zbs instructions (i.e. the REQUIRE_ZBS macro) and
>   its use for qualifying the Zba instructions) are moved into a
>   separate commit.
>
>  target/riscv/insn32.decode              | 17 +++++++++--------
>  target/riscv/insn_trans/trans_rvb.c.inc | 25 +++++++++++++++----------
>  2 files changed, 24 insertions(+), 18 deletions(-)
>

Acked-by: Bin Meng <bmeng.cn@gmail.com>

