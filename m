Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA21D718F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 10:50:18 +0200 (CEST)
Received: from localhost ([::1]:37738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKIX3-00015d-7q
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 04:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60357)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iKIUQ-0007I9-EO
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 04:47:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iKIUO-0000y5-Hj
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 04:47:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33244)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iKIUK-0000wP-Ia
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 04:47:30 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 94AD881129;
 Tue, 15 Oct 2019 08:47:26 +0000 (UTC)
Received: from redhat.com (ovpn-112-30.ams2.redhat.com [10.36.112.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F66460BE2;
 Tue, 15 Oct 2019 08:47:24 +0000 (UTC)
Date: Tue, 15 Oct 2019 09:47:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: RFC: Why dont we move to newer capstone?
Message-ID: <20191015084722.GD22859@redhat.com>
References: <CALvKS=E-t1c+BVDn=0RbM8nBry8GcYOXh-PrziQO7XhS7W2NUw@mail.gmail.com>
 <CALvKS=GB1-zDnkKxei6Dn5MNyr5kwj+vEtD_3MZyVNfzqQuRZg@mail.gmail.com>
 <CAFEAcA-gLHm0D6vR0Rvpbi_bbVWpKspvm8YLSVPHpCVP6HmDUg@mail.gmail.com>
 <20191015082708.GB22859@redhat.com>
 <0a4262f8-df07-e83e-0928-b6cf4e12800d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0a4262f8-df07-e83e-0928-b6cf4e12800d@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 15 Oct 2019 08:47:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 15, 2019 at 10:36:40AM +0200, Thomas Huth wrote:
> On 15/10/2019 10.27, Daniel P. Berrang=C3=A9 wrote:
> > On Sat, Oct 05, 2019 at 02:33:34PM +0100, Peter Maydell wrote:
> >> On Sat, 5 Oct 2019 at 11:21, Lucien Murray-Pitts
> >> <lucienmp.qemu@gmail.com> wrote:
> >>> Whilst working on a m68k patch I noticed that the capstone in use
> >>> today (3.0) doesnt support the M68K and thus a hand turned disasm
> >>> function is used.
> >>>
> >>> The newer capstone (5.0) appears to support a few more CPU, inc. m6=
8k.
> >>>
> >>> Why we move to this newer capstone?
> >>
> >> Moving to a newer capstone sounds like a good idea. The only
> >> reason we haven't moved forward as far as I'm aware is that
> >> nobody has done the work to send a patch to do that move
> >> forward to the newer version. Richard Henderson would
> >> probably know if there was any other blocker.
> >=20
> > Bearing in mind our distro support policy, we need to continue to
> > support 3.0 series of capstone for a while yet based on what I
> > see in various distros. eg Ubuntu 18.04 LTS has 3.0.4, as does
> > Fedora 29.  Version 4.0 is only in a few very new distros:
> >=20
> >    https://repology.org/project/capstone/versions
> >=20
> > We can of course use features from newer capstone, *provided* we corr=
ectly
> > do conditional compilation so that we can still build against 3.0 ser=
ies
> > on distros that have that version.
>=20
> We're embedding the capstone submodule in the release tarballs, so I
> think we're independent from the distro release, aren't we? So this
> should not be an issue, as far as I can see.

It is an issue for people/distros who don't want to building with bundled
3rd party code.

I'd suggest it is probably time we could drop the capstone git submodule.
We originally added it because capstone wasn't widely present in distros
we care about. AFAICT, it is now present in all the distros, so could be
treated the same way as any other 3rd party library dep we have.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

