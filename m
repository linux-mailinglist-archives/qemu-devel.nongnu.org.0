Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324E640D480
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 10:30:11 +0200 (CEST)
Received: from localhost ([::1]:58674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQmmX-0006U3-Mr
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 04:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQmlE-0005kV-1R
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:28:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQmlA-0001bJ-Bl
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:28:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631780922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1V+xA8pMST3m3K3EIPmX684IbS8oNjQD8Tubx7dumCQ=;
 b=KJ3G88c8wP8agattMs5JtCKI8HYdxI0rrdwPAZHVWEw8av7/xpwyRVzRnk14zm6cOmz1oh
 egxZ035mQNUJ+8uyNhXn9uyJUJ2MwmhokZ/aNfyysP2yS7HsaP0LTkUlT4ixyUijD9H2gm
 Psrw5jA+X7Utgt08EYPVsKu8BOceshI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-X0HVvbd3NvutIzqfuP2QCg-1; Thu, 16 Sep 2021 04:28:39 -0400
X-MC-Unique: X0HVvbd3NvutIzqfuP2QCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2839F1006AAA;
 Thu, 16 Sep 2021 08:28:38 +0000 (UTC)
Received: from localhost (unknown [10.39.192.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A75FB10190CA;
 Thu, 16 Sep 2021 08:28:32 +0000 (UTC)
Date: Thu, 16 Sep 2021 09:28:31 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: Re: [RFC v6] virtio/vsock: add two more queues for datagram types
Message-ID: <YUMALy/a3Sc9w1gZ@stefanha-x1.localdomain>
References: <20210913221843.2304308-1-jiang.wang@bytedance.com>
 <YUCZntCNrLQTu9Xu@stefanha-x1.localdomain>
 <CAP_N_Z8vJF7F=mhpRpcFwQarFH_uLWBmahi0jb1q6yj=j7YSXg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP_N_Z8vJF7F=mhpRpcFwQarFH_uLWBmahi0jb1q6yj=j7YSXg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4hZZeVXG6WFbIPfq"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, HarshaNavkis@gmail.com,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--4hZZeVXG6WFbIPfq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 08:59:17PM -0700, Jiang Wang . wrote:
> On Tue, Sep 14, 2021 at 5:46 AM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> > On Mon, Sep 13, 2021 at 10:18:43PM +0000, Jiang Wang wrote:
> > > diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsoc=
k.c
> > > index 6095ed7349..e9ec0e1c00 100644
> > > --- a/hw/virtio/vhost-user-vsock.c
> > > +++ b/hw/virtio/vhost-user-vsock.c
> > > @@ -105,7 +105,7 @@ static void vuv_device_realize(DeviceState *dev, =
Error **errp)
> > >          return;
> > >      }
> > >
> > > -    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
> > > +    vhost_vsock_common_realize(vdev, "vhost-user-vsock", false);
> >
> > VIRTIO_VSOCK_F_DGRAM support should work equally well for
> > vhost-user-vsock. I don't think there is a need to disable it here.
> >
> Stefano mentioned in previous email ( V3 ) that I can disable dgram
> for vhost-user-vsock for now. I think we need some extra changes to
> fully support vhost-vsock-user, like feature discovery?

I'm not sure why enabling it on the QEMU side poses a problem? VIRTIO
feature negotiation will disable it (if the feature bit is included in
user_feature_bits[]) if the vhost-user device backend lacks support.

> > >      /* The event queue belongs to QEMU */
> > >      vvc->event_vq =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> > >                                         vhost_vsock_common_handle_out=
put);
> > >
> > > -    vvc->vhost_dev.nvqs =3D ARRAY_SIZE(vvc->vhost_vqs);
> > > -    vvc->vhost_dev.vqs =3D vvc->vhost_vqs;
> > > +    vvc->vhost_dev.nvqs =3D nvqs;
> > > +    vvc->vhost_dev.vqs =3D g_new0(struct vhost_virtqueue, vvc->vhost=
_dev.nvqs);
> >
> > IIUC the number of virtqueues needs to be the maximum supported number.
> > It's okay to have more virtqueues than needed. The feature bit is used
> > by the driver to detect the device's support for dgrams, not the number
> > of virtqueues.
> >
> OK. I can just make these changes. But I am not able to test vhost-user-v=
sock
> as of now. I tried to follow the steps on here:
> https://patchew.org/QEMU/20200515152110.202917-1-sgarzare@redhat.com/
> But the git repo for the vhost-user-vsock is kind of broken. I tried to
> fix it but I am new to rust so it will take some time. Is there any updat=
ed
> or an easier way to test vhost-user-vsock?

Harsha or Stefano can help with this.

> > > @@ -132,13 +138,34 @@ static const VMStateDescription vmstate_virtio_=
vhost_vsock =3D {
> > >      .post_load =3D vhost_vsock_common_post_load,
> > >  };
> > >
> > > +static bool vhost_vsock_dgram_supported(int vhostfd, Error **errp)
> > > +{
> > > +    uint64_t features;
> > > +    int ret;
> > > +
> > > +    ret =3D ioctl(vhostfd, VHOST_GET_FEATURES, &features);
> > > +    if (ret) {
> > > +        error_setg(errp, "vhost-vsock: failed to read device freatur=
es. %s",
> > > +                     strerror(errno));
> > > +        return false;
> > > +    }
> >
> > ioctl(2) shouldn't be necessary. Let vhost detect features from the
> > device backend (vhost kernel or vhost-user) and don't worry about
> I did not get this part. What are the difference between vhost and
> device backend? I thought vhost is the device backend? vhost kernel
> is one kind of backend and vhost-user is another kind.  Could you explain
> more? Thanks.
>=20
> > conditionally adding the exact number of virtqueues.

By "Let vhost detect features" I meant let the QEMU "hw/virtio/vhost.h"
API detect the features from the backend (either vhost kernel or
vhost-user). vhost_dev_init() and the other functions already check the
device backend's features, so there should be no need to manually make
an ioctl() call from hw/vhost-vsock.c. The purpose of the QEMU vhost API
is to abstract the backend so device code like hw/vhost-vsock.c doesn't
need to know whether it is communicating with a vhost kernel or
vhost-user device backend.

--4hZZeVXG6WFbIPfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFDAC8ACgkQnKSrs4Gr
c8h1FwgAxcu8JxEq+9sGdDmEEBRBKPeIiuspXVi5FNM+r9p8XzuFK+RR4zYzQZXF
9vHOhlv3dkSuTZ8YY2MIlqaoFnMOg4K/w0GUTwuqow1y9nMj55itPzL7rmzniTGf
BUosQLTapnXbp7+p2IJud3AK97nxi1fPnYYnOAnQV1AcXFzLewnpjg+yIgVqhp8x
iig+Lin0qLfSTxCdBi3X+bZbkEa7hgqzYUPLEnx2xa+vdovzsZU6YxiYQZfXWqyE
uYBMAs8qqsoDauLwZyD/PDjLuhgWzNHp3pOBRg4fJbtrmfa+BfwQOzHtg9mxEAgv
kGM17pTRuxEff5cUHtDoxVuIde6giw==
=p2ss
-----END PGP SIGNATURE-----

--4hZZeVXG6WFbIPfq--


