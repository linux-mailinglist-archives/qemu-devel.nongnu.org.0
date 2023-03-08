Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8536B01FE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 09:49:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZpTJ-0003nk-VQ; Wed, 08 Mar 2023 03:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZpTI-0003nZ-Ct
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 03:48:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZpTG-0006UO-6C
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 03:48:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678265303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JaXq9hNWxDZ+cqvBxPAA37xxqn8RnvnmM4EDuuYnKyk=;
 b=EomOlYllGTtMP6r8KWkYUlLM5y/igY2NwGAYqIjX6v1akvaFo6KY3h5pfHQnqQLJaTGsDI
 d3aI47T2onWYnF7kEmpNUf4RrydGM/7Ia/cNIH96sURt1QklHRgIIPu3yTnUYTtEAFf4Kk
 RP6Ek0ekzP0RoDTicti/t+faBJiKtbw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-uQXAB4czN3iXXEr3cR_6Uw-1; Wed, 08 Mar 2023 03:48:20 -0500
X-MC-Unique: uQXAB4czN3iXXEr3cR_6Uw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05AF886C14B;
 Wed,  8 Mar 2023 08:48:20 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C124C1121314;
 Wed,  8 Mar 2023 08:48:18 +0000 (UTC)
Date: Wed, 8 Mar 2023 09:48:17 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 1/6] block: don't acquire AioContext lock in
 bdrv_drain_all()
Message-ID: <ZAhL0Xz4tuUWPeXY@redhat.com>
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-2-stefanha@redhat.com>
 <ZAdxog0T8XkSSUZd@redhat.com> <20230307192019.GB153228@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N6+TQMQTUg5v+AO9"
Content-Disposition: inline
In-Reply-To: <20230307192019.GB153228@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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


--N6+TQMQTUg5v+AO9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 07.03.2023 um 20:20 hat Stefan Hajnoczi geschrieben:
> On Tue, Mar 07, 2023 at 06:17:22PM +0100, Kevin Wolf wrote:
> > Am 01.03.2023 um 21:57 hat Stefan Hajnoczi geschrieben:
> > > There is no need for the AioContext lock in bdrv_drain_all() because
> > > nothing in AIO_WAIT_WHILE() needs the lock and the condition is atomi=
c.
> > >=20
> > > Note that the NULL AioContext argument to AIO_WAIT_WHILE() is odd. In
> > > the future it can be removed.
> >=20
> > It can be removed for all callers that run in the main loop context. For
> > code running in an iothread, it's still important to pass a non-NULL
> > context. This makes me doubt that the ctx parameter can really be
> > removed without changing more.
> >=20
> > Is your plan to remove the if from AIO_WAIT_WHILE_INTERNAL(), too, and
> > to poll qemu_get_current_aio_context() instead of ctx_ or the main
> > context?
>=20
> This is what I'd like once everything has been converted to
> AIO_WAIT_WHILE_UNLOCKED() - and at this point we might as well call it
> AIO_WAIT_WHILE() again:
>=20
>   #define AIO_WAIT_WHILE(cond) ({                                    \
>       bool waited_ =3D false;                                          \
>       AioWait *wait_ =3D &global_aio_wait;                             \
>       /* Increment wait_->num_waiters before evaluating cond. */     \
>       qatomic_inc(&wait_->num_waiters);                              \
>       /* Paired with smp_mb in aio_wait_kick(). */                   \
>       smp_mb();                                                      \
>       while ((cond)) {                                               \
>           aio_poll(qemu_get_current_aio_context(), true);            \
>           waited_ =3D true;                                            \
>       }                                                              \
>       qatomic_dec(&wait_->num_waiters);                              \
>       waited_; })

Ok, yes, this is what I tried to describe above.

> However, I just realized this only works in the main loop thread because
> that's where aio_wait_kick() notifications are received. An IOThread
> running AIO_WAIT_WHILE() won't be woken when another thread (including
> the main loop thread) calls aio_wait_kick().

Which is of course a limitation we already have today. You can wait for
things in your own iothread, or for all threads from the main loop.

However, in the future multiqueue world, the first case probably becomes
pretty much useless because even for the same node, you could get
activity in any thread.

So essentially AIO_WAIT_WHILE() becomes GLOBAL_STATE_CODE(). Which is
probably a good idea anyway, but I'm not entirely sure how many places
we currently have where it's called from an iothread. I know the drain
in mirror_run(), but Emanuele already had a patch in his queue where
bdrv_co_yield_to_drain() schedules drain in the main context, so if that
works, mirror_run() would be solved.

https://gitlab.com/eesposit/qemu/-/commit/63562351aca4fb05d5711eb410feb96e6=
4b5d4ad

> I would propose introducing a QemuCond for each condition that we wait
> on, but QemuCond lacks event loop integration. The current thread would
> be unable to run aio_poll() while also waiting on a QemuCond.
>=20
> Life outside coroutines is hard, man! I need to think about this more.
> Luckily this problem doesn't block this patch series.

I hope that we don't really need all of this if we can limit running
synchronous code to the main loop.

> > > There is an assertion in
> > > AIO_WAIT_WHILE() that checks that we're in the main loop AioContext a=
nd
> > > we would lose that check by dropping the argument. However, that was a
> > > precursor to the GLOBAL_STATE_CODE()/IO_CODE() macros and is now a
> > > duplicate check. So I think we won't lose much by dropping it, but le=
t's
> > > do a few more AIO_WAIT_WHILE_UNLOCKED() coversions of this sort to
> > > confirm this is the case.
> > >=20
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> >=20
> > Yes, it seems that we don't lose much, except maybe some consistency in
> > the intermediate state. The commit message could state a bit more
> > directly what we gain, though. Since you mention removing the parameter
> > as a future possibility, I assume that's the goal with it, but I
> > wouldn't be sure just from reading the commit message.
>=20
> AIO_WAIT_WHILE() callers need to be weened of the AioContext lock.
> That's the main motivation and this patch series converts the easy
> cases where we already don't need the lock. Dropping the function
> argument eventually is a side benefit.

Yes, but the conversion to AIO_WAIT_WHILE_UNLOCKED() could be done with
ctx instead of NULL. So moving to NULL is a separate change that needs a
separate explanation. You could even argue that it should be a separate
patch if it's an independent change.

Or am I missing something and keeping ctx would actually break things?

Kevin

--N6+TQMQTUg5v+AO9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmQIS9EACgkQfwmycsiP
L9YjnQ/+MXPU6SsZpf/uwK9da70+VkXzPa6oSD+aEXxF+SUU+pTsos3tHBX/kYu8
QdQT/UmvfymVdylKTCPzV2T3arPnZxNMX+Iv7uZazZwA4i4tN2A5bpTTj6+wQV0h
9Dlk6FMk6tYXpGZNpARwvGz5MQ6krQ/SnLyaw28Jdql8sUllkAoU5W8m5W+RUIQm
sfRci1VXzQI/gYTsEo4v2DFj8UXoclDQc5+6tyGw9tCKUxrcPUEAkskqX/Z+Z+oP
OjQsHXmXUecyKeC63CJ9Rc3XkW3j1GTz7UguNkKE3iZpqfgkqb0p9KPWSgo9Cw4n
UMS7ezZncHejbgt9md6AW8nXaA+XxCE6nzxrAsMxQURjLw2Evf2lS9sZ3Z6iXj/W
LDuhHyOKlA973QYHUYH5A1fQroVLaojIfbrOQUJAySPgb6cISYUT60nRB4zPZVZy
g/cR1xEwaF7LfNg3RNGnGC1Og4dT6QuAd3vN6ByW2PxXAUIhzHs7KqUPmHKei4tt
C82d6u+Yfpazfmzmz3VgfamzU6Lo46yIFpEWu2A49/4FLPVLJmmTOPMF5aSIoGAT
0FYayX/3lnqzSxpoge7gkbdP+l6/tlfCfAPe5IgPNYNDtmrduMQn6aMLHq5Iw4Va
3hw1JXTI0jV69ZiIEsFo+i1evJysIeRfVqGI+RyrwsKFZb7mWVU=
=v7en
-----END PGP SIGNATURE-----

--N6+TQMQTUg5v+AO9--


