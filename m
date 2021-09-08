Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB384033B5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 07:23:01 +0200 (CEST)
Received: from localhost ([::1]:49004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNq32-000723-Hq
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 01:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNq1K-0006JH-8x
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:21:14 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:41553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNq1H-0000Qe-BG
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:21:13 -0400
Received: by mail-yb1-xb33.google.com with SMTP id z18so1761461ybg.8
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 22:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RoXQEDI2oNm7lizFkynUM+HDyqSm6omralTh3GyxQLc=;
 b=VSU4egcITr78KwhhHE0ezfAVaEDgzJlzvPeGTVLZrtfKtoECwQBM2QGAW0+XfanhXs
 d/AktK9hRBqleO7xa+plkNKtyhglZQafvzFC7oCLZbD2PyfKgbY+2TKcUIS33yxVwOIC
 FDpFtTMfAFfGqC3m19cj4f2njvL157JPHSpf3IFU++KNLsoIhv+nXXy2GhgbDPUpwFyo
 aXstX8DRKtfsY8DWduezSHb8JSkUTOaIu3HWkn/7EPadHMj9M9h49XS9d1nW5QPCW3X9
 bcwkF0L6/kwj1LpGN33NyoQ+ggbyt6MseFur2mHaEB9m1sLdG4pdZlKzO3y4feXg+nub
 qZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RoXQEDI2oNm7lizFkynUM+HDyqSm6omralTh3GyxQLc=;
 b=rybiyDE/XrgmA83+PzJVnmEMuvtG2dYBqcvgw0f0B9Qp6OqBGlxAoUW55OQZIqWZSS
 DxZlYmuRcVd8mHozkNRVtG3w7G+aTKX58lqpOOeVWB0v7xySkmDM+R4szCWFPx29SuVX
 2Tf/OYW8lvVTXcH73YOkDzz3eKfgGSN/2xZR2n4RmiN3lwtq06fZkRyWY4FdzgiFq2aX
 xRSZoGXuISprMmvUD4WOuB6PLc0nRwq1ThXphvmBr0VUew5QwmdKBU8RBtr6cV5vFdsu
 kziFoS1yxDaE6o0g3GXIck0bz/P+660TpN7GCSicHoWXrJOTpqFhTWtwvOBGstH3knac
 Q/oQ==
X-Gm-Message-State: AOAM531iEO0ChDq7Wdnti8FT3WtMKyM90/JKpqlsVnW3yVNEdcj2G9xJ
 7/hQLVTJmQuF4JzhHFSggf8zFGwd33vi8c56EHQ=
X-Google-Smtp-Source: ABdhPJwyYQlxPZ6ulg2R7SK2hUieVCvY135fb4+MaXiUM8TE4ip+no8LLCIbMmUxrX9V1JeuFFZgzpeNO0kIS3Nu1VY=
X-Received: by 2002:a25:5956:: with SMTP id n83mr2550200ybb.109.1631078470327; 
 Tue, 07 Sep 2021 22:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-8-philipp.tomsich@vrull.eu>
In-Reply-To: <20210904203516.2570119-8-philipp.tomsich@vrull.eu>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Sep 2021 13:21:00 +0800
Message-ID: <CAEUhbmVnOdkEAHGP92wBQAyEKjyNafxLZ=s_fvp+obZKmjYWLQ@mail.gmail.com>
Subject: Re: [PATCH v10 07/16] target/riscv: Remove shift-one instructions
 (proposed Zbo in pre-0.93 draft-B)
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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

On Sun, Sep 5, 2021 at 4:40 AM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> The Zb[abcs] ratification package does not include the proposed
> shift-one instructions. There currently is no clear plan to whether
> these (or variants of them) will be ratified as Zbo (or a different
> extension) or what the timeframe for such a decision could be.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Remove shift-one instructions in a separate commit.
>
>  target/riscv/insn32.decode              |  8 ---
>  target/riscv/insn_trans/trans_rvb.c.inc | 70 -------------------------
>  2 files changed, 78 deletions(-)
>

Acked-by: Bin Meng <bmeng.cn@gmail.com>

