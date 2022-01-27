Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665FF49E583
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 16:11:41 +0100 (CET)
Received: from localhost ([::1]:36662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD6R2-00016y-Gj
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 10:11:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nD5jN-00023T-R6
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:26:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nD5jJ-0004Af-4g
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643293575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qdm90PR37+lS7YbNbHXE1UfufDajoEUJAmCgl7YpzJI=;
 b=XdxQ4FqfriXy7pWLcv7gqrsyy5NkVE8AmVOfJG1rPxGLTs2Yw92XRtsRp9elDnJrYKamGB
 4NvWBSuTQ8uZOfVU3HHQJPN6zsG37K5VHdnn+5ILR/9lDYSzoOyCS2yuVyh4XlQNTeZ/4C
 Ze/fk3nePWfQVWdh41asVjTmIX70DDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-zsCVM5p6Mvq_HD_eIpV1PQ-1; Thu, 27 Jan 2022 09:26:14 -0500
X-MC-Unique: zsCVM5p6Mvq_HD_eIpV1PQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F3B183DD22;
 Thu, 27 Jan 2022 14:26:13 +0000 (UTC)
Received: from localhost (unknown [10.39.193.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E9D37B034;
 Thu, 27 Jan 2022 14:26:12 +0000 (UTC)
Date: Thu, 27 Jan 2022 14:26:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] block/export: Fix vhost-user-blk shutdown with requests
 in flight
Message-ID: <YfKrg/NPdLqrwoyg@stefanha-x1.localdomain>
References: <20220125151435.48792-1-kwolf@redhat.com>
 <YfFPCsvetg1IIUUO@stefanha-x1.localdomain>
 <YfKnp6SoWCiE+F49@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QprvkOoa67Ivf9lE"
Content-Disposition: inline
In-Reply-To: <YfKnp6SoWCiE+F49@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: hreitz@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QprvkOoa67Ivf9lE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 27, 2022 at 03:10:11PM +0100, Kevin Wolf wrote:
> Am 26.01.2022 um 14:39 hat Stefan Hajnoczi geschrieben:
> > On Tue, Jan 25, 2022 at 04:14:35PM +0100, Kevin Wolf wrote:
> > > The vhost-user-blk export runs requests asynchronously in their own
> > > coroutine. When the vhost connection goes away and we want to stop the
> > > vhost-user server, we need to wait for these coroutines to stop before
> > > we can unmap the shared memory. Otherwise, they would still access the
> > > unmapped memory and crash.
> > >=20
> > > This introduces a refcount to VuServer which is increased when spawni=
ng
> > > a new request coroutine and decreased before the coroutine exits. The
> > > memory is only unmapped when the refcount reaches zero.
> > >=20
> > > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > > ---
> > >  include/qemu/vhost-user-server.h     |  5 +++++
> > >  block/export/vhost-user-blk-server.c |  5 +++++
> > >  util/vhost-user-server.c             | 22 ++++++++++++++++++++++
> > >  3 files changed, 32 insertions(+)
> > >=20
> > > diff --git a/include/qemu/vhost-user-server.h b/include/qemu/vhost-us=
er-server.h
> > > index 121ea1dedf..cd43193b80 100644
> > > --- a/include/qemu/vhost-user-server.h
> > > +++ b/include/qemu/vhost-user-server.h
> > > @@ -42,6 +42,8 @@ typedef struct {
> > >      const VuDevIface *vu_iface;
> > > =20
> > >      /* Protected by ctx lock */
> > > +    unsigned int refcount;
> > > +    bool wait_idle;
> > >      VuDev vu_dev;
> > >      QIOChannel *ioc; /* The I/O channel with the client */
> > >      QIOChannelSocket *sioc; /* The underlying data channel with the =
client */
> > > @@ -59,6 +61,9 @@ bool vhost_user_server_start(VuServer *server,
> > > =20
> > >  void vhost_user_server_stop(VuServer *server);
> > > =20
> > > +void vhost_user_server_ref(VuServer *server);
> > > +void vhost_user_server_unref(VuServer *server);
> > > +
> > >  void vhost_user_server_attach_aio_context(VuServer *server, AioConte=
xt *ctx);
> > >  void vhost_user_server_detach_aio_context(VuServer *server);
> > > =20
> > > diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhos=
t-user-blk-server.c
> > > index 1862563336..a129204c44 100644
> > > --- a/block/export/vhost-user-blk-server.c
> > > +++ b/block/export/vhost-user-blk-server.c
> > > @@ -172,6 +172,7 @@ vu_blk_discard_write_zeroes(VuBlkExport *vexp, st=
ruct iovec *iov,
> > >      return VIRTIO_BLK_S_IOERR;
> > >  }
> > > =20
> > > +/* Called with server refcount increased, must decrease before retur=
ning */
> > >  static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
> > >  {
> > >      VuBlkReq *req =3D opaque;
> > > @@ -286,10 +287,12 @@ static void coroutine_fn vu_blk_virtio_process_=
req(void *opaque)
> > >      }
> > > =20
> > >      vu_blk_req_complete(req);
> > > +    vhost_user_server_unref(server);
> > >      return;
> > > =20
> > >  err:
> > >      free(req);
> > > +    vhost_user_server_unref(server);
> > >  }
> > > =20
> > >  static void vu_blk_process_vq(VuDev *vu_dev, int idx)
> > > @@ -310,6 +313,8 @@ static void vu_blk_process_vq(VuDev *vu_dev, int =
idx)
> > > =20
> > >          Coroutine *co =3D
> > >              qemu_coroutine_create(vu_blk_virtio_process_req, req);
> > > +
> > > +        vhost_user_server_ref(server);
> > >          qemu_coroutine_enter(co);
> >=20
> > Why not increment inside vu_blk_virtio_process_req()? My understanding
> > is the coroutine is entered immediately so there is no race that needs
> > to be protected against by incrementing the refcount early.
>=20
> You're right, as long as we know that qemu_coroutine_enter() is used to
> enter the coroutine and we increase the refcount before the coroutine
> yields for the first time, doing this in vu_blk_virtio_process_req is
> sufficient.
>=20
> With respect to potential future code changes, it feels a little safer
> to do it here like in this patch, but at the same time I have to admit
> that having ref and unref in the same function is a little nicer.
>=20
> So for me there is no clear winner. If you prefer moving the ref into
> the coroutine, I can post a v2.

The way the code is currently written made me question whether I missed
a race condition. This may be a case where defensive programming
actually makes the code harder to understand.

That said, it's just me and I also don't have a strong opinion because
it's correct the way you wrote it. Feel free to merge this patch as it
is.

Stefan

--QprvkOoa67Ivf9lE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHyq4MACgkQnKSrs4Gr
c8jfswgAmaEQuNoqpD1NdIAlCGwfRh9JT+9kb038dMVf1BOKxI0Fmd+jhBAcY6/4
oTuIY661EFlcMDkaw5R+lNlB1/HeR4Z2mpOkgg1gwCNub9Cz5BoJnDYf1HM8vhDJ
13yDS0st8AUz9H2hOA/UIia3MaZzReSB9UaGYkcb3kuLmLxNSRwLLnN4LLcWwZDw
wicZU2WP+RDcWkQfDKEp3vVB2LlsMFnN+Cf4Ssu/oxh8oCQHJqR7YZ1uUCsjBjMI
eenTVUhMU/CYL8SeFHPxALSifxZASgG+EYQL2NH5JQFWCgy074gI9VT+DRnEIFc5
cIyD+Q28W4+cVx/HPJbRevMafYdLXg==
=fGX0
-----END PGP SIGNATURE-----

--QprvkOoa67Ivf9lE--


