Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD9F6AF4E6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 20:21:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZcrO-00078I-PH; Tue, 07 Mar 2023 14:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZcrM-00077t-T5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 14:20:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZcrL-0006rz-9W
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 14:20:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678216826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=csb9EWa+j/xMxcualFG80nHlFmfhnMPaV8xwgfYO1Jw=;
 b=Buj6VHkfdPdf7IhyY31uz6FuctZ38BU6nVYFu3jhXDBpXkxkybuXKtiEdt6hALUX5kiK4g
 YF4/W1ixXpIj7hzFbpJCx53xY8+qgqzvwfMEP1Xihh1LUOsD/ZZl3t1hKCmt6d4I0i/tqA
 YNdus6IItW8CraZvaarTbcLRTvtr3EI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-4eTpvmH4OwWxjNeRlEVIVw-1; Tue, 07 Mar 2023 14:20:23 -0500
X-MC-Unique: 4eTpvmH4OwWxjNeRlEVIVw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B23D01C426A9;
 Tue,  7 Mar 2023 19:20:22 +0000 (UTC)
Received: from localhost (unknown [10.39.195.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25758492C14;
 Tue,  7 Mar 2023 19:20:20 +0000 (UTC)
Date: Tue, 7 Mar 2023 14:20:19 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 1/6] block: don't acquire AioContext lock in
 bdrv_drain_all()
Message-ID: <20230307192019.GB153228@fedora>
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-2-stefanha@redhat.com>
 <ZAdxog0T8XkSSUZd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6OZV9c4PigprrZhu"
Content-Disposition: inline
In-Reply-To: <ZAdxog0T8XkSSUZd@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--6OZV9c4PigprrZhu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2023 at 06:17:22PM +0100, Kevin Wolf wrote:
> Am 01.03.2023 um 21:57 hat Stefan Hajnoczi geschrieben:
> > There is no need for the AioContext lock in bdrv_drain_all() because
> > nothing in AIO_WAIT_WHILE() needs the lock and the condition is atomic.
> >=20
> > Note that the NULL AioContext argument to AIO_WAIT_WHILE() is odd. In
> > the future it can be removed.
>=20
> It can be removed for all callers that run in the main loop context. For
> code running in an iothread, it's still important to pass a non-NULL
> context. This makes me doubt that the ctx parameter can really be
> removed without changing more.
>=20
> Is your plan to remove the if from AIO_WAIT_WHILE_INTERNAL(), too, and
> to poll qemu_get_current_aio_context() instead of ctx_ or the main
> context?

This is what I'd like once everything has been converted to
AIO_WAIT_WHILE_UNLOCKED() - and at this point we might as well call it
AIO_WAIT_WHILE() again:

  #define AIO_WAIT_WHILE(cond) ({                                    \
      bool waited_ =3D false;                                          \
      AioWait *wait_ =3D &global_aio_wait;                             \
      /* Increment wait_->num_waiters before evaluating cond. */     \
      qatomic_inc(&wait_->num_waiters);                              \
      /* Paired with smp_mb in aio_wait_kick(). */                   \
      smp_mb();                                                      \
      while ((cond)) {                                               \
          aio_poll(qemu_get_current_aio_context(), true);            \
          waited_ =3D true;                                            \
      }                                                              \
      qatomic_dec(&wait_->num_waiters);                              \
      waited_; })

However, I just realized this only works in the main loop thread because
that's where aio_wait_kick() notifications are received. An IOThread
running AIO_WAIT_WHILE() won't be woken when another thread (including
the main loop thread) calls aio_wait_kick().

I would propose introducing a QemuCond for each condition that we wait
on, but QemuCond lacks event loop integration. The current thread would
be unable to run aio_poll() while also waiting on a QemuCond.

Life outside coroutines is hard, man! I need to think about this more.
Luckily this problem doesn't block this patch series.

> > There is an assertion in
> > AIO_WAIT_WHILE() that checks that we're in the main loop AioContext and
> > we would lose that check by dropping the argument. However, that was a
> > precursor to the GLOBAL_STATE_CODE()/IO_CODE() macros and is now a
> > duplicate check. So I think we won't lose much by dropping it, but let's
> > do a few more AIO_WAIT_WHILE_UNLOCKED() coversions of this sort to
> > confirm this is the case.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Yes, it seems that we don't lose much, except maybe some consistency in
> the intermediate state. The commit message could state a bit more
> directly what we gain, though. Since you mention removing the parameter
> as a future possibility, I assume that's the goal with it, but I
> wouldn't be sure just from reading the commit message.

AIO_WAIT_WHILE() callers need to be weened of the AioContext lock.
That's the main motivation and this patch series converts the easy cases
where we already don't need the lock. Dropping the function argument
eventually is a side benefit.

Stefan

--6OZV9c4PigprrZhu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQHjnMACgkQnKSrs4Gr
c8hMTwf7BmK8eMtDoMKHpcCowyQSTt5Zr9lPAeWWfF6RF4lBwwvH+Lx5FYsP5v1i
YoVgBf4YG7YOORUuqQ8SmvsMouClkAfboz5wkp15nV9C5a21tWPQMs7APIalS+Fw
rdMsO3SPSthaT8gSSX0JJQAb4kEXpxX7pE3PkGOqR4FfV2J9ZWIOci6NkJ4yzZmc
QBO10vuj9fBXCFBZ3RZdkFJjOHoVKGHjEvq3bA27tGU82ldiH1tsJaPbR3HJVYlM
R1nAQvIbv8qCAVpaSAPVDjK67BatKOHlbwIWyn1lIC2jfQT6CgOO7HTEAd9jMyjG
mqk76CogUwBPNDROvNpa1slv7bRneQ==
=uCWa
-----END PGP SIGNATURE-----

--6OZV9c4PigprrZhu--


