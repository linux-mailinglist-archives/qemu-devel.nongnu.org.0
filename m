Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848F3485115
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:22:40 +0100 (CET)
Received: from localhost ([::1]:46294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53RH-00062J-L7
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:22:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n53Mn-0002UZ-6g
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:18:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n53Mj-0006Wf-Qw
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:17:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641377877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=518ixK5OwuLHpoOVt+/d25cKQseFVPjRxY2VEWxLs20=;
 b=gSW/mf7soWK0rGUBl0sxb8WfxyvM4qxWIANY8ZiL/8yJvmZM2hYfhzPPr/bH+1H8RiUe+u
 orxJgPPvihXZEU5BEJrCAVOXhu4WkgkyF2Mob2Ws+fK17AtzcbBXwCLUo0H42leJ83jabU
 eCggFw9kq/oFqwEB/0Waabn/4YcANqM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-FXhpdG5aNW2M00dFDVI6pQ-1; Wed, 05 Jan 2022 05:17:53 -0500
X-MC-Unique: FXhpdG5aNW2M00dFDVI6pQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96FDA1800D50;
 Wed,  5 Jan 2022 10:17:52 +0000 (UTC)
Received: from localhost (unknown [10.39.194.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F973708F2;
 Wed,  5 Jan 2022 10:17:31 +0000 (UTC)
Date: Wed, 5 Jan 2022 10:17:31 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [RFC 05/10] vdpa-dev: implement the realize interface
Message-ID: <YdVwOwVuEOgrRuBm@stefanha-x1.localdomain>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-6-longpeng2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220105005900.860-6-longpeng2@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lOPnd2E3+DFAsbzs"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: mst@redhat.com, jasowang@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, yechuan@huawei.com, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, pbonzini@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--lOPnd2E3+DFAsbzs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 08:58:55AM +0800, Longpeng(Mike) wrote:
> From: Longpeng <longpeng2@huawei.com>
>=20
> Implements the .realize interface.
>=20
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>  hw/virtio/vdpa-dev.c         | 114 +++++++++++++++++++++++++++++++++++
>  include/hw/virtio/vdpa-dev.h |   8 +++
>  2 files changed, 122 insertions(+)
>=20
> diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
> index 790117fb3b..2d534d837a 100644
> --- a/hw/virtio/vdpa-dev.c
> +++ b/hw/virtio/vdpa-dev.c
> @@ -15,9 +15,122 @@
>  #include "sysemu/sysemu.h"
>  #include "sysemu/runstate.h"
> =20
> +static void
> +vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> +{
> +    /* Nothing to do */
> +}
> +
> +static int vdpa_dev_get_info_by_fd(int fd, uint64_t cmd, Error **errp)

This looks similar to the helper function in a previous patch but this
time the return value type is int instead of uint32_t. Please make the
types consistent.

> +{
> +    int val;
> +
> +    if (ioctl(fd, cmd, &val) < 0) {
> +        error_setg(errp, "vhost-vdpa-device: cmd 0x%lx failed: %s",
> +                   cmd, strerror(errno));
> +        return -1;
> +    }
> +
> +    return val;
> +}
> +
> +static inline int vdpa_dev_get_queue_size(int fd, Error **errp)
> +{
> +    return vdpa_dev_get_info_by_fd(fd, VHOST_VDPA_GET_VRING_NUM, errp);
> +}
> +
> +static inline int vdpa_dev_get_vqs_num(int fd, Error **errp)
> +{
> +    return vdpa_dev_get_info_by_fd(fd, VHOST_VDPA_GET_VQS_NUM, errp);
> +}
> +
> +static inline int vdpa_dev_get_config_size(int fd, Error **errp)
> +{
> +    return vdpa_dev_get_info_by_fd(fd, VHOST_VDPA_GET_CONFIG_SIZE, errp)=
;
> +}
> +
>  static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
>  {
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> +    VhostVdpaDevice *s =3D VHOST_VDPA_DEVICE(vdev);
> +    uint32_t device_id;
> +    int max_queue_size;
> +    int fd;
> +    int i, ret;
> +
> +    fd =3D qemu_open(s->vdpa_dev, O_RDWR, errp);
> +    if (fd =3D=3D -1) {
> +        return;
> +    }
> +    s->vdpa.device_fd =3D fd;

This is the field I suggest exposing as a QOM property so it can be set
from the proxy object (e.g. when the PCI proxy opens the vdpa device
before our .realize() function is called).

> +
> +    max_queue_size =3D vdpa_dev_get_queue_size(fd, errp);
> +    if (*errp) {
> +        goto out;
> +    }
> +
> +    if (s->queue_size > max_queue_size) {
> +        error_setg(errp, "vhost-vdpa-device: invalid queue_size: %d (max=
:%d)",
> +                   s->queue_size, max_queue_size);
> +        goto out;
> +    } else if (!s->queue_size) {
> +        s->queue_size =3D max_queue_size;
> +    }
> +
> +    ret =3D vdpa_dev_get_vqs_num(fd, errp);
> +    if (*errp) {
> +        goto out;
> +    }
> +
> +    s->dev.nvqs =3D ret;

There is no input validation because we trust the kernel vDPA return
values. That seems okay for now but if there is a vhost-user version of
this in the future then input validation will be necessary to achieve
isolation between QEMU and the vhost-user processes. I suggest including
input validation code right away because it's harder to audit the code
and fix missing input validation later on.

> +    s->dev.vqs =3D g_new0(struct vhost_virtqueue, s->dev.nvqs);
> +    s->dev.vq_index =3D 0;
> +    s->dev.vq_index_end =3D s->dev.nvqs;
> +    s->dev.backend_features =3D 0;
> +    s->started =3D false;
> +
> +    ret =3D vhost_dev_init(&s->dev, &s->vdpa, VHOST_BACKEND_TYPE_VDPA, 0=
, NULL);
> +    if (ret < 0) {
> +        error_setg(errp, "vhost-vdpa-device: vhost initialization failed=
: %s",
> +                   strerror(-ret));
> +        goto out;
> +    }
> +
> +    ret =3D s->dev.vhost_ops->vhost_get_device_id(&s->dev, &device_id);

The vhost_*() API abstracts the ioctl calls but this source file and the
PCI proxy have ioctl calls. I wonder if it's possible to move the ioctls
calls into the vhost_*() API? That would be cleaner and also make it
easier to add vhost-user vDPA support in the future.

--lOPnd2E3+DFAsbzs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHVcDoACgkQnKSrs4Gr
c8i9swf/V5AeDahMCoVr+JbQ8ubspY/EPHefQbC8WHsmM6pmcoiCLq62PoFNLdJs
t5aROR0yfXJFXH2poIcuHq2qzdaWlM599YfgZFI3VmSdXtQS81qAiVcXYQaxRQ6q
QSPSQiA0NQvE1bsuAJ9DEDiASnrcz8sztmo9R2Bw1PGaKNBQmwU5qB33gNe1oyPm
hruVjy3MJdq2iIbd7KaOqhrVmJT9hPRaT/zhzp4PE70HAq6vNiFyhVlwUWpU9iIh
6yXWn5smUQdSrXVyjMFBm4UZ1hzStsxot/fAQNR5qF7+qbzqqmZtcM8vXFP2YcdL
AVGpr6bE47rT5MPnDo2ek1SXHBNF9w==
=iBJS
-----END PGP SIGNATURE-----

--lOPnd2E3+DFAsbzs--


