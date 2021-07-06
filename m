Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F113BD7D8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 15:32:27 +0200 (CEST)
Received: from localhost ([::1]:38992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0lBb-0004uq-1N
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 09:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0l7X-0001LN-HR
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:28:15 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:37886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0l7V-0004UU-BX
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:28:15 -0400
Received: by mail-ed1-x534.google.com with SMTP id y40so12854820ede.4
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vQCG2ZwuHYOWFzJCHW9Je7k2DFJ9whQ7aysA7MIu8ik=;
 b=apFT4xoG+BK0dsLHCeVxJVxPED0PNhsuvd+Gjlk1dH5J58T74wgoAwElkvDrTZoi7F
 4uhb1kdlWuDf33fXBGqOzrLzqQ7fOQCGoT5rQxTbj6mNbRuwhmjuCBiAthLkJ0VvFRWM
 r+vTTOlzfsW5jr2EoTEwnVuV/iPqYh/hEqmwNmI4l3S0bsvS9XnEcc4qT7ay9XhuAUHb
 jQw2e8cs3UpeWDvX4CW9vr7+ltyjSqUydVUBSBd8ioOXOfj+lYzIj3wyfKVji66eS3YS
 /CcpNGmRcNAX9Acos+gMKEY2p5A5XucquVQXfB+M7DbUq5RsFkWF+j6SV2b6VIMU/fLc
 Wk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vQCG2ZwuHYOWFzJCHW9Je7k2DFJ9whQ7aysA7MIu8ik=;
 b=TMO5Fc9EmCm8H6VHPuiroNxtBFitrpYcg1PJ89WjorKaPnEP/E2NM5/xD9yuWTiibe
 wXSL8TkZrD4XgNkL6L60U9+nLlgx0gPG9VmuTT4XDprCChzI2ASJYC4CrqVOPhiHHlFl
 zoEeNKNBSyNNbPQumuAg+E0+diXCDQCoo+j7FQDYO2HaEK2AozTWKbCJpkdPoF1dwKWY
 5bRZwr8EclTc81e57YTmi/7aiHYkuo5HbMh+NRgJTi9fuwiO1TUzKLv6qtoxCbjSVgwe
 ScHkweYnEoHQ0tjnCe1tXPHX1yKBEYqvArBDmwchfStnQ0z1BrBUGXaeCnWDRdXIIHBk
 84Dw==
X-Gm-Message-State: AOAM533ksLYzAYDFXDQ7H9yUE+17a93nVi+LivSqXRXRCN5DdLGC7p9m
 ROC2A3BqUcV3prmG939YUfqafFBzU15FCc86fKqPlw==
X-Google-Smtp-Source: ABdhPJzrG5GxIeC8P/FMcjt1TVDPn9yLdvz9wc5LqpF3lJTR+pA/1A6QgFDj0I+h3wAaQ0o7rwiGApgM4vlw18Gjqhg=
X-Received: by 2002:a05:6402:1911:: with SMTP id
 e17mr22883440edz.36.1625578091760; 
 Tue, 06 Jul 2021 06:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
 <CAFEAcA-ZeKEMTp5X0VWXu+hip9ryzQLTLNwd_bsKQybyT_k7CQ@mail.gmail.com>
 <bbb32d79ed60fb90128b3662ec925f60ca258e8a.camel@linaro.org>
 <287eb50c0b99a3daec986ec29ede33cb2bdfd025.camel@linaro.org>
 <CAFEAcA-xC_v2z=QaD=_dkFWx2Hr+UFd0h_YTtSi6MNPhk6-Sbg@mail.gmail.com>
 <781518f186454dc31c97b34c088f89577fbb66ab.camel@linaro.org>
In-Reply-To: <781518f186454dc31c97b34c088f89577fbb66ab.camel@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jul 2021 14:27:33 +0100
Message-ID: <CAFEAcA-+JxmqNrOSaMsZCkwOsPQn6SUOO9a_bGhzGqCr9GUvJA@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Jul 2021 at 13:46, <shashi.mallela@linaro.org> wrote:
>
> On Tue, 2021-07-06 at 10:19 +0100, Peter Maydell wrote:
> > On Tue, 6 Jul 2021 at 04:25, <shashi.mallela@linaro.org> wrote:
> >
> > But the pseudocode for MAPTI does not say anywhere that we should
> > be checking the pIntID against any CPU's GICR_PROPBASER field.
> > It is checked only by the checks in LPIOutOfRange(), which tests:
> >  * is it larger than permitted by GICD_TYPER.IDbits
> >  * is it not in the LPI range and not 1023
> >
> > Checking whether the intID is too big and would cause us to index
> > off the end of the redistributor's configuration table should be done
> > later, only when the ITS actually sends the interrupt to a particular
> > redistributor, I think.
> >
> > (You can't rely on the guest having done the MAPC before the MAPTI;
> > and in any case the guest could choose to do a MAPC to a different
> > redistributor after it's done the MAPTI.)

> We already have the "intID too big check" in place within the
> redistributor processing when ITS sends the interrupt trigger.
> "the LPI range and not 1023" is also handled in this function,but for
> validating "is it larger than permitted by GICD_TYPER.IDbits",the
> source of GICD_TYPER.IDbits is GICR_PROPBASER because we pick up min of
> GICR_PROPBASER.IDbits and GICD_TYPER.IDBits.
>
> If we are to not use gicr_propbaser,then are we good to just accept the
> intID value here since we are validating the same during interrupt
> processing?

You should check the things the pseudocode says you should check.
When processing MAPTI, that's GICD_TYPER.IDbits. GICR_PROPBASER.IDbits
is not the same thing because the guest can set it to a smaller value.

thanks
-- PMM

