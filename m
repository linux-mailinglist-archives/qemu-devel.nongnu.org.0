Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E396D48C27D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 11:47:17 +0100 (CET)
Received: from localhost ([::1]:44398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7b9x-0004FN-23
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 05:47:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7b8d-0002st-NH
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:45:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7b8c-0005Wn-6R
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:45:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641984353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yVuQwyjtczw4xEuzyltRcEM5HF6Ol4ECkAUgM1kwDB4=;
 b=TiSgpPWYRSXjGIJWehooC+WpoX4I8bnYcdUvNH8u8AFd7Cfj0IQBOWF+FH8AKsquJwGutV
 XXC+SkqQaOuv3AJZbxRU3yuO4aoJHlk9tN7kNWa9ASHhrYHSSSdG41NXEjAap+5euQmHRV
 31u5B7qfysAaORmh1xVDMEp9+fBKZBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-ngtOZxmyNl-CwifcaCirPA-1; Wed, 12 Jan 2022 05:45:50 -0500
X-MC-Unique: ngtOZxmyNl-CwifcaCirPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2352E1083F6C;
 Wed, 12 Jan 2022 10:45:49 +0000 (UTC)
Received: from localhost (unknown [10.39.195.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B44684637;
 Wed, 12 Jan 2022 10:45:21 +0000 (UTC)
Date: Wed, 12 Jan 2022 10:45:20 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 1/4] jobs: drop qmp_ trace points
Message-ID: <Yd6xQLKerw5LE6FO@stefanha-x1.localdomain>
References: <20211223110756.699148-1-vsementsov@virtuozzo.com>
 <20211223110756.699148-2-vsementsov@virtuozzo.com>
 <YdxZTz3UcLBAdVxL@stefanha-x1.localdomain>
 <CAFn=p-Zx5NatsY6qVrm6dQ2jh8=0030_7+-nKSkFhMgpOV=+Fg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-Zx5NatsY6qVrm6dQ2jh8=0030_7+-nKSkFhMgpOV=+Fg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KrRR6/gxHUw8FVaC"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Qemu-block <qemu-block@nongnu.org>, Michael Roth <michael.roth@amd.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--KrRR6/gxHUw8FVaC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 11, 2022 at 06:44:58PM -0500, John Snow wrote:
> On Mon, Jan 10, 2022 at 11:06 AM Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
> >
> > On Thu, Dec 23, 2021 at 12:07:53PM +0100, Vladimir Sementsov-Ogievskiy =
wrote:
> > > diff --git a/block/trace-events b/block/trace-events
> > > index 549090d453..5be3e3913b 100644
> > > --- a/block/trace-events
> > > +++ b/block/trace-events
> > > @@ -49,15 +49,6 @@ block_copy_read_fail(void *bcs, int64_t start, int=
 ret) "bcs %p start %"PRId64"
> > >  block_copy_write_fail(void *bcs, int64_t start, int ret) "bcs %p sta=
rt %"PRId64" ret %d"
> > >  block_copy_write_zeroes_fail(void *bcs, int64_t start, int ret) "bcs=
 %p start %"PRId64" ret %d"
> > >
> > > -# ../blockdev.c
> > > -qmp_block_job_cancel(void *job) "job %p"
> > > -qmp_block_job_pause(void *job) "job %p"
> > > -qmp_block_job_resume(void *job) "job %p"
> > > -qmp_block_job_complete(void *job) "job %p"
> > > -qmp_block_job_finalize(void *job) "job %p"
> > > -qmp_block_job_dismiss(void *job) "job %p"
> > > -qmp_block_stream(void *bs) "bs %p"
> > > -
> > >  # file-win32.c
> > >  file_paio_submit(void *acb, void *opaque, int64_t offset, int count,=
 int type) "acb %p opaque %p offset %"PRId64" count %d type %d"
> > >
> > > diff --git a/trace-events b/trace-events
> > > index a637a61eba..1265f1e0cc 100644
> > > --- a/trace-events
> > > +++ b/trace-events
> > > @@ -79,14 +79,6 @@ job_state_transition(void *job,  int ret, const ch=
ar *legal, const char *s0, con
> > >  job_apply_verb(void *job, const char *state, const char *verb, const=
 char *legal) "job %p in state %s; applying verb %s (%s)"
> > >  job_completed(void *job, int ret) "job %p ret %d"
> > >
> > > -# job-qmp.c
> > > -qmp_job_cancel(void *job) "job %p"
> > > -qmp_job_pause(void *job) "job %p"
> > > -qmp_job_resume(void *job) "job %p"
> > > -qmp_job_complete(void *job) "job %p"
> > > -qmp_job_finalize(void *job) "job %p"
> > > -qmp_job_dismiss(void *job) "job %p"
> >
> > The job pointer argument will be lost. That's not ideal but probably
> > worth getting trace events for all QMP commands.
> >
> > Stefan
>=20
> We could move the six job-related tracepoints into the implementation
> routines instead; i.e. job_user_cancel, job_user_pause, etc. This
> would cover all 12 QMP interface tracepoints, and that'd let us keep
> the "implementation" trace points.

Good idea. Having the job pointer might be handy so it's worth
preserving these trace events.

Stefan

--KrRR6/gxHUw8FVaC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHesUAACgkQnKSrs4Gr
c8hY7AgAtymOfpQg47r2aBmxJ0AERFcVJjlqNfGUULZotwYbvPxHOwFifF3fuQBN
4W+kPMusmIZTFNLSu9BiKKfMRU2Kf+lU1lY6V5jDv0ugvK6OOvLOD8P3ycsWc2GN
iWoNTyMc6c0A5ICUE0a8d9FokFXxqHZ+GRRDW153KirE+wF6z0LQm0lEvznBXXrD
uA1Wl8iTGQY40djBMazr7PRVPu4J1/RfRX0M1CvQIon53nPELCNnIq0a2PMlL6dt
E5l7IuxFtp3CUaq3ZYNK7ngtydkR4vQRKXcO8M8GkrMS/Pn7jY5poQ9wKAVy/qKF
1Edb4PIfYnk5q/qsz48Ht6EUv/THnQ==
=Z8Yo
-----END PGP SIGNATURE-----

--KrRR6/gxHUw8FVaC--


