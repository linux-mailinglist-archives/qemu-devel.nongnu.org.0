Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2051B42208D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:21:21 +0200 (CEST)
Received: from localhost ([::1]:40278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXfhQ-0004jB-6b
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXfax-0004iD-1P
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:14:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXfau-0000vI-IP
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633421675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AsbM8CV81b+mEJJ1LcPJtz9XGk14XNN4bkf+Flg+WEE=;
 b=LCg4Q/mKI6cz6KvOemQJ8emZyzBjS5R8wIxqZHD/18VrW9/Xv06knAbARH/L5+onOa26+B
 9iaGq8hyczwwprMP3cGtE6Or7T/wk4X6Re5jHvGYFDzobgqdEPb4BshKfmyajlebYQ4to6
 6A+jb9qLO2h7iSFLZ7bekaxEnpjVB5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-ROlxec67MiyDRq0ZXw87-g-1; Tue, 05 Oct 2021 04:14:34 -0400
X-MC-Unique: ROlxec67MiyDRq0ZXw87-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C0B018125C3;
 Tue,  5 Oct 2021 08:14:33 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D43B1850E;
 Tue,  5 Oct 2021 08:14:15 +0000 (UTC)
Date: Tue, 5 Oct 2021 09:14:14 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 08/13] virtiofsd: Create a notification queue
Message-ID: <YVwJVlRFUaw+W+lo@stefanha-x1.localdomain>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-9-vgoyal@redhat.com>
 <YVsQDkoNPyvC/Uoo@stefanha-x1.localdomain>
 <YVtrk6/sWwoUfXs+@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVtrk6/sWwoUfXs+@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GNMiKuBvTSe6DbNh"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, iangelak@redhat.com,
 dgilbert@redhat.com, virtio-fs@redhat.com, jaggel@bu.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--GNMiKuBvTSe6DbNh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 05:01:07PM -0400, Vivek Goyal wrote:
> On Mon, Oct 04, 2021 at 03:30:38PM +0100, Stefan Hajnoczi wrote:
> > On Thu, Sep 30, 2021 at 11:30:32AM -0400, Vivek Goyal wrote:
> > > Add a notification queue which will be used to send async notificatio=
ns
> > > for file lock availability.
> > >=20
> > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
> > > ---
> > >  hw/virtio/vhost-user-fs-pci.c     |  4 +-
> > >  hw/virtio/vhost-user-fs.c         | 62 +++++++++++++++++++++++++--
> > >  include/hw/virtio/vhost-user-fs.h |  2 +
> > >  tools/virtiofsd/fuse_i.h          |  1 +
> > >  tools/virtiofsd/fuse_virtio.c     | 70 +++++++++++++++++++++++------=
--
> > >  5 files changed, 116 insertions(+), 23 deletions(-)
> > >=20
> > > diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-=
pci.c
> > > index 2ed8492b3f..cdb9471088 100644
> > > --- a/hw/virtio/vhost-user-fs-pci.c
> > > +++ b/hw/virtio/vhost-user-fs-pci.c
> > > @@ -41,8 +41,8 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProx=
y *vpci_dev, Error **errp)
> > >      DeviceState *vdev =3D DEVICE(&dev->vdev);
> > > =20
> > >      if (vpci_dev->nvectors =3D=3D DEV_NVECTORS_UNSPECIFIED) {
> > > -        /* Also reserve config change and hiprio queue vectors */
> > > -        vpci_dev->nvectors =3D dev->vdev.conf.num_request_queues + 2=
;
> > > +        /* Also reserve config change, hiprio and notification queue=
 vectors */
> > > +        vpci_dev->nvectors =3D dev->vdev.conf.num_request_queues + 3=
;
> > >      }
> > > =20
> > >      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> > > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > > index d1efbc5b18..6bafcf0243 100644
> > > --- a/hw/virtio/vhost-user-fs.c
> > > +++ b/hw/virtio/vhost-user-fs.c
> > > @@ -31,6 +31,7 @@ static const int user_feature_bits[] =3D {
> > >      VIRTIO_F_NOTIFY_ON_EMPTY,
> > >      VIRTIO_F_RING_PACKED,
> > >      VIRTIO_F_IOMMU_PLATFORM,
> > > +    VIRTIO_FS_F_NOTIFICATION,
> > > =20
> > >      VHOST_INVALID_FEATURE_BIT
> > >  };
> > > @@ -147,7 +148,7 @@ static void vuf_handle_output(VirtIODevice *vdev,=
 VirtQueue *vq)
> > >       */
> > >  }
> > > =20
> > > -static void vuf_create_vqs(VirtIODevice *vdev)
> > > +static void vuf_create_vqs(VirtIODevice *vdev, bool notification_vq)
> > >  {
> > >      VHostUserFS *fs =3D VHOST_USER_FS(vdev);
> > >      unsigned int i;
> > > @@ -155,6 +156,15 @@ static void vuf_create_vqs(VirtIODevice *vdev)
> > >      /* Hiprio queue */
> > >      fs->hiprio_vq =3D virtio_add_queue(vdev, fs->conf.queue_size,
> > >                                       vuf_handle_output);
> > > +    /*
> > > +     * Notification queue. Feature negotiation happens later. So at =
this
> > > +     * point of time we don't know if driver will use notification q=
ueue
> > > +     * or not.
> > > +     */
> > > +    if (notification_vq) {
> > > +        fs->notification_vq =3D virtio_add_queue(vdev, fs->conf.queu=
e_size,
> > > +                                               vuf_handle_output);
> > > +    }
> > > =20
> > >      /* Request queues */
> > >      fs->req_vqs =3D g_new(VirtQueue *, fs->conf.num_request_queues);
> > > @@ -163,8 +173,12 @@ static void vuf_create_vqs(VirtIODevice *vdev)
> > >                                            vuf_handle_output);
> > >      }
> > > =20
> > > -    /* 1 high prio queue, plus the number configured */
> > > -    fs->vhost_dev.nvqs =3D 1 + fs->conf.num_request_queues;
> > > +    /* 1 high prio queue, 1 notification queue plus the number confi=
gured */
> > > +    if (notification_vq) {
> > > +        fs->vhost_dev.nvqs =3D 2 + fs->conf.num_request_queues;
> > > +    } else {
> > > +        fs->vhost_dev.nvqs =3D 1 + fs->conf.num_request_queues;
> > > +    }
> > >      fs->vhost_dev.vqs =3D g_new0(struct vhost_virtqueue, fs->vhost_d=
ev.nvqs);
> > >  }
> > > =20
> > > @@ -176,6 +190,11 @@ static void vuf_cleanup_vqs(VirtIODevice *vdev)
> > >      virtio_delete_queue(fs->hiprio_vq);
> > >      fs->hiprio_vq =3D NULL;
> > > =20
> > > +    if (fs->notification_vq) {
> > > +        virtio_delete_queue(fs->notification_vq);
> > > +    }
> > > +    fs->notification_vq =3D NULL;
> > > +
> > >      for (i =3D 0; i < fs->conf.num_request_queues; i++) {
> > >          virtio_delete_queue(fs->req_vqs[i]);
> > >      }
> > > @@ -194,9 +213,43 @@ static uint64_t vuf_get_features(VirtIODevice *v=
dev,
> > >  {
> > >      VHostUserFS *fs =3D VHOST_USER_FS(vdev);
> > > =20
> > > +    virtio_add_feature(&features, VIRTIO_FS_F_NOTIFICATION);
> > > +
> > >      return vhost_get_features(&fs->vhost_dev, user_feature_bits, fea=
tures);
> > >  }
> > > =20
> > > +static void vuf_set_features(VirtIODevice *vdev, uint64_t features)
> > > +{
> > > +    VHostUserFS *fs =3D VHOST_USER_FS(vdev);
> > > +
> > > +    if (virtio_has_feature(features, VIRTIO_FS_F_NOTIFICATION)) {
> > > +        fs->notify_enabled =3D true;
> > > +        /*
> > > +         * If guest first booted with no notification queue support =
and
> > > +         * later rebooted with kernel which supports notification, w=
e
> > > +         * can end up here
> > > +         */
> > > +        if (!fs->notification_vq) {
> > > +            vuf_cleanup_vqs(vdev);
> > > +            vuf_create_vqs(vdev, true);
> > > +        }
> >=20
> > I would simplify things by unconditionally creating the notification vq
> > for the device and letting the vhost-user device backend decide whether
> > it wants to handle the vq or not.
> > If the backend doesn't implement the
> > vq then it also won't advertise VIRTIO_FS_F_NOTIFICATION so the guest
> > driver won't submit virtqueue buffers.
>=20
> I think I am did not understand the idea. This code deals with that
> both qemu and vhost-user device can deal with notification queue. But
> driver can't deal with it.=20
>=20
> So if we first booted into a guest kernel which does not support
> notification queue, then we will not have instantiated notification
> queue. But later we reboot guest into a newer kernel and now it
> has capability to deal with notification queues, so we create it
> now.
>=20
> IIUC, you are suggesting that somehow keep notification queue
> instantiated even if guest driver does not support notifications, so
> that we will not have to get into the exercise of cleaning up queues
> and re-instantiating these?

Yes.

> But I think we can't keep notification queue around if driver does
> not support it. Because it changes queue index. queue index 1 will
> belong to request queue if notifications are not enabled otherwise
> it will belong to notification queue. So If I always instantiate
> notification queue, then guest and qemu/virtiofsd will have
> different understanding of which queue index belongs to what
> queue.

The meaning of the virtqueue doesn't matter. That only matters to
virtiofsd when processing virtqueues. Since QEMU's -device
vhost-user-fs doesn't process virtqueues there's no difference between
hipri, request, and notification virtqueues.

I'm not 100% sure that the vhost-user code is set up to work smoothly in
this fashion, but I think it should be possible to make this work and
the end result will be simpler.

Stefan

--GNMiKuBvTSe6DbNh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFcCVYACgkQnKSrs4Gr
c8gUhQgAhDSDoXmBt36ckc/L1xioUJPhdWpIRjhR9GQ0aaI3NMTI6CauS+5MmYwg
+PEoDIScGxtZOqYk1HKMAKYo/HmxSF3EH4lnkdi4SFgOQoejmDibywTo1djT6cm/
OsChgjfSblqsLN6j+QRCNi1/fLPoWRR7qYBXelnHIDrs9/ruLEYPWvg8jDulSjie
muLvuhFCpxBZrrTmDCy1xBa2JO2tGBSSbyDz4kOuLzb0lTM3UtDtojoiwJdT0ols
yltahA/qpdR3KPBOEMxQwO0WA6u8YyqLR0gc+WvqqfB3UaARGwJvvDNm+K0NiA/E
9CzvIBhNJ7E+lpql3sMdSA6YTxJ9eQ==
=SxKk
-----END PGP SIGNATURE-----

--GNMiKuBvTSe6DbNh--


