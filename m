Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7C56F4A88
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 21:42:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptvsD-0000k8-7j; Tue, 02 May 2023 15:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptvs9-0000jA-Og
 for qemu-devel@nongnu.org; Tue, 02 May 2023 15:41:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptvs7-00061M-RM
 for qemu-devel@nongnu.org; Tue, 02 May 2023 15:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683056471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6xENbjVvp+Pts3X84Cy2DsWSBfSYloGA+NzmbgbplRU=;
 b=fOt5e4RU5TCQFUGbDzQYsMURmBV4TTppPLwFTDXuiOX/1HAeWzGUfAZBXzXiWnCsNNQ+6K
 ZzSkLnn2K9rjM23rxRBj5B/SGsNXfh3w0WRwxeaPssy8iGjfAXZmMM26l+zMdFxLzhUNlf
 R+HFjIHQCOB0Hw5mFMP//N1FNQGQAhg=
Received: from mimecast-mx02.redhat.com (66.187.233.88 [66.187.233.88]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-YMLPGPKMO4SxOjhl3dEpxA-1; Tue, 02 May 2023 15:41:01 -0400
X-MC-Unique: YMLPGPKMO4SxOjhl3dEpxA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E962D85A588;
 Tue,  2 May 2023 19:40:54 +0000 (UTC)
Received: from localhost (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E85EC4020960;
 Tue,  2 May 2023 19:40:47 +0000 (UTC)
Date: Tue, 2 May 2023 15:40:45 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Lieven <pl@kamp.de>, Paul Durrant <paul@xen.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: Re: [PATCH v4 06/20] block/export: wait for vhost-user-blk requests
 when draining
Message-ID: <20230502194045.GC535070@fedora>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-7-stefanha@redhat.com>
 <ZFEve2GfI0TqsItA@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XRuGd9g1z5oS2ell"
Content-Disposition: inline
In-Reply-To: <ZFEve2GfI0TqsItA@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--XRuGd9g1z5oS2ell
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 05:42:51PM +0200, Kevin Wolf wrote:
> Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> > Each vhost-user-blk request runs in a coroutine. When the BlockBackend
> > enters a drained section we need to enter a quiescent state. Currently
> > any in-flight requests race with bdrv_drained_begin() because it is
> > unaware of vhost-user-blk requests.
> >=20
> > When blk_co_preadv/pwritev()/etc returns it wakes the
> > bdrv_drained_begin() thread but vhost-user-blk request processing has
> > not yet finished. The request coroutine continues executing while the
> > main loop thread thinks it is in a drained section.
> >=20
> > One example where this is unsafe is for blk_set_aio_context() where
> > bdrv_drained_begin() is called before .aio_context_detached() and
> > .aio_context_attach(). If request coroutines are still running after
> > bdrv_drained_begin(), then the AioContext could change underneath them
> > and they race with new requests processed in the new AioContext. This
> > could lead to virtqueue corruption, for example.
> >=20
> > (This example is theoretical, I came across this while reading the
> > code and have not tried to reproduce it.)
> >=20
> > It's easy to make bdrv_drained_begin() wait for in-flight requests: add
> > a .drained_poll() callback that checks the VuServer's in-flight counter.
> > VuServer just needs an API that returns true when there are requests in
> > flight. The in-flight counter needs to be atomic.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  include/qemu/vhost-user-server.h     |  4 +++-
> >  block/export/vhost-user-blk-server.c | 16 ++++++++++++++++
> >  util/vhost-user-server.c             | 14 ++++++++++----
> >  3 files changed, 29 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/include/qemu/vhost-user-server.h b/include/qemu/vhost-user=
-server.h
> > index bc0ac9ddb6..b1c1cda886 100644
> > --- a/include/qemu/vhost-user-server.h
> > +++ b/include/qemu/vhost-user-server.h
> > @@ -40,8 +40,9 @@ typedef struct {
> >      int max_queues;
> >      const VuDevIface *vu_iface;
> > =20
> > +    unsigned int in_flight; /* atomic */
> > +
> >      /* Protected by ctx lock */
> > -    unsigned int in_flight;
> >      bool wait_idle;
> >      VuDev vu_dev;
> >      QIOChannel *ioc; /* The I/O channel with the client */
> > @@ -62,6 +63,7 @@ void vhost_user_server_stop(VuServer *server);
> > =20
> >  void vhost_user_server_inc_in_flight(VuServer *server);
> >  void vhost_user_server_dec_in_flight(VuServer *server);
> > +bool vhost_user_server_has_in_flight(VuServer *server);
> > =20
> >  void vhost_user_server_attach_aio_context(VuServer *server, AioContext=
 *ctx);
> >  void vhost_user_server_detach_aio_context(VuServer *server);
> > diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-=
user-blk-server.c
> > index 841acb36e3..092b86aae4 100644
> > --- a/block/export/vhost-user-blk-server.c
> > +++ b/block/export/vhost-user-blk-server.c
> > @@ -272,7 +272,20 @@ static void vu_blk_exp_resize(void *opaque)
> >      vu_config_change_msg(&vexp->vu_server.vu_dev);
> >  }
> > =20
> > +/*
> > + * Ensures that bdrv_drained_begin() waits until in-flight requests co=
mplete.
> > + *
> > + * Called with vexp->export.ctx acquired.
> > + */
> > +static bool vu_blk_drained_poll(void *opaque)
> > +{
> > +    VuBlkExport *vexp =3D opaque;
> > +
> > +    return vhost_user_server_has_in_flight(&vexp->vu_server);
> > +}
> > +
> >  static const BlockDevOps vu_blk_dev_ops =3D {
> > +    .drained_poll  =3D vu_blk_drained_poll,
> >      .resize_cb =3D vu_blk_exp_resize,
> >  };
>=20
> You're adding a new function pointer to an existing BlockDevOps...
>=20
> > @@ -314,6 +327,7 @@ static int vu_blk_exp_create(BlockExport *exp, Bloc=
kExportOptions *opts,
> >      vu_blk_initialize_config(blk_bs(exp->blk), &vexp->blkcfg,
> >                               logical_block_size, num_queues);
> > =20
> > +    blk_set_dev_ops(exp->blk, &vu_blk_dev_ops, vexp);
> >      blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_d=
etach,
> >                                   vexp);
> > =20
> >      blk_set_dev_ops(exp->blk, &vu_blk_dev_ops, vexp);
>=20
> ..but still add a second blk_set_dev_ops(). Maybe a bad merge conflict
> resolution with commit ca858a5fe94?

Thanks, I probably didn't have ca858a5fe94 in my tree when writing this
code.

> > @@ -323,6 +337,7 @@ static int vu_blk_exp_create(BlockExport *exp, Bloc=
kExportOptions *opts,
> >                                   num_queues, &vu_blk_iface, errp)) {
> >          blk_remove_aio_context_notifier(exp->blk, blk_aio_attached,
> >                                          blk_aio_detach, vexp);
> > +        blk_set_dev_ops(exp->blk, NULL, NULL);
> >          g_free(vexp->handler.serial);
> >          return -EADDRNOTAVAIL;
> >      }
> > @@ -336,6 +351,7 @@ static void vu_blk_exp_delete(BlockExport *exp)
> > =20
> >      blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_ai=
o_detach,
> >                                      vexp);
> > +    blk_set_dev_ops(exp->blk, NULL, NULL);
> >      g_free(vexp->handler.serial);
> >  }
>=20
> These two hunks are then probably already fixes for ca858a5fe94 and
> should be a separate patch if so.

Sure, I can split them out.

hw/ doesn't need to call blk_set_dev_ops(blk, NULL, NULL) because
hw/core/qdev-properties-system.c:release_drive() -> blk_detach_dev()
does it automatically, but block/export does. It's easy to overlook and
that's probably why ca858a5fe94 didn't include it.

> > diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
> > index 1622f8cfb3..2e6b640050 100644
> > --- a/util/vhost-user-server.c
> > +++ b/util/vhost-user-server.c
> > @@ -78,17 +78,23 @@ static void panic_cb(VuDev *vu_dev, const char *buf)
> >  void vhost_user_server_inc_in_flight(VuServer *server)
> >  {
> >      assert(!server->wait_idle);
> > -    server->in_flight++;
> > +    qatomic_inc(&server->in_flight);
> >  }
> > =20
> >  void vhost_user_server_dec_in_flight(VuServer *server)
> >  {
> > -    server->in_flight--;
> > -    if (server->wait_idle && !server->in_flight) {
> > -        aio_co_wake(server->co_trip);
> > +    if (qatomic_fetch_dec(&server->in_flight) =3D=3D 1) {
> > +        if (server->wait_idle) {
> > +            aio_co_wake(server->co_trip);
> > +        }
> >      }
> >  }
> > =20
> > +bool vhost_user_server_has_in_flight(VuServer *server)
> > +{
> > +    return qatomic_load_acquire(&server->in_flight) > 0;
> > +}
> > +
>=20
> Any reason why you left the server->in_flight accesses in
> vu_client_trip() non-atomic?

I don't remember if it was a mistake or if there is a reason why it's
safe. I'll replace those accesses with calls to
vhost_user_server_has_in_flight().

Stefan

--XRuGd9g1z5oS2ell
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRRZz0ACgkQnKSrs4Gr
c8iEjwgAov+Ozs58HYaiYo0b4VnPoOnAM2QqHXYzmVRN4+5mqvFWNVKufgQMDbSG
1o1dgDNOCRU1tpOCUbNRYmvJxvYY6QA9Ho7AdLGPZc6jq2CR4LHarr5MP1Py5ktT
dGAN6GFH3qzsf93j4wEa0HnWax5RvOdFEPxkK2JKgXRA+AesbOLRizK1q2P5p3TH
6I0SfPnLhlTeosVaQ4mRLkZuXNt5/bTeh54lW/NSLP6IpbBoB082Wqr1JqCwjdVO
XxBNAMrMB/0oImJNHh9HSqpB2oHlL2FOa/yu++wNeZ1uzHdt7oRDpgwx2mQpMmiT
/HhN2vFe1XsM621h8uV5aa4HZH7Hiw==
=UcN5
-----END PGP SIGNATURE-----

--XRuGd9g1z5oS2ell--


