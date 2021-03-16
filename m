Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AB333D8F7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:18:57 +0100 (CET)
Received: from localhost ([::1]:42060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCPI-00083G-Sg
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMCMa-0006jN-Tv
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:16:09 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:41780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMCMX-0000hX-CO
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:16:08 -0400
Received: by mail-ed1-x533.google.com with SMTP id z1so22231273edb.8
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 09:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XU9TlxLhp01G0Y3Oy4/hNaIJ/CUvU8i6RMutZ7hVlKs=;
 b=Pc2uZi5mZ4001S95ZX3Up0KwYvwAO9rJADIt7YLqehZQQQw476vRQTgpKGnVKSJg0K
 Nj7aFcbAGggA8/3vtufw/N5kPisF9F+pVfryB4EeuOYDtMrWYueQrcMhUNn7cds9bzz/
 IxfHZ3RLQ+jAIsHPILUSL04mjxr6HsRGay8Rblm9DN8mBwlHXWVnfn2sYisOKpfI6Z2c
 wzTIMUZjdh1ymKk5sGbjILh9g9+TYjqQ9uG9q3nMNXgFmr9eyu8mo/KhCf+3G0PafwDf
 edKPl4NCu9e6Ovo5wg3qzTbMdIxZ0Yyoxa9bRVudS4zzrC6LAbI8vrR4/trQCZgse8VV
 1K4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XU9TlxLhp01G0Y3Oy4/hNaIJ/CUvU8i6RMutZ7hVlKs=;
 b=AatTbAHvf9p+GWmk4PHt/1hRwRf7O1U9pSW447tCd3EJbXQx4CohGIHu4/hm+pTjL8
 zdZ7KbeWNwOJEp58DBX4rvuqQK5kFbf7Tvj79HDOfsrF2OvimJJQVsJKNsnXMrSqs3bl
 mfgHWkdfoM3hJe5rmXli+dQLs/o7nUga45oANe8hF4nXoppmZH7PjnfD8blCAS9U61VI
 UaFScCZNQ7UJdnBmeO8aIbJx6MooG4Vzl8T9sPRilhrMz64Fq1zpP3NVXCpnvcWH2yqG
 koC0T6U1BmZjSFixoIsySCkZqdkTUMM1vmKWHBThTrL6VRGEnVQonQPxLlL570TJaIkv
 B3lg==
X-Gm-Message-State: AOAM533jKaiRwr610en5IV1kVJOg+3/uKY8KtPLBKq/S/ng+IAIaY62R
 kLiprq0+L2fmH6gAki1+It1M3FNJedaYv7PYlEkWIQ==
X-Google-Smtp-Source: ABdhPJyWtTxXlkUNx5XxL4Z/z/Smu3Y8BUDruYuJ0y4f/P3IPVkbkjGF9A7u5g45O1wkJpqbdklsArnXLutTf1pXtok=
X-Received: by 2002:aa7:d686:: with SMTP id d6mr37697060edr.146.1615911363493; 
 Tue, 16 Mar 2021 09:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210315164931.23477-1-shashi.mallela@linaro.org>
In-Reply-To: <20210315164931.23477-1-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Mar 2021 16:15:41 +0000
Message-ID: <CAFEAcA8q9sS-ob7XDKh62OX-R=5icXbhSTqD64KB-K+=yg2gOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/intc: GICv3 ITS implementation
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 at 16:49, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Implementation of Interrupt Translation Service which allows eventid
> from devices to be translated to physical LPI IntIds.Extended the
> redistributor functionality to process LPI Interrupts as well.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3.c                    |    6 +
>  hw/intc/arm_gicv3_common.c             |   20 +-
>  hw/intc/arm_gicv3_cpuif.c              |   15 +-
>  hw/intc/arm_gicv3_dist.c               |   22 +-
>  hw/intc/arm_gicv3_its.c                | 1386 ++++++++++++++++++++++++
>  hw/intc/arm_gicv3_its_common.c         |   17 +-
>  hw/intc/arm_gicv3_its_kvm.c            |    2 +-
>  hw/intc/arm_gicv3_redist.c             |  163 ++-
>  hw/intc/gicv3_internal.h               |  169 ++-
>  hw/intc/meson.build                    |    1 +
>  include/hw/intc/arm_gicv3_common.h     |   13 +
>  include/hw/intc/arm_gicv3_its_common.h |   12 +-
>  12 files changed, 1807 insertions(+), 19 deletions(-)
>  create mode 100644 hw/intc/arm_gicv3_its.c

Hi; thanks for posting this. Unfortuantely 1800 lines is much
too large a patch to be reviewable. Could you split the series
up into smaller pieces, please? One possible structure would be
to have a patch with the framework of the device but no actual
implementation of register behaviour or command handling,
followed by patches which add the behaviour piece by piece,
and then finally the patch adding it to the board.

I think it would also be useful to have the virt board
support, as a demonstration that the emulated ITS and
the KVM ITS have the same interface to the board code
and are basically drop-in-replacements.

Finally, for multi-patch series, please always send a cover letter
(the "0/5" email, which the other patch emails are followups to;
git format-patch should do this for you).

thanks
-- PMM

