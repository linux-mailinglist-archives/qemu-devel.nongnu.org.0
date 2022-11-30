Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7C863E2A0
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 22:22:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0UWu-0008Rk-0n; Wed, 30 Nov 2022 16:22:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p0UWg-0008P8-CQ
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 16:21:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p0UWd-0001Yd-NN
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 16:21:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669843310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xu6XuanUm3d7n8rzzjoQ1QlEaPiHTMaSMI2Zf+dYuXc=;
 b=GXG8hDZBvWc+eD+FJeT5vJ26/1axrTHv2KPzYvi9fehVLXn/Tb2hdBT6S0mJudxllYeVn+
 G6PBd4QyeJbV5qryKW7LEXFeEopaqd6jV482dECOdPTAhWvAkGFcF/GkcyLm6/OJUpYm+K
 bUuIXzue42IEATdHhfeBAo3PmChgxCo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-K6yA1xkTOaS6H8X_bTfiog-1; Wed, 30 Nov 2022 16:21:49 -0500
X-MC-Unique: K6yA1xkTOaS6H8X_bTfiog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AEAE3C3C16E;
 Wed, 30 Nov 2022 21:21:47 +0000 (UTC)
Received: from localhost (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 632262024CBE;
 Wed, 30 Nov 2022 21:21:46 +0000 (UTC)
Date: Wed, 30 Nov 2022 16:21:42 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org, sgarzare@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [PATCH  v4 4/5] hw/virtio: generalise CHR_EVENT_CLOSED handling
Message-ID: <Y4fJZhRgpAH4NVVP@fedora>
References: <20221130112439.2527228-1-alex.bennee@linaro.org>
 <20221130112439.2527228-5-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YzYalxjZWhzIZj+w"
Content-Disposition: inline
In-Reply-To: <20221130112439.2527228-5-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--YzYalxjZWhzIZj+w
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2022 at 11:24:38AM +0000, Alex Benn=E9e wrote:
> ..and use for both virtio-user-blk and virtio-user-gpio. This avoids
> the circular close by deferring shutdown due to disconnection until a
> later point.

I thought re-entrancy was already avoided by Patch 3?

> virtio-user-blk already had this mechanism in place so
> generalise it as a vhost-user helper function and use for both blk and
> gpio devices.
>=20
> While we are at it we also fix up vhost-user-gpio to re-establish the
> event handler after close down so we can reconnect later.

I don't understand how the BH is supposed to help. Normally BHs are used
to defer processing while we're in a call stack of some depth. The
callers still require the resource we want to free, so we scheduled a
BH.

That's not the case here. The CHR_EVENT_CLOSED callback is just another
top-level event handler, not something that is called deep in a call
stack.

This BH approach isn't safe against nested event loops (something that
calls aio_poll() to wait), because now the BH can be invoked deep in a
call stack.

That said, if Patch 3 isn't enough and this patch fixes a problem, then
let's keep it for 7.2. It feels like a possibly incomplete solution and
maybe something that should be solved differently in 8.0.

>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  include/hw/virtio/vhost-user.h | 18 +++++++++
>  hw/block/vhost-user-blk.c      | 41 +++-----------------
>  hw/virtio/vhost-user-gpio.c    | 11 +++++-
>  hw/virtio/vhost-user.c         | 71 ++++++++++++++++++++++++++++++++++
>  4 files changed, 104 insertions(+), 37 deletions(-)
>=20
> diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-use=
r.h
> index c6e693cd3f..191216a74f 100644
> --- a/include/hw/virtio/vhost-user.h
> +++ b/include/hw/virtio/vhost-user.h
> @@ -68,4 +68,22 @@ bool vhost_user_init(VhostUserState *user, CharBackend=
 *chr, Error **errp);
>   */
>  void vhost_user_cleanup(VhostUserState *user);
> =20
> +/**
> + * vhost_user_async_close() - cleanup vhost-user post connection drop
> + * @d: DeviceState for the associated device (passed to callback)
> + * @chardev: the CharBackend associated with the connection
> + * @vhost: the common vhost device
> + * @cb: the user callback function to complete the clean-up
> + *
> + * This function is used to handle the shutdown of a vhost-user
> + * connection to a backend. We handle this centrally to make sure we
> + * do all the steps and handle potential races due to VM shutdowns.
> + * Once the connection is disabled we call a backhalf to ensure
> + */
> +typedef void (*vu_async_close_fn)(DeviceState *cb);
> +
> +void vhost_user_async_close(DeviceState *d,
> +                            CharBackend *chardev, struct vhost_dev *vhos=
t,
> +                            vu_async_close_fn cb);
> +
>  #endif
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 1177064631..aff4d2b8cb 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -369,17 +369,10 @@ static void vhost_user_blk_disconnect(DeviceState *=
dev)
>      vhost_user_blk_stop(vdev);
> =20
>      vhost_dev_cleanup(&s->dev);
> -}
> =20
> -static void vhost_user_blk_chr_closed_bh(void *opaque)
> -{
> -    DeviceState *dev =3D opaque;
> -    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> -    VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> -
> -    vhost_user_blk_disconnect(dev);
> +    /* Re-instate the event handler for new connections */
>      qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk_eve=
nt,
> -                             NULL, opaque, NULL, true);
> +                             NULL, dev, NULL, true);
>  }
> =20
>  static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
> @@ -398,33 +391,9 @@ static void vhost_user_blk_event(void *opaque, QEMUC=
hrEvent event)
>          }
>          break;
>      case CHR_EVENT_CLOSED:
> -        if (!runstate_check(RUN_STATE_SHUTDOWN)) {
> -            /*
> -             * A close event may happen during a read/write, but vhost
> -             * code assumes the vhost_dev remains setup, so delay the
> -             * stop & clear.
> -             */
> -            AioContext *ctx =3D qemu_get_current_aio_context();
> -
> -            qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL,
> -                    NULL, NULL, false);
> -            aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, o=
paque);
> -
> -            /*
> -             * Move vhost device to the stopped state. The vhost-user de=
vice
> -             * will be clean up and disconnected in BH. This can be usef=
ul in
> -             * the vhost migration code. If disconnect was caught there =
is an
> -             * option for the general vhost code to get the dev state wi=
thout
> -             * knowing its type (in this case vhost-user).
> -             *
> -             * FIXME: this is sketchy to be reaching into vhost_dev
> -             * now because we are forcing something that implies we
> -             * have executed vhost_dev_stop() but that won't happen
> -             * until vhost_user_blk_stop() gets called from the bh.
> -             * Really this state check should be tracked locally.
> -             */
> -            s->dev.started =3D false;
> -        }
> +        /* defer close until later to avoid circular close */
> +        vhost_user_async_close(dev, &s->chardev, &s->dev,
> +                               vhost_user_blk_disconnect);
>          break;
>      case CHR_EVENT_BREAK:
>      case CHR_EVENT_MUX_IN:
> diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
> index be9be08b4c..b7b82a1099 100644
> --- a/hw/virtio/vhost-user-gpio.c
> +++ b/hw/virtio/vhost-user-gpio.c
> @@ -233,6 +233,8 @@ static int vu_gpio_connect(DeviceState *dev, Error **=
errp)
>      return 0;
>  }
> =20
> +static void vu_gpio_event(void *opaque, QEMUChrEvent event);
> +
>  static void vu_gpio_disconnect(DeviceState *dev)
>  {
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> @@ -245,6 +247,11 @@ static void vu_gpio_disconnect(DeviceState *dev)
> =20
>      vu_gpio_stop(vdev);
>      vhost_dev_cleanup(&gpio->vhost_dev);
> +
> +    /* Re-instate the event handler for new connections */
> +    qemu_chr_fe_set_handlers(&gpio->chardev,
> +                             NULL, NULL, vu_gpio_event,
> +                             NULL, dev, NULL, true);
>  }
> =20
>  static void vu_gpio_event(void *opaque, QEMUChrEvent event)
> @@ -262,7 +269,9 @@ static void vu_gpio_event(void *opaque, QEMUChrEvent =
event)
>          }
>          break;
>      case CHR_EVENT_CLOSED:
> -        vu_gpio_disconnect(dev);
> +        /* defer close until later to avoid circular close */
> +        vhost_user_async_close(dev, &gpio->chardev, &gpio->vhost_dev,
> +                               vu_gpio_disconnect);
>          break;
>      case CHR_EVENT_BREAK:
>      case CHR_EVENT_MUX_IN:
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index abe23d4ebe..8f635844af 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -21,6 +21,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/sockets.h"
> +#include "sysemu/runstate.h"
>  #include "sysemu/cryptodev.h"
>  #include "migration/migration.h"
>  #include "migration/postcopy-ram.h"
> @@ -2670,6 +2671,76 @@ void vhost_user_cleanup(VhostUserState *user)
>      user->chr =3D NULL;
>  }
> =20
> +
> +typedef struct {
> +    vu_async_close_fn cb;
> +    DeviceState *dev;
> +    CharBackend *cd;
> +    struct vhost_dev *vhost;
> +} VhostAsyncCallback;
> +
> +static void vhost_user_async_close_bh(void *opaque)
> +{
> +    VhostAsyncCallback *data =3D opaque;
> +    struct vhost_dev *vhost =3D data->vhost;
> +
> +    /*
> +     * If the vhost_dev has been cleared in the meantime there is
> +     * nothing left to do as some other path has completed the
> +     * cleanup.
> +     */
> +    if (vhost->vdev) {
> +        data->cb(data->dev);
> +    }
> +
> +    g_free(data);
> +}
> +
> +/*
> + * We only schedule the work if the machine is running. If suspended
> + * we want to keep all the in-flight data as is for migration
> + * purposes.
> + */
> +void vhost_user_async_close(DeviceState *d,
> +                            CharBackend *chardev, struct vhost_dev *vhos=
t,
> +                            vu_async_close_fn cb)
> +{
> +    if (!runstate_check(RUN_STATE_SHUTDOWN)) {
> +        /*
> +         * A close event may happen during a read/write, but vhost
> +         * code assumes the vhost_dev remains setup, so delay the
> +         * stop & clear.
> +         */
> +        AioContext *ctx =3D qemu_get_current_aio_context();
> +        VhostAsyncCallback *data =3D g_new0(VhostAsyncCallback, 1);
> +
> +        /* Save data for the callback */
> +        data->cb =3D cb;
> +        data->dev =3D d;
> +        data->cd =3D chardev;
> +        data->vhost =3D vhost;
> +
> +        /* Disable any further notifications on the chardev */
> +        qemu_chr_fe_set_handlers(chardev,
> +                                 NULL, NULL, NULL, NULL, NULL, NULL,
> +                                 false);
> +
> +        aio_bh_schedule_oneshot(ctx, vhost_user_async_close_bh, data);
> +
> +        /*
> +         * Move vhost device to the stopped state. The vhost-user device
> +         * will be clean up and disconnected in BH. This can be useful in
> +         * the vhost migration code. If disconnect was caught there is an
> +         * option for the general vhost code to get the dev state without
> +         * knowing its type (in this case vhost-user).
> +         *
> +         * Note if the vhost device is fully cleared by the time we
> +         * execute the bottom half we won't continue with the cleanup.
> +         */
> +        vhost->started =3D false;
> +    }
> +}
> +
>  static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
>  {
>      if (!virtio_has_feature(dev->protocol_features,
> --=20
> 2.34.1
>=20

--YzYalxjZWhzIZj+w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmOHyWYACgkQnKSrs4Gr
c8hs2wgAtCVCzHystVuSgjYm6PmYTdRmjmVIGczKP2Z/dVsP6/xriPYG9xUsAQHq
CqejiYo9LM/WzM9h+UEk44ISxHcTtjrYoTvEpS8GjjV3Gr9YrQvs98HeoxyFIgmn
XjOsotP9GaL/FVR96m5kgKVM7tL23m9BIoh34UM5lUfL1HMkuCKOPKFeww4np5GX
b4VJO1nLke8BbiiUtEJmhFAsnfU8jV5XeEapGMYkNRVHgaFJvWO1XHEBPTWXp9bS
2EqbJm7t5+1Pre1qJA3CrIcPcOBDwEneK+kihWyhiuPKK3SntQ129MIiuV06ED3V
uto6uNi7lYof1lEqjJE/zLvU/MZqwA==
=MQGz
-----END PGP SIGNATURE-----

--YzYalxjZWhzIZj+w--


