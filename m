Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B358B6DAC3B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 13:31:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkkIa-00024K-4R; Fri, 07 Apr 2023 07:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pkkIX-000246-Vd
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 07:30:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pkkIW-0007wy-1I
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 07:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680867026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NtfQbhfX5QYdxw0EJ/QYJ7eXlNUpLL9gqz3vr0BpmRE=;
 b=XI+iWjkX/Lc7VYsUtBZsl5XUOVKZTgnufLPZGp3IWjUOj/kXWON9AHB4ov/M03Z8P376DL
 26Iu7459FGS7nIq3Hh9hNJyZoaAqgDsSwGOygOEkZkeN4w29Xv7tAIYhFjFNfkwyJLOyJa
 RtNaxHiVNnUSJlg0JUEAY94yddOvd8o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-t2tx6aHPP9-flp5R_4ePDg-1; Fri, 07 Apr 2023 07:30:22 -0400
X-MC-Unique: t2tx6aHPP9-flp5R_4ePDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB1CF185A78F;
 Fri,  7 Apr 2023 11:30:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 311CB40C6EC4;
 Fri,  7 Apr 2023 11:30:20 +0000 (UTC)
Date: Fri, 7 Apr 2023 07:30:19 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH for-8.1] qemu-coroutine: remove qatomic_mb_read()
Message-ID: <20230407113019.GA778714@fedora>
References: <20230406100759.240870-1-pbonzini@redhat.com>
 <CAJSP0QVkrcU=v77jjnLZsUN3eVKF4RyJ+aLT2_EV4hX=HfL6Vg@mail.gmail.com>
 <CABgObfbCV+KVCq6Cj7_70OcOmuj8ZiULBeSjK19n6ia=n3OTNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lUCAjG79jun5LiAT"
Content-Disposition: inline
In-Reply-To: <CABgObfbCV+KVCq6Cj7_70OcOmuj8ZiULBeSjK19n6ia=n3OTNw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--lUCAjG79jun5LiAT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 07, 2023 at 10:32:39AM +0200, Paolo Bonzini wrote:
> Il gio 6 apr 2023, 12:55 Stefan Hajnoczi <stefanha@gmail.com> ha scritto:
>=20
> > On Thu, 6 Apr 2023 at 06:09, Paolo Bonzini <pbonzini@redhat.com> wrote:
> > >
> > > Replace with an explicit barrier and a comment.
> > >
> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > > ---
> > >  util/qemu-coroutine.c | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
> > > index 849452369201..17a88f65053e 100644
> > > --- a/util/qemu-coroutine.c
> > > +++ b/util/qemu-coroutine.c
> > > @@ -127,9 +127,13 @@ void qemu_aio_coroutine_enter(AioContext *ctx,
> > Coroutine *co)
> > >          Coroutine *to =3D QSIMPLEQ_FIRST(&pending);
> > >          CoroutineAction ret;
> > >
> > > -        /* Cannot rely on the read barrier for to in aio_co_wake(), =
as
> > there are
> > > -         * callers outside of aio_co_wake() */
> > > -        const char *scheduled =3D qatomic_mb_read(&to->scheduled);
> > > +        /*
> > > +         * Read to before to->scheduled; pairs with qatomic_cmpxchg =
in
> > > +         * qemu_co_sleep(), aio_co_schedule() etc.
> > > +         */
> > > +        smp_read_barrier_depends();
> >
> > I'm not a fan of nuanced memory ordering primitives. I don't
> > understand or remember all the primitives available in
> > docs/devel/atomics.rst and especially not how they interact with each
> > other.
> >
>=20
> Understood, that's why I want to remove qatomic_mb_read().
>=20
> Does smp_read_barrier_depends() make sense for QEMU? Does QEMU support
> > Alpha host CPUs?
> >
>=20
> It makes sense in that it's cheaper than qatomic_load_acquire() or
> smp_rmb() on ARM and PPC (32-bit ARM is especially bad). Here I can use
> smp_rmb() if you prefer; I thought that the comment, explicitly referring
> to "to->scheduled" which depends on "to", would be enough.
>=20
> I could also use QSIMPLEQ_FIRST_RCU(&pending) to hide the barrier, but it
> seems to be a bad idea because there's no RCU involvement here.

If smp_read_barrier_depends() is cheaper on ARM and PPC than
qatomic_load_acquire() or smp_rmb(), then this seems like a good use of
it:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

I didn't know that smp_read_barrier_depends() is relevant on any
architecture other than Alpha. It would be nice if atomics.rst mentioned
ARM and PPC rather than Alpha.

Thanks,
Stefan

--lUCAjG79jun5LiAT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQv/ssACgkQnKSrs4Gr
c8gjpQgAirLB1XwzH5vIL9MMRAGOoJ5xB/dL2o2aDWrKiJtfrJUh5RN695B7Q4mI
OBsMeXvAczPxWV8zMBjiQJKVpocpg7sSqJWwx89NaGNSivg9QX8jZNdMdiDA8sim
uQY7+mb5JASoNQfudkL2AVHZej49SmTfjjpXZoBwciWERMndqYX9tBAVHN6J020i
gePSFCIpldhdOgmXq/LmuKCGELV0rwQ+U4c+lVbGzCYipjBohzWyn6ZTs07i/5lM
QBG1yho6YBWUsAk08H2ckXaB54AMQUxIiH91SYFe2KQcl6ILchppjT8yX0qv9+SN
v4aaOEfkNKjxTN0xBQxLLAPpLUmquA==
=G9/G
-----END PGP SIGNATURE-----

--lUCAjG79jun5LiAT--


