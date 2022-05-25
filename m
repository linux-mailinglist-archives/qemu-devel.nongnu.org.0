Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B1D53418B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 18:32:02 +0200 (CEST)
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nttvU-0005Uq-OU
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 12:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntti5-00042U-UK
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:18:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntti3-00079b-3w
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653495486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f8CbnMHZcO7lpRZhalt7NIZHMWbqU96/aJZAXN9xIJA=;
 b=Q1ytVDymdWMXHBvdiJlDvXhJWm4JlNnjsT4I79zor1BYLueSwa7SxXc+XDlzdl3vm9zxxG
 VYbqmVBhPR88QOzOp9aTHoTl/xCsp17osRaTjb/7eXKgj1/RQjmlRp993twSmFDoaRHzty
 it6deh/2ep+zovnTusM1PNQ2SJUFY/U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-bwOWvHbDNZCWGmvWENXsWQ-1; Wed, 25 May 2022 12:17:55 -0400
X-MC-Unique: bwOWvHbDNZCWGmvWENXsWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABBB88027EE;
 Wed, 25 May 2022 16:17:54 +0000 (UTC)
Received: from localhost (unknown [10.39.195.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4167A2026D07;
 Wed, 25 May 2022 16:17:54 +0000 (UTC)
Date: Wed, 25 May 2022 17:17:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH  v2 15/15] tests/qtest: enable tests for virtio-gpio
Message-ID: <Yo5WsY4Kcr8x8LQj@stefanha-x1.localdomain>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
 <20220524154056.2896913-16-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="um6CL9UyymiWIRvh"
Content-Disposition: inline
In-Reply-To: <20220524154056.2896913-16-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--um6CL9UyymiWIRvh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2022 at 04:40:56PM +0100, Alex Benn=E9e wrote:
> We don't have a virtio-gpio implementation in QEMU and only
> support a vhost-user backend. The QEMU side of the code is minimal so
> it should be enough to instantiate the device and pass some vhost-user
> messages over the control socket. To do this we hook into the existing
> vhost-user-test code and just add the bits required for gpio.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Eric Auger <eric.auger@redhat.com>
> Message-Id: <20220408155704.2777166-1-alex.bennee@linaro.org>
>=20
> ---
> v2
>   - add more of the missing boilerplate
>   - don't request LOG_SHMD
>   - use get_features op
>   - report VIRTIO_F_VERSION_1
>   - more comments
> ---
>  tests/qtest/libqos/virtio-gpio.h |  35 +++++++
>  tests/qtest/libqos/virtio-gpio.c | 171 +++++++++++++++++++++++++++++++
>  tests/qtest/libqos/virtio.c      |   2 +-
>  tests/qtest/vhost-user-test.c    |  66 ++++++++++++
>  tests/qtest/libqos/meson.build   |   1 +
>  5 files changed, 274 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qtest/libqos/virtio-gpio.h
>  create mode 100644 tests/qtest/libqos/virtio-gpio.c
>=20
> diff --git a/tests/qtest/libqos/virtio-gpio.h b/tests/qtest/libqos/virtio=
-gpio.h
> new file mode 100644
> index 0000000000..f11d41bd19
> --- /dev/null
> +++ b/tests/qtest/libqos/virtio-gpio.h
> @@ -0,0 +1,35 @@
> +/*
> + * virtio-gpio structures
> + *
> + * Copyright (c) 2022 Linaro Ltd
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef TESTS_LIBQOS_VIRTIO_GPIO_H
> +#define TESTS_LIBQOS_VIRTIO_GPIO_H
> +
> +#include "qgraph.h"
> +#include "virtio.h"
> +#include "virtio-pci.h"
> +
> +typedef struct QVhostUserGPIO QVhostUserGPIO;
> +typedef struct QVhostUserGPIOPCI QVhostUserGPIOPCI;
> +typedef struct QVhostUserGPIODevice QVhostUserGPIODevice;
> +
> +struct QVhostUserGPIO {
> +    QVirtioDevice *vdev;
> +    QVirtQueue **queues;
> +};
> +
> +struct QVhostUserGPIOPCI {
> +    QVirtioPCIDevice pci_vdev;
> +    QVhostUserGPIO gpio;
> +};
> +
> +struct QVhostUserGPIODevice {
> +    QOSGraphObject obj;
> +    QVhostUserGPIO gpio;
> +};
> +
> +#endif
> diff --git a/tests/qtest/libqos/virtio-gpio.c b/tests/qtest/libqos/virtio=
-gpio.c
> new file mode 100644
> index 0000000000..762aa6695b
> --- /dev/null
> +++ b/tests/qtest/libqos/virtio-gpio.c
> @@ -0,0 +1,171 @@
> +/*
> + * virtio-gpio nodes for testing
> + *
> + * Copyright (c) 2022 Linaro Ltd
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "standard-headers/linux/virtio_config.h"
> +#include "../libqtest.h"
> +#include "qemu/module.h"
> +#include "qgraph.h"
> +#include "virtio-gpio.h"
> +
> +static QGuestAllocator *alloc;
> +
> +static void virtio_gpio_cleanup(QVhostUserGPIO *gpio)
> +{
> +    QVirtioDevice *vdev =3D gpio->vdev;
> +    int i;
> +
> +    for (i =3D 0; i < 2; i++) {
> +        qvirtqueue_cleanup(vdev->bus, gpio->queues[i], alloc);
> +    }
> +    g_free(gpio->queues);
> +}
> +
> +/*
> + * This handles the VirtIO setup from the point of view of the driver
> + * frontend and therefor doesn't present any vhost specific features
> + * and in fact masks of the re-used bit.
> + */
> +static void virtio_gpio_setup(QVhostUserGPIO *gpio)
> +{
> +    QVirtioDevice *vdev =3D gpio->vdev;
> +    uint64_t features;
> +    int i;
> +
> +    features =3D qvirtio_get_features(vdev);
> +    features &=3D ~QVIRTIO_F_BAD_FEATURE;

This looks questionable. qvirtio_get_features() should return VIRTIO
feature bits. Is QVIRTIO_F_BAD_FEATURE masked out here because
qvirtio_get_features() is returning raw vhost-user feature bits instead
and you want to get rid of VHOST_USER_F_PROTOCOL_FEATURES?

--um6CL9UyymiWIRvh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKOVrEACgkQnKSrs4Gr
c8hDpQf5AXPJdL/fJ1XEo7TabGryv6/eZ54GPnKc23kc9WWv5Il1ZlcO6o722R6C
JptU21eGVWkA0WjFS5HM0N5fhN2+IqoFNtUFJnV3P8QzTLqnChkTEzCpE+bTZ7wu
hStWXNNUUNtam1SAm5Dv89zSZ0qefzevZlENQOCxmcEboNs7GXmKijEuBIC5E6A6
gHHzai9opf26PTs1Hnmo9h0OA5pKZN4BNSeAKm8S/aB5EbYRO7BXarDvgU/C8uHb
TPActv7CdJ76hIB18zZqaUSwgiWxNx8yGPg5kFjzDTFZc15uiEscfceaTSbbnunT
f/++PgVxik/Jw/t7r2n3ULg/6RpvEQ==
=gesw
-----END PGP SIGNATURE-----

--um6CL9UyymiWIRvh--


