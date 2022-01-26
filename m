Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E833A49CB74
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 14:54:24 +0100 (CET)
Received: from localhost ([::1]:34012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCiki-0000r9-0x
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 08:54:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCiWH-00014I-7x
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:39:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCiWF-0007No-D9
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:39:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643204366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=obtDAKEZ7RqPcDCuL98QVXlNI+jsrzcSL+K0j74vn4c=;
 b=G8aM94rZnHhBoPx2HruDATZhITesrb/9v16YiWIVWD4A7i3+DRe5naN7VSZOzcVAKnINRG
 1XZdvhV70EqGIzcreQnnYTTEk1hcVhAsks+gJqh/p9567rTN8MgxBgSSvEz0cJduc73lfE
 To0QKjxY20xliZ7S6xHpc02oo7W0cr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-PO7LlRCDNA-FEqKDlnyGdw-1; Wed, 26 Jan 2022 08:39:24 -0500
X-MC-Unique: PO7LlRCDNA-FEqKDlnyGdw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D99918145E2;
 Wed, 26 Jan 2022 13:39:23 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C90E6E206;
 Wed, 26 Jan 2022 13:39:23 +0000 (UTC)
Date: Wed, 26 Jan 2022 13:39:22 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] block/export: Fix vhost-user-blk shutdown with requests
 in flight
Message-ID: <YfFPCsvetg1IIUUO@stefanha-x1.localdomain>
References: <20220125151435.48792-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="agnDoCyMhFm+NQ4v"
Content-Disposition: inline
In-Reply-To: <20220125151435.48792-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
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


--agnDoCyMhFm+NQ4v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 04:14:35PM +0100, Kevin Wolf wrote:
> The vhost-user-blk export runs requests asynchronously in their own
> coroutine. When the vhost connection goes away and we want to stop the
> vhost-user server, we need to wait for these coroutines to stop before
> we can unmap the shared memory. Otherwise, they would still access the
> unmapped memory and crash.
>=20
> This introduces a refcount to VuServer which is increased when spawning
> a new request coroutine and decreased before the coroutine exits. The
> memory is only unmapped when the refcount reaches zero.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/qemu/vhost-user-server.h     |  5 +++++
>  block/export/vhost-user-blk-server.c |  5 +++++
>  util/vhost-user-server.c             | 22 ++++++++++++++++++++++
>  3 files changed, 32 insertions(+)
>=20
> diff --git a/include/qemu/vhost-user-server.h b/include/qemu/vhost-user-s=
erver.h
> index 121ea1dedf..cd43193b80 100644
> --- a/include/qemu/vhost-user-server.h
> +++ b/include/qemu/vhost-user-server.h
> @@ -42,6 +42,8 @@ typedef struct {
>      const VuDevIface *vu_iface;
> =20
>      /* Protected by ctx lock */
> +    unsigned int refcount;
> +    bool wait_idle;
>      VuDev vu_dev;
>      QIOChannel *ioc; /* The I/O channel with the client */
>      QIOChannelSocket *sioc; /* The underlying data channel with the clie=
nt */
> @@ -59,6 +61,9 @@ bool vhost_user_server_start(VuServer *server,
> =20
>  void vhost_user_server_stop(VuServer *server);
> =20
> +void vhost_user_server_ref(VuServer *server);
> +void vhost_user_server_unref(VuServer *server);
> +
>  void vhost_user_server_attach_aio_context(VuServer *server, AioContext *=
ctx);
>  void vhost_user_server_detach_aio_context(VuServer *server);
> =20
> diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-us=
er-blk-server.c
> index 1862563336..a129204c44 100644
> --- a/block/export/vhost-user-blk-server.c
> +++ b/block/export/vhost-user-blk-server.c
> @@ -172,6 +172,7 @@ vu_blk_discard_write_zeroes(VuBlkExport *vexp, struct=
 iovec *iov,
>      return VIRTIO_BLK_S_IOERR;
>  }
> =20
> +/* Called with server refcount increased, must decrease before returning=
 */
>  static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
>  {
>      VuBlkReq *req =3D opaque;
> @@ -286,10 +287,12 @@ static void coroutine_fn vu_blk_virtio_process_req(=
void *opaque)
>      }
> =20
>      vu_blk_req_complete(req);
> +    vhost_user_server_unref(server);
>      return;
> =20
>  err:
>      free(req);
> +    vhost_user_server_unref(server);
>  }
> =20
>  static void vu_blk_process_vq(VuDev *vu_dev, int idx)
> @@ -310,6 +313,8 @@ static void vu_blk_process_vq(VuDev *vu_dev, int idx)
> =20
>          Coroutine *co =3D
>              qemu_coroutine_create(vu_blk_virtio_process_req, req);
> +
> +        vhost_user_server_ref(server);
>          qemu_coroutine_enter(co);

Why not increment inside vu_blk_virtio_process_req()? My understanding
is the coroutine is entered immediately so there is no race that needs
to be protected against by incrementing the refcount early.

>      }
>  }
> diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
> index f68287e811..f66fbba710 100644
> --- a/util/vhost-user-server.c
> +++ b/util/vhost-user-server.c
> @@ -74,6 +74,20 @@ static void panic_cb(VuDev *vu_dev, const char *buf)
>      error_report("vu_panic: %s", buf);
>  }
> =20
> +void vhost_user_server_ref(VuServer *server)
> +{
> +    assert(!server->wait_idle);
> +    server->refcount++;
> +}
> +
> +void vhost_user_server_unref(VuServer *server)
> +{
> +    server->refcount--;
> +    if (server->wait_idle && !server->refcount) {
> +        aio_co_wake(server->co_trip);
> +    }
> +}
> +
>  static bool coroutine_fn
>  vu_message_read(VuDev *vu_dev, int conn_fd, VhostUserMsg *vmsg)
>  {
> @@ -177,6 +191,14 @@ static coroutine_fn void vu_client_trip(void *opaque)
>          /* Keep running */
>      }
> =20
> +    if (server->refcount) {
> +        /* Wait for requests to complete before we can unmap the memory =
*/
> +        server->wait_idle =3D true;
> +        qemu_coroutine_yield();
> +        server->wait_idle =3D false;
> +    }
> +    assert(server->refcount =3D=3D 0);
> +
>      vu_deinit(vu_dev);
> =20
>      /* vu_deinit() should have called remove_watch() */
> --=20
> 2.31.1
>=20

--agnDoCyMhFm+NQ4v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxTwoACgkQnKSrs4Gr
c8gF1Qf/acYXpnfTU/PUvznKaXt4xUDjMc6Z5V+dtKHnxFKTOZQGbA2+qqUth/cY
5f2Sszaq7aAXfTKdgWpbePtTbClqGkJ0AThFN3weLvYQVEHZGT+nKbGkj1YSLgzQ
0Gc7eQ1A3vfgqQdiA7UlPSxRf4/mp3+XgGugpo37hO23bkKBzSma/eOX622e2KFy
kLsR05EU64J+kiw1NAPHl8pZhgT6N1UQ8AEuUT2FKseHDFj7lcVYdiaMcEKj0mw/
MwlFmE92Tv4ccLL6mfOJD0zoFuB7HXFozuVtQigt0MFQsgu6pkIfucCaW6HEmMeF
xcmMMDjZ6KtQvGpoN2XEs/j8G7cJng==
=swDT
-----END PGP SIGNATURE-----

--agnDoCyMhFm+NQ4v--


