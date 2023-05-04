Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70256F4AEE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 22:08:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptwH1-0006HA-Il; Tue, 02 May 2023 16:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptwGz-0006Gj-BE
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:06:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptwGx-0008Q9-JM
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683058010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LgDhtbpQWSSNsgeEph8esneZJVWEPWcWGLZOnDkeVKE=;
 b=I0Q7FmXJcHgRPzDCGZVRZW5wO60zYEgbDh6m6zI866V9UqJgTP1ogT0D7leuNw5lt4X/CQ
 4mdfz0wigxjQtR4KNpZtCHoV3IUYUuJ3FFxTWQhsshlTH+M85y9xZA9tPMqXvq2tTEXqwY
 +2N0OZHYrZZ1yYiJn2VbMfAGN1Zu150=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-EPMPoQX1NfuQ2XU-a2gp2Q-1; Tue, 02 May 2023 16:06:48 -0400
X-MC-Unique: EPMPoQX1NfuQ2XU-a2gp2Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5758A85A588;
 Tue,  2 May 2023 20:06:47 +0000 (UTC)
Received: from localhost (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C37E1C15BAE;
 Tue,  2 May 2023 20:06:46 +0000 (UTC)
Date: Tue, 2 May 2023 16:06:45 -0400
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
Subject: Re: [PATCH v4 07/20] block/export: stop using is_external in
 vhost-user-blk server
Message-ID: <20230502200645.GE535070@fedora>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-8-stefanha@redhat.com>
 <ZFE0iFnbr2ey0A7X@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O5xAqfWJ9HxCWIfk"
Content-Disposition: inline
In-Reply-To: <ZFE0iFnbr2ey0A7X@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--O5xAqfWJ9HxCWIfk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 06:04:24PM +0200, Kevin Wolf wrote:
> Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> > vhost-user activity must be suspended during bdrv_drained_begin/end().
> > This prevents new requests from interfering with whatever is happening
> > in the drained section.
> >=20
> > Previously this was done using aio_set_fd_handler()'s is_external
> > argument. In a multi-queue block layer world the aio_disable_external()
> > API cannot be used since multiple AioContext may be processing I/O, not
> > just one.
> >=20
> > Switch to BlockDevOps->drained_begin/end() callbacks.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  block/export/vhost-user-blk-server.c | 43 ++++++++++++++--------------
> >  util/vhost-user-server.c             | 10 +++----
> >  2 files changed, 26 insertions(+), 27 deletions(-)
> >=20
> > diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-=
user-blk-server.c
> > index 092b86aae4..d20f69cd74 100644
> > --- a/block/export/vhost-user-blk-server.c
> > +++ b/block/export/vhost-user-blk-server.c
> > @@ -208,22 +208,6 @@ static const VuDevIface vu_blk_iface =3D {
> >      .process_msg           =3D vu_blk_process_msg,
> >  };
> > =20
> > -static void blk_aio_attached(AioContext *ctx, void *opaque)
> > -{
> > -    VuBlkExport *vexp =3D opaque;
> > -
> > -    vexp->export.ctx =3D ctx;
> > -    vhost_user_server_attach_aio_context(&vexp->vu_server, ctx);
> > -}
> > -
> > -static void blk_aio_detach(void *opaque)
> > -{
> > -    VuBlkExport *vexp =3D opaque;
> > -
> > -    vhost_user_server_detach_aio_context(&vexp->vu_server);
> > -    vexp->export.ctx =3D NULL;
> > -}
>=20
> So for changing the AioContext, we now rely on the fact that the node to
> be changed is always drained, so the drain callbacks implicitly cover
> this case, too?

Yes.

> >  static void
> >  vu_blk_initialize_config(BlockDriverState *bs,
> >                           struct virtio_blk_config *config,
> > @@ -272,6 +256,25 @@ static void vu_blk_exp_resize(void *opaque)
> >      vu_config_change_msg(&vexp->vu_server.vu_dev);
> >  }
> > =20
> > +/* Called with vexp->export.ctx acquired */
> > +static void vu_blk_drained_begin(void *opaque)
> > +{
> > +    VuBlkExport *vexp =3D opaque;
> > +
> > +    vhost_user_server_detach_aio_context(&vexp->vu_server);
> > +}
>=20
> Compared to the old code, we're losing the vexp->export.ctx =3D NULL. This
> is correct at this point because after drained_begin we still keep
> processing requests until we arrive at a quiescent state.
>=20
> However, if we detach the AioContext because we're deleting the
> iothread, won't we end up with a dangling pointer in vexp->export.ctx?
> Or can we be certain that nothing interesting happens before drained_end
> updates it with a new valid pointer again?

If you want I can add the detach() callback back again and set ctx to
NULL there?

Stefan

--O5xAqfWJ9HxCWIfk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRRbVUACgkQnKSrs4Gr
c8i4OAf+KMBGicSKs6PxKeNThQpFSMAOYw12vnQg0N97hfarjPeaKf9lZmdJLKB7
McPjsLuRThNx0snklzDlcRovZKNZcV5EjEddXKA1ikDqZXDeLue4X717xIIV1RF0
oYAyyPcTXr9V1JKG2nKQzz1fK/zb0oXyEycRI1uPB1YjiL/NnBUZEdAG3DEZmBXK
qjZcFpvChPe6DFydAfunLcRtoSASIb6cBLCeOFHXuTrKixFZeG9QDW87ONOMnG7D
JF3Cjcfsn94R6SFWDOK2TGeKF7IY6kVJa+gOJXyTE2+n2vZhpezwmroM4kprRJGc
TiMUeoBbZl3Oi5FrMOcj7MOeMEdRlw==
=PCPd
-----END PGP SIGNATURE-----

--O5xAqfWJ9HxCWIfk--


