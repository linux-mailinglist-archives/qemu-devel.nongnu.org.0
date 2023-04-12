Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7761A6E0036
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 22:52:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmhRY-0002aO-KV; Wed, 12 Apr 2023 16:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pmhRW-0002ZC-BV
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:51:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pmhRT-0004cl-Q1
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681332706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZTGV17AyFUFsPTC6qb7GT4CJBCMBF8Bq7czydddK6yw=;
 b=bWVKfL1ikX+qPgz2pNiRFHR/xuG0ZEYlseEHKMKDlOyvc3aYSYhgm8p570MJUkXLBV9Y7Q
 ZuthINW+2JbhWuKjzIb0WccLCaGZDebGqcClRwxBfQi4ZForvi6Qoab8PQqgpvUpMitfwS
 b4Y4PsdnwKG4t6pPBKxbwQNQexnCLjE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-kDIWkowdOGm9qhirftcsUg-1; Wed, 12 Apr 2023 16:51:41 -0400
X-MC-Unique: kDIWkowdOGm9qhirftcsUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FCB2185A78B;
 Wed, 12 Apr 2023 20:51:41 +0000 (UTC)
Received: from localhost (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E00F1415117;
 Wed, 12 Apr 2023 20:51:39 +0000 (UTC)
Date: Wed, 12 Apr 2023 16:51:38 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Roman Kagan <rvkagan@yandex-team.ru>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 1/4] vhost: Re-enable vrings after setting features
Message-ID: <20230412205138.GA2813183@fedora>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-2-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rRJT1mSd1+ho7w0n"
Content-Disposition: inline
In-Reply-To: <20230411150515.14020-2-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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


--rRJT1mSd1+ho7w0n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 11, 2023 at 05:05:12PM +0200, Hanna Czenczek wrote:
> If the back-end supports the VHOST_USER_F_PROTOCOL_FEATURES feature,
> setting the vhost features will set this feature, too.  Doing so
> disables all vrings, which may not be intended.
>=20
> For example, enabling or disabling logging during migration requires
> setting those features (to set or unset VHOST_F_LOG_ALL), which will
> automatically disable all vrings.  In either case, the VM is running
> (disabling logging is done after a failed or cancelled migration, and
> only once the VM is running again, see comment in
> memory_global_dirty_log_stop()), so the vrings should really be enabled.
> As a result, the back-end seems to hang.
>=20
> To fix this, we must remember whether the vrings are supposed to be
> enabled, and, if so, re-enable them after a SET_FEATURES call that set
> VHOST_USER_F_PROTOCOL_FEATURES.
>=20
> It seems less than ideal that there is a short period in which the VM is
> running but the vrings will be stopped (between SET_FEATURES and
> SET_VRING_ENABLE).  To fix this, we would need to change the protocol,
> e.g. by introducing a new flag or vhost-user protocol feature to disable
> disabling vrings whenever VHOST_USER_F_PROTOCOL_FEATURES is set, or add
> new functions for setting/clearing singular feature bits (so that
> F_LOG_ALL can be set/cleared without touching F_PROTOCOL_FEATURES).
>=20
> Even with such a potential addition to the protocol, we still need this
> fix here, because we cannot expect that back-ends will implement this
> addition.
>=20
> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>  include/hw/virtio/vhost.h | 10 ++++++++++
>  hw/virtio/vhost.c         | 13 +++++++++++++
>  2 files changed, 23 insertions(+)
>=20
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index a52f273347..2fe02ed5d4 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -90,6 +90,16 @@ struct vhost_dev {
>      int vq_index_end;
>      /* if non-zero, minimum required value for max_queues */
>      int num_queues;
> +
> +    /*
> +     * Whether the virtqueues are supposed to be enabled (via
> +     * SET_VRING_ENABLE).  Setting the features (e.g. for
> +     * enabling/disabling logging) will disable all virtqueues if
> +     * VHOST_USER_F_PROTOCOL_FEATURES is set, so then we need to
> +     * re-enable them if this field is set.
> +     */
> +    bool enable_vqs;
> +
>      /**
>       * vhost feature handling requires matching the feature set
>       * offered by a backend which may be a subset of the total
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index a266396576..cbff589efa 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -50,6 +50,8 @@ static unsigned int used_memslots;
>  static QLIST_HEAD(, vhost_dev) vhost_devices =3D
>      QLIST_HEAD_INITIALIZER(vhost_devices);
> =20
> +static int vhost_dev_set_vring_enable(struct vhost_dev *hdev, int enable=
);
> +
>  bool vhost_has_free_slot(void)
>  {
>      unsigned int slots_limit =3D ~0U;
> @@ -899,6 +901,15 @@ static int vhost_dev_set_features(struct vhost_dev *=
dev,
>          }
>      }
> =20
> +    if (dev->enable_vqs) {
> +        /*
> +         * Setting VHOST_USER_F_PROTOCOL_FEATURES would have disabled all
> +         * virtqueues, even if that was not intended; re-enable them if
> +         * necessary.
> +         */
> +        vhost_dev_set_vring_enable(dev, true);
> +    }
> +
>  out:
>      return r;
>  }
> @@ -1896,6 +1907,8 @@ int vhost_dev_get_inflight(struct vhost_dev *dev, u=
int16_t queue_size,
> =20
>  static int vhost_dev_set_vring_enable(struct vhost_dev *hdev, int enable)
>  {
> +    hdev->enable_vqs =3D enable;
> +
>      if (!hdev->vhost_ops->vhost_set_vring_enable) {
>          return 0;
>      }

The vhost-user spec doesn't say that VHOST_F_LOG_ALL needs to be toggled
at runtime and I don't think VHOST_USER_SET_PROTOCOL_FEATURES is
intended to be used like that. This issue shows why doing so is a bad
idea.

VHOST_F_LOG_ALL does not need to be toggled to control logging. Logging
is controlled at runtime by the presence of the dirty log
(VHOST_USER_SET_LOG_BASE) and the per-vring logging flag
(VHOST_VRING_F_LOG).

I suggest permanently enabling VHOST_F_LOG_ALL upon connection when the
the backend supports it. No spec changes are required.

libvhost-user looks like it will work. I didn't look at DPDK/SPDK, but
checking that it works there is important too.

I have CCed people who may be interested in this issue. This is the
first time I've looked at vhost-user logging, so this idea may not work.

Stefan

--rRJT1mSd1+ho7w0n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQ3GdoACgkQnKSrs4Gr
c8gRgAf/aLQ0EfT9jbbQjInu5Fc1ww8V3UXzGc3Voqlv5rzjaI/5aTFUZmXUJYAQ
YQ6QAQY0+VBwBKlYHs9Ru704GuJt/jROiejganu/IoYd1EsJQuMGLYY/gLodx/sW
10hvSuBorC1afLwYY7A2YCo3Y/rM/9N/v0hO3BEMV5bHyhyBslUDf5BULN/jDhJP
dpwiuWtgeKFviT1FEuxjDfk2avjGEDYrnzmdmPKu9eqfqbZGyRy+EJsHAgluiZoB
10SacXeKLNjdm33MFW3xmTvWJw4aX8JlR0bV+woMM7MG1NtNBvQJr76bSWHVtGGL
wbg9o/5R/UNM43k0dfWPYyCdbZx4QQ==
=mbed
-----END PGP SIGNATURE-----

--rRJT1mSd1+ho7w0n--


