Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41FC632945
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:21:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9XC-0005Ip-7n; Mon, 21 Nov 2022 11:20:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox9Wv-0005Ed-Fp
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:20:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox9Ws-00086S-VS
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:20:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669047616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U+8TAgYfWWVMEPiJZeL4kBJ5Wy4hnEED9lCIgPuG3Vo=;
 b=MvgFaW69/gGrkexrvjn9hnHhfNa7HObE7f7InhYnFF6YtjkMmLrKGnvOrAQZeMdSJJzCj+
 3wFQr7hYw7Pxi/bWJ3nFRHKBtfxqBWdDzQkCqxxm0tZO57I29lwf/AmKlNKxNuAkjvIQkY
 XS9vLzfowlvyCedt0GlEpUhc/WaeOuU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-f81cNApvO06ZhgPIkclBQg-1; Mon, 21 Nov 2022 11:20:12 -0500
X-MC-Unique: f81cNApvO06ZhgPIkclBQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E590833A06;
 Mon, 21 Nov 2022 16:20:12 +0000 (UTC)
Received: from localhost (unknown [10.39.195.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 536F640C6E13;
 Mon, 21 Nov 2022 16:20:11 +0000 (UTC)
Date: Mon, 21 Nov 2022 11:20:07 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, virtio-fs@redhat.com,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, kangjie.xu@linux.alibaba.com,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: mask VIRTIO_F_RING_RESET for vhost and vhost-user
 devices
Message-ID: <Y3ulN5DtIN4YIHy6@fedora>
References: <20221121101101.29400-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yGYzq2s7HGeIQb5G"
Content-Disposition: inline
In-Reply-To: <20221121101101.29400-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--yGYzq2s7HGeIQb5G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2022 at 11:11:01AM +0100, Stefano Garzarella wrote:
> Commit 69e1c14aa2 ("virtio: core: vq reset feature negotation support")
> enabled VIRTIO_F_RING_RESET by default for all virtio devices.
>=20
> This feature is not currently emulated by QEMU, so for vhost and
> vhost-user devices we need to make sure it is supported by the offloaded
> device emulation (in-kernel or in another process).
> To do this we need to add VIRTIO_F_RING_RESET to the features bitmap
> passed to vhost_get_features(). This way it will be masked if the device
> does not support it.
>=20
> This issue was initially discovered with vhost-vsock and vhost-user-vsock,
> and then also tested with vhost-user-rng which confirmed the same issue.
> They fail when sending features through VHOST_SET_FEATURES ioctl or
> VHOST_USER_SET_FEATURES message, since VIRTIO_F_RING_RESET is negotiated
> by the guest (Linux >=3D v6.0), but not supported by the device.
>=20
> Fixes: 69e1c14aa2 ("virtio: core: vq reset feature negotation support")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1318
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>=20
> To prevent this problem in the future, perhaps we should provide a functi=
on
> (e.g. vhost_device_get_features) where we go to mask all non-device-speci=
fic
> features (e.g VIRTIO_F_*, VIRTIO_RING_F_*) that are not emulated by QEMU =
but
> we expect them to be emulated by the vhost or vhost-user devices.
> Then we can call it in all .get_features callbacks just before return the
> features.
>=20
> What do you think?
>=20
> But maybe better to do that for the next release, I will send an RFC.

This patch looks good for 7.2.

I agree that in the long run this needs to be more robust so vhost
devices don't break every time a new feature bit is added.

>=20
> Thanks,
> Stefano
> ---
>  hw/block/vhost-user-blk.c      |  1 +
>  hw/net/vhost_net.c             |  1 +
>  hw/scsi/vhost-scsi.c           |  1 +
>  hw/scsi/vhost-user-scsi.c      |  1 +
>  hw/virtio/vhost-user-fs.c      |  1 +
>  hw/virtio/vhost-user-gpio.c    |  1 +
>  hw/virtio/vhost-user-i2c.c     |  1 +
>  hw/virtio/vhost-user-rng.c     | 11 +++++++++--
>  hw/virtio/vhost-vsock-common.c |  1 +
>  net/vhost-vdpa.c               |  1 +
>  10 files changed, 18 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--yGYzq2s7HGeIQb5G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmN7pTcACgkQnKSrs4Gr
c8gy8gf9GfUs9ASyMEBiAtX7Kr79Btno4bBzs94QMnBUfdCZygUA7V5ROUz5YG6N
2yklQ1VhUHCV+e1+pmFcZ6DzMbhB1RQ9z+rtSUPG4+FCCLvDTqVG8Gf3ZcPABciE
8Neau3FnHxI1cPzPNcDqTfseLO8yhnFLAuBTfXRQkLpb5Q6jklsRb+IARNAOBqeK
wawUXiEJTYJenbRVqmukbNAWVEOh6ciwNKLR70WNdW1AvgQh9cQru2rkuXuQ6Fb6
mKSCvyiNV8Gp1bxCksN232LsGuAFY2qiFq+ckwqp+kjDoVRfp6dvZ4lEN6NfTPZx
nHDh+dnM6X886tjkTpvA830JVW1PKQ==
=2Fm+
-----END PGP SIGNATURE-----

--yGYzq2s7HGeIQb5G--


