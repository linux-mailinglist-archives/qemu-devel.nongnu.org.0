Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3246121D4B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 20:27:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52184 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRha5-00083V-3g
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 14:27:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hRhXw-0006d9-K0
	for qemu-devel@nongnu.org; Fri, 17 May 2019 14:25:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hRhXv-0008Ql-EP
	for qemu-devel@nongnu.org; Fri, 17 May 2019 14:25:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55044)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hRhXv-0008Pi-5p
	for qemu-devel@nongnu.org; Fri, 17 May 2019 14:25:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD8D7C04BD48;
	Fri, 17 May 2019 18:25:28 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 17FD35C21E;
	Fri, 17 May 2019 18:25:26 +0000 (UTC)
Date: Fri, 17 May 2019 15:25:25 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Yury Kotov <yury-kotov@yandex-team.ru>
Message-ID: <20190517182525.GM4189@habkost.net>
References: <156671554283778@vla1-1374b6242101.qloud-c.yandex.net>
	<20190404095212.GC2678@work-vm>
	<111121554372069@iva7-0f652523820f.qloud-c.yandex.net>
	<880271555505167@vla1-9d3c37294942.qloud-c.yandex.net>
	<460551557826929@iva6-8a76e93b6298.qloud-c.yandex.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <460551557826929@iva6-8a76e93b6298.qloud-c.yandex.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 17 May 2019 18:25:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH] QEMU may write to system_memory before
 guest starts
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
	Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"wrfsh@yandex-team.ru" <wrfsh@yandex-team.ru>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


My memory is failing here: do we still need to fix a bug where
there are unexpected writes to system_memory, or this is just a
request to include a mechanism to help us detect those cases in
the future?


On Tue, May 14, 2019 at 12:42:14PM +0300, Yury Kotov wrote:
> Ping ping
>=20
> 17.04.2019, 15:46, "Yury Kotov" <yury-kotov@yandex-team.ru>:
> > Ping
> >
> > 04.04.2019, 13:01, "Yury Kotov" <yury-kotov@yandex-team.ru>:
> >> =C2=A0I saw Catherine Ho's patch series and it seems ok to me, but i=
n this RFC I asked
> >> =C2=A0about a way how to detect other writes which may not be covere=
d by particular
> >> =C2=A0fixes.
> >> =C2=A0Perhaps this is excessive caution...
> >>
> >> =C2=A0Regards,
> >> =C2=A0Yury
> >>
> >> =C2=A004.04.2019, 12:52, "Dr. David Alan Gilbert" <dgilbert@redhat.c=
om>:
> >>> =C2=A0=C2=A0* =D0=AE=D1=80=D0=B8=D0=B9 =D0=9A=D0=BE=D1=82=D0=BE=D0=B2=
 (yury-kotov@yandex-team.ru) wrote:
> >>>> =C2=A0=C2=A0=C2=A0Ping
> >>>
> >>> =C2=A0=C2=A0Is this fixed by Catherine Ho's patch series?
> >>>
> >>> =C2=A0=C2=A0Dave
> >>>
> >>>> =C2=A0=C2=A0=C2=A021.03.2019, 19:27, "Yury Kotov" <yury-kotov@yand=
ex-team.ru>:
> >>>> =C2=A0=C2=A0=C2=A0> Hi,
> >>>> =C2=A0=C2=A0=C2=A0>
> >>>> =C2=A0=C2=A0=C2=A0> 19.03.2019, 14:52, "Dr. David Alan Gilbert" <d=
gilbert@redhat.com>:
> >>>> =C2=A0=C2=A0=C2=A0>> =C2=A0* Peter Maydell (peter.maydell@linaro.o=
rg) wrote:
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0On Tue, 19 Mar 2019 at 11:03, Dr=
. David Alan Gilbert
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0<dgilbert@redhat.com> wrote:
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0>
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0> * Peter Maydell (peter.maydell=
@linaro.org) wrote:
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0> > I didn't think migration dis=
tinguished between "main memory"
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0> > and any other kind of RAMBlo=
ck-backed memory ?
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0>
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0> In Yury's case there's a disti=
nction between RAMBlock's that are mapped
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0> with RAM_SHARED (which normall=
y ends up as MAP_SHARED) and all others.
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0> You can set that for main memo=
ry by using -numa to specify a memdev
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0> that's backed by a file and ha=
s the share=3Don property.
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0>
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0> On x86 the ROMs end up as sepa=
rate RAMBlock's that aren't affected
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0> by that -numa/share=3Don - so =
they don't fight Yury's trick.
> >>>> =C2=A0=C2=A0=C2=A0>>>
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0You can use the generic loader o=
n x86 to load an ELF file
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0into RAM if you want, which woul=
d I think also trigger this.
> >>>> =C2=A0=C2=A0=C2=A0>>
> >>>> =C2=A0=C2=A0=C2=A0>> =C2=A0OK, although that doesn't worry me too =
much - since in the majority
> >>>> =C2=A0=C2=A0=C2=A0>> =C2=A0of cases Yury's trick still works well.
> >>>> =C2=A0=C2=A0=C2=A0>>
> >>>> =C2=A0=C2=A0=C2=A0>> =C2=A0I wonder if there's a way to make Yury'=
s code to detect these cases
> >>>> =C2=A0=C2=A0=C2=A0>> =C2=A0and not allow the feature; the best thi=
ng for the moment would seem to
> >>>> =C2=A0=C2=A0=C2=A0>> =C2=A0be to skip the aarch test that uses elf=
 loading.
> >>>> =C2=A0=C2=A0=C2=A0>
> >>>> =C2=A0=C2=A0=C2=A0> Currently, I've no idea how to detect such cas=
es, but there is an ability to
> >>>> =C2=A0=C2=A0=C2=A0> detect memory corruption. I want to update the=
 RFC patch to let user to map some
> >>>> =C2=A0=C2=A0=C2=A0> memory regions as readonly until incoming migr=
ation start.
> >>>> =C2=A0=C2=A0=C2=A0>
> >>>> =C2=A0=C2=A0=C2=A0> E.g.
> >>>> =C2=A0=C2=A0=C2=A0> 1) If x-ignore-shared is enabled in command li=
ne or memory region is marked
> >>>> =C2=A0=C2=A0=C2=A0> =C2=A0=C2=A0=C2=A0(something like ',readonly=3D=
on'),
> >>>> =C2=A0=C2=A0=C2=A0> 2) Memory region is shared (,share=3Don),
> >>>> =C2=A0=C2=A0=C2=A0> 3) And qemu is started with '-incoming' option
> >>>> =C2=A0=C2=A0=C2=A0>
> >>>> =C2=A0=C2=A0=C2=A0> Then map such regions as readonly until incomi=
ng migration finished.
> >>>> =C2=A0=C2=A0=C2=A0> Thus, the patch will be able to detect memory =
corruption and will not affect
> >>>> =C2=A0=C2=A0=C2=A0> normal cases.
> >>>> =C2=A0=C2=A0=C2=A0>
> >>>> =C2=A0=C2=A0=C2=A0> How do you think, is it needed?
> >>>> =C2=A0=C2=A0=C2=A0>
> >>>> =C2=A0=C2=A0=C2=A0> I already have a cleaner version of the RFC pa=
tch, but I'm not sure about 1).
> >>>> =C2=A0=C2=A0=C2=A0> Which way is better: enable capability in comm=
and line, add a new option for
> >>>> =C2=A0=C2=A0=C2=A0> memory-backend or something else.
> >>>> =C2=A0=C2=A0=C2=A0>
> >>>> =C2=A0=C2=A0=C2=A0>> =C2=A0Dave
> >>>> =C2=A0=C2=A0=C2=A0>>
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0thanks
> >>>> =C2=A0=C2=A0=C2=A0>>> =C2=A0=C2=A0-- PMM
> >>>> =C2=A0=C2=A0=C2=A0>> =C2=A0--
> >>>> =C2=A0=C2=A0=C2=A0>> =C2=A0Dr. David Alan Gilbert / dgilbert@redha=
t.com / Manchester, UK
> >>>> =C2=A0=C2=A0=C2=A0>
> >>>> =C2=A0=C2=A0=C2=A0> Regards,
> >>>> =C2=A0=C2=A0=C2=A0> Yury
> >>> =C2=A0=C2=A0--
> >>> =C2=A0=C2=A0Dr. David Alan Gilbert / dgilbert@redhat.com / Manchest=
er, UK

--=20
Eduardo

