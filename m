Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4355C737
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 04:28:38 +0200 (CEST)
Received: from localhost ([::1]:47276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi8X7-0006PI-Og
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 22:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56756)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marlies.ruck@gmail.com>) id 1hi4QG-0007H8-ID
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 18:05:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marlies.ruck@gmail.com>) id 1hi4QF-0001Ti-0T
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 18:05:16 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35374)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marlies.ruck@gmail.com>)
 id 1hi4QE-0001PH-Id
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 18:05:14 -0400
Received: by mail-io1-f65.google.com with SMTP id m24so32450260ioo.2
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 15:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fQmdud04grl8ZB7fn919dxOx0uv0A1cHE1YWXWElWDk=;
 b=B1kpZY8ScS2F+aLHsRMFbl0+wXzKKcxUju96avFSb6x42YdFTqA9y6GOr9402Wmbge
 +eZtARyMiVcOOq+CgQyWBfhWWC0wkOEbYgcw/tDRUbFXXbU7N3wr/x+EP5X+dOtv+Tan
 V8DrZHmQKBrdjwCQVZZlzcBqgm9ojE0jfN8WYvw8m4Og5oHqfomuo98bNOt3GfB6gJFc
 J/3WrfwMx/PhmydL/TUuiMbwYZb/eyM4sT+jHa/eepRL15iCodOGZ2icb6tFf3AQ4JH+
 kNaWj+6DE6dMKSBTlnDOlBsWfK8hrJg3ig2p6k3htXssM4yEah42Nf7rsy3Zvfb4fEwi
 dkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fQmdud04grl8ZB7fn919dxOx0uv0A1cHE1YWXWElWDk=;
 b=srL8NWdCLqqUbwBlfSVqjJsTz5SVqpSAI+YCulw7ZTaxUkGY+uGonsEyp7KHxjxda9
 oxAWxqI2+O/SOf+7TQfq06Ip/keFMAUWUMVR53+vahDyNjQInFLdLslDI0/cumAN1oSR
 QonLvp55BPCixziK7WEvpJha5AB7tt/5MP+xMMFA6J3lcpV0+lsoys496ySlQuUTsrn4
 5WwjVED6yqjwKTT0akNVRKVZLPw0tUjnLnypfFdvBLiChAUSp3/3QSwY6HrXWqXLPYTL
 O3qJI+1w5V0vZttpSQkRCF+rcyLbS9iI0wgnD5trQoZBwYe52bOhbDTuacmebxF8KDsE
 8ymA==
X-Gm-Message-State: APjAAAVKM1vZoYFY/gof1ySyBzL54t7IV91xGOfG6xZnl2NIewYJ14Eb
 oJO9mr74/xDkDjcjHjboxmGng7T9VxSYmQk8uCM=
X-Google-Smtp-Source: APXvYqzKZMNrIZ88M+IPY74oZXJ+KgBukl1fZz2b9WNNWb8j31ve0i53RnjN9S/FGllx0eNE0r8DeH7il8NO1fU61MQ=
X-Received: by 2002:a6b:4f14:: with SMTP id d20mr6766155iob.219.1562018651490; 
 Mon, 01 Jul 2019 15:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <CALw29ZZZ08Lt13oZsbZCwV+uP0roLuT6t+8m16y+8YT-KH4t7A@mail.gmail.com>
 <CALw29ZbiqpGFOGHOP_7K2DvAfap_xE+PWAfXvvr35eK7aKn-dA@mail.gmail.com>
 <e3282346-166b-ef37-b874-2c2625cf31c1@redhat.com>
 <CAFEAcA-ZVGq1bD4+fu2+7GOVq_nBXBy8h31AY-0=i2ixnvvRnQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-ZVGq1bD4+fu2+7GOVq_nBXBy8h31AY-0=i2ixnvvRnQ@mail.gmail.com>
From: Marlies Ruck <marlies.ruck@gmail.com>
Date: Mon, 1 Jul 2019 15:04:00 -0700
Message-ID: <CALw29Za+za-Pncr5esvnaNU8C3dx6Jws+jSbJAPJ0fSc50NotA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.166.65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] patch to swap SIGRTMIN + 1 and SIGRTMAX - 1
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
Cc: Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All,

You are correct, this would break Go binaries.  I was planning on
submitting a PR to the Go runtime if my patch was accepted to QEMU.  The Go
PR would ignore the failure to register a handler for SIGRTMAX - 1, just as
it currently ignores the failure on SIGRTMAX (
https://github.com/golang/go/blob/master/src/runtime/os_linux.go#L443).
Does this seem reasonable to you?  My local set up has these patches to
QEMU and Go and it allows me to run both Go guest programs, and guest
programs that use SIGRTMIN + 1.

Also, thank you Peter and Phil for your patience as this is my first time
contributing to QEMU.  If you decide to use this patch, I'm happy to resend
the patch via `git send email`.

Thanks!
Marli



On Mon, Jul 1, 2019 at 2:08 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sat, 29 Jun 2019 at 11:53, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
> wrote:
> >
> > Hi Marlies,
> >
> > On 6/29/19 1:26 AM, Marlies Ruck wrote:
> > > Hi,
> > >
> > > I just wanted to follow up since I sent this patch a week ago to make
> sure
> > > it was a received.  An ack would be appreciated.
> >
> > You did not Cc'ed the maintainer, so he likely missed it.
> > See:
> > https://wiki.qemu.org/Contribute/SubmitAPatch#CC_the_relevant_maintaine=
r
> >
> > $ ./scripts/get_maintainer.pl -f linux-user/signal.c
> > Riku Voipio <riku.voipio@iki.fi> (maintainer:Linux user)
> > Laurent Vivier <laurent@vivier.eu> (reviewer:Linux user)
> >
> > BTW you should also look at the next paragraph in this wiki page:
> >
> https://wiki.qemu.org/Contribute/SubmitAPatch#Do_not_send_as_an_attachmen=
t
> >
> > Since you credit Peter Maydell, it would be kind to Cc him too.
>
> I have a strong suspicion that if we applied this patch it would
> break running a pile of Go binaries that currently work, which means
> it's something we need to be cautious about. (The Go runtime special
> cases the fact that when it tries to register some signals they don't
> work, but will abort on startup I think if it can't register a handler
> for SIGRTMAX-1, which will be the case after this patch.)
>
> thanks
> -- PMM
>
