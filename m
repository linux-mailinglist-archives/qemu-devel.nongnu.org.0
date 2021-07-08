Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019D23BF785
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:22:56 +0200 (CEST)
Received: from localhost ([::1]:57044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1QFD-0004nb-2b
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1QE0-0003kC-DM
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:21:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1QDy-0003X9-Lz
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:21:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625736097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lroMFint3rfSYhTBWsHpzB1FgRKvliGaCuuRgNzQVms=;
 b=e09jMrG6UmXFgvWdJ3j3uLpOMaRyEzc6MyzfNbCba9eYItfOYs9zzDVdw/1xWfAaKq7J6u
 RKQufOAvgrekRWHqjdz4LZhhzIE6VCeyY6GORmCvYW2P5FUjrE7u8jhdBwPtkno0Ssr8xR
 4ZDeCTdNLSjabhxO8Gr6gaoSLp/vvdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-DIA0ZnIAORuNifOuatGcGA-1; Thu, 08 Jul 2021 05:21:36 -0400
X-MC-Unique: DIA0ZnIAORuNifOuatGcGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72C15801B1C;
 Thu,  8 Jul 2021 09:21:35 +0000 (UTC)
Received: from localhost (ovpn-114-141.ams2.redhat.com [10.36.114.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C68115C1C2;
 Thu,  8 Jul 2021 09:21:31 +0000 (UTC)
Date: Thu, 8 Jul 2021 10:21:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 2/2] docs: add a section on the generalities of
 vhost-user
Message-ID: <YObDmUmuODt/ebQm@stefanha-x1.localdomain>
References: <20210707184549.24436-1-alex.bennee@linaro.org>
 <20210707184549.24436-3-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210707184549.24436-3-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0JkO6kjvUjifYl/c"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0JkO6kjvUjifYl/c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 07, 2021 at 07:45:49PM +0100, Alex Benn=E9e wrote:
> While we do mention some of this stuff in the various daemons and
> manuals the subtleties of the socket and memory sharing are sometimes
> missed. This document attempts to give some background on vhost-user
> daemons in general terms.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/interop/vhost-user.rst        |  4 ++-
>  docs/system/device-emulation.rst   |  1 +
>  docs/system/devices/vhost-user.rst | 57 ++++++++++++++++++++++++++++++
>  3 files changed, 61 insertions(+), 1 deletion(-)
>  create mode 100644 docs/system/devices/vhost-user.rst
>=20
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index d6085f7045..f46423b6f3 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -1,3 +1,5 @@
> +.. _vhost_user_proto:
> +
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Vhost-user Protocol
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> @@ -6,7 +8,7 @@ Vhost-user Protocol
>  :Licence: This work is licensed under the terms of the GNU GPL,
>            version 2 or later. See the COPYING file in the top-level
>            directory.
> -
> +         =20
>  .. contents:: Table of Contents
> =20
>  Introduction
> diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulat=
ion.rst
> index a0f00bc340..5aca6ed66b 100644
> --- a/docs/system/device-emulation.rst
> +++ b/docs/system/device-emulation.rst
> @@ -75,4 +75,5 @@ Emulated Devices
>     devices/net.rst
>     devices/nvme.rst
>     devices/usb.rst
> +   devices/vhost-user.rst
>     devices/virtio-pmem.rst
> diff --git a/docs/system/devices/vhost-user.rst b/docs/system/devices/vho=
st-user.rst
> new file mode 100644
> index 0000000000..ecb1107d4c
> --- /dev/null
> +++ b/docs/system/devices/vhost-user.rst
> @@ -0,0 +1,57 @@
> +.. _vhost_user:
> +
> +vhost-user back ends
> +--------------------
> +
> +vhost-user back ends are way to service the request of VirtIO devices
> +outside of QEMU itself. To do this there are a number of things
> +required.
> +
> +vhost-user device
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +These are simple stub devices that ensure the VirtIO device is visible
> +to the guest. The code is mostly boilerplate although each device has
> +a ``chardev`` option which specifies the ID of the ``--chardev``
> +device that connects via a socket to the vhost-user *daemon*.
> +
> +vhost-user daemon
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This is a separate process that is connected to by QEMU via a socket
> +following the :ref:`vhost_user_proto`. There are a number of daemons
> +that can be built when enabled by the project although any daemon that
> +meets the specification for a given device can be used. The daemon
> +will open a socket and *listen* for a connection from QEMU at which
> +point the protocol will start its negotiation.

I suggest dropping this line because it's more complicated and possibly
confusing at this point: vhost-user daemons can either listen or they
can connect (i.e. QEMU is the one that listens). I think both directions
were supported because they were convenient in different situations.

> +
> +Shared memory object
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +In order for the daemon to access the VirtIO queues to process the
> +requests it needs access to the guest's address space. This is
> +achieved via the ``memory-backend-file`` object. A reference to a

``memory-backend-file`` or ``memory-backend-memfd`` objects.

(memory-backend-ram doesn't have an fd so it cannot be passed over a
UNIX domain socket.)

> +file-descriptor which can access this object will be passed via the
> +socket as part of the protocol negotiation.
> +
> +Example
> +=3D=3D=3D=3D=3D=3D=3D
> +
> +First start you daemon.
> +
> +.. parsed-literal::
> +
> +  $ virtio-foo --socket-path=3D/var/run/foo.sock $OTHER_ARGS
> +
> +The you start your QEMU instance specifying the device, chardev and
> +memory objects.
> +
> +.. parsed-literal::
> +
> +  $ |qemu_system| \\
> +      -chardev socket,id=3Dba1,path=3D/var/run/foo.sock \\
> +      -device vhost-user-foo,chardev=3Dba1,$OTHER_ARGS \\
> +      -object memory-backend-memfd,id=3Dmem,size=3D4G,share=3Don \\
> +      -numa node,memdev=3Dmem \\
> +        ...
> +
> --=20
> 2.20.1
>=20

--0JkO6kjvUjifYl/c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDmw5kACgkQnKSrs4Gr
c8gOBAgAwXnEz9KrLa/bAkYmMtMrk0casi6CYgKVs8i3fAADTiH8BlAPC0ajWHmW
1NX1jilIdQy7rMP7m1lXQt91VXO0E7D1mwO2JyJML1xYJVEcG5z5O9HLMGTiTnDx
2+XMHqKLv5Os+/mzOBuP2Xbp/X7OU9vrrXf1bbIL7FPy74yFhmPKQ3hVXapO23or
kEmbDfSIkBo0jTeBIy22oLOm/kfcFiCPyXrIEZTGLL4gauV/HTN1G7iDv9aKWM2F
A9ww3AYeRDACckaN/xHTXaiOpUAXUxGQvKfTBrpDhBJKhI0+Nrvk+pGrKsLTw5T6
SBSRu+wHZsTWg7ck7D/frTutzuXBAA==
=0MN6
-----END PGP SIGNATURE-----

--0JkO6kjvUjifYl/c--


