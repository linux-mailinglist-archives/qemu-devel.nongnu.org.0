Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54B326532
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 15:55:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTRht-0004IF-3v
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 09:55:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hTRdX-00011f-NP
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:50:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hTRdW-0004Xq-CK
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:50:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40840)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hTRdW-0004X2-4t; Wed, 22 May 2019 09:50:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3AC5930031A6;
	Wed, 22 May 2019 13:50:22 +0000 (UTC)
Received: from gondolin (dhcp-192-213.str.redhat.com [10.33.192.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CEE328558;
	Wed, 22 May 2019 13:50:17 +0000 (UTC)
Date: Wed, 22 May 2019 15:50:15 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Message-ID: <20190522155015.67313ae1.cohuck@redhat.com>
In-Reply-To: <CAL1e-=j5joi3ssA-7Q2PVp841ywj41Ntz_MSKdB4w27Z9JvcEQ@mail.gmail.com>
References: <20190521152810.21353-1-cohuck@redhat.com>
	<20190521152810.21353-3-cohuck@redhat.com>
	<6e216877-60be-ddcd-3f15-604e870ca8ba@redhat.com>
	<20190522140729.25970e17.cohuck@redhat.com>
	<6b101b85-4985-4736-acad-59389b00de55@vivier.eu>
	<20190522142421.746f7495.cohuck@redhat.com>
	<CAL1e-=j5joi3ssA-7Q2PVp841ywj41Ntz_MSKdB4w27Z9JvcEQ@mail.gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 22 May 2019 13:50:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL v3 47/55] linux headers: update against
 Linux 5.2-rc1
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	qemu-s390x@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
	Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?= =?UTF-8?B?w6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 May 2019 15:22:23 +0200
Aleksandar Markovic <aleksandar.m.mail@gmail.com> wrote:

> On May 22, 2019 2:24 PM, "Cornelia Huck" <cohuck@redhat.com> wrote:
> >
> > On Wed, 22 May 2019 14:10:39 +0200
> > Laurent Vivier <laurent@vivier.eu> wrote:
> > =20
> > > On 22/05/2019 14:07, Cornelia Huck wrote: =20
> > > > On Wed, 22 May 2019 13:47:25 +0200
> > > > Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> > > > =20
> > > >> On 5/21/19 5:28 PM, Cornelia Huck wrote: =20
> > > >>> commit a188339ca5a396acc588e5851ed7e19f66b0ebd9
> > > >>>
> > > >>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > > >>> --- =20
> > > >> [...] =20
> > > >>>   #define __NR_mq_notify 184
> > > >>>   __SC_COMP(__NR_mq_notify, sys_mq_notify, compat_sys_mq_notify)
> > > >>>   #define __NR_mq_getsetattr 185
> > > >>> @@ -536,8 +567,10 @@ __SC_COMP(__NR_msgsnd, sys_msgsnd, =20
> compat_sys_msgsnd)
> > > >>>   __SYSCALL(__NR_semget, sys_semget)
> > > >>>   #define __NR_semctl 191
> > > >>>   __SC_COMP(__NR_semctl, sys_semctl, compat_sys_semctl)
> > > >>> +#if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG !=3D=
 32 =20
> > > >
> > > > Eww. It seems only aarch64 sets __ARCH_WANT_TIME32_SYSCALLS, and the
> > > > second condition probably catches others but not mipsel.
> > > > =20
> > > >>>   #define __NR_semtimedop 192
> > > >>> -__SC_COMP(__NR_semtimedop, sys_semtimedop, compat_sys_semtimedop)
> > > >>> +__SC_COMP(__NR_semtimedop, sys_semtimedop, sys_semtimedop_time32)
> > > >>> +#endif
> > > >>>   #define __NR_semop 193
> > > >>>   __SYSCALL(__NR_semop, sys_semop) =20
> > > >> [...]
> > > >>
> > > >> https://app.shippable.com/github/qemu/qemu/runs/1703/summary/conso=
le
> > > >>
> > > >> It seems this commit introduce a regression on mips32:
> > > >>
> > > >>    CC      mipsel-linux-user/linux-user/syscall.o
> > > >> ./linux-user/syscall.c: In function 'safe_semtimedop':
> > > >> ./linux-user/syscall.c:697:25: error: '__NR_semtimedop' undeclared
> > > >> (first use in this function)
> > > >>       return safe_syscall(__NR_##name, arg1, arg2, arg3, arg4); \ =
=20
> > > >
> > > > So, we unconditionally deal with this syscall, i.e. we assume it is
> > > > always present? (I'm not sure of the logic in linux-user code.)
> > > > =20
> > >
> > > linux-user assumes it is present if __NR_msgsnd is present. =20
> >
> > Hm. The kernel change seems to break that assumption. Does anyone with
> > mips knowledge have an idea whether that was intentional (and the
> > linux-user code needs to be changed), or whether that's an issue on the
> > kernel side?
> > =20
>=20
> Hi, Cornelia.
>=20
> Thanks for your involving into this issue!
>=20
> It could be that (not-originating-from-MIPS) kernel commit:
>=20
> https://github.com/torvalds/linux/commit/1a787fc5ba18ac767e635c58d06a0b46=
876184e3
>=20
> made a mess with system call availability for MIPS (I will forward this to
> MIPS kernel maintainer Paul Burton). My impression is that this was not
> intentional, and is a temporary instability of kernel interface.

I don't think that's the problematic commit; that one seems to be a
follow-up on c8ce48f06503 ("asm-generic: Make time32 syscall numbers
optional") for tools usage (we sync from the 'normal' headers).

The stated intention of the asm-generic commit is to keep 32 bit
architectures working as before via defining
__ARCH_WANT_TIME32_SYSCALLS, but it seems that was not done for mips
(but it should, right?)

> However, I think that QEMU nevertheless should not make the assumption th=
at
> if __NR_MSGSND, than semtimedop() is present. It could be true, but it is
> still just self-imposed belief in QEMU, kernel never guarantied such thin=
gs.

I'm not too familiar with that family of syscalls; is there a better
way to check for syscall availability here?

> The alternative way of invoking via IPCV6 (else part of =E2=80=9Cifdef
> __NR_MSGSND=E2=80=9D) should work for MIPS in the present stage of header=
s and
> kernel.

If my assumption above (mips skipped by accident) is correct, we need
to fix the kernel headers instead :/ -- unless we want to add a
temporary build fix.

> As a side note, perhaps we shoul update kernel headers only off of stable
> kernel releases.

In the past, we have even updated the kernel headers against
non-mainline (kvm) versions :)

Breakage here seems to be rare (and if this is a real kernel interface
bug, it'd be a good thing that we caught it); I believe getting support
for new features into QEMU quicker makes that a good trade-off.

