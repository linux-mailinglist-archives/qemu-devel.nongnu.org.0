Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4323C5ED6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:07:09 +0200 (CEST)
Received: from localhost ([::1]:54868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xWW-0001K1-Sk
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1m2xSa-0003Ub-4V
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:03:04 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1m2xSX-0007MI-OR
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:03:03 -0400
Received: by mail-wr1-x433.google.com with SMTP id t5so12210263wrw.12
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZYK6c2AP1WcE5HtD2karR+j5D92DM2OQ0s035Kx9Bjs=;
 b=EStNtg7+U/Bu+gRW+sRW4xpwU9TfT4Xt3la9XUMazS2/dpscwT807celuJmzOCDBtR
 35pFPBks8c3wr0u3UqFhmM5VmbVZASIGCg1P2SSwczMoaOW9dhlL+OSZZNuBT8+VIK7S
 bgbRivGHwyAzSMo3HV3g2nhOh8fKPxZNXhgqbmiMSEyVfkHVSwfOrz5t0FbH9ph55oH6
 Gy+Zy4paESScf6kKeXrRcNaunAqSPgOOqTHgMW83l0eT7zaEN8V/5PLhaz0+Xm0yb7yD
 /pej5NgKH4QmZyZNYlsgOoJF9TuHh4xQqdwjlNQtbSXAzMimBn528sf9N1xHxOXH8kVi
 tYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZYK6c2AP1WcE5HtD2karR+j5D92DM2OQ0s035Kx9Bjs=;
 b=HUkGL8+IiCivIbaQyjb5o+jB811ft0ZqIig0xcoRv3o4FLatSAaSvzhLxGJCLVwIYr
 yPLcIbORl756Q//sBWRLnK7/ScxznxJnm5TlPsOMnKL+VO5hXYGtlgu7soOL+YxV2+p3
 QWOX4ARwqiuyMiTfTDg4zkk8Q59rlZKkgfQOQQr8s2gdd0acAMqrsO2YkqXWJaQ3hzTw
 P4grt3YpwbXpJYVbrgZUcXzmH8khqRZA0Okg46HZ4FC29lhKIgJxRu0iUjoazfA+e7MK
 dXM7M8ZrxqdWcIakA/rKAl2zngquOaV8Wmr/ZlQkjpb0EYDxnchWpmTz7gK4eCXdNJG6
 HsUA==
X-Gm-Message-State: AOAM5306YmPZoYk1Iy0DzqgjcRuEV3WXA6kpyQzS793v07/PHER5u2/d
 8NwMro/Tz/r8sXBlUoMzkltLNrDgvIUHODbG5Uh1Bg==
X-Google-Smtp-Source: ABdhPJyQ4NCdYGlPn98aJimMu+3bruXrDU4xOqSuZrwQ2F3U/ZzYouYs+91E+gljXaQT4bawsgrFd9eXYxWweMHKs9M=
X-Received: by 2002:a5d:464b:: with SMTP id j11mr59866970wrs.356.1626102179984; 
 Mon, 12 Jul 2021 08:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160615.330768-1-anup.patel@wdc.com>
 <20210612160615.330768-4-anup.patel@wdc.com>
 <CAEUhbmV1L7sL+9=3=onkXZoR0FYpV93gKCVxFJ5O5-Jw36PQgA@mail.gmail.com>
 <CAAhSdy2q7S08eF8NfqvEeFORkrGDaZsDJftCTaq7c9zi7WU2SQ@mail.gmail.com>
 <CAEUhbmW9XEk0rZivzQTMhFwL4Egjh0jR9HxEnwJMSOyBntiQig@mail.gmail.com>
 <CAAhSdy1QW+sQi0L+NfCSfL6k4ZQaU9sqt=ZdDQ=ZK8ygykZnxg@mail.gmail.com>
 <CAEUhbmXLcgF59QXFveqpJJ-QzexfR++b+JE-ECKntgMnFQ_boA@mail.gmail.com>
In-Reply-To: <CAEUhbmXLcgF59QXFveqpJJ-QzexfR++b+JE-ECKntgMnFQ_boA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 12 Jul 2021 20:32:48 +0530
Message-ID: <CAAhSdy195JTXoZsk=XOZmQog2X4ZP2Npty-74SvorC8Kjjdm9g@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] hw/riscv: virt: Add optional ACLINT support to
 virt machine
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::433;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 6:41 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Jul 12, 2021 at 6:54 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, Jul 12, 2021 at 11:45 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Mon, Jul 12, 2021 at 1:39 PM Anup Patel <anup@brainfault.org> wrote:
> > > >
> > > > On Mon, Jun 14, 2021 at 5:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > >
> > > > > On Sun, Jun 13, 2021 at 12:14 AM Anup Patel <anup.patel@wdc.com> wrote:
> > > > > >
> > > > > > We extend virt machine to emulate ACLINT devices only when "aclint=on"
> > > > > > parameter is passed along with machine name in QEMU command-line.
> > > > > >
> > > > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > > > ---
> > > > > >  hw/riscv/virt.c         | 110 +++++++++++++++++++++++++++++++++++++++-
> > > > > >  include/hw/riscv/virt.h |   2 +
> > > > > >  2 files changed, 111 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > > > > > index 977d699753..a35f66af13 100644
> > > > > > --- a/hw/riscv/virt.c
> > > > > > +++ b/hw/riscv/virt.c
> > > > > > @@ -50,6 +50,7 @@ static const MemMapEntry virt_memmap[] = {
> > > > > >      [VIRT_TEST] =        {   0x100000,        0x1000 },
> > > > > >      [VIRT_RTC] =         {   0x101000,        0x1000 },
> > > > > >      [VIRT_CLINT] =       {  0x2000000,       0x10000 },
> > > > > > +    [VIRT_ACLINT_SSWI] = {  0x2F00000,        0x4000 },
> > > > >
> > > > > How about we reuse the same register space to support both CLINT and
> > > > > ACLINT? This saves some register space for future extension.
> > > >
> > > > The intention of placing ACLINT SSWI separate from ACLINT MTIMER and
> > > > MSWI is to minimize PMP region usage.
> > >
> > > Okay, so this leaves spaces for 240 ACLINT MTIMER and MSWI devices in
> > > total, if we put ACLINT SSWI at 0x2F00000, and we still have spaces
> > > for 64 ACLINT SSWI devices. Is this enough?
> >
> > We just need one instance of MTIMER, MSWI, and SSWI per-socket.
> > Current limit of max sockets in RISC-V virt machine is 8. We will be
> > reducing this to 4 due space required by IMSICs. This means no matter
> > what 8 instances of each MTIMER, MSWI, and SSWI is the max we
> > can go for RISC-V virt machine. This limits are due to the fact that
> > we want to fit devices in first 2GB space.
> >
>
> Can you list the maximum ACLINT devices and their memory map we intend
> to support and with that we can see how many PMP is used?

For 4 sockets, we will have following layout:
0x2000000-0x200FFFF (Socket0 MTIMER and MSWI)
0x2010000-0x201FFFF (Socket1 MTIMER and MSWI)
0x2020000-0x202FFFF (Socket2 MTIMER and MSWI)
0x2030000-0x203FFFF (Socket3 MTIMER and MSWI)
0x2F00000-0x2F03FFF (Socket0 SSWI)
0x2F04000-0x2F07FFF (Socket1 SSWI)
0x2F08000-0x2F0bFFF (Socket2 SSWI)
0x2F0C000-0x2F0FFFF (Socket3 SSWI)

OpenSBI will create one PMP region to protect all
MTIMERs and MSWIs which is:
0x2000000-0x203FFFF

Regards,
Anup

>
> Regards,
> Bin

