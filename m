Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423892DC271
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 15:46:56 +0100 (CET)
Received: from localhost ([::1]:37522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpY4t-00027Q-3w
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 09:46:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpY11-0007Rd-Jv
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:42:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpY0z-0000is-7H
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608129771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7vMCLcqRR1eNRYu6OA4/IViHWXTbaZyoys0aGofRiEc=;
 b=YGpTnrQjAREK0Psp8h5K5woWHN73whtlkSNjoepVkEm2Apq32cSUOfUaPr4PcuX7ow9SFN
 CA4NzTc0ejl4BvLQNCH8mimgvL+VFXVO0Y6ygSuV6DCwF6f0ZDB8gKmbBQgAHj8ZJ294sE
 0HOYwuT8cXMTc0O0rY1hqLcJv3m7HTQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-Ne41Ol0_Mr639TD5tXV40A-1; Wed, 16 Dec 2020 09:42:48 -0500
X-MC-Unique: Ne41Ol0_Mr639TD5tXV40A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BAE7100E345;
 Wed, 16 Dec 2020 14:42:42 +0000 (UTC)
Received: from localhost (ovpn-115-151.ams2.redhat.com [10.36.115.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2651FE713;
 Wed, 16 Dec 2020 14:42:41 +0000 (UTC)
Date: Wed, 16 Dec 2020 14:42:41 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/3] trace: recommend "log" backend for getting started
 with tracing
Message-ID: <20201216144241.GA707467@stefanha-x1.localdomain>
References: <20201209174225.401337-1-stefanha@redhat.com>
 <20201209174225.401337-4-stefanha@redhat.com>
 <CAFEAcA9nwUtgVF3-n=tfJ6JDTViP-G2XQhSWk-n-tEuV_aGvyQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9nwUtgVF3-n=tfJ6JDTViP-G2XQhSWk-n-tEuV_aGvyQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2020 at 03:06:17PM +0000, Peter Maydell wrote:
> On Wed, 9 Dec 2020 at 17:42, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > The "simple" backend is actually more complicated to use than the "log"
> > backend. Update the quickstart documentation to feature the "log"
> > backend instead of the "simple" backend.
> >
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  docs/devel/tracing.rst | 19 ++++++++-----------
> >  1 file changed, 8 insertions(+), 11 deletions(-)
> >
> > diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
> > index 76cc1b24fa..039a0bb267 100644
> > --- a/docs/devel/tracing.rst
> > +++ b/docs/devel/tracing.rst
> > @@ -11,9 +11,9 @@ for debugging, profiling, and observing execution.
> >  Quickstart
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > -1. Build with the 'simple' trace backend::
> > +1. Build with the 'log' trace backend::
> >
> > -    ./configure --enable-trace-backends=3Dsimple
> > +    ./configure --enable-trace-backends=3Dlog
> >      make
>=20
> Isn't this the default ?
>=20
> It seems to me that the real "quickstart" is
> "your QEMU binary was likely already built with the log backend,
> so all you need to do is pass it '-trace eventname -trace eventname'
> or '-trace some-pattern*'" (or whatever the syntax is: I
> usually use -d trace=3Dsomething but I assume we'd rather suggest
> -trace to new users ?)
>=20
> We can suggest also "if you have a lot of events you might find
> it useful to put them in a file and use --trace events=3Dfile"
> but IME that's not the common case for "getting started with
> just outputting trace events" because you can usually enable
> a whole device's trace events with one suitable glob pattern.

Good idea, I'll simplify the quickstart section.

> >  2. Create a file with the events you want to trace::
> > @@ -24,10 +24,6 @@ Quickstart
> >
> >      qemu --trace events=3D/tmp/events ... # your normal QEMU invocatio=
n
> >
> > -4. Pretty-print the binary trace file::
> > -
> > -    ./scripts/simpletrace.py trace-events-all trace-* # Override * wit=
h QEMU <pid>
> > -
> >  Trace events
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > @@ -195,7 +191,7 @@ script.
> >
> >  The trace backends are chosen at configure time::
> >
> > -    ./configure --enable-trace-backends=3Dsimple
> > +    ./configure --enable-trace-backends=3Dlog
>=20
> 'log' is the default so we don't need to specifically suggest people
> select it as a configure argument.

Will fix.

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/aHOAACgkQnKSrs4Gr
c8ij6Qf/U4kHEkXJBTXo679L1OvZBfsgenNFwtLwlfXIfinnVLroi+JjxoKlZpYP
oZuDnF/sofzaBGbRFpVlw3ur+mWlaCKRArA+4sh3ySA/pucsfxe9NMgPBnY9vUk7
v0j8oC4kLUpnpFe43oBOcG6Jp8Wqe0l+LHsjcPA9SZ6EsvJ2FizbknJNDRbsbFKn
aGSqreO4zSBWxmo7o/ejEniia5e5pWF37oIrWAmQsUCfZtrf8w2bavBq0asIpRFu
kwzswRVsjQ93b6zO8yHKLkFixtYxDnVUhVVvlFxJr4LsCkb5mKTsrxMAYzk2Hqsw
sra1GvJrN0n0wRSNVrybi5fXJ0Q2Ew==
=ELzD
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--


