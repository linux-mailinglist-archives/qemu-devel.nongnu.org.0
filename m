Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FB0B4FE9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 16:07:26 +0200 (CEST)
Received: from localhost ([::1]:46534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAE8b-0003q5-9l
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 10:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49580)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iAE7E-000390-B2
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 10:06:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iAE7D-0004Qe-4M
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 10:06:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33368)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iAE76-0004NK-Lv; Tue, 17 Sep 2019 10:05:52 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B56CF197BCE9;
 Tue, 17 Sep 2019 14:05:51 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-202.ams2.redhat.com
 [10.36.116.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B9F460318;
 Tue, 17 Sep 2019 14:05:38 +0000 (UTC)
Date: Tue, 17 Sep 2019 16:05:36 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20190917140536.GE4824@localhost.localdomain>
References: <44f97011-4a02-7832-c253-d43474f79d44@redhat.com>
 <a829185c-7c09-5afe-1479-15054ad59807@redhat.com>
 <33f60f4e-8156-e46f-8500-79b0982348b2@redhat.com>
 <c38acedf-d3db-384f-4aea-967ef3f87fdd@redhat.com>
 <20190917084012.GA4824@localhost.localdomain>
 <e9c8a9f5-80d9-b003-8036-0ba8df352ec3@redhat.com>
 <20190917112212.GB4824@localhost.localdomain>
 <1bed5587-63bf-2fe5-fe6a-4ac337058e2a@redhat.com>
 <20190917134235.GC4824@localhost.localdomain>
 <8109abd4-0e48-c9af-4de3-7bb60875a4f4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8109abd4-0e48-c9af-4de3-7bb60875a4f4@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Tue, 17 Sep 2019 14:05:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 6/8] iotests: Test driver whitelisting
 in 093
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.09.2019 um 15:44 hat John Snow geschrieben:
>=20
>=20
> On 9/17/19 9:42 AM, Kevin Wolf wrote:
> > Am 17.09.2019 um 15:09 hat John Snow geschrieben:
> >> On 9/17/19 7:22 AM, Kevin Wolf wrote:
> >>> Am 17.09.2019 um 13:07 hat Max Reitz geschrieben:
> >>>> On 17.09.19 10:40, Kevin Wolf wrote:
> >>>>> Am 17.09.2019 um 10:18 hat Max Reitz geschrieben:
> >>>>>> On 13.09.19 20:30, John Snow wrote:
> >>>>>>> I'd still like to define func_wrapper with a nod to the type co=
nstraint
> >>>>>>> it has:
> >>>>>>>
> >>>>>>> def func_wrapper(instance: iotests.QMPTestCase, *args, **kwargs=
):
> >>>>>>>     [...]
> >>>>>>>
> >>>>>>>
> >>>>>>> Then, you'd write:
> >>>>>>>
> >>>>>>> if callable(required_formats):
> >>>>>>>     fmts =3D required_formats(instance)
> >>>>>>> else:
> >>>>>>>     fmts =3D required_formats
> >>>>>>
> >>>>>> Yep, that anyway.  (Although I didn=E2=80=99t know about the =E2=
=80=9Cparam: type=E2=80=9D
> >>>>>> syntax and put that constraint in a comment instead.  Thanks aga=
in :-))
> >>>>>
> >>>>> Note that function annotations are Python 3 only, so we can't use=
 that
> >>>>> syntax yet anyway. If you want to use type hints that are underst=
ood by
> >>>>> tools (like mypy) and compatible with Python 2, you have to use
> >>>>> something like this (feel free to be more specific than Any):
> >>>>
> >>>> Do we really feel like staying compatible with Python 2, though?
> >>>
> >>> Feel like it? No.
> >>>
> >>> It's more that we are compelled to do so because we only deprecated=
 it
> >>> in 4.1.
> >>
> >> Sorry for the impromptu lesson on type hints in 3.5! I added that in=
 to
> >> my suggestion as a demonstrative example and didn't mean for you to =
use
> >> it as-is, sorry for not making that clear.
> >>
> >> I'm confused about the Python3 deprecation timeline. Normally we'd
> >> follow our standard approach, but it does hit EOL at the end of this
> >> year, so do we drop support then, too? I have the memory of a goldfi=
sh I
> >> suppose, and can't quite remember our conclusions, if any, of previo=
us
> >> discussions on this subject.
> >=20
> > It shouldn't make a difference actually because deprecation in 4.1 me=
ans
> > that 4.2 (in December) will be the last release that must still suppo=
rt
> > Python 2, and we can switch to Python 3 for 5.0.
> >=20
> >> If we do drop python2 though, the new minimum version appears to be =
3.5
> >> because that's what ships in EPEL. That'd give us standardized type
> >> hints that we can use for static analysis tools.
> >=20
> > Actually I seem to remember I suggested that we should make 3.5 the
> > minimum Python 3 version, and I thought a patch to this effect had be=
en
> > merged, but now I can't find any such check in configure. Maybe I sho=
uld
> > find the old thread again to see if there was any reason not to do th=
is.
> >=20
> > Personally, I would have preferred 3.6 because it brings in variable
> > annotations, but I think last time the conclusion was that it would b=
e
> > 3.5 indeed.
> >=20
>=20
> And with variable annotations you get data classes too, I believe, whic=
h
> are quite handy.

I didn't know these. Looks convenient, only in 3.7, though. We might be
there in five years.

Kevin

