Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAA6595EFD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 17:26:23 +0200 (CEST)
Received: from localhost ([::1]:36682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNySU-0001ye-Lp
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 11:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oNyQb-0000Nm-SG; Tue, 16 Aug 2022 11:24:25 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:45626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oNyQa-0006hw-78; Tue, 16 Aug 2022 11:24:25 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3246910dac3so159989517b3.12; 
 Tue, 16 Aug 2022 08:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ZguFav5ekM6VlKBCGI2UWwo0tGYpYrlF1/LFU6kbEYQ=;
 b=huwxI4e1W/i3cMugdGvymjKJaucGJTp0DZbmBExXpX+dK56mPvZwl2lKO9AFRRV2Ay
 GqFbKzHL+H1mb95odIV8UCHTymOP1R/yEJRbi6R3C+D8MGNLjHTAvMxNDBI1OoCqjpzw
 9gyiKhC7u61CdH9ESYxitxF//pnr3FJZnMo2x0VrRjBeMPvpprtqPjfTLMiuN6P/qwDy
 69jMrNBIualbOrL/6lLq3TjYqL2y2S6jmbXRRfqXZV0Ja+pk3XKWE9+YTOjaKJM+ZK9s
 Uv2JVXfEiKSMNOdjPgbSbMkYWoZ9W34upi+fDreJ2oOc+BS8e3GGssvYDKIwtaWLJZzE
 9Fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ZguFav5ekM6VlKBCGI2UWwo0tGYpYrlF1/LFU6kbEYQ=;
 b=8RNS2fL+qOTim06qglPdp5pb8lqv9mP51T0EYlx7AeUfS3VXSgG/BLo+UL2+/Pn+4G
 buao/HHeepbrVW6qFlvadIw+G+ERITQraAc7bK1ni7U4Dt1rV2ZLBhNXGWUT/C9D1QY7
 pu7LTRxA6cvrCXcQmDgmeK1eHyN48JmEkwmufyobXXphNY8BJcdt8BEkw2kKAPsfObuT
 032CUX/WkVVDFiMuhoR5pua5X8tEmy9XcoSMw4ORqUFVoHWngbqyPP/Rs19IGxx+p5ll
 ofXSMIlhj/8MO1ziaK+I51HpL1rZsa77p8j6LY3APHSWNKnvpGo9YSb4wdr34YRIvPEH
 xpSA==
X-Gm-Message-State: ACgBeo1hviX2TcfrmajLmGK+SsXxKZHO2C7JKZcD8yFEZFjxRBH2JisH
 zp7nIzIyGkevbK9/Ggqfbnp6xEPRCMhHatlhKWmoiOdX4JHqkw==
X-Google-Smtp-Source: AA6agR5MBAhJGyxMWHmvm6NjCjFefblZ4SV9T6iY587t1RP7oZd5e+y4dqBG5wmImsNaDzKZ0gYq9VWJxHKikOpspyg=
X-Received: by 2002:a25:ed0a:0:b0:68e:ad45:6db4 with SMTP id
 k10-20020a25ed0a000000b0068ead456db4mr1753377ybh.118.1660663462178; Tue, 16
 Aug 2022 08:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
 <20220811153739.3079672-2-fanjinhao21s@ict.ac.cn>
In-Reply-To: <20220811153739.3079672-2-fanjinhao21s@ict.ac.cn>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 16 Aug 2022 11:24:10 -0400
Message-ID: <CAJSP0QWriGrzJAU7cgwRRt+5hhGNuajBKe6O=6i14g9Egmh1uw@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/nvme: avoid unnecessary call to irq (de)assertion
 functions
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, its@irrelevant.dk, kbusch@kernel.org, 
 "open list:nvme" <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, 11 Aug 2022 at 11:38, Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:
>
> nvme_irq_assert() only does useful work when cq->irq_enabled is true.
> nvme_irq_deassert() only works for pin-based interrupts. Avoid calls
> into these functions if we are sure they will not do useful work.
>
> This will be most useful when we use eventfd to send interrupts. We
> can avoid the unnecessary overhead of signalling eventfd.
>
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
>  hw/nvme/ctrl.c | 40 ++++++++++++++++++++++------------------
>  1 file changed, 22 insertions(+), 18 deletions(-)

There is code duplication and nvme_irq_assert/deassert() check
->irq_enabled and msix_enabled() again.

Can the logic be moved into assert()/deassert() so callers don't need
to duplicate the checks?

(I assume the optimization is that eventfd syscalls are avoided, not
that the function call is avoided.)

Stefan

