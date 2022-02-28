Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DBD4C6FC2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:44:02 +0100 (CET)
Received: from localhost ([::1]:51186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOhFq-0004ww-3U
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:44:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nOhEG-0003aH-3y
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:42:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nOhEE-0001Ij-5D
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:42:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646059340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oV3OxPtlk8KV7MfGewt5cLtQscK8LOjzE/mjAiF5XPQ=;
 b=dVpSH9IW7kDWzikJ7q65l5YKB1wmYzXe2FTpmtZN3w3lFy44xyHNiymVmCe5T3nQ1PGZq+
 e/hXDPHN3RSrE7q2NP0pM/GfjP2/4qgaUXpJF8TQC5DBfg/sjNcGFiVzI8MLI8c/JGeA92
 KjQOYQiHO+GP81reaoUs5pqOkyXasQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-5jYi6HbVOmurH1elB_i1YA-1; Mon, 28 Feb 2022 09:42:17 -0500
X-MC-Unique: 5jYi6HbVOmurH1elB_i1YA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A75FF51DF;
 Mon, 28 Feb 2022 14:42:15 +0000 (UTC)
Received: from localhost (unknown [10.39.192.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 421C284976;
 Mon, 28 Feb 2022 14:42:15 +0000 (UTC)
Date: Mon, 28 Feb 2022 14:03:28 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: What is the correct way to handle the VirtIO config space in
 vhost-user?
Message-ID: <YhzWMMLTZY1e24Uh@stefanha-x1.localdomain>
References: <87ee3q3mos.fsf@linaro.org>
 <87a6ee3l5e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KaRo7IZzdBD3KNOt"
Content-Disposition: inline
In-Reply-To: <87a6ee3l5e.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KaRo7IZzdBD3KNOt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2022 at 05:32:43PM +0000, Alex Benn=E9e wrote:
>=20
> [Apologies to CC list for repost due to fat fingering the mailing list ad=
dress]
>=20
> Hi Michael,
>=20
> I was updating my vhost-user-rpmb implementation when I realised it
> wasn't handling config space access properly. However when I went to
> implement it I realised there seems to be two ways of doing this. For
> example in vhost-user-gpu we have:
>=20
>   static void
>   vhost_user_gpu_get_config(VirtIODevice *vdev, uint8_t *config_data)
>   {
>       VhostUserGPU *g =3D VHOST_USER_GPU(vdev);
>       VirtIOGPUBase *b =3D VIRTIO_GPU_BASE(vdev);
>       struct virtio_gpu_config *vgconfig =3D
>           (struct virtio_gpu_config *)config_data;
>       Error *local_err =3D NULL;
>       int ret;
>=20
>       memset(config_data, 0, sizeof(struct virtio_gpu_config));
>=20
>       ret =3D vhost_dev_get_config(&g->vhost->dev,
>                                  config_data, sizeof(struct virtio_gpu_co=
nfig),
>                                  &local_err);
>       if (ret) {
>           error_report_err(local_err);
>           return;
>       }
>=20
>       /* those fields are managed by qemu */
>       vgconfig->num_scanouts =3D b->virtio_config.num_scanouts;
>       vgconfig->events_read =3D b->virtio_config.events_read;
>       vgconfig->events_clear =3D b->virtio_config.events_clear;
>   }
>=20
> which is setup with .get_config and .set_config functions that poke the
> appropriate vhost communication. However to do this needs an instance
> init to create a vhost just so it can jump the g->vhost->dev indirection:
>=20
>   static void
>   vhost_user_gpu_instance_init(Object *obj)
>   {
>       VhostUserGPU *g =3D VHOST_USER_GPU(obj);
>=20
>       g->vhost =3D VHOST_USER_BACKEND(object_new(TYPE_VHOST_USER_BACKEND)=
);
>       object_property_add_alias(obj, "chardev",
>                                 OBJECT(g->vhost), "chardev");
>   }
>=20
> (aside: this continues my QOM confusion about when things should be in a
> class or instance init, up until this point I hadn't needed it in my
> stub).

Class init is a one-time per-class initializer function. It is mostly
used for setting up callbacks/overridden methods from the base class.

Instance init is like an object constructor in object-oriented
programming.

> However when grepping around I found some vhost-user devices do it
> differently, for example vhost-user-blk has:
>=20
>   static int vhost_user_blk_handle_config_change(struct vhost_dev *dev)
>   {
>       int ret;
>       struct virtio_blk_config blkcfg;
>       VHostUserBlk *s =3D VHOST_USER_BLK(dev->vdev);
>       Error *local_err =3D NULL;
>=20
>       ret =3D vhost_dev_get_config(dev, (uint8_t *)&blkcfg,
>                                  sizeof(struct virtio_blk_config),
>                                  &local_err);
>       if (ret < 0) {
>           error_report_err(local_err);
>           return ret;
>       }
>=20
>       /* valid for resize only */
>       if (blkcfg.capacity !=3D s->blkcfg.capacity) {
>           s->blkcfg.capacity =3D blkcfg.capacity;
>           memcpy(dev->vdev->config, &s->blkcfg, sizeof(struct virtio_blk_=
config));
>           virtio_notify_config(dev->vdev);
>       }
>=20
>       return 0;
>   }

This is not a .get_config() method, it's a VIRTIO configuration change
notification handler. The vhost-user-blk device server ("slave") sends
this notification to notify the driver that configuration space contents
have been updated (e.g. the disk was resized). QEMU fetches the new
config space contents from the device and then forwards the notification
to the guest.

The .get_config() method for vhost-user-blk.c is:

  static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t *con=
fig)
  {
      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
 =20
      /* Our num_queues overrides the device backend */
      virtio_stw_p(vdev, &s->blkcfg.num_queues, s->num_queues);
 =20
      memcpy(config, &s->blkcfg, sizeof(struct virtio_blk_config));
  }

vhost_user_blk_update_config() is simple, it copies out s->blkcfg.

> Although this seems to miss the ability to "set" a config - although
> that seems confusing anyway, surely the guest only ever reads the config
> space?

VIRTIO allows the driver to write to the config space. This is used to
toggle the disk write cache on the virtio-blk device, for example.

> So my question is which approach is the correct one? Is one a legacy
> approach or is it "depends on what you are doing"?

Yes, it depends on whether the device sends configuration space change
notifications or not. If not, a traditional .get_config() like
vhost-user-gpu can be used. If yes, then caching the configuration space
contents like vhost-user-blk is convenient.

Stefan

--KaRo7IZzdBD3KNOt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIc1jAACgkQnKSrs4Gr
c8jCWQf+NTA3Cy/TIbzJDenWqLk/TDy/1HYxRyfo1uVk7gp6N64dibgrrAYHXwge
oUODn1Fl+svQSFmCydqlCsDxVhnrcDiYH5IxhQyeTKvrVlZQ3/o8ZS6unnhNu7ag
NgbdgN5/BVVfvq8cHFCxpYU/Mmuwiql4y4s2kaRbuQovuVsLtiGulaW4MmskZxfT
ukifEEIORocXkTSpPviJXlqWhB3X7uWrNqT0dRCchqALk9SE2iwrL37QK+ZYMI/H
Bne1Fe0M6A/0th3hfJ1PvziklBI/hgiklEnR+uoyVkptgYOCvq05Pexz9Idn3YkB
LeYiNFktWuE39xi7B4THH9CSN1Q0zA==
=dKg5
-----END PGP SIGNATURE-----

--KaRo7IZzdBD3KNOt--


