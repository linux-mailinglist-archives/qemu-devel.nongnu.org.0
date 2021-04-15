Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855F33600BA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 06:03:10 +0200 (CEST)
Received: from localhost ([::1]:38214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWtDh-0000Vx-Bj
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 00:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1lWtBp-0007tQ-0x
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 00:01:14 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:34335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1lWtBb-0000nm-3g
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 00:01:12 -0400
Received: by mail-lf1-x129.google.com with SMTP id n8so36987839lfh.1
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 21:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xI3Ep+n0y0FZ95h+gp0YqcG2RpJeZK2m3inYPh2KkoA=;
 b=K7wOiXfNaxguCbJIgTH5K7MZiHx2z23tr2sQNuOnsaWauUh4t4TJy51NmoeCJRnHRu
 qttcxdhZ3cXs6hBeDa7To8AARK3yqdY2hGnP1xEpWlAEUxeyLsspTfUDDezg4htA6RnI
 oSIk6K6ap7s4LfOHKgT526SYPx1lKLcwyKT5RyELegqpMvpodCvqHg+mRxNWY377N373
 3SnEb92+PKQqQyt7JVp5VNGTCXC3W08s3Qa/YyVwbzwnFW7FWChloPh+/X8WgUOnjA4P
 7bis3byHogBYgn+G4e8tIXuz148FBWivhuH0HMiOrNzfnIMfUqS0ihs+vG+uPZuOVTqw
 tOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xI3Ep+n0y0FZ95h+gp0YqcG2RpJeZK2m3inYPh2KkoA=;
 b=NJPIUOtp8y28b8OklLGahJfj6psxP7kat3n3nXw9uPGxecdnMtaAfTppOUIZIVoccu
 vI1nzkIY9rSaeBWuyqpXUSwx1/g1v+nd9bTZKY9kFPv6i/klwo/FbjFhRLfoNGE1Gfzj
 stzE5LCazkgupq1KRUEKgeLfuzNmlGSHMqXXV4CegehpOfG0tgro9J7QM3PmYPFRgnxK
 n2mSvR9tjQ4qVBymMkk0X8x5RRKvtnqcVcyZXnj7DN3bZFSXLmnPSDLHrCj14N2gLR9o
 NtJCoaxtnUK3/18RTFi3VzUZO2duFwuvEJ3dl3KMhv7k84nFFwzcwQUxTt+U7wnwlp+B
 o2Gw==
X-Gm-Message-State: AOAM531PV7AMcZOXw1RYYf8E5O+uK16onoQa5EwT2fOv+vRfg1jPb4FF
 9KIijbmg0VgUC+Yirwf24paz3zCqsxy82KsQGCWxIw==
X-Google-Smtp-Source: ABdhPJwPcmCWbeCxoxQ0XdetoVFkX8EwJYoaXuiFhzxzE2lqFEBKCDcjD82clFuYH0lNPYPJ7FCnCi5HxeVp5UoweyY=
X-Received: by 2002:a05:6512:108f:: with SMTP id
 j15mr568966lfg.76.1618459251276; 
 Wed, 14 Apr 2021 21:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <161832726983.9430.3755052950345832110.malonedeb@chaenomeles.canonical.com>
 <CAKmqyKM7iVth4dzSLgdx6u=V3icoQuFnZ+JeqwUzmvim14BRRg@mail.gmail.com>
In-Reply-To: <CAKmqyKM7iVth4dzSLgdx6u=V3icoQuFnZ+JeqwUzmvim14BRRg@mail.gmail.com>
From: Kito Cheng <kito.cheng@sifive.com>
Date: Thu, 15 Apr 2021 12:00:40 +0800
Message-ID: <CALLt3TjP5TsuVNOcM+jnQb1tUKPuRxxxsNAahFCZFrxZs-gc1g@mail.gmail.com>
Subject: Re: [Bug 1923629] [NEW] RISC-V Vector Instruction vssub.vv not
 saturating
To: Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=kito.cheng@sifive.com; helo=mail-lf1-x129.google.com
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
Cc: liuzhiwei <zhiwei_liu@c-sky.com>, Bug 1923629 <1923629@bugs.launchpad.net>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add Frank, he is the SiFive's qemu maintainer.

On Thu, Apr 15, 2021 at 11:57 AM Alistair Francis <alistair23@gmail.com> wr=
ote:
>
> + LIU Zhiwei and Kito Cheng
>
> Alistair
>
> On Wed, Apr 14, 2021 at 1:31 AM Tony Cole <1923629@bugs.launchpad.net> wr=
ote:
> >
> > Public bug reported:
> >
> > I noticed doing a negate ( 0 =E2=80=93 0x80000000 ) using vssub.vv prod=
uces an
> > incorrect result of 0x80000000 (should saturate to 0x7FFFFFFF).
> >
> > Here is the bit of the code:
> >
> >                 vmv.v.i         v16, 0
> >                 =E2=80=A6
> > 8f040457        vssub.vv        v8,v16,v8
> >
> > I believe the instruction encoding is correct (vssub.vv with vd =3D v8,
> > vs2 =3D v16, rs1 =3D v8), but the result does not saturate in QEMU.
> >
> > I=E2=80=99ve just tested with what I think is the latest branch (
> > https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v7 commit 26 Feb
> > 2021: 1151361fa7d45cc90d69086ccf1a4d8397931811 ) and the problem still
> > exists.
> >
> > ** Affects: qemu
> >      Importance: Undecided
> >          Status: New
> >
> >
> > ** Tags: riscv vector
> >
> > --
> > You received this bug notification because you are a member of qemu-
> > devel-ml, which is subscribed to QEMU.
> > https://bugs.launchpad.net/bugs/1923629
> >
> > Title:
> >   RISC-V Vector Instruction vssub.vv not saturating
> >
> > Status in QEMU:
> >   New
> >
> > Bug description:
> >   I noticed doing a negate ( 0 =E2=80=93 0x80000000 ) using vssub.vv pr=
oduces an
> >   incorrect result of 0x80000000 (should saturate to 0x7FFFFFFF).
> >
> >   Here is the bit of the code:
> >
> >                 vmv.v.i         v16, 0
> >                 =E2=80=A6
> >   8f040457      vssub.vv        v8,v16,v8
> >
> >   I believe the instruction encoding is correct (vssub.vv with vd =3D v=
8,
> >   vs2 =3D v16, rs1 =3D v8), but the result does not saturate in QEMU.
> >
> >   I=E2=80=99ve just tested with what I think is the latest branch (
> >   https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v7 commit 26 Feb
> >   2021: 1151361fa7d45cc90d69086ccf1a4d8397931811 ) and the problem stil=
l
> >   exists.
> >
> > To manage notifications about this bug go to:
> > https://bugs.launchpad.net/qemu/+bug/1923629/+subscriptions
> >

