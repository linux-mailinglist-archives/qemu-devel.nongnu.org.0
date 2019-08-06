Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAD5832B2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 15:29:55 +0200 (CEST)
Received: from localhost ([::1]:33294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huzXG-0000eL-R4
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 09:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57010)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1huzWa-0008EO-Fw
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:29:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1huzWZ-0005XY-5y
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:29:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55658)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1huzWY-0005XC-Ug
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:29:11 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EC040309DEE6;
 Tue,  6 Aug 2019 13:29:09 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A8E65D6A7;
 Tue,  6 Aug 2019 13:29:06 +0000 (UTC)
Date: Tue, 6 Aug 2019 14:29:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190806132904.GH14887@redhat.com>
References: <20190713165856.29883-1-philmd@redhat.com>
 <20190806124408.GE14887@redhat.com>
 <CAFEAcA8=+n_+dF2o4bDtY4T5G=_rYySTEHmf1KSb0qWQJN0BfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA8=+n_+dF2o4bDtY4T5G=_rYySTEHmf1KSb0qWQJN0BfQ@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 06 Aug 2019 13:29:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH-for-4.1] Makefile: Fix the NSIS Windows
 builds
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, Adam Baxter <voltagex@voltagex.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 06, 2019 at 02:25:27PM +0100, Peter Maydell wrote:
> On Tue, 6 Aug 2019 at 13:44, Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
> >
> > On Sat, Jul 13, 2019 at 06:58:56PM +0200, Philippe Mathieu-Daud=C3=A9=
 wrote:
> > > The qemu-nsis.bmp file was not listed with the other blobs, thus
> > > not installed in the ${BINDIR} location.
> > >
> > > This fixes:
> > >
> > >   $ make installer
> > >   [...]
> > >   (cd /tmp/qemu-nsis; \
> > >            for i in qemu-system-*.exe; do \
> > >              arch=3D${i%.exe}; \
> > >              arch=3D${arch#qemu-system-}; \
> > >              echo Section \"$arch\" Section_$arch; \
> > >              echo SetOutPath \"\$INSTDIR\"; \
> > >              echo File \"\${BINDIR}\\$i\"; \
> > >              echo SectionEnd; \
> > >            done \
> > >           ) >/tmp/qemu-nsis/system-emulations.nsh
> > >   makensis -V2 -NOCD \
> > >                   -DCONFIG_DOCUMENTATION=3D"y" \
> > >                    \
> > >                   -DBINDIR=3D"/tmp/qemu-nsis" \
> > >                    \
> > >                   -DSRCDIR=3D"/home/phil/source/qemu" \
> > >                   -DOUTFILE=3D"qemu-setup-4.0.90.exe" \
> > >                   -DDISPLAYVERSION=3D"4.0.90" \
> > >                   /home/phil/source/qemu/qemu.nsi
> > >   File: "/tmp/qemu-nsis\*.bmp" -> no files found.
> > >   Usage: File [/nonfatal] [/a] ([/r] [/x filespec [...]] filespec [=
...] |
> > >      /oname=3Doutfile one_file_only)
> > >   Error in script "/home/phil/source/qemu/qemu.nsi" on line 122 -- =
aborting creation process
> > >   Makefile:1077: recipe for target 'qemu-setup-4.0.90.exe' failed
> > >   make: *** [qemu-setup-4.0.90.exe] Error 1
> > >
> > > Fixes: https://bugs.launchpad.net/bugs/1836453
> > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > > ---
> > > Based-on: 20190713163558.13204-1-philmd@redhat.com
> > > https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg03204.html
> > >
> > > $ file qemu-setup-4.0.90.exe
> > > qemu-setup-4.0.90.exe: PE32 executable (GUI) Intel 80386 (stripped =
to external PDB), for MS Windows, Nullsoft Installer self-extracting arch=
ive
> > > ---
> > >  Makefile | 1 +
> > >  1 file changed, 1 insertion(+)
> >
> > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>=20
> I thought for a moment that this was another patch we'd missed putting
> in 4.1, but it went in as commit b3ce38dcf93a12038ce on July 15th, so
> we're OK.

Opps, sorry for the noise. I didn't see any response to the original
posting, so didn't realize it had been picked up.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

