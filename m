Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3862EB4BA
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 22:13:52 +0100 (CET)
Received: from localhost ([::1]:46080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwteJ-0005o0-F5
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 16:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kwtdJ-00057q-EE; Tue, 05 Jan 2021 16:12:49 -0500
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:37334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kwtdH-0005vM-QO; Tue, 05 Jan 2021 16:12:49 -0500
Received: by mail-il1-x132.google.com with SMTP id k8so1070622ilr.4;
 Tue, 05 Jan 2021 13:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CJzM8vGuJJ7uphomVoIK3FvyeywCzrMEff/uX/RUGhQ=;
 b=nQoLdb9HSjZeeEmET9F+xZE56nPZqliJIuRKKXgFOdKhGagTfNZ0qEN+AtOWa48GzE
 T7c+xuq6FfNPxyJ1WeonzqRCIJDY9Qiwjb9aV11C5bY8YM1ALCb95amsyED28LAt8rjY
 FxHQ66FEzKu2fmhEb2g8LhFyx+pTSJf6U1JJUAebc+mv+0h4fSmk4bX4N9WBi0NJKgGJ
 2SJjVBosLF1XejAKXA9oNPTf6Jhx1V9vPyOA5dY/MvRuak1igQbxBLlWTh12qs3UkFnK
 o56Wdsv6WEJi7td88Ym4aAzwpmqgieiSe2ZK5p1tDVH4SHLflCmWoIMpqv3Kmf/ntBa6
 o44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CJzM8vGuJJ7uphomVoIK3FvyeywCzrMEff/uX/RUGhQ=;
 b=Wn0nZBS1ExFgINeFwwdUZKgLX9S4916cD/zwGCEt2PBf2bLXegft5qaMf8rHPmcOsh
 a8kVPaKEZpmo1ArsKDvebwTCmXCSmXjPPc9UPvfmheM2iwPBQT4H1pd3cwT3IkNYJRDg
 KjrO+O5tOImah8s4DnIAcOZYh/2RTift1uGFlZi+wJiOkZLXo+Qsnbs+1bGEAbpHLU5Y
 BQELvfihQYOG0QHWsVjdvI6i2v4g/t+f+Y3VNYkUwkly1FGxSaTHBmKGtQtNgaM686d8
 qTWKt4KMUSvoilqzsoRK8Hf90ZNN3RImqfnXHd+TPFCgbA/E0RyFWtjC4pxY8gvYtrf8
 vLxg==
X-Gm-Message-State: AOAM531h8fUSgZ9QEqccm/7gM1KTVlILtIB6KzL4iseIssNz7TC2vVSg
 Pu0m0arV89dmQdX0JPKoQmDh8f5IfgoWkNV9bouCGVasp0Q=
X-Google-Smtp-Source: ABdhPJyV//J91oUbSy46/5/647p/q40XVfqntZEWZZNiqAeoBgj1nhnyYGvhL38IHUi/i9ofPpYBbf9Wo34Aq1er4CM=
X-Received: by 2002:a05:6e02:ca5:: with SMTP id 5mr1471370ilg.40.1609881166022; 
 Tue, 05 Jan 2021 13:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
 <CAEUhbmUtCvXCKoQGU9b6+UX1juChVfHkugODjo2psBnRw+7NTw@mail.gmail.com>
 <CAKmqyKPy-V77t-COOb2Vp5DasfduC49Uy51EcCfSRos+M-JkKw@mail.gmail.com>
In-Reply-To: <CAKmqyKPy-V77t-COOb2Vp5DasfduC49Uy51EcCfSRos+M-JkKw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 Jan 2021 13:12:19 -0800
Message-ID: <CAKmqyKPGpNvvhvsZ_vUrjasj_sjy+yHP0n5VdkNnBpv3CfbwRw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 5, 2021 at 1:08 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Dec 16, 2020 at 2:25 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Alistair, Peter,
> >
> > On Wed, Dec 2, 2020 at 10:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Avoid using a magic number (4) everywhere for the number of chip
> > > selects supported.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >
> > > (no changes since v1)
> > >
> > >  hw/ssi/imx_spi.c         | 4 ++--
> > >  include/hw/ssi/imx_spi.h | 5 ++++-
> > >  2 files changed, 6 insertions(+), 3 deletions(-)
> > >
> >
> > Ping, not sure who is going to pick up this series?
>
> It should be reviewed by Jean-Christophe and then probably go via the ARM tree.

Ah, I just realised I apparently have `hw/ssi/*` listed in
MAINTAINERS. As this file is specifically mentioned somewhere else in
MAINTAINERS and I know very little about IMX I'm going to leave this
alone still.

Alistair

>
> Alistair
>
> >
> > Regards,
> > Bin
> >

