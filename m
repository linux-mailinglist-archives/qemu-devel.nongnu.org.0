Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02DF6B244F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 13:39:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paFXu-0006tX-6N; Thu, 09 Mar 2023 07:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1paFXr-0006sJ-Jm
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:38:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1paFXp-0000tX-Fi
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678365532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ROAusS+3dWO5ys/W0bo4YYXMrMmmtGTM+qj100y7gE0=;
 b=YyURA/Dlum0dFEXQ2SqzGnd70INhGUaWPoxD1BzvowErYvfQKxKC7NCGIdBlifPHCKuRYa
 eddzxT/r2MlN6prj9Fa5OcoUtl21EJNy02k2uqyfEXf37jn7L6cmNc9g/qCFBSA6+asvOY
 vsn0cVs0AKmwe4sBb7QCLBhXJA2OsJQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-K4GyZVTqPZyEZoEaS9NIJA-1; Thu, 09 Mar 2023 07:38:49 -0500
X-MC-Unique: K4GyZVTqPZyEZoEaS9NIJA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A539D3C21C2D;
 Thu,  9 Mar 2023 12:38:48 +0000 (UTC)
Received: from localhost (unknown [10.39.194.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21E7740CF8ED;
 Thu,  9 Mar 2023 12:38:46 +0000 (UTC)
Date: Thu, 9 Mar 2023 07:38:45 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 1/6] block: don't acquire AioContext lock in
 bdrv_drain_all()
Message-ID: <20230309123845.GD370169@fedora>
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-2-stefanha@redhat.com>
 <ZAdxog0T8XkSSUZd@redhat.com> <20230307192019.GB153228@fedora>
 <ZAhL0Xz4tuUWPeXY@redhat.com> <20230308142621.GD299426@fedora>
 <ZAjFF+sfTZ1UmvFK@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h5oeiNq064qOT4da"
Content-Disposition: inline
In-Reply-To: <ZAjFF+sfTZ1UmvFK@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--h5oeiNq064qOT4da
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2023 at 06:25:43PM +0100, Kevin Wolf wrote:
> Am 08.03.2023 um 15:26 hat Stefan Hajnoczi geschrieben:
> > On Wed, Mar 08, 2023 at 09:48:17AM +0100, Kevin Wolf wrote:
> > > Am 07.03.2023 um 20:20 hat Stefan Hajnoczi geschrieben:
> > > > On Tue, Mar 07, 2023 at 06:17:22PM +0100, Kevin Wolf wrote:
> > > > > Am 01.03.2023 um 21:57 hat Stefan Hajnoczi geschrieben:
> > > > > > There is no need for the AioContext lock in bdrv_drain_all() be=
cause
> > > > > > nothing in AIO_WAIT_WHILE() needs the lock and the condition is=
 atomic.
> > > > > >=20
> > > > > > Note that the NULL AioContext argument to AIO_WAIT_WHILE() is o=
dd. In
> > > > > > the future it can be removed.
> > > > >=20
> > > > > It can be removed for all callers that run in the main loop conte=
xt. For
> > > > > code running in an iothread, it's still important to pass a non-N=
ULL
> > > > > context. This makes me doubt that the ctx parameter can really be
> > > > > removed without changing more.
> > > > >=20
> > > > > Is your plan to remove the if from AIO_WAIT_WHILE_INTERNAL(), too=
, and
> > > > > to poll qemu_get_current_aio_context() instead of ctx_ or the main
> > > > > context?
> > > >=20
> > > > This is what I'd like once everything has been converted to
> > > > AIO_WAIT_WHILE_UNLOCKED() - and at this point we might as well call=
 it
> > > > AIO_WAIT_WHILE() again:
> > > >=20
> > > >   #define AIO_WAIT_WHILE(cond) ({                                  =
  \
> > > >       bool waited_ =3D false;                                      =
    \
> > > >       AioWait *wait_ =3D &global_aio_wait;                         =
    \
> > > >       /* Increment wait_->num_waiters before evaluating cond. */   =
  \
> > > >       qatomic_inc(&wait_->num_waiters);                            =
  \
> > > >       /* Paired with smp_mb in aio_wait_kick(). */                 =
  \
> > > >       smp_mb();                                                    =
  \
> > > >       while ((cond)) {                                             =
  \
> > > >           aio_poll(qemu_get_current_aio_context(), true);          =
  \
> > > >           waited_ =3D true;                                        =
    \
> > > >       }                                                            =
  \
> > > >       qatomic_dec(&wait_->num_waiters);                            =
  \
> > > >       waited_; })
> > >=20
> > > Ok, yes, this is what I tried to describe above.
> > >=20
> > > > However, I just realized this only works in the main loop thread be=
cause
> > > > that's where aio_wait_kick() notifications are received. An IOThread
> > > > running AIO_WAIT_WHILE() won't be woken when another thread (includ=
ing
> > > > the main loop thread) calls aio_wait_kick().
> > >=20
> > > Which is of course a limitation we already have today. You can wait f=
or
> > > things in your own iothread, or for all threads from the main loop.
> > >=20
> > > However, in the future multiqueue world, the first case probably beco=
mes
> > > pretty much useless because even for the same node, you could get
> > > activity in any thread.
> > >=20
> > > So essentially AIO_WAIT_WHILE() becomes GLOBAL_STATE_CODE(). Which is
> > > probably a good idea anyway, but I'm not entirely sure how many places
> > > we currently have where it's called from an iothread. I know the drain
> > > in mirror_run(), but Emanuele already had a patch in his queue where
> > > bdrv_co_yield_to_drain() schedules drain in the main context, so if t=
hat
> > > works, mirror_run() would be solved.
> > >=20
> > > https://gitlab.com/eesposit/qemu/-/commit/63562351aca4fb05d5711eb410f=
eb96e64b5d4ad
> > >=20
> > > > I would propose introducing a QemuCond for each condition that we w=
ait
> > > > on, but QemuCond lacks event loop integration. The current thread w=
ould
> > > > be unable to run aio_poll() while also waiting on a QemuCond.
> > > >=20
> > > > Life outside coroutines is hard, man! I need to think about this mo=
re.
> > > > Luckily this problem doesn't block this patch series.
> > >=20
> > > I hope that we don't really need all of this if we can limit running
> > > synchronous code to the main loop.
> >=20
> > Great idea, I think you're right.
> >=20
> > I'll audit the code to find the IOThread AIO_WAIT_WHILE() callers and
> > maybe a future patch series can work on that.
> >=20
> > > > > > There is an assertion in
> > > > > > AIO_WAIT_WHILE() that checks that we're in the main loop AioCon=
text and
> > > > > > we would lose that check by dropping the argument. However, tha=
t was a
> > > > > > precursor to the GLOBAL_STATE_CODE()/IO_CODE() macros and is no=
w a
> > > > > > duplicate check. So I think we won't lose much by dropping it, =
but let's
> > > > > > do a few more AIO_WAIT_WHILE_UNLOCKED() coversions of this sort=
 to
> > > > > > confirm this is the case.
> > > > > >=20
> > > > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > >=20
> > > > > Yes, it seems that we don't lose much, except maybe some consiste=
ncy in
> > > > > the intermediate state. The commit message could state a bit more
> > > > > directly what we gain, though. Since you mention removing the par=
ameter
> > > > > as a future possibility, I assume that's the goal with it, but I
> > > > > wouldn't be sure just from reading the commit message.
> > > >=20
> > > > AIO_WAIT_WHILE() callers need to be weened of the AioContext lock.
> > > > That's the main motivation and this patch series converts the easy
> > > > cases where we already don't need the lock. Dropping the function
> > > > argument eventually is a side benefit.
> > >=20
> > > Yes, but the conversion to AIO_WAIT_WHILE_UNLOCKED() could be done wi=
th
> > > ctx instead of NULL. So moving to NULL is a separate change that need=
s a
> > > separate explanation. You could even argue that it should be a separa=
te
> > > patch if it's an independent change.
> > >=20
> > > Or am I missing something and keeping ctx would actually break things?
> >=20
> > Yes, ctx argument does not need to be modified when converting from
> > AIO_WAIT_WHILE() to AIO_WAIT_WHILE_UNLOCKED(). Passing it bothers me
> > because we don't really use it when unlock=3Dfalse.
> >=20
> > Would you like me to keep ctx non-NULL for now?
>=20
> I don't really mind doing both changes in one commit because they are so
> small, but at least I'd like the commit message to be more explicit
> about the eventual goal we have with switching to NULL instead of just
> stating that it's odd, but harmless.

Got it, I'll send another revision.

Stefan

--h5oeiNq064qOT4da
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQJ01UACgkQnKSrs4Gr
c8gmGAf+KBQ//U3T5tQ2c7qW2Uh+a8hIdB/S3Lq0rXp7BD0wAT9M/NVpRuJcqdlW
LJc9Gb3mBXuVFqtF+xH8PP00BwG5Mtt/8h3gZ053bblkuUCqPhLxNkPQeqTYnZhN
RL0EtRqXtTxpEITZBFnlWPW5AYZ2iAcFOVguhDgGS602qRieM97H6JUboXNosbg2
nXqsf/qvQBzVrjXWM2A/YTq820mF98vPaUP+sDQZ9gEOTzsN3yqzMxpIN+hWNEjx
5daZ9uPvhQWaWbERW84j/e6iEPDbCHst2QSAe+XbCV3p4HMCSRK3VYoThSiPFrUo
W6PogMqaAopoFKdkZVNPv4Y/Fvartw==
=fDZE
-----END PGP SIGNATURE-----

--h5oeiNq064qOT4da--


