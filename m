Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E318B140697
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 10:44:05 +0100 (CET)
Received: from localhost ([::1]:54548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isOAe-0003xZ-FP
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 04:44:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49839)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1isO7k-0000Mh-Qg
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 04:41:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1isO7g-0008Pn-Pv
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 04:41:04 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59452)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1isO7g-0008Ov-Hv
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 04:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579254059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vysc0QLvNmazwH3On4TGOG79RauthPxhQHvOVOs88RI=;
 b=EnKddB5qLoSgLt/4qvi0A+jKGpzjTUFypSZLImPEgmjmrDPvFSt90LWxKIvhWDoNcUCsuY
 neVLk3IRSNOsIuLtHYJ2CPseNFI2rwEdyRvK4UKVGLarJvZDCFLihb5aEbRrZWeAn4GuF+
 pHY+17uX/oxkzL6Gaw0PWh4NTiIOh0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-cO4zedEWPTGG5m5IcFfg-w-1; Fri, 17 Jan 2020 04:40:56 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26FA918FE860;
 Fri, 17 Jan 2020 09:40:55 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82D895D9CD;
 Fri, 17 Jan 2020 09:40:51 +0000 (UTC)
Date: Fri, 17 Jan 2020 10:40:50 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 1/4] qapi: Add a 'coroutine' flag for commands
Message-ID: <20200117094050.GA7394@dhcp-200-226.str.redhat.com>
References: <20200115122326.26393-1-kwolf@redhat.com>
 <20200115122326.26393-2-kwolf@redhat.com>
 <875zhc9360.fsf@dusky.pond.sub.org>
 <20200115155850.GG5505@linux.fritz.box>
 <871rrzy2sg.fsf@dusky.pond.sub.org>
 <20200116150214.GH9470@linux.fritz.box>
 <87o8v2o6r2.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87o8v2o6r2.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: cO4zedEWPTGG5m5IcFfg-w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: stefanha@redhat.com, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.01.2020 um 08:57 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
>=20
> > Am 16.01.2020 um 14:00 hat Markus Armbruster geschrieben:
> >> Kevin Wolf <kwolf@redhat.com> writes:
> >> > I have no idea if we will eventually get a case where the command wa=
nts
> >> > to behave different between the two modes and actually has use for a
> >> > coroutine. I hope not.
> >> >
> >> > But using two bools rather than a single enum keeps the code simple =
and
> >> > leaves us all options open if it turns out that we do have a use cas=
e.
> >>=20
> >> I can buy the argument "the two are conceptually orthogonal, although =
we
> >> don't haven't found a use for one of the four cases".
> >>=20
> >> Let's review the four combinations of the two flags once more:
> >>=20
> >> * allow-oob: false, coroutine: false
> >>=20
> >>   Handler runs in main loop, outside coroutine context.  Okay.
> >>=20
> >> * allow-oob: false, coroutine: true
> >>=20
> >>   Handler runs in main loop, in coroutine context.  Okay.
> >>=20
> >> * allow-oob: true, coroutine: false
> >>=20
> >>   Handler may run in main loop or in iothread, outside coroutine
> >>   context.  Okay.
> >>=20
> >> * allow-oob: true, coroutine: true
> >>=20
> >>   Handler may run (in main loop, in coroutine context) or (in iothread=
,
> >>   outside coroutine context).  This "in coroutine context only with
> >>   execute, not with exec-oob" behavior is a bit surprising.
> >>=20
> >>   We could document it, noting that it may change to always run in
> >>   coroutine context.  Or we simply reject this case as "not
> >>   implemented".  Since we have no uses, I'm leaning towards reject.  O=
ne
> >>   fewer case to test then.
> >
> > What would be the right mode of rejecting it?
> >
> > I assume we should catch it somewhere in the QAPI generator (where?) an=
d
>=20
> check_flags() in expr.py?

Looks like the right place, thanks.

> > then just assert in the C code that both flags aren't set at the same
> > time?
>=20
> I think you already do, in do_qmp_dispatch():
>=20
>     assert(!(oob && qemu_in_coroutine()));
>=20
> Not sure that's the best spot.  Let's see when I review PATCH 3.

This asserts that exec-oob handlers aren't executed in coroutine
context. It doesn't assert that the handler doesn't have QCO_COROUTINE
and QCO_ALLOW_OOB set at the same time.

> >> >> > @@ -194,8 +195,9 @@ out:
> >> >> >      return ret
> >> >> > =20
> >> >> > =20
> >> >> > -def gen_register_command(name, success_response, allow_oob, allo=
w_preconfig):
> >> >> > -    options =3D []
> >> >> > +def gen_register_command(name: str, success_response: bool, allo=
w_oob: bool,
> >> >> > +                         allow_preconfig: bool, coroutine: bool)=
 -> str:
> >> >> > +    options =3D [] # type: List[str]
> >>=20
> >> One more: this is a PEP 484 type hint.  With Python 3, we can use PEP
> >> 526 instead:
> >>=20
> >>           options: List[str] =3D []
> >>=20
> >> I think we should.
> >
> > This requires Python 3.6, unfortunately. The minimum requirement for
> > building QEMU is 3.5.
>=20
> *Sigh*

One of the reasons why I would have preferred 3.6 as the minimum, but
our policy says that Debian oldstabe is still relevant for another two
years. *shrug*

Kevin


