Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E360421195
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 16:38:39 +0200 (CEST)
Received: from localhost ([::1]:42454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXP70-0000De-11
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 10:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXP2m-0004Fi-UB
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:34:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXP2l-0008ED-7i
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633358053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hjkZ1/Gdg3GU1XO2srUGOewTQibFC6WAY9UaD04TsFE=;
 b=SDDYK7/LclnCQBIqQdhkTV31eQRPjhk6NcrwH8GczVakCOO8Aq6FhmPfFdF4xioFHBIQ4J
 qvHpSk7Hs0yNcFkpEtrFfwUxKOtnbYyOss/cvqq8egJa5KpinHqHNbnG8PHl2g/UzUxpRi
 ZIbNM3E8c8s8ehueaYiEXL9l2xMi7iw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-JHiE3a9PONm2BmZ23hercg-1; Mon, 04 Oct 2021 10:34:10 -0400
X-MC-Unique: JHiE3a9PONm2BmZ23hercg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78B4FCC63D;
 Mon,  4 Oct 2021 14:34:09 +0000 (UTC)
Received: from localhost (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B257F60CC9;
 Mon,  4 Oct 2021 14:33:48 +0000 (UTC)
Date: Mon, 4 Oct 2021 15:33:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 09/13] virtiofsd: Specify size of notification buffer
 using config space
Message-ID: <YVsQyxaPHyChcOel@stefanha-x1.localdomain>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-10-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930153037.1194279-10-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WPlcQ8i1nUBRp1hu"
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

--WPlcQ8i1nUBRp1hu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 11:30:33AM -0400, Vivek Goyal wrote:
> Daemon specifies size of notification buffer needed and that should be
> done using config space.
>=20
> Only ->notify_buf_size value of config space comes from daemon. Rest of
> it is filled by qemu device emulation code.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
> ---
>  hw/virtio/vhost-user-fs.c                  | 27 +++++++++++++++++++
>  include/hw/virtio/vhost-user-fs.h          |  2 ++
>  include/standard-headers/linux/virtio_fs.h |  2 ++
>  tools/virtiofsd/fuse_virtio.c              | 31 ++++++++++++++++++++++
>  4 files changed, 62 insertions(+)
>=20
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index 6bafcf0243..68a94708b4 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -36,15 +36,41 @@ static const int user_feature_bits[] =3D {
>      VHOST_INVALID_FEATURE_BIT
>  };
> =20
> +static int vhost_user_fs_handle_config_change(struct vhost_dev *dev)
> +{
> +    return 0;
> +}
> +
> +const VhostDevConfigOps fs_ops =3D {
> +    .vhost_dev_config_notifier =3D vhost_user_fs_handle_config_change,
> +};
> +
>  static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
>  {
>      VHostUserFS *fs =3D VHOST_USER_FS(vdev);
>      struct virtio_fs_config fscfg =3D {};
> +    Error *local_err =3D NULL;
> +    int ret;
> +
> +    /*
> +     * As of now we only get notification buffer size from device. And t=
hat's
> +     * needed only if notification queue is enabled.
> +     */
> +    if (fs->notify_enabled) {
> +        ret =3D vhost_dev_get_config(&fs->vhost_dev, (uint8_t *)&fs->fsc=
fg,
> +                                   sizeof(struct virtio_fs_config),
> +                                   &local_err);
> +        if (ret) {
> +            error_report_err(local_err);
> +            return;
> +        }
> +    }
> =20
>      memcpy((char *)fscfg.tag, fs->conf.tag,
>             MIN(strlen(fs->conf.tag) + 1, sizeof(fscfg.tag)));
> =20
>      virtio_stl_p(vdev, &fscfg.num_request_queues, fs->conf.num_request_q=
ueues);
> +    virtio_stl_p(vdev, &fscfg.notify_buf_size, fs->fscfg.notify_buf_size=
);
> =20
>      memcpy(config, &fscfg, sizeof(fscfg));
>  }
> @@ -316,6 +342,7 @@ static void vuf_device_realize(DeviceState *dev, Erro=
r **errp)
>                  sizeof(struct virtio_fs_config));
> =20
>      vuf_create_vqs(vdev, true);
> +    vhost_dev_set_config_notifier(&fs->vhost_dev, &fs_ops);
>      ret =3D vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
>                           VHOST_BACKEND_TYPE_USER, 0, errp);
>      if (ret < 0) {
> diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-=
user-fs.h
> index 95dc0dd402..3b114ee260 100644
> --- a/include/hw/virtio/vhost-user-fs.h
> +++ b/include/hw/virtio/vhost-user-fs.h
> @@ -14,6 +14,7 @@
>  #ifndef _QEMU_VHOST_USER_FS_H
>  #define _QEMU_VHOST_USER_FS_H
> =20
> +#include "standard-headers/linux/virtio_fs.h"
>  #include "hw/virtio/virtio.h"
>  #include "hw/virtio/vhost.h"
>  #include "hw/virtio/vhost-user.h"
> @@ -37,6 +38,7 @@ struct VHostUserFS {
>      struct vhost_virtqueue *vhost_vqs;
>      struct vhost_dev vhost_dev;
>      VhostUserState vhost_user;
> +    struct virtio_fs_config fscfg;
>      VirtQueue **req_vqs;
>      VirtQueue *hiprio_vq;
>      VirtQueue *notification_vq;
> diff --git a/include/standard-headers/linux/virtio_fs.h b/include/standar=
d-headers/linux/virtio_fs.h
> index b7f015186e..867d18acf6 100644
> --- a/include/standard-headers/linux/virtio_fs.h
> +++ b/include/standard-headers/linux/virtio_fs.h
> @@ -17,6 +17,8 @@ struct virtio_fs_config {
> =20
>  =09/* Number of request queues */
>  =09uint32_t num_request_queues;
> +=09/* Size of notification buffer */
> +=09uint32_t notify_buf_size;
>  } QEMU_PACKED;
> =20
>  /* For the id field in virtio_pci_shm_cap */

Please put all the include/standard-headers/linux/ changes into a single
commit that imports these changes from linux.git. Changes to this header
shouldn't be hand-written, use scripts/update-linux-headers.sh instead.

> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.=
c
> index f5b87a508a..3b720c5d4a 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -856,6 +856,35 @@ static bool fv_queue_order(VuDev *dev, int qidx)
>      return false;
>  }
> =20
> +static uint64_t fv_get_protocol_features(VuDev *dev)
> +{
> +    return 1ull << VHOST_USER_PROTOCOL_F_CONFIG;
> +}
> +
> +static int fv_get_config(VuDev *dev, uint8_t *config, uint32_t len)
> +{
> +    struct virtio_fs_config fscfg =3D {};
> +    unsigned notify_size, roundto =3D 64;
> +    union fuse_notify_union {
> +        struct fuse_notify_poll_wakeup_out  wakeup_out;
> +        struct fuse_notify_inval_inode_out  inode_out;
> +        struct fuse_notify_inval_entry_out  entry_out;
> +        struct fuse_notify_delete_out       delete_out;
> +        struct fuse_notify_store_out        store_out;
> +        struct fuse_notify_retrieve_out     retrieve_out;
> +    };
> +
> +    notify_size =3D sizeof(struct fuse_out_header) +
> +              sizeof(union fuse_notify_union);
> +    notify_size =3D ((notify_size + roundto) / roundto) * roundto;

Why is the size rounded to 64 bytes?

--WPlcQ8i1nUBRp1hu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFbEMsACgkQnKSrs4Gr
c8hyBggAwOxF2L640Vklsmwx/tmQjBMHiL2GL1r8KLwwJGcMo+f6ZkKE/K7TkA50
3Ipifu2xCd+vbaH/qpud8YPWANwFEUxMOrx3uqXWCHP2OUGz/XCcXLkyQQRdXMQu
O7UGzD0ac2imfl4yrAykpjwjvhLtTgKIs6Ul+D1UgQaVdu1RpIfcTShwerhp9iN+
SvN5oX6UqbQiRZUBhVvAXnUB3G90HAJ+dzPted+9sW+OF/438OBZAt3APMNw99/p
QMAL+BJMCA3otw35ZuOWxrs6/rDm/4yvsCk+tWPy8ch/J3EKyx/xhPnCOFEX4FcQ
9ByvvlLRACl8Z0+RYTTL1KcV3QCsDQ==
=prAC
-----END PGP SIGNATURE-----

--WPlcQ8i1nUBRp1hu--


