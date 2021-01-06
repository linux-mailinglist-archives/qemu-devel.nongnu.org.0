Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6B72EB6C5
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 01:23:56 +0100 (CET)
Received: from localhost ([::1]:47540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwwcE-0004Yy-Vo
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 19:23:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwwap-00040X-23; Tue, 05 Jan 2021 19:22:27 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:45945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwwan-0006bK-Hc; Tue, 05 Jan 2021 19:22:26 -0500
Received: by mail-yb1-xb32.google.com with SMTP id k78so1184396ybf.12;
 Tue, 05 Jan 2021 16:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7ugd7YDudYddqLGIcukv+gM9J30wg5E9OZ3wbdwxrsY=;
 b=FfKeffQDpZPWbJfr0KuqD1NithrQo/98z99aZesAW9ufKAGlxSWT5LRVSR7NEITGLJ
 J6SlIOgw9eaAHSrmsHvR0SsIStaFOlZwN6m+mEqZaIvUp8cXxHvxeOR2XiPFL7GbdMDA
 5G20xwWdDSl6eqSFl7sRhdhs24Uhnv4iGc4dyO64ExtW8xHPknSMxCGTqXgN3tjGaI5i
 62JwwajDpYcRD5mu+B2oiDFA/AUEu1JwKp/+9XJdAURBQ72uBWAc5V/RJMQtZH1YZFTr
 cAxfruD5MGY9NCgMg/n4aIDppRiTuviSL7bhTG4j5zML0JYUDBbIaB7wzlRfM+Ylx/ot
 saAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7ugd7YDudYddqLGIcukv+gM9J30wg5E9OZ3wbdwxrsY=;
 b=eS9l4uxrDVU/t6z6XU8CReaQdhlUJsRT44x9q4vzZ20EOoUjY4QPuZDZyz5xPXJVsY
 Tj8qyVuAX/+Ig9j0N5yGv4BtkgaiS2kMTauL3N3Jusj70qJAjiEmMIHP6mnfmcLlV++w
 v5BKy+Xeo8FJrxVcBY9Y6VUGaZ31ErbzV18FVE9OK/P2OetRJFy5SGfuJ0xL+ZgB2JSQ
 MDruJ7qmF+hLgJecPz7Uxugi1s0KkTHW1qZkQfcE5rxwuIyZdIF5OH4OqyVUqJ+A8gG3
 HJXPZzmiSw5MSnLkFdo773GFBTxYrTsgABHsJLZHFYVgRgto4YKhaLo63pAuYGk8cJEK
 lDDA==
X-Gm-Message-State: AOAM5330jCS6U5vYqZWx9oRP4mQ+KyHxgDlMW4shuYQ3by8qJhMQ/gqe
 h98lu/O4OMptXF120ZkSSSkk+yTPU0sGG/d0QlA=
X-Google-Smtp-Source: ABdhPJxO1V7jYiD1y83kIiSLO0S0DpaEIjmmzIhiOYFQOg7P841IEZAzxG+rxVNKu7uEoNc8VHQSiYwOP2Fo+HU1mLU=
X-Received: by 2002:a25:4d7:: with SMTP id 206mr2970167ybe.306.1609892544235; 
 Tue, 05 Jan 2021 16:22:24 -0800 (PST)
MIME-Version: 1.0
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
 <CAEUhbmUtCvXCKoQGU9b6+UX1juChVfHkugODjo2psBnRw+7NTw@mail.gmail.com>
 <CAKmqyKPy-V77t-COOb2Vp5DasfduC49Uy51EcCfSRos+M-JkKw@mail.gmail.com>
 <CAFEAcA-6NqgwKQKBFVg-VYgwdOReddyHm=sUO6o0nLQXaoB_Fg@mail.gmail.com>
In-Reply-To: <CAFEAcA-6NqgwKQKBFVg-VYgwdOReddyHm=sUO6o0nLQXaoB_Fg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 6 Jan 2021 08:22:13 +0800
Message-ID: <CAEUhbmVd3Umei8qWdN-H2vejR144sgEDYyKwj5CTsbku5KjvKA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 6, 2021 at 5:11 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 5 Jan 2021 at 21:09, Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Wed, Dec 16, 2020 at 2:25 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > Hi Alistair, Peter,
> > >
> > > On Wed, Dec 2, 2020 at 10:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > Avoid using a magic number (4) everywhere for the number of chip
> > > > selects supported.
> > > >
> > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > >
> > > > (no changes since v1)
> > > >
> > > >  hw/ssi/imx_spi.c         | 4 ++--
> > > >  include/hw/ssi/imx_spi.h | 5 ++++-
> > > >  2 files changed, 6 insertions(+), 3 deletions(-)
> > > >
> > >
> > > Ping, not sure who is going to pick up this series?
> >
> > It should be reviewed by Jean-Christophe and then probably go via the ARM tree.
>
> It doesn't seem to have been sent with a cover letter. Multi-patch
> patchsets without a cover letter tend to get missed because when
> I scan through my email looking for patches I should review or
> pick up I'm looking for either (a) single patches or (b) the 00/nn
> cover letter email...

Thanks. I will resend it with a cover-letter.

Regards,
Bin

