Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8A43A7889
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 09:53:28 +0200 (CEST)
Received: from localhost ([::1]:38530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3t1-0004Lv-Az
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 03:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt3qN-0001SC-9E; Tue, 15 Jun 2021 03:50:44 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:45993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt3qL-0000NO-82; Tue, 15 Jun 2021 03:50:43 -0400
Received: by mail-il1-x12c.google.com with SMTP id b5so14478858ilc.12;
 Tue, 15 Jun 2021 00:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ggyYiI42YeOFm1U/6uM+KysWQEXe86JOWUUnEO6Ovng=;
 b=VNjgj/UXt90kWlVQWR6WGixTkkFkeiaYXJS7SSCyJljmkWDLRp8Kukc43u9rmqZurY
 JIcZuChgkq0fX3T39gg7UA4SSteLkR7WM10xc2/891u1fTS1ZeSXlGY6ElSwhl1aDvHG
 O8TA7AjRK74gqh9U1A1TgdbuRumfKUwCqxHfbIJFfMG0tkR5T1P/7ocgPCDn6K27E6go
 sra0A9e0WYy0J/gwMmNFoLMLiCezjDafC84MylUEpTPVn8AVErhQZXFVpBhJahzKY+uh
 5hd3CoDA5aMQ8I6rlaoG3ivbpHv/j0vMAdtS9XIJoSaV6fV7QEgovHETW1iqoRQ5FddH
 kXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ggyYiI42YeOFm1U/6uM+KysWQEXe86JOWUUnEO6Ovng=;
 b=cux+dDsGP85Iy3sTU7FWlgeqT90UUc8uKGWpjZd0qOvsx3T3RHZgovGfXjIbMmP9hs
 IHGrVfeLKW+VUPJl7JMHmLQ9qZDtiGz0RU5UjVfRLPmSmZ/ZpHzYTgZ/oRWvsNsIsZ3C
 p8gxWPOakc3htM0urP3Pk2WsBSvkU1aYO8BWxnPwC4huwN2KM2S4cLJAjf+eIQUkvkXf
 oihgYuF7dQifp1V9Q6i0nTlZE7Pe7BiyyowKUC6A4jIVebiYBpl6cf9R9R9t9SymQYFZ
 LvLGfspjXNfDPlV0HqwPAbLg7g+5mIjHBzpyY0UeYmX8qAiKVrshrhbERmPNx2loj6qn
 hTgA==
X-Gm-Message-State: AOAM531fULbT6B+KKDciWjeeIvmw+nJAHfM9KdBcap2A4O+jFRf/Hu+O
 XhLW+PzB+U/+fAPRXjkOQNqeSKlSkRvkfrFHnso=
X-Google-Smtp-Source: ABdhPJxZYb8ZWjMf9GjelN0kT4KzLJMlHm8z7f3uZz/2ZAaLQWlXhtS0/zdYbhrezr0puyLuEixatzGPIw9N32HMoaM=
X-Received: by 2002:a05:6e02:dc7:: with SMTP id
 l7mr16626770ilj.40.1623743439737; 
 Tue, 15 Jun 2021 00:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-3-erdnaxe@crans.org>
 <CAFEAcA9EEOg92Vz3ZiyV3XeWXn8PV=sGm7wiaqoj==K6PoPM-w@mail.gmail.com>
 <4fdbc225-3c4a-ba38-2fa6-5a031e6a1845@crans.org>
In-Reply-To: <4fdbc225-3c4a-ba38-2fa6-5a031e6a1845@crans.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Jun 2021 17:50:13 +1000
Message-ID: <CAKmqyKM6sA0O7rmr-Mt=_JS34UGwD5jfmAhgi9MOfs3b3+2atA@mail.gmail.com>
Subject: Re: [PATCH 2/2] stm32vldiscovery: Add the STM32VLDISCOVERY Machine
To: Alexandre IOOSS <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:STM32F100" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 15, 2021 at 5:17 PM Alexandre IOOSS <erdnaxe@crans.org> wrote:
>
> On 6/14/21 5:52 PM, Peter Maydell wrote:
> > On Tue, 8 Jun 2021 at 17:10, Alexandre Iooss <erdnaxe@crans.org> wrote:
> >>
> >> This is a Cortex-M3 based machine. Information can be found at:
> >> https://www.st.com/en/evaluation-tools/stm32vldiscovery.html
> >>
> >> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
> >
> > The commit message says this is Cortex-M3 based, but the
> > code gives it a Cortex-M4. Which is correct?
>
> This is an typo. The board is Cortex-M3 so I will fix the machine code
> in next version of this patchset.
>
> >> ---
> >>   MAINTAINERS                             |  6 +++
> >>   default-configs/devices/arm-softmmu.mak |  1 +
> >>   hw/arm/Kconfig                          |  4 ++
> >>   hw/arm/meson.build                      |  1 +
> >>   hw/arm/stm32vldiscovery.c               | 66 +++++++++++++++++++++++++
> >>   5 files changed, 78 insertions(+)
> >>   create mode 100644 hw/arm/stm32vldiscovery.c
> >
> > Could you add some documentation for the new board, please?
> > This lives in docs/system/arm. Commit c9f8511ea8d2b807 gives
> > an example of adding docs for a board.
> >
> > thanks
> > -- PMM
> >
>
> Should I rather:
> 1. Add `docs/system/arm/stm32vldiscovery.rst` to document only this new
> machine?
> 2. Add `docs/system/arm/stm32discovery.rst` to document this new machine
> and future STM32 Discovery boards?
> 3. Add `docs/system/arm/stm32.rst` to document all STM32-based boards?
>
> STM32 boards share a lot in common so I believe option 3 is more
> appropriate, what is your opinion?
> If we go with option 3, I can also try to document the Netduino Plus 2
> (maybe in another commit, or another patchset later).

Looking at the existing `nuvoton.rst` file I would say option 3 is the
best bet here.

Alistair

>
> Thanks,
> -- Alexandre
>

