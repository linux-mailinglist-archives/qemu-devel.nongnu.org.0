Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E08749E816
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:53:09 +0100 (CET)
Received: from localhost ([::1]:40720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD81E-0007kq-8l
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:53:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nD70C-0008A3-Iz
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:48:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nD70A-0008VE-9M
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:47:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643298477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NU3P7XHeUe8f8A2yd6y4Ed89NfUUPYgivj7/LpDSHzw=;
 b=TLKD47yUie73Y+MyFvPFHjn6aRRU4j8tgDgm7/EI8AdN8CUfdW8WpspWT/KIpoLaGopZ4s
 yIR9FmDsHWHL7P00aK7S2P+6ciye5fz1pMQzvKfBz5W9RsDfzHczXcRddBj2gdkxEddaeK
 FHERqOpUR8mX9RZlVjtU1xFSX8zHA4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-x007DtYfNESlRSG9QKs44g-1; Thu, 27 Jan 2022 10:47:53 -0500
X-MC-Unique: x007DtYfNESlRSG9QKs44g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3380F1091DA0;
 Thu, 27 Jan 2022 15:47:52 +0000 (UTC)
Received: from localhost (unknown [10.39.193.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C28CF798DE;
 Thu, 27 Jan 2022 15:47:30 +0000 (UTC)
Date: Thu, 27 Jan 2022 15:47:28 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
Subject: Re: [PATCH 1/1] util: adjust coroutine pool size to virtio block queue
Message-ID: <YfK+kLyUuy245klR@stefanha-x1.localdomain>
References: <20220111091950.840-1-hnarukaw@yahoo-corp.jp>
 <20220111091950.840-2-hnarukaw@yahoo-corp.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HKJo3nT5ZtUNrOId"
Content-Disposition: inline
In-Reply-To: <20220111091950.840-2-hnarukaw@yahoo-corp.jp>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, hreitz@redhat.com, aoiwa@yahoo-corp.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HKJo3nT5ZtUNrOId
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 11, 2022 at 06:19:50PM +0900, Hiroki Narukawa wrote:
> Coroutine pool size was 64 from long ago, and the basis was organized in =
the commit message in c740ad92.
>=20
> At that time, virtio-blk queue-size and num-queue were not configuable, a=
nd equivalent values were 128 and 1.
>=20
> Coroutine pool size 64 was fine then.
>=20
> Later queue-size and num-queue got configuable, and default values were i=
ncreased.
>=20
> Coroutine pool with size 64 exhausts frequently with random disk IO in ne=
w size, and slows down.
>=20
> This commit adjusts coroutine pool size adaptively with new values.
>=20
> This commit adds 64 by default, but now coroutine is not only for block d=
evices,
>=20
> and is not too much burdon comparing with new default.
>=20
> pool size of 128 * vCPUs.
>=20
> Signed-off-by: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
> ---
>  hw/block/virtio-blk.c    |  3 +++
>  include/qemu/coroutine.h |  5 +++++
>  util/qemu-coroutine.c    | 15 +++++++++++----
>  3 files changed, 19 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index f139cd7cc9..726dbe14de 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -32,6 +32,7 @@
>  #include "hw/virtio/virtio-bus.h"
>  #include "migration/qemu-file-types.h"
>  #include "hw/virtio/virtio-access.h"
> +#include "qemu/coroutine.h"
> =20
>  /* Config size before the discard support (hide associated config fields=
) */
>  #define VIRTIO_BLK_CFG_SIZE offsetof(struct virtio_blk_config, \
> @@ -1222,6 +1223,8 @@ static void virtio_blk_device_realize(DeviceState *=
dev, Error **errp)
>      for (i =3D 0; i < conf->num_queues; i++) {
>          virtio_add_queue(vdev, conf->queue_size, virtio_blk_handle_outpu=
t);
>      }
> +    qemu_coroutine_increase_pool_batch_size(conf->num_queues * conf->que=
ue_size
> +                                            / 2);

Why "/ 2"?

>      virtio_blk_data_plane_create(vdev, conf, &s->dataplane, &err);
>      if (err !=3D NULL) {
>          error_propagate(errp, err);

Please handle hot unplug (->unrealize()) so the coroutine pool shrinks
down again when virtio-blk devices are removed.

My main concern is memory footprint. A burst of I/O can create many
coroutines and they might never be used again. But I think we can deal
with that using a timer in a separate future patch (if necessary).

Thanks,
Stefan

--HKJo3nT5ZtUNrOId
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHyvpAACgkQnKSrs4Gr
c8hXWggAqPBEV6HUSWip/vNCjcwt+tBd+JkoCuIR7ZfC2nxtLkKvCAZP2R4Q6Jzk
pYpN+HpHXgfFYXwml3BcbksG3Y8lme3MqGnMe2Awr0bflk7uFwC0vATW/osHIgaN
Ns7M+R32hNWABGUK8QbofBaA/u5dN71hmwTcI8GGMtpePDQCZxsGWBFEIphSa93z
aQn1XqwFDTUIaOGkvLBqLb+oqA3Xub2KUvgLGUJV5hRejJAIluNaym8YJR8STw0p
oxbaV6Yiy3RKkXmCNSIOSfpnZv5JfSfofTF8+GiCrhsLGic9FaeYa3tt35/fIVOM
7xMy3VKC8KHVosvBmrmGzGQRvuoelg==
=619P
-----END PGP SIGNATURE-----

--HKJo3nT5ZtUNrOId--


