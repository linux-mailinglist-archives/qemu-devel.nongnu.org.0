Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7338F699F01
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 22:29:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSlnU-0001s9-6x; Thu, 16 Feb 2023 16:28:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pSlnQ-0001rg-FZ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 16:28:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pSlnO-0007uD-Hf
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 16:28:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676582881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/hXy1HpTCYiEJ9Z+jks1uJCoK/Mg0MRCvK+fZJ7JU6E=;
 b=d/oftvaNfwglxiu+EKSTlF67EmzJ3GggbCUksTpE1US4NW2Mm0zGoXHhunsNYQa87Yi3s/
 yAdr0sCeST0NpSQi+FHMeBqW9ZDKFbScGgxJqWG/EUXNu5Uh79QYsTSInZ+qvqVS1Z50I0
 OyPS5frn2TyyGxzzPuyoRLblpQe7o38=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581--Wrrf4TCPBqq1WFWvMUb7w-1; Thu, 16 Feb 2023 16:27:57 -0500
X-MC-Unique: -Wrrf4TCPBqq1WFWvMUb7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D929802C16;
 Thu, 16 Feb 2023 21:27:57 +0000 (UTC)
Received: from localhost (unknown [10.39.192.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3685440B40C9;
 Thu, 16 Feb 2023 21:27:55 +0000 (UTC)
Date: Thu, 16 Feb 2023 16:27:54 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH v2 2/3] dma-helpers: prevent dma_blk_cb() vs
 dma_aio_cancel() race
Message-ID: <Y+6f2rc6I4z7HVAy@fedora>
References: <20230210143238.524357-1-stefanha@redhat.com>
 <20230210143238.524357-3-stefanha@redhat.com>
 <Y+5LblriH/1jmHcB@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FKjHb0aHDNagTxix"
Content-Disposition: inline
In-Reply-To: <Y+5LblriH/1jmHcB@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--FKjHb0aHDNagTxix
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 04:27:42PM +0100, Kevin Wolf wrote:
> Am 10.02.2023 um 15:32 hat Stefan Hajnoczi geschrieben:
> > dma_blk_cb() only takes the AioContext lock around ->io_func(). That
> > means the rest of dma_blk_cb() is not protected. In particular, the
> > DMAAIOCB field accesses happen outside the lock.
> >=20
> > There is a race when the main loop thread holds the AioContext lock and
> > invokes scsi_device_purge_requests() -> bdrv_aio_cancel() ->
> > dma_aio_cancel() while an IOThread executes dma_blk_cb(). The dbs->acb
> > field determines how cancellation proceeds. If dma_aio_cancel() see
> > dbs->acb =3D=3D NULL while dma_blk_cb() is still running, the request c=
an be
> > completed twice (-ECANCELED and the actual return value).
> >=20
> > The following assertion can occur with virtio-scsi when an IOThread is
> > used:
> >=20
> >   ../hw/scsi/scsi-disk.c:368: scsi_dma_complete: Assertion `r->req.aioc=
b !=3D NULL' failed.
> >=20
> > Fix the race by holding the AioContext across dma_blk_cb(). Now
> > dma_aio_cancel() under the AioContext lock will not see
> > inconsistent/intermediate states.
> >=20
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Two things that seem to need attention in the review:
>=20
> > diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> > index 7820fec54c..2463964805 100644
> > --- a/softmmu/dma-helpers.c
> > +++ b/softmmu/dma-helpers.c
> > @@ -113,17 +113,19 @@ static void dma_complete(DMAAIOCB *dbs, int ret)
> >  static void dma_blk_cb(void *opaque, int ret)
> >  {
> >      DMAAIOCB *dbs =3D (DMAAIOCB *)opaque;
> > +    AioContext *ctx =3D dbs->ctx;
> >      dma_addr_t cur_addr, cur_len;
> >      void *mem;
> > =20
> >      trace_dma_blk_cb(dbs, ret);
> > =20
> > +    aio_context_acquire(ctx);
>=20
> During the first iteration, the caller may already hold the AioContext
> lock. In the case of scsi-disk, it does. Locking a second time is fine
> in principle because it's a recursive lock, but we have to be careful
> not to call AIO_WAIT_WHILE() indirectly then because it could deadlock.
>=20
> Except for the dbs->common.cb (see below) I don't see any functions that
> would be problematic in this respect. In fact, the one I would be most
> worried about is dbs->io_func, but it was already locked before.
>=20
> >      dbs->acb =3D NULL;
> >      dbs->offset +=3D dbs->iov.size;
> > =20
> >      if (dbs->sg_cur_index =3D=3D dbs->sg->nsg || ret < 0) {
> >          dma_complete(dbs, ret);
>=20
> All request callbacks hold the AioContext lock now when they didn't
> before. I wonder if it's worth documenting the locking rules for
> dma_blk_io() in a comment. Could be a separate patch, though.
>=20
> You remove the locking in scsi_dma_complete() to compensate. All the
> other callers come from IDE and nvme, which don't take the lock
> internally. Taking the main AioContext lock once is fine, so this looks
> good.
>=20
> If it is possible that we already complete on the first iteration, this
> could however also be affected by the case above so that the AioContext
> is locked twice. In this case, the invoked callback must not call
> AIO_WAIT_WHILE() and we would need to audit IDE and nvme.
>=20
> Is it possible? In other words, can dbs->sg->nsg be 0? If not, can we
> assert and document it?

In the nsg =3D=3D 0 case there's another problem: the completion callback
function is invoked and the AIOCB is unref'd before dma_blk_io() returns
the stale AIOCB pointer.

That would lead to problems later because the pattern is typically:

  r->aiocb =3D dma_blk_io(...);
  ...
  use r and r->aiocb later

So I don't think nsg =3D 0 makes sense.

Functions I looked at invoke dma_blk_io() only when there are still
bytes to transfer. I think we're safe but I'll admit I'm not 100% sure.

> > -        return;
> > +        goto out;
> >      }
> >      dma_blk_unmap(dbs);
> > =20
> > @@ -164,9 +166,9 @@ static void dma_blk_cb(void *opaque, int ret)
> > =20
> >      if (dbs->iov.size =3D=3D 0) {
> >          trace_dma_map_wait(dbs);
> > -        dbs->bh =3D aio_bh_new(dbs->ctx, reschedule_dma, dbs);
> > +        dbs->bh =3D aio_bh_new(ctx, reschedule_dma, dbs);
>=20
> Does copying dbs->ctx to a local variable imply that it may change
> during the function? I didn't think so, but if it may, then why is
> calling aio_bh_new() with the old value right?

I changed this line for consistency, not to change behavior or fix a bug.

Regarding AioContext changes, they can't happen because no function that
changes the AioContext is called between this line and the earlier
aio_context_acquire().

(Having to worry about AioContext changes is a pain though and I look
forward to when we can get rid of this lock.)

Stefan

--FKjHb0aHDNagTxix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPun9oACgkQnKSrs4Gr
c8i19ggApiXID9W+jYRfBO7k16A7jcIYirMPNxoU2jcYNKA9N+isG7RspPEot5BZ
MRkm/mdgNG1zE5aL75CukaKKWlsaUJ4RQsuv4avk2Xq7P5DDJN18DX+7SjUXZV8t
xQQqd6C9qJ1wjZeQ8kY5sJz1UrdjBsaqImmiVTF6ggPMdRtrujjCklNRWaSw9L+E
ja0JXHX7BUE0Z/jRmyvO7cn/Z3M7hqN4bDjsz7dMTJvW/nl1UQiIv47fNy9cNR+U
y3tOFDgqkN7OhzcFTPV9Wo8HeS3FkUL+EyLBABp7f2AuP/yRSKKlLfbgZbyAOuBu
8AdXvW2MXJnrafMc8WVm96i0clsMOA==
=gt31
-----END PGP SIGNATURE-----

--FKjHb0aHDNagTxix--


