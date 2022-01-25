Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB3D49B867
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:18:08 +0100 (CET)
Received: from localhost ([::1]:57478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCOWF-0003Wj-Ur
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:18:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCNSx-00076q-UQ
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:10:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCNSd-0006V9-5Y
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643123417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fFvTIKuTsMpADBOzHtZkFNn1OrhmLcb8s2wtcOahvb4=;
 b=e7yzI9E4xqhn7Z7LOTxu0xG3dv6nZhDBDWJW9xLT3pFjx31sq2kD8xk9KeagXaxFUV/gL5
 DHVIebj35R8VNLjL9oMjYdyqcWRPo3+b9pP+GIsJhsY5LdZB9BrKlnq04gnSUGZCuCR2TW
 dDiygUFpftlYqTmvuT4fSx2WYFGJBGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-MOB-M-ExOVyBVIKFZGvWHw-1; Tue, 25 Jan 2022 10:10:15 -0500
X-MC-Unique: MOB-M-ExOVyBVIKFZGvWHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 534F719251A1;
 Tue, 25 Jan 2022 15:10:13 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0A237E2FE;
 Tue, 25 Jan 2022 15:10:12 +0000 (UTC)
Date: Tue, 25 Jan 2022 15:10:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 12/18] vfio-user: run vfio-user context
Message-ID: <YfAS0+7qg8Db3roP@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <63ef44664629ffd07d3bffe60351e808965dd13e.1642626515.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Kg29grYpdfbC0Ge4"
Content-Disposition: inline
In-Reply-To: <63ef44664629ffd07d3bffe60351e808965dd13e.1642626515.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 marcandre.lureau@gmail.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Kg29grYpdfbC0Ge4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2022 at 04:42:01PM -0500, Jagannathan Raman wrote:
> Setup a handler to run vfio-user context. The context is driven by
> messages to the file descriptor associated with it - get the fd for
> the context and hook up the handler with it
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  qapi/misc.json            | 23 ++++++++++
>  hw/remote/vfio-user-obj.c | 90 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 112 insertions(+), 1 deletion(-)
>=20
> diff --git a/qapi/misc.json b/qapi/misc.json
> index e8054f415b..f0791d3311 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -527,3 +527,26 @@
>   'data': { '*option': 'str' },
>   'returns': ['CommandLineOptionInfo'],
>   'allow-preconfig': true }
> +
> +##
> +# @VFU_CLIENT_HANGUP:
> +#
> +# Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
> +# communication channel
> +#
> +# @device: ID of attached PCI device
> +#
> +# @path: path of the socket

This assumes a UNIX domain socket path was given. It doesn't work well
with file descriptor passing. The x-vfio-user-server is an object with
a unique QEMU Object Model path (the last path component is its id). You
can get the id like this:

  object_get_canonical_path_component(OBJECT(o))

I suggest dropping @path and including the server object's id instead.

> +#
> +# Since: 6.3
> +#
> +# Example:
> +#
> +# <- { "event": "VFU_CLIENT_HANGUP",
> +#      "data": { "device": "lsi1",
> +#                "path": "/tmp/vfu1-sock" },
> +#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
> +#
> +##
> +{ 'event': 'VFU_CLIENT_HANGUP',
> +  'data': { 'device': 'str', 'path': 'str' } }
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index 10db78eb8d..91d49a221f 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -27,6 +27,9 @@
>   *
>   * device - id of a device on the server, a required option. PCI devices
>   *          alone are supported presently.
> + *
> + * notes - x-vfio-user-server could block IO and monitor during the
> + *         initialization phase.
>   */
> =20
>  #include "qemu/osdep.h"
> @@ -41,11 +44,14 @@
>  #include "hw/remote/machine.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-visit-sockets.h"
> +#include "qapi/qapi-events-misc.h"
>  #include "qemu/notify.h"
> +#include "qemu/thread.h"
>  #include "sysemu/sysemu.h"
>  #include "libvfio-user.h"
>  #include "hw/qdev-core.h"
>  #include "hw/pci/pci.h"
> +#include "qemu/timer.h"
> =20
>  #define TYPE_VFU_OBJECT "x-vfio-user-server"
>  OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
> @@ -95,6 +101,8 @@ struct VfuObject {
>      PCIDevice *pci_dev;
> =20
>      Error *unplug_blocker;
> +
> +    int vfu_poll_fd;
>  };
> =20
>  static void vfu_object_init_ctx(VfuObject *o, Error **errp);
> @@ -144,6 +152,68 @@ static void vfu_object_set_device(Object *obj, const=
 char *str, Error **errp)
>      vfu_object_init_ctx(o, errp);
>  }
> =20
> +static void vfu_object_ctx_run(void *opaque)
> +{
> +    VfuObject *o =3D opaque;
> +    int ret =3D -1;
> +
> +    while (ret !=3D 0) {
> +        ret =3D vfu_run_ctx(o->vfu_ctx);
> +        if (ret < 0) {
> +            if (errno =3D=3D EINTR) {
> +                continue;
> +            } else if (errno =3D=3D ENOTCONN) {
> +                qapi_event_send_vfu_client_hangup(o->device,
> +                                                  o->socket->u.q_unix.pa=
th);
> +                qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);

Do we also stop monitoring o->vfu_poll_fd when object-del is used to
delete the x-vfio-user-server object?

--Kg29grYpdfbC0Ge4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHwEtMACgkQnKSrs4Gr
c8gUEQgAsHPLOJdN8PCP3LBXq0300nu8eRi+STuY8eVtm4ivcy62oy9WPUnPuzzl
yTSjNBpL/B19D/WYeUNApIpZM+fTLJZBJ9HnidxAzxMrU1yiPjCQG0hj78lutvOY
oUsPvax/gET5XMVpdbU4yxJKrp6zmfNFAeWUheJpLSizw/Po73cg3I+rr8r8luYG
iVvljACDA29eNF/gs0V9RqA9hcbG+kCeXDYq4F+0cIpf+9pZ42QhIfYO8t6eMuI0
939YaacUiNyOPYUbOzLdhVaopEv6Qb7ubgvuY8RriX3NuMcIVkEbTs1uvu8KLJtO
lVDH2xTXOLW25KiofaTpqRbB7ZxWmg==
=36LS
-----END PGP SIGNATURE-----

--Kg29grYpdfbC0Ge4--


