Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619E110BE03
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 22:33:33 +0100 (CET)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ia4wG-0001L4-8K
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 16:33:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55524)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ia4td-0000nW-63
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 16:30:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ia4tb-0004OD-27
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 16:30:48 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38375)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1ia4ta-0004Mz-Qh
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 16:30:46 -0500
Received: by mail-ot1-x344.google.com with SMTP id z25so20413406oti.5
 for <qemu-devel@nongnu.org>; Wed, 27 Nov 2019 13:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JXvT5o0Gd1gREWBesSjnwOkZo5sOzRG0oiFQV1LhO+s=;
 b=JAC8u3BRqU8wXpkdV0IrZthe6a8ggBPUhmnMHlzwx6qA6/6rA326qtZATONeWcu9ME
 xLJ7WcTnChk/5bVAY3jcQSH7MOH1P8v7Ap/U1Wy9MJf1pg42ToR0966u7dGkjkAdm5op
 BluXH7nQ6xPywl/rQhPMsotyZ1QHTPRRJ0c7a5nkYm3OjPh8C1+jKxYVAA6tk7lAOsMR
 SqKWuxCongk1Fq6/9HIk0o3/aG24oDfo0ArUsnOWVDtZnu9U80KEWRogMItKI/b7MXel
 kpvFjFsp6/IUAWBXHHdPcuPOs3Q8OKUtkNXNRNLV5geiUQnWXrIRdQLFu6DB7fm0BnNe
 E50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JXvT5o0Gd1gREWBesSjnwOkZo5sOzRG0oiFQV1LhO+s=;
 b=XP4fWlweyMmhkeJrkvG/fu+rxkM44UemftqXht7+byl3oTgBZy8K1SIkTznkHvQ/Bv
 ujmsgrUPhhSdDWOAB77c37v1U97eSZR7srtrm4rA2V6SYfyjl+VEvV0NlyRimDzcK3gM
 k6WwPQydOXuYQ3SbGm4MarceVBoAH0J/ZzTTIF98lkKsdysnxbISabgNkgdfG3iHN733
 ziDwSqPdIA94V24Akia3YZtqTJouKdX2lULgAOxRJgiXs37IRsKDPwEflVc5ieySSgAA
 7Sv2KmYzFFjf0uiBHxYal8NxY1RDwWZNABZEVcW9mx+7YVACuIKgzVdae9ij4HhHYT3S
 SmXg==
X-Gm-Message-State: APjAAAXqaz7qNcAJbLH2oNu+Bkx9goniFEz8TXoLWOtcqOLWKO73UFd5
 9A/34riq9frypcZQ7jDuXRd/bL949WVgiR0tvQI=
X-Google-Smtp-Source: APXvYqzensJkU8k64d4o9XHDyXcxLzs/aNF9HaJDpNxCcbBHZYNJvAWmBF7dvLMiZ7gwflXpNeq822zmQdfKzCmCQJ4=
X-Received: by 2002:a9d:58c9:: with SMTP id s9mr609704oth.121.1574890245234;
 Wed, 27 Nov 2019 13:30:45 -0800 (PST)
MIME-Version: 1.0
References: <20191125104103.28962-1-philmd@redhat.com>
 <CAL1e-=gJxBRvkiPzdAKOqVLEc7mmLpJRrprv5Rjcd8p2jD+_Hg@mail.gmail.com>
 <8fa0f275-797a-6a3c-4fac-43f4f7a8b975@redhat.com>
In-Reply-To: <8fa0f275-797a-6a3c-4fac-43f4f7a8b975@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 27 Nov 2019 22:30:34 +0100
Message-ID: <CAL1e-=gyUQh7zZ_2sj=DfvZ856m2Ugm+9vS3xvjHUniWmUUsdw@mail.gmail.com>
Subject: Re: [PATCH-for-4.2] hw/mips: Deprecate the r4k machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Thomas Huth <thuth@redhat.com>, libvir-list@redhat.com,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 27, 2019 at 10:17 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi Aleksandar,
>
> On 11/27/19 7:47 PM, Aleksandar Markovic wrote:
> > On Mon, Nov 25, 2019 at 11:41 AM Philippe Mathieu-Daud=C3=A9
> > <philmd@redhat.com> wrote:
> >>
> >> The r4k machine was introduced in 2005 (6af0bf9c7) and its last
> >> logical change was in 2005 (9542611a6). After we can count 164
> >> maintenance commits (QEMU API changes) with the exception of
> >> 1 fix in 2015 (memory leak, commit 3ad9fd5a).
> >>
> >> This machine was introduced as a proof of concept to run a MIPS
> >> CPU. 2 years later, the Malta machine was add (commit 5856de80)
> >> modeling a real platform.
> >>
>
> Since you queued this patch, do you mind adding Aurelien comment to the
> patch description, as it appears important information:
>
> '''
> The Linux kernel support for this machine has been dropped more
> than 10 years ago in this commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D302922e5f6901eb6f29c58539631f71b3d9746b8
> '''
>

Sure.

> I was not sure when sending the patch, but as an improvement, we can
> also remove Aurelien and Aleksandar Rikalo from the MAINTAINERS section.
>

I would leave that section intact please. They are currently formally
in charge of this machine, and if they have been so by now for so long
time, let them be the same even during deprecation period.

I would of course remove the patch related to R4000 maintainership fro
my separate series covering chang in the maintainership, since it
really loses any sense.

> And I assume we can also add (which was explicit in your previous patch):
> Acked-by: Aurelien Jarno <aurelien@aurel32.net>
>

OK.

> If you want I can resend this patch with all that amended.
>
> >> Note also this machine has no specification except 5 lines in
> >> the header of this file:
> >>
> >>   * emulates a simple machine with ISA-like bus.
> >>   * ISA IO space mapped to the 0x14000000 (PHYS) and
> >>   * ISA memory at the 0x10000000 (PHYS, 16Mb in size).
> >>   * All peripherial devices are attached to this "bus" with
> >>   * the standard PC ISA addresses.
> >>
> >> It is time to deprecate this obsolete machine. Users are
> >> recommended to use the Malta board, which hardware is well
> >> documented.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>   qemu-deprecated.texi | 5 +++++
> >>   hw/mips/mips_r4k.c   | 1 +
> >>   MAINTAINERS          | 2 +-
> >>   3 files changed, 7 insertions(+), 1 deletion(-)
> >>
> >
> > Applied to MIPS queue.
> >
> >> diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
> >> index 4b4b7425ac..05265b43c8 100644
> >> --- a/qemu-deprecated.texi
> >> +++ b/qemu-deprecated.texi
> >> @@ -266,6 +266,11 @@ The 'scsi-disk' device is deprecated. Users shoul=
d use 'scsi-hd' or
> >>
> >>   @section System emulator machines
> >>
> >> +@subsection mips r4k platform (since 4.2)
> >> +
> >> +This machine type is very old and unmaintained. Users should use the =
'malta'
> >> +machine type instead.
> >> +
> >>   @subsection pc-0.12, pc-0.13, pc-0.14 and pc-0.15 (since 4.0)
> >>
> >>   These machine types are very old and likely can not be used for live=
 migration
> >> diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
> >> index 70024235ae..0b79ad26cb 100644
> >> --- a/hw/mips/mips_r4k.c
> >> +++ b/hw/mips/mips_r4k.c
> >> @@ -294,6 +294,7 @@ void mips_r4k_init(MachineState *machine)
> >>
> >>   static void mips_machine_init(MachineClass *mc)
> >>   {
> >> +    mc->deprecation_reason =3D "use malta machine type instead";
> >>       mc->desc =3D "mips r4k platform";
> >>       mc->init =3D mips_r4k_init;
> >>       mc->block_default_type =3D IF_IDE;
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 5e5e3e52d6..3b3a88e264 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -972,7 +972,7 @@ F: hw/net/mipsnet.c
> >>   R4000
> >>   M: Aurelien Jarno <aurelien@aurel32.net>
> >>   R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
> >> -S: Maintained
> >> +S: Obsolete
> >>   F: hw/mips/mips_r4k.c
> >>
> >>   Fulong 2E
> >> --
> >> 2.21.0
> >>
> >>
> >
>

