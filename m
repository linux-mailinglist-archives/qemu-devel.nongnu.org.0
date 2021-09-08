Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E061403A0C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:41:22 +0200 (CEST)
Received: from localhost ([::1]:52564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwtF-0005to-7n
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNwpg-0002ez-RD
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:37:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNwpe-0001hv-TK
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631104658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rMxf9uddiaN7fH56GkLAsJGC/ipr3Aw2ncYeFfGzYgk=;
 b=Yecq7wmE9kTpQGDPbR3DAAFU4lKMgSJ28lVlnJcJnh2aLmkoPLKH0/D7Kwv+7Ixd6P5EYH
 e9FQrLASm3Fl68qWuRh8AyLDWOVxyx/NAq9kZ5siQLJYt/ybgH4czzh5ZmN5JrmoqsfpVz
 v96gUXmrQRG9oTQ6l6aGHkN0K3Fl1BM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-G_bo0UpfMIuhsh6lV2ebJg-1; Wed, 08 Sep 2021 08:37:37 -0400
X-MC-Unique: G_bo0UpfMIuhsh6lV2ebJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6820C10168C0;
 Wed,  8 Sep 2021 12:37:35 +0000 (UTC)
Received: from localhost (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16F0C77F3C;
 Wed,  8 Sep 2021 12:37:30 +0000 (UTC)
Date: Wed, 8 Sep 2021 13:37:30 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH RFC server v2 02/11] vfio-user: define vfio-user object
Message-ID: <YTiuih20Ka5yPPF/@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <ff8864013462e53eb0bed0aa609b55b21c0b18e0.1630084211.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <ff8864013462e53eb0bed0aa609b55b21c0b18e0.1630084211.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Orm5qaO4MiGa1tUv"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, philmd@redhat.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Orm5qaO4MiGa1tUv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2021 at 01:53:21PM -0400, Jagannathan Raman wrote:
> Define vfio-user object which is remote process server for QEMU. Setup
> object initialization functions and properties necessary to instantiate
> the object
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  qapi/qom.json             |  20 ++++++-
>  hw/remote/vfio-user-obj.c | 145 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  MAINTAINERS               |   1 +
>  hw/remote/meson.build     |   1 +
>  hw/remote/trace-events    |   3 +
>  5 files changed, 168 insertions(+), 2 deletions(-)
>  create mode 100644 hw/remote/vfio-user-obj.c
>=20
> diff --git a/qapi/qom.json b/qapi/qom.json
> index a25616b..3e941ee 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -689,6 +689,20 @@
>    'data': { 'fd': 'str', 'devid': 'str' } }
> =20
>  ##
> +# @VfioUserProperties:
> +#
> +# Properties for vfio-user objects.
> +#
> +# @socket: path to be used as socket by the libvfiouser library
> +#
> +# @devid: the id of the device to be associated with the file descriptor
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'VfioUserProperties',
> +  'data': { 'socket': 'str', 'devid': 'str' } }

Please use 'SocketAddress' for socket instead of 'str'. That way file
descriptor passing is easy to support and additional socket address
families can be supported in the future.

> +
> +##
>  # @RngProperties:
>  #
>  # Properties for objects of classes derived from rng.
> @@ -812,7 +826,8 @@
>      'tls-creds-psk',
>      'tls-creds-x509',
>      'tls-cipher-suites',
> -    'x-remote-object'
> +    'x-remote-object',
> +    'vfio-user'
>    ] }
> =20
>  ##
> @@ -868,7 +883,8 @@
>        'tls-creds-psk':              'TlsCredsPskProperties',
>        'tls-creds-x509':             'TlsCredsX509Properties',
>        'tls-cipher-suites':          'TlsCredsProperties',
> -      'x-remote-object':            'RemoteObjectProperties'
> +      'x-remote-object':            'RemoteObjectProperties',
> +      'vfio-user':                  'VfioUserProperties'

"vfio-user" doesn't communicate whether this is a client or server. Is
"vfio-user-server" clearer?

>    } }
> =20
>  ##
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> new file mode 100644
> index 0000000..4a1e297
> --- /dev/null
> +++ b/hw/remote/vfio-user-obj.c
> @@ -0,0 +1,145 @@
> +/**
> + * QEMU vfio-user server object
> + *
> + * Copyright =A9 2021 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL-v2, version 2 or=
 later.
> + *
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +/**
> + * Usage: add options:
> + *     -machine x-remote
> + *     -device <PCI-device>,id=3D<pci-dev-id>
> + *     -object vfio-user,id=3D<id>,socket=3D<socket-path>,devid=3D<pci-d=
ev-id>

I suggest renaming devid=3D to device=3D or pci-device=3D (similar to drive=
=3D
and netdev=3D) for consistency and to avoid confusion with PCI Device IDs.

> diff --git a/hw/remote/meson.build b/hw/remote/meson.build
> index fb35fb8..cd44dfc 100644
> --- a/hw/remote/meson.build
> +++ b/hw/remote/meson.build
> @@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files=
('message.c'))
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'=
))
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
> +remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('vfio-user-obj=
.c'))

If you use CONFIG_VFIO_USER_SERVER then it's easier to separate mpqemu
from vfio-user. Sharing CONFIG_MULTIPROCESS could become messy later.

--Orm5qaO4MiGa1tUv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE4rokACgkQnKSrs4Gr
c8g70ggAkqEUO9VawLARJdnXbsKgbqfOkdP2mX/0qC0c6x8OsE4JNf8NZO24Vdl6
s8cB12qKmY08fwm1EIOqGEFGpVrEc5Yidxw8m1h+bv2BwiqSxliVhsY5IvcB15tV
ysELG8tKX/QsvoTj7BiiwAXRkkbXXp2AfCTuYggTR+sx1B0NwGWLHmDtHe3vw/AY
PcwEeFmGMrErqlDI0M7pOP4rGtAHu1LpZDJQ32gjsmkQucmyAPGK518+0Z4JKCNb
lbuzMImmSgQopAet2WnnQafunihp/wPf/0yjfv5ZHH6J+W+0M4X48ur/8QDGPfEd
WvZDUWufpLZ8uAWmvyWXKVQP2rNCpA==
=LqtX
-----END PGP SIGNATURE-----

--Orm5qaO4MiGa1tUv--


