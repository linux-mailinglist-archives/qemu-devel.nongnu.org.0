Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB57B6FFBD1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 23:24:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxDkk-0003bz-FB; Thu, 11 May 2023 17:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pxDki-0003bh-FB
 for qemu-devel@nongnu.org; Thu, 11 May 2023 17:23:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pxDkg-0001Jn-RN
 for qemu-devel@nongnu.org; Thu, 11 May 2023 17:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683840185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=15TTAtwTe95TssE/QqqHEBqg7HkRY26GkLUlrAlX6ug=;
 b=iqb/IVIuPMRgyZLyouxClOLbHmXtRDLqXJRs10nsyWOYeopp8cLic4Tiz30otHMQMNBBpx
 yH69+gzkE2uzTA0hTYYBxmLXca6oo/mWIdZnk4PABRa+78u3zfF554Aubah6c2TY1VyJWk
 NQ8D6p08gebFXSmfQiusO3Ry/hMf96A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-3xO6SSSRNHmyv7vq4yn9MA-1; Thu, 11 May 2023 17:23:01 -0400
X-MC-Unique: 3xO6SSSRNHmyv7vq4yn9MA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1EFD101A54F;
 Thu, 11 May 2023 21:23:00 +0000 (UTC)
Received: from localhost (unknown [10.39.194.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C76ED1121314;
 Thu, 11 May 2023 21:22:59 +0000 (UTC)
Date: Thu, 11 May 2023 17:22:57 -0400
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
Subject: Re: [PATCH v4 17/20] virtio-blk: implement
 BlockDevOps->drained_begin()
Message-ID: <20230511212257.GC1425915@fedora>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-18-stefanha@redhat.com>
 <ZFQgBvWShB4NCymj@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Oiaj1dMwGdbo2z3S"
Content-Disposition: inline
In-Reply-To: <ZFQgBvWShB4NCymj@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--Oiaj1dMwGdbo2z3S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 11:13:42PM +0200, Kevin Wolf wrote:
> Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> > Detach ioeventfds during drained sections to stop I/O submission from
> > the guest. virtio-blk is no longer reliant on aio_disable_external()
> > after this patch. This will allow us to remove the
> > aio_disable_external() API once all other code that relies on it is
> > converted.
> >=20
> > Take extra care to avoid attaching/detaching ioeventfds if the data
> > plane is started/stopped during a drained section. This should be rare,
> > but maybe the mirror block job can trigger it.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  hw/block/dataplane/virtio-blk.c | 17 +++++++++------
> >  hw/block/virtio-blk.c           | 38 ++++++++++++++++++++++++++++++++-
> >  2 files changed, 48 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virti=
o-blk.c
> > index bd7cc6e76b..d77fc6028c 100644
> > --- a/hw/block/dataplane/virtio-blk.c
> > +++ b/hw/block/dataplane/virtio-blk.c
> > @@ -245,13 +245,15 @@ int virtio_blk_data_plane_start(VirtIODevice *vde=
v)
> >      }
> > =20
> >      /* Get this show started by hooking up our callbacks */
> > -    aio_context_acquire(s->ctx);
> > -    for (i =3D 0; i < nvqs; i++) {
> > -        VirtQueue *vq =3D virtio_get_queue(s->vdev, i);
> > +    if (!blk_in_drain(s->conf->conf.blk)) {
> > +        aio_context_acquire(s->ctx);
> > +        for (i =3D 0; i < nvqs; i++) {
> > +            VirtQueue *vq =3D virtio_get_queue(s->vdev, i);
> > =20
> > -        virtio_queue_aio_attach_host_notifier(vq, s->ctx);
> > +            virtio_queue_aio_attach_host_notifier(vq, s->ctx);
> > +        }
> > +        aio_context_release(s->ctx);
> >      }
> > -    aio_context_release(s->ctx);
> >      return 0;
> > =20
> >    fail_aio_context:
> > @@ -317,7 +319,10 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
> >      trace_virtio_blk_data_plane_stop(s);
> > =20
> >      aio_context_acquire(s->ctx);
> > -    aio_wait_bh_oneshot(s->ctx, virtio_blk_data_plane_stop_bh, s);
> > +
> > +    if (!blk_in_drain(s->conf->conf.blk)) {
> > +        aio_wait_bh_oneshot(s->ctx, virtio_blk_data_plane_stop_bh, s);
> > +    }
>=20
> So here we actually get a semantic change: What you described as the
> second part in the previous patch, processing the virtqueue one last
> time, isn't done any more if the device is drained.
>=20
> If it's okay to just skip this during drain, why do we need to do it
> outside of drain?

I forgot to answer why we need to process requests one last time outside
drain.

This approach comes from how vhost uses ioeventfd. When switching from
vhost back to QEMU emulation, there's a chance that a final virtqueue
kick snuck in while ioeventfd was being disabled.

This is not the case with dataplane nowadays (it may have in the past).
The only state dataplane transitions are device reset and 'stop'/'cont'.
Neither of these require QEMU to process new requests in while stopping
dataplane.

My confidence is not 100%, but still pretty high that the
virtio_queue_host_notifier_read() call could be dropped from dataplane
code. Since I'm not 100% sure I didn't attempt that.

Stefan

--Oiaj1dMwGdbo2z3S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRdXLEACgkQnKSrs4Gr
c8jaKwf/fkopq41ZCcEWQFE6onRfieKs07b9qdmYnv9Ly46C4LHZe6PGnV7WnARH
Io4P4+i62gfIqhSteatqauqvYq0TKi/1WtWlzzOZhBU4J2zQGkJ29d5j7Z5YCTb7
uNx4J0SysXXmIau/T/Tg0KbpTI8srRIYOW5j7qlrEiLcINJvXaK10xjyz3ANbGkl
uh/ieO4H2Yuf4IZn51Lm7xQhUfcHCVNOS2Or0s2zrhu4wI8UpJUIrcH56yQIoXis
isUj+u0Yh4B7BMeBVYSOfV4omMO8NhBALqjpJBJ4frnh+1RZ0aeZKB0PWPafYYrc
UkYTFhgJIK8F7OpXUii69DxnOfDAmQ==
=Ls32
-----END PGP SIGNATURE-----

--Oiaj1dMwGdbo2z3S--


