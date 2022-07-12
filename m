Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEB95719C9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:22:44 +0200 (CEST)
Received: from localhost ([::1]:48494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBEuZ-00028w-9J
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBEqN-0006tG-69
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:18:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBEqL-00042A-Iu
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:18:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657628301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=60GPsrkzlYFz33+fMQWHEFx4Fls2gjD8WofG6lFP8eQ=;
 b=RSMP0Sq5C8C3OPqXlFu3EuEeKmJ2xkHJWY7d2mbfC0k9e2qD0XFeFEk19AmRtLaZOGb0Zo
 BYK1PZvT8U/f9IswVqQbjailJ3Qj4elOedzXhSOmJmxm1VVXEkL4ifP0YAYHDlB4rsUGqF
 X1723LzF1aepG0EFVfB4t6RMnTw17rA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-2HoVRWMQPjetF9JOLxtabw-1; Tue, 12 Jul 2022 08:18:18 -0400
X-MC-Unique: 2HoVRWMQPjetF9JOLxtabw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2C58101E168;
 Tue, 12 Jul 2022 12:18:17 +0000 (UTC)
Received: from localhost (unknown [10.39.193.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 942B29D7F;
 Tue, 12 Jul 2022 12:18:17 +0000 (UTC)
Date: Tue, 12 Jul 2022 13:18:16 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 3/8] virtio_blk_process_queued_requests: always run in a bh
Message-ID: <Ys1miHWFLCR1ArKm@stefanha-x1.localdomain>
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-4-eesposit@redhat.com>
 <YsRJeay6omYXu3Cd@stefanha-x1.localdomain>
 <fef736a3-e5b9-762b-2605-5f04170fbf54@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qh/14SL9TGfxMXni"
Content-Disposition: inline
In-Reply-To: <fef736a3-e5b9-762b-2605-5f04170fbf54@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qh/14SL9TGfxMXni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2022 at 11:07:06AM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> Am 05/07/2022 um 16:23 schrieb Stefan Hajnoczi:
> > On Thu, Jun 09, 2022 at 10:37:22AM -0400, Emanuele Giuseppe Esposito wr=
ote:
> >> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virt=
io-blk.c
> >> index f9224f23d2..03e10a36a4 100644
> >> --- a/hw/block/dataplane/virtio-blk.c
> >> +++ b/hw/block/dataplane/virtio-blk.c
> >> @@ -234,8 +234,16 @@ int virtio_blk_data_plane_start(VirtIODevice *vde=
v)
> >>          goto fail_aio_context;
> >>      }
> >> =20
> >> +    blk_inc_in_flight(s->conf->conf.blk);
> >=20
> > Missing comment explaining why the in-flight counter is incremented and
> > where the matching decrement operation is located.
> >=20
> > I think you can get away without a comment if blk_inc_in_flight() is
> > right next to aio_bh_new(), but in this case there are a few lines of
> > code in between and it becomes unclear if there is a connection.
>=20
> I will simply add:
>=20
>     /*
>      * virtio_blk_restart_bh() code will take care of decrementing
>      * in_flight counter.
>      */
>=20
> should make sense.

Perfect.

>=20
> >=20
> >> +    /*
> >> +     * vblk->bh is only set in virtio_blk_dma_restart_cb, which
> >> +     * is called only on vcpu start or stop.
> >> +     * Therefore it must be null.
> >> +     */
> >> +    assert(vblk->bh =3D=3D NULL);
> >>      /* Process queued requests before the ones in vring */
> >=20
> > This comment makes an assumption about the order of file descriptor
> > handlers vs BHs in the event loop. I suggest removing the comment. There
> > is no reason for processing queued requests first anyway since
> > virtio-blk devices can complete requests in any order.
> >=20
>=20
> Ok, I guess you mean in a separate patch.

No, before this patch the comment was correct. Now it's questionable
because the (synchronous) call has been replaced with a BH.

I think it's appropriate to drop this comment in this patch.

Stefan

--qh/14SL9TGfxMXni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLNZogACgkQnKSrs4Gr
c8gm1AgAoKvMnfPRu5Vf+PkMQozngtpCZrFj9ZbH5j67/bicF4LENzkMt0UGYeLY
ZC3IRciC6F6sps04qkxmDe5vXiLDymL9zcJX6P9uFn2LaEM7ffqcrO9K6GXqNeGh
52zjizE/tVaol2BOoWfQAsOR+4rjoiRlpQc09oYNArTreR9az4PydgLA/wxpc+vY
l//+Jyo2ZGZkxiuD1W2QzXsxWVD7+VeAB8qFqDNlezqwFZWPyNBR5AScIyaMGYc1
6FVRXdGfEG31fLalmh+/Y3AWjpRycL/ioDZZGe196BHLvMYhFNFE98knBX2pVY4d
44qGpM4YgbAb+pg7s4u34PhGqUW1SQ==
=VK6N
-----END PGP SIGNATURE-----

--qh/14SL9TGfxMXni--


