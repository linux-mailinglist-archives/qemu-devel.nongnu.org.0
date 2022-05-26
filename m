Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691F9534B2F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 10:10:04 +0200 (CEST)
Received: from localhost ([::1]:52602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu8Z4-0005Cf-Et
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 04:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu8Vb-00047F-Nq
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:06:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu8VZ-00062K-1Z
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:06:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653552371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t0kOGyweQUN7QB9d3yjE8fMSlC8Eais52VTeMuR12dU=;
 b=ainE/rBFUT2zr14a0x35RyNx53l/oos+X9hBBYiykGVi2nVFZDjW+yFb16QGZvPZT6QcTF
 62zauTIxbYQbu7KoElTFZwK+PbQFALFjcmqwdumAUNiaCZhNdznU4mot6pKfKwvUjKu6bV
 lhi5A/VDSweaL2mDausQNGqAosN0Va4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-kviUXDUsNrShG82-6cCbmA-1; Thu, 26 May 2022 04:06:08 -0400
X-MC-Unique: kviUXDUsNrShG82-6cCbmA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BC4A811E75;
 Thu, 26 May 2022 08:06:07 +0000 (UTC)
Received: from localhost (unknown [10.39.193.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6551404E4AD;
 Thu, 26 May 2022 08:06:06 +0000 (UTC)
Date: Thu, 26 May 2022 09:06:05 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH  v2 15/15] tests/qtest: enable tests for virtio-gpio
Message-ID: <Yo807aga6xuWfy4B@stefanha-x1.localdomain>
References: <Yo5WsY4Kcr8x8LQj@stefanha-x1.localdomain>
 <878rqp1boj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="e8dW0wOLB8hI5BcN"
Content-Disposition: inline
In-Reply-To: <878rqp1boj.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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


--e8dW0wOLB8hI5BcN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 11:35:53PM +0100, Alex Benn=E9e wrote:
>=20
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>=20
> > [[PGP Signed Part:Undecided]]
> > On Tue, May 24, 2022 at 04:40:56PM +0100, Alex Benn=E9e wrote:
> >> We don't have a virtio-gpio implementation in QEMU and only
> >> support a vhost-user backend. The QEMU side of the code is minimal so
> >> it should be enough to instantiate the device and pass some vhost-user
> >> messages over the control socket. To do this we hook into the existing
> >> vhost-user-test code and just add the bits required for gpio.
> >>=20
> >> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> >> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> >> Cc: Paolo Bonzini <pbonzini@redhat.com>
> >> Cc: Eric Auger <eric.auger@redhat.com>
> >> Message-Id: <20220408155704.2777166-1-alex.bennee@linaro.org>
> >>=20
> >> ---
> >> v2
> >>   - add more of the missing boilerplate
> >>   - don't request LOG_SHMD
> >>   - use get_features op
> >>   - report VIRTIO_F_VERSION_1
> >>   - more comments
> >> ---
> >>  tests/qtest/libqos/virtio-gpio.h |  35 +++++++
> >>  tests/qtest/libqos/virtio-gpio.c | 171 +++++++++++++++++++++++++++++++
> >>  tests/qtest/libqos/virtio.c      |   2 +-
> >>  tests/qtest/vhost-user-test.c    |  66 ++++++++++++
> >>  tests/qtest/libqos/meson.build   |   1 +
> >>  5 files changed, 274 insertions(+), 1 deletion(-)
> >>  create mode 100644 tests/qtest/libqos/virtio-gpio.h
> >>  create mode 100644 tests/qtest/libqos/virtio-gpio.c
> >>=20
> >> diff --git a/tests/qtest/libqos/virtio-gpio.h b/tests/qtest/libqos/vir=
tio-gpio.h
> >> new file mode 100644
> >> index 0000000000..f11d41bd19
> >> --- /dev/null
> >> +++ b/tests/qtest/libqos/virtio-gpio.h
> >> @@ -0,0 +1,35 @@
> >> +/*
> >> + * virtio-gpio structures
> >> + *
> >> + * Copyright (c) 2022 Linaro Ltd
> >> + *
> >> + * SPDX-License-Identifier: GPL-2.0-or-later
> >> + */
> >> +
> >> +#ifndef TESTS_LIBQOS_VIRTIO_GPIO_H
> >> +#define TESTS_LIBQOS_VIRTIO_GPIO_H
> >> +
> >> +#include "qgraph.h"
> >> +#include "virtio.h"
> >> +#include "virtio-pci.h"
> >> +
> >> +typedef struct QVhostUserGPIO QVhostUserGPIO;
> >> +typedef struct QVhostUserGPIOPCI QVhostUserGPIOPCI;
> >> +typedef struct QVhostUserGPIODevice QVhostUserGPIODevice;
> >> +
> >> +struct QVhostUserGPIO {
> >> +    QVirtioDevice *vdev;
> >> +    QVirtQueue **queues;
> >> +};
> >> +
> >> +struct QVhostUserGPIOPCI {
> >> +    QVirtioPCIDevice pci_vdev;
> >> +    QVhostUserGPIO gpio;
> >> +};
> >> +
> >> +struct QVhostUserGPIODevice {
> >> +    QOSGraphObject obj;
> >> +    QVhostUserGPIO gpio;
> >> +};
> >> +
> >> +#endif
> >> diff --git a/tests/qtest/libqos/virtio-gpio.c b/tests/qtest/libqos/vir=
tio-gpio.c
> >> new file mode 100644
> >> index 0000000000..762aa6695b
> >> --- /dev/null
> >> +++ b/tests/qtest/libqos/virtio-gpio.c
> >> @@ -0,0 +1,171 @@
> >> +/*
> >> + * virtio-gpio nodes for testing
> >> + *
> >> + * Copyright (c) 2022 Linaro Ltd
> >> + *
> >> + * SPDX-License-Identifier: GPL-2.0-or-later
> >> + */
> >> +
> >> +#include "qemu/osdep.h"
> >> +#include "standard-headers/linux/virtio_config.h"
> >> +#include "../libqtest.h"
> >> +#include "qemu/module.h"
> >> +#include "qgraph.h"
> >> +#include "virtio-gpio.h"
> >> +
> >> +static QGuestAllocator *alloc;
> >> +
> >> +static void virtio_gpio_cleanup(QVhostUserGPIO *gpio)
> >> +{
> >> +    QVirtioDevice *vdev =3D gpio->vdev;
> >> +    int i;
> >> +
> >> +    for (i =3D 0; i < 2; i++) {
> >> +        qvirtqueue_cleanup(vdev->bus, gpio->queues[i], alloc);
> >> +    }
> >> +    g_free(gpio->queues);
> >> +}
> >> +
> >> +/*
> >> + * This handles the VirtIO setup from the point of view of the driver
> >> + * frontend and therefor doesn't present any vhost specific features
> >> + * and in fact masks of the re-used bit.
> >> + */
> >> +static void virtio_gpio_setup(QVhostUserGPIO *gpio)
> >> +{
> >> +    QVirtioDevice *vdev =3D gpio->vdev;
> >> +    uint64_t features;
> >> +    int i;
> >> +
> >> +    features =3D qvirtio_get_features(vdev);
> >> +    features &=3D ~QVIRTIO_F_BAD_FEATURE;
> >
> > This looks questionable. qvirtio_get_features() should return VIRTIO
> > feature bits. Is QVIRTIO_F_BAD_FEATURE masked out here because
> > qvirtio_get_features() is returning raw vhost-user feature bits instead
> > and you want to get rid of VHOST_USER_F_PROTOCOL_FEATURES?
>=20
> Well it's an invalid bit for the driver/frontend<->hw/backend path -
> although maybe we should error if we saw it?

Thinking about it again, there's an argument for keeping "features &=3D
~QVIRTIO_F_BAD_FEATURE;". It means the code can be reused with
virtio-pci virtio-gpio devices.

I was just afraid that may the vhost-user implementation is exposing
VHOST_USER_F_PROTOCOL_FEATURES and we're working around that by masking
QVIRTIO_F_BAD_FEATURE here. An assertion/error would protect against
that.

Either way is fine by me.

Stefan

--e8dW0wOLB8hI5BcN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKPNO0ACgkQnKSrs4Gr
c8jOIgf/eeNqk5ZJNcVbQ6S5WlW0mWAOlQc6T+xO7DkD1LPbqTwU22CubBDISZ3G
ZVeSX0HFD333aVErHyMp8EEStEB/jJ0J6kiCABQQaFkIQow1VFulEMtTA7WWVetO
77WwJTDh+umwr20ScW48Yv0PIy9y5TP7DxBQEmNUiLQMrsCoyWo9rwTE6y76xpfw
yqOftOcx2Spb8R8Ztbm7s71xENYLAkahMaW/7cECICuRipta/iaKg5s1tbYVrw5R
ecU07P9jkrXUgEl6k7IUNUDGdJUzSzxtx2gNlOjCy0XO7NIqqM7Jl5iishYLXzQQ
4JHA15HHYG0Fbt3Ja7FwkrL9bA7xfQ==
=z2C/
-----END PGP SIGNATURE-----

--e8dW0wOLB8hI5BcN--


