Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2743D49E48D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:25:06 +0100 (CET)
Received: from localhost ([::1]:48230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5hw-0007Hw-Jk
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:25:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nD5U5-0002IM-7I
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:10:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nD5U2-0001ky-PU
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643292640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vgHODmfgH0Md2aUlD/RbINSZLynVr4O5/y2ZuomekiU=;
 b=Bw4/3rIWdvVE0+Ma1PPudtaAyTm2OIjr5HvPO/S5lkNm+q7xzwW/NlAZ80SoAc4b2V+ZAj
 OgDVhdK7VUOEVZ6G60r9q2XfVS0GYQcHUGpt7xpDSDQi9lbS9798KIxFLdz8KJdGuZMe1b
 iHM3tg+egUoOPtf2I2pTrpBjE6ciIck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-cI5uufvhMEK-bXR6bry67g-1; Thu, 27 Jan 2022 09:10:36 -0500
X-MC-Unique: cI5uufvhMEK-bXR6bry67g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A9441091DA2;
 Thu, 27 Jan 2022 14:10:35 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14F0A1F436;
 Thu, 27 Jan 2022 14:10:12 +0000 (UTC)
Date: Thu, 27 Jan 2022 15:10:11 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] block/export: Fix vhost-user-blk shutdown with requests
 in flight
Message-ID: <YfKnp6SoWCiE+F49@redhat.com>
References: <20220125151435.48792-1-kwolf@redhat.com>
 <YfFPCsvetg1IIUUO@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rDOXm0HL+VkfHR1v"
Content-Disposition: inline
In-Reply-To: <YfFPCsvetg1IIUUO@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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


--rDOXm0HL+VkfHR1v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 26.01.2022 um 14:39 hat Stefan Hajnoczi geschrieben:
> On Tue, Jan 25, 2022 at 04:14:35PM +0100, Kevin Wolf wrote:
> > The vhost-user-blk export runs requests asynchronously in their own
> > coroutine. When the vhost connection goes away and we want to stop the
> > vhost-user server, we need to wait for these coroutines to stop before
> > we can unmap the shared memory. Otherwise, they would still access the
> > unmapped memory and crash.
> >=20
> > This introduces a refcount to VuServer which is increased when spawning
> > a new request coroutine and decreased before the coroutine exits. The
> > memory is only unmapped when the refcount reaches zero.
> >=20
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  include/qemu/vhost-user-server.h     |  5 +++++
> >  block/export/vhost-user-blk-server.c |  5 +++++
> >  util/vhost-user-server.c             | 22 ++++++++++++++++++++++
> >  3 files changed, 32 insertions(+)
> >=20
> > diff --git a/include/qemu/vhost-user-server.h b/include/qemu/vhost-user=
-server.h
> > index 121ea1dedf..cd43193b80 100644
> > --- a/include/qemu/vhost-user-server.h
> > +++ b/include/qemu/vhost-user-server.h
> > @@ -42,6 +42,8 @@ typedef struct {
> >      const VuDevIface *vu_iface;
> > =20
> >      /* Protected by ctx lock */
> > +    unsigned int refcount;
> > +    bool wait_idle;
> >      VuDev vu_dev;
> >      QIOChannel *ioc; /* The I/O channel with the client */
> >      QIOChannelSocket *sioc; /* The underlying data channel with the cl=
ient */
> > @@ -59,6 +61,9 @@ bool vhost_user_server_start(VuServer *server,
> > =20
> >  void vhost_user_server_stop(VuServer *server);
> > =20
> > +void vhost_user_server_ref(VuServer *server);
> > +void vhost_user_server_unref(VuServer *server);
> > +
> >  void vhost_user_server_attach_aio_context(VuServer *server, AioContext=
 *ctx);
> >  void vhost_user_server_detach_aio_context(VuServer *server);
> > =20
> > diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-=
user-blk-server.c
> > index 1862563336..a129204c44 100644
> > --- a/block/export/vhost-user-blk-server.c
> > +++ b/block/export/vhost-user-blk-server.c
> > @@ -172,6 +172,7 @@ vu_blk_discard_write_zeroes(VuBlkExport *vexp, stru=
ct iovec *iov,
> >      return VIRTIO_BLK_S_IOERR;
> >  }
> > =20
> > +/* Called with server refcount increased, must decrease before returni=
ng */
> >  static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
> >  {
> >      VuBlkReq *req =3D opaque;
> > @@ -286,10 +287,12 @@ static void coroutine_fn vu_blk_virtio_process_re=
q(void *opaque)
> >      }
> > =20
> >      vu_blk_req_complete(req);
> > +    vhost_user_server_unref(server);
> >      return;
> > =20
> >  err:
> >      free(req);
> > +    vhost_user_server_unref(server);
> >  }
> > =20
> >  static void vu_blk_process_vq(VuDev *vu_dev, int idx)
> > @@ -310,6 +313,8 @@ static void vu_blk_process_vq(VuDev *vu_dev, int id=
x)
> > =20
> >          Coroutine *co =3D
> >              qemu_coroutine_create(vu_blk_virtio_process_req, req);
> > +
> > +        vhost_user_server_ref(server);
> >          qemu_coroutine_enter(co);
>=20
> Why not increment inside vu_blk_virtio_process_req()? My understanding
> is the coroutine is entered immediately so there is no race that needs
> to be protected against by incrementing the refcount early.

You're right, as long as we know that qemu_coroutine_enter() is used to
enter the coroutine and we increase the refcount before the coroutine
yields for the first time, doing this in vu_blk_virtio_process_req is
sufficient.

With respect to potential future code changes, it feels a little safer
to do it here like in this patch, but at the same time I have to admit
that having ref and unref in the same function is a little nicer.

So for me there is no clear winner. If you prefer moving the ref into
the coroutine, I can post a v2.

Kevin

> >      }
> >  }
> > diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
> > index f68287e811..f66fbba710 100644
> > --- a/util/vhost-user-server.c
> > +++ b/util/vhost-user-server.c
> > @@ -74,6 +74,20 @@ static void panic_cb(VuDev *vu_dev, const char *buf)
> >      error_report("vu_panic: %s", buf);
> >  }
> > =20
> > +void vhost_user_server_ref(VuServer *server)
> > +{
> > +    assert(!server->wait_idle);
> > +    server->refcount++;
> > +}
> > +
> > +void vhost_user_server_unref(VuServer *server)
> > +{
> > +    server->refcount--;
> > +    if (server->wait_idle && !server->refcount) {
> > +        aio_co_wake(server->co_trip);
> > +    }
> > +}
> > +
> >  static bool coroutine_fn
> >  vu_message_read(VuDev *vu_dev, int conn_fd, VhostUserMsg *vmsg)
> >  {
> > @@ -177,6 +191,14 @@ static coroutine_fn void vu_client_trip(void *opaq=
ue)
> >          /* Keep running */
> >      }
> > =20
> > +    if (server->refcount) {
> > +        /* Wait for requests to complete before we can unmap the memor=
y */
> > +        server->wait_idle =3D true;
> > +        qemu_coroutine_yield();
> > +        server->wait_idle =3D false;
> > +    }
> > +    assert(server->refcount =3D=3D 0);
> > +
> >      vu_deinit(vu_dev);
> > =20
> >      /* vu_deinit() should have called remove_watch() */
> > --=20
> > 2.31.1
> >=20



--rDOXm0HL+VkfHR1v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmHyp8IACgkQfwmycsiP
L9bJMxAAsKzFiJVRp3jMdR5RVY70C2j84bKKx5oOVa/EL/rIBqOwvaqd/jY00LFf
i3a+WRau30603TaB4M2fUG3/EqYCIWwpjhLzO7T2A8BpwikJOiefzPkixEkGMZAR
hqFsISgTTiCQaB6RQLkvD/qc9VHxthG+LP6xwOjHrANVpk+LM8bGGKFhTGTJO6Em
YXvTls9jUAfZLrQh/SRznx0cv+SUqal1ZVm4OfIk5Lwd+UXWR5V5qgbl7vfZfGVM
pKpcQLM6qxDMcSRq9zpIeetVovR2y9aI2VS+X9jCAABddyI17cm5LreNaHHkh1Uu
8XoO9YdAMWD0ZpdDm0EVeufcJ4KQt9qyYOX6i2EJPMwTGWsvEyZDARRV0mXSs/3K
0jyob5nXti32o8j1hXKWlWv2C4ClMTBJtJIdaJnTpzMu4POoey6JqgdZAbvhtxCQ
tM/R0PydcW3Paoh7XI23muh906qNn3tlNibmaQQhIRflee8h4hTyFHOZaolvpNoM
TQdxPF9S9ZggjRsU7EJ+pzZ9tyzxlMi8m7rD0RbNBPmvINH/uTL6+QuDaXYw/0lN
pQQvAU+qI/lOiBjMSdkXwgN3T4em6jRo/YR2NsnmjzwPDOhYa3ATp2KTLVc5GpGp
L3aPLab21ufEIvaOYaf2RmfwnZ5Nl3CMugPDfko4TVahhc3NMus=
=GYEA
-----END PGP SIGNATURE-----

--rDOXm0HL+VkfHR1v--


