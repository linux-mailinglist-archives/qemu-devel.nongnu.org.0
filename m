Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D637130FA5
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 16:10:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44169 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWiEW-0001qP-VB
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 10:10:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mrezanin@redhat.com>) id 1hWi4K-0003Z6-6O
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:59:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mrezanin@redhat.com>) id 1hWi4I-00063f-Aw
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:59:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:18386)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mrezanin@redhat.com>)
	id 1hWi4E-00060X-6k; Fri, 31 May 2019 09:59:34 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DCF3BC130719;
	Fri, 31 May 2019 13:59:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCB7F1001E86;
	Fri, 31 May 2019 13:59:32 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
	(zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3A95206D2;
	Fri, 31 May 2019 13:59:32 +0000 (UTC)
Date: Fri, 31 May 2019 09:59:29 -0400 (EDT)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Message-ID: <627031963.25549126.1559311169316.JavaMail.zimbra@redhat.com>
In-Reply-To: <874l5aahmx.fsf@zen.linaroharston>
References: <20190514155301.16123-1-alex.bennee@linaro.org>
	<20190514155301.16123-7-alex.bennee@linaro.org>
	<20190531091204.tjmq622gw457xbdr@lws.brq.redhat.com>
	<87sgsu51bd.fsf@zen.linaroharston>
	<833530119.25503992.1559302089822.JavaMail.zimbra@redhat.com>
	<874l5aahmx.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.40.204.19, 10.4.195.20]
Thread-Topic: target/arm: use the common interface for WRITE0/WRITEC in
	arm-semi
Thread-Index: PHKtkS65/Rg51CAuNZ8JNu6imuD3rQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 31 May 2019 13:59:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH 06/11] target/arm: use the common
 interface for WRITE0/WRITEC in arm-semi
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



----- Original Message -----
> From: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
> To: "Miroslav Rezanina" <mrezanin@redhat.com>
> Cc: qemu-devel@nongnu.org, "Peter Maydell" <peter.maydell@linaro.org>, "R=
iku Voipio" <riku.voipio@iki.fi>,
> qemu-arm@nongnu.org, "Laurent Vivier" <laurent@vivier.eu>
> Sent: Friday, May 31, 2019 3:16:38 PM
> Subject: Re: [Qemu-devel] [RFC PATCH 06/11] target/arm: use the common in=
terface for WRITE0/WRITEC in arm-semi
>=20
>=20
> Miroslav Rezanina <mrezanin@redhat.com> writes:
>=20
> > ----- Original Message -----
> >> From: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
> >> To: "Miroslav Rezanina" <mrezanin@redhat.com>
> >> Cc: qemu-devel@nongnu.org, "Peter Maydell" <peter.maydell@linaro.org>,
> >> "Riku Voipio" <riku.voipio@iki.fi>,
> >> qemu-arm@nongnu.org, "Laurent Vivier" <laurent@vivier.eu>
> >> Sent: Friday, May 31, 2019 1:08:06 PM
> >> Subject: Re: [Qemu-devel] [RFC PATCH 06/11] target/arm: use the common
> >> interface for WRITE0/WRITEC in arm-semi
> >>
> >>
> >> Miroslav Rezanina <mrezanin@redhat.com> writes:
> >>
> >> > On Tue, May 14, 2019 at 04:52:56PM +0100, Alex Benn=C3=A9e wrote:
> >> >> Now we have a common semihosting console interface use that for our
> >> >> string output. However ARM is currently unique in also supporting
> >> >> semihosting for linux-user so we need to replicate the API in
> >> >> linux-user. If other architectures gain this support we can move th=
e
> >> >> file later.
> >> >>
> >> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> >> ---
> >> >>  linux-user/Makefile.objs  |  2 ++
> >> >>  linux-user/arm/semihost.c | 24 ++++++++++++++++++++++++
> >> >>  target/arm/arm-semi.c     | 31 ++++++-------------------------
> >> >>  3 files changed, 32 insertions(+), 25 deletions(-)
> >> >>  create mode 100644 linux-user/arm/semihost.c
> >> >>
> >> >> diff --git a/linux-user/Makefile.objs b/linux-user/Makefile.objs
> >> >> index 769b8d83362..285c5dfa17a 100644
> >> >> --- a/linux-user/Makefile.objs
> >> >> +++ b/linux-user/Makefile.objs
> >> >> @@ -6,4 +6,6 @@ obj-y =3D main.o syscall.o strace.o mmap.o signal.o=
 \
> >> >>  obj-$(TARGET_HAS_BFLT) +=3D flatload.o
> >> >>  obj-$(TARGET_I386) +=3D vm86.o
> >> >>  obj-$(TARGET_ARM) +=3D arm/nwfpe/
> >> >> +obj-$(TARGET_ARM) +=3D arm/semihost.o
> >> >> +obj-$(TARGET_AARCH64) +=3D arm/semihost.o
> >> >>  obj-$(TARGET_M68K) +=3D m68k-sim.o
> >> >> diff --git a/linux-user/arm/semihost.c b/linux-user/arm/semihost.c
> >> >> new file mode 100644
> >> >> index 00000000000..9554102a855
> >> >> --- /dev/null
> >> >> +++ b/linux-user/arm/semihost.c
> >> >> @@ -0,0 +1,24 @@
> >> >> +/*
> >> >> + * ARM Semihosting Console Support
> >> >> + *
> >> >> + * Copyright (c) 2019 Linaro Ltd
> >> >> + *
> >> >> + * Currently ARM is unique in having support for semihosting suppo=
rt
> >> >> + * in linux-user. So for now we implement the common console API b=
ut
> >> >> + * just for arm linux-user.
> >> >> + *
> >> >> + * SPDX-License-Identifier: GPL-2.0-or-later
> >> >> + */
> >> >> +
> >> >> +#include "qemu/osdep.h"
> >> >> +#include "cpu.h"
> >> >> +#include "hw/semihosting/console.h"
> >> >> +#include "qemu.h"
> >> >> +
> >> >> +int qemu_semihosting_console_out(CPUArchState *env, target_ulong a=
ddr,
> >> >> int len)
> >> >> +{
> >> >> +    void *s =3D lock_user_string(addr);
> >> >> +    len =3D write(STDERR_FILENO, s, len ? len : strlen(s));
> >> >> +    unlock_user(s, addr, 0);
> >> >> +    return len;
> >> >> +}
> >> >> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> >> >> index 9e5a414dd89..253c66b172a 100644
> >> >> --- a/target/arm/arm-semi.c
> >> >> +++ b/target/arm/arm-semi.c
> >> >> @@ -27,6 +27,7 @@
> >> >>
> >> >>  #include "cpu.h"
> >> >>  #include "hw/semihosting/semihost.h"
> >> >> +#include "hw/semihosting/console.h"
> >> >>  #ifdef CONFIG_USER_ONLY
> >> >>  #include "qemu.h"
> >> >>
> >> >> @@ -314,32 +315,12 @@ target_ulong do_arm_semihosting(CPUARMState *=
env)
> >> >>              return set_swi_errno(ts, close(arg0));
> >> >>          }
> >> >>      case TARGET_SYS_WRITEC:
> >> >> -        {
> >> >> -          char c;
> >> >> -
> >> >> -          if (get_user_u8(c, args))
> >> >> -              /* FIXME - should this error code be -TARGET_EFAULT =
? */
> >> >> -              return (uint32_t)-1;
> >> >> -          /* Write to debug console.  stderr is near enough.  */
> >> >> -          if (use_gdb_syscalls()) {
> >> >> -                return arm_gdb_syscall(cpu, arm_semi_cb,
> >> >> "write,2,%x,1",
> >> >> args);
> >> >> -          } else {
> >> >> -                return write(STDERR_FILENO, &c, 1);
> >> >> -          }
> >> >> -        }
> >> >> +    {
> >> >> +        qemu_semihosting_console_out(env, args, 1);
> >> >> +        return 0xdeadbeef;
> >> >> +    }
> >> >>      case TARGET_SYS_WRITE0:
> >> >> -        if (!(s =3D lock_user_string(args)))
> >> >> -            /* FIXME - should this error code be -TARGET_EFAULT ? =
*/
> >> >> -            return (uint32_t)-1;
> >> >> -        len =3D strlen(s);
> >> >> -        if (use_gdb_syscalls()) {
> >> >> -            return arm_gdb_syscall(cpu, arm_semi_cb, "write,2,%x,%=
x",
> >> >> -                                   args, len);
> >> >> -        } else {
> >> >> -            ret =3D write(STDERR_FILENO, s, len);
> >> >> -        }
> >> >> -        unlock_user(s, args, 0);
> >> >> -        return ret;
> >> >> +        return qemu_semihosting_console_out(env, args, 0);
> >> >>      case TARGET_SYS_WRITE:
> >> >>          GET_ARG(0);
> >> >>          GET_ARG(1);
> >> >> --
> >> >> 2.20.1
> >> >>
> >> >>
> >> >
> >> > Hi Alex,
> >> >
> >> > this patch breaks build for softmmu target when CONFIG_SEMIHOSTING i=
s
> >> > not
> >> > enabled as qemu_semihosting_console_out
> >> > is not defined in such case - neither linux-user/arm/semihost.c nor
> >> > hw/semihosting/console.c compiled and function
> >> > is not in stubs/semihost.c
> >>
> >> How do you do that? I tried ../../configure --without-default-devices
> >> and that still builds for me.
> >
> > It's usual RHEL way - use --without-default-devices and use specific
> > list of enabled devices (this mean disable CONFIG_SEMIHOSTING in
> > default_config/* file).
>=20
> OK - so from the upstream source tree CONFIG_SEMIHOSTING is still =3Dy
> (but I can see most of them are now =3Dn). Isn't the simplest solution to
> fix-up your version of the default_config file to include SEMIHOSTING?
>=20

It's fix but it goes against our policy of handling CONFIG options so we
would prefer to have this fixed - otherwise there's no meaning in having
config option if you can't disable it.

> Is this an out-of-tree RHEL addition?
>

No, it's RHEL device config handling.

Mirek
=20
> >>
> >> But I suspect what's needed is to change:
> >>
> >> #ifndef CONFIG_USER_ONLY
> >>
> >> to
> >>
> >> #ifdef CONFIG_SEMIHOSTING
> >>
> >> to the relevant headers and helper bits.
> >
> > Yeah, have to find out what are relevant pieces.
> >
> > Mirek
> >
> >>
> >> >
> >> > Mirek
> >>
> >>
> >> --
> >> Alex Benn=C3=A9e
> >>
>=20
>=20
> --
> Alex Benn=C3=A9e
>=20

--=20
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer


