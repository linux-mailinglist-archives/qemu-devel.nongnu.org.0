Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7A5AD6DF
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Sep 2019 12:31:46 +0200 (CEST)
Received: from localhost ([::1]:54862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7GxV-0000lj-Ix
	for lists+qemu-devel@lfdr.de; Mon, 09 Sep 2019 06:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55915)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i7Gw9-0000Ed-Q5
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 06:30:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i7Gw7-0001Em-It
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 06:30:21 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37431)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1i7Gw7-0001ED-CI
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 06:30:19 -0400
Received: by mail-ot1-x342.google.com with SMTP id s28so11924835otd.4
 for <qemu-devel@nongnu.org>; Mon, 09 Sep 2019 03:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=1dablnJmmYW3vsCyAnEq1iHNTXHrFYxcD97TQwAykuw=;
 b=cqLqMY8PtVjA7AF7Jn3aY+crG9BH/7MMNvFatzO478L/P/s0amRI0x4+KXrqwm3yJl
 vOmOQP96qDD3yF0WJllZs1AUncgMSy1mrXiVmBsR/OmGSI0QYRud6wt2WudoydORMMYJ
 HSg5qHTBnzGITgtPf0f9RU20reypGXn8edvV9BUb+kQPB+IJC7/E5DzalD+3LmuGfrGi
 pOHSAdO4Mni/93R6dyMzhG+2AMBcQtvzAz7xh1llei8G4RmUoSFQV/uFWjBpn8JZ862H
 IGRIi7NbttnJW8PO9BR2nXQnQqDkIUflGU16tfJAAuzUertsLTc89XfOboJaTgZaEwrE
 2yzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=1dablnJmmYW3vsCyAnEq1iHNTXHrFYxcD97TQwAykuw=;
 b=QIWGwoVtw6XyWL56gfT9oQxRQnH/TB/Rau6VOj54aum1Ld+Y/TKTGT7nIufGdm1GlP
 wmDuFRhqo+07ZzH6hgMKMyk9w4ZzO83ARNwq/upOCtCP6wQghKNVXISOpcmlr2P60a4Z
 QUWT10su9wW9FNnTSyfhFL5VFx6hrM2+Kt0MWgcYFySbe9RBwQwo4nCMI5yWpm7FD3uX
 Lks5UC9R6V3t4kvK1gdfsnoQyokBO2IGhjYVT+qXhvDDph9Fu6X4YfeHf/SvM6O5wN4y
 WQ4Fhlz65mjD6L1nXc69l8OZ+7uSW5HEDx9/6+0QDVS7mVruoxpHl+SwrrZW7v0EleaB
 kp6g==
X-Gm-Message-State: APjAAAUl2wpCu9Xag+svTEpyAvcgC6/IhlgPBSeGaZ3zd8XDsISW3CCm
 y0s4etCimnUGis41w6ZhaNIjGpMo048iwoBQWX4=
X-Google-Smtp-Source: APXvYqyI6MXkhbkhe1VRbIyjguydH/1RICx/GdGz0uWzzb5KGDsEg5gYeKx6R9hhM+471PkNLudzFmBrJM4lRqYYwWw=
X-Received: by 2002:a05:6830:4c5:: with SMTP id
 s5mr17950670otd.121.1568025018456; 
 Mon, 09 Sep 2019 03:30:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP;
 Mon, 9 Sep 2019 03:30:17 -0700 (PDT)
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP;
 Mon, 9 Sep 2019 03:30:17 -0700 (PDT)
In-Reply-To: <CAL1e-=icX+uKfHtMc69-GVQAkTfR-poreB2_Zzm-=tyK=fp+KA@mail.gmail.com>
References: <20190802160458.25681-1-peter.maydell@linaro.org>
 <CAL1e-=icX+uKfHtMc69-GVQAkTfR-poreB2_Zzm-=tyK=fp+KA@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Mon, 9 Sep 2019 12:30:17 +0200
Message-ID: <CAL1e-=iFWnzFwa1=CJEf04Pv0+yV+7otvKSPJpAogjSnoXjDUg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH 0/3] target/mips: Convert to
 do_transaction_failed hook
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
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping for Herv=C3=A9.

22.08.2019. 20.16, "Aleksandar Markovic" <aleksandar.m.mail@gmail.com> =D1=
=98=D0=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
>
> 02.08.2019. 18.05, "Peter Maydell" <peter.maydell@linaro.org> =D1=98=D0=
=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
> >
> > This patchset converts the MIPS target away from the
> > old broken do_unassigned_access hook to the new (added in
> > 2017...) do_transaction_failed hook.
> >
>
> Herve, bonjour.
>
> As far as I can see these changes are fine. May I ask you for your
opinion? Can you run your Jazz tests without regressions with this change?
>
> Mille mercis,
> Aleksandar
>
> > The motivation here is:
> >  * do_unassigned_access is broken because:
> >     + it will be called for any kind of access to physical addresses
> >       where there is no assigned device, whether that access is by the
> >       CPU or by something else (like a DMA controller!), so it can
> >       result in spurious guest CPU exceptions.
> >     + It will also get called even when using KVM, when there's nothing
> >       useful it can do.
> >     + It isn't passed in the return-address within the TCG generated
> >       code, so it isn't able to correctly restore the CPU state
> >       before generating the exception, and so the exception will
> >       often be generated with the wrong faulting guest PC value
> >  * there are now only a few targets still using the old hook,
> >    so if we can convert them we can delete all the old code
> >    and complete this API transation. (Patches for SPARC are on
> >    the list; the other user is RISCV, which accidentally
> >    implemented the old hook rather than the new one recently.)
> >
> > The general approach to the conversion is to check the target for
> > load/store-by-physical-address operations which were previously
> > implicitly causing exceptions, to see if they now need to explicitly
> > check for and handle memory access failures. (The 'git grep' regexes
> > in docs/devel/loads-stores.rst are useful here: the API families to
> > look for are ld*_phys/st*_phys, address_space_ld/st*, and
> > cpu_physical_memory*.)
> >
> > For MIPS, there are none of these (the usual place where targets do
> > this is hardware page table walks where the page table entries are
> > loaded by physical address, and MIPS doesn't seem to have those).
> >
> > Code audit out of the way, the actual hook changeover is pretty
> > simple.
> >
> > The complication here is the MIPS Jazz board, which has some rather
> > dubious code that intercepts the do_unassigned_access hook to suppress
> > generation of exceptions for invalid accesses due to data accesses,
> > while leaving exceptions for invalid instruction fetches in place. I'm
> > a bit dubious about whether the behaviour we have implemented here is
> > really what the hardware does -- it seems pretty odd to me to not
> > generate exceptions for d-side accesses but to generate them for
> > i-side accesses, and looking back through git and mailing list history
> > this code is here mainly as "put back the behaviour we had before a
> > previous commit broke it", and that older behaviour in turn I think is
> > more historical-accident than because anybody deliberately checked the
> > hardware behaviour and made QEMU work that way. However, I don't have
> > any real hardware to do comparative tests on, so this series retains
> > the same behaviour we had before on this board, by making it intercept
> > the new hook in the same way it did the old one. I've beefed up the
> > comment somewhat to indicate what we're doing, why, and why it might
> > not be right.
> >
> > The patch series is structured in three parts:
> >  * make the Jazz board code support CPUs regardless of which
> >    of the two hooks they implement
> >  * switch the MIPS CPUs over to implementing the new hook
> >  * remove the no-longer-needed Jazz board code for the old
> >    hook
> > (This seemed cleaner to me than squashing the whole thing into
> > a single patch that touched core mips code and the jazz board
> > at the same time.)
> >
> > I have tested this with:
> >  * the ARC Multiboot BIOS linked to from the bug
> >    https://bugs.launchpad.net/qemu/+bug/1245924 (and which
> >    was the test case for needing the hook intercept)
> >  * a Linux kernel for the 'mips' mips r4k machine
> >  * 'make check'
> > Obviously more extensive testing would be useful, but I
> > don't have any other test images. I also don't have
> > a KVM MIPS host, which would be worth testing to confirm
> > that it also still works.
> >
> > If anybody happens by some chance to still have a working
> > real-hardware Magnum or PICA61 board, we could perhaps test
> > how it handles accesses to invalid memory, but I suspect that
> > nobody does any more :-)
> >
> > thanks
> > -- PMM
> >
> >
> > Peter Maydell (3):
> >   hw/mips/mips_jazz: Override do_transaction_failed hook
> >   target/mips: Switch to do_transaction_failed() hook
> >   hw/mips/mips_jazz: Remove no-longer-necessary override of
> >     do_unassigned_access
> >
> >  target/mips/internal.h  |  8 ++++---
> >  hw/mips/mips_jazz.c     | 47 +++++++++++++++++++++++++++++------------
> >  target/mips/cpu.c       |  2 +-
> >  target/mips/op_helper.c | 24 +++++++--------------
> >  4 files changed, 47 insertions(+), 34 deletions(-)
> >
> > --
> > 2.20.1
> >
> >
