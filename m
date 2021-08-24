Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767363F627C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:12:54 +0200 (CEST)
Received: from localhost ([::1]:51608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZ2e-0005PS-3U
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIZ1E-00048u-NJ
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:11:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIZ1B-00036o-G8
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629821475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ugLwqfezPrGNAWe2vbOPYMuexvJcABsNeG2WDO3zRAA=;
 b=EwTax60N0o6w1XLXenTtU+vvARZjN7voW6PSwuTEaaXdEOGcJDs8jt8VyvmLwEv4GAHGtc
 XKerJ/lw5H9+2A/IEbYAA466B1micFd18v9IQT+FHLtNrWnkO3hAeEPYnLSvdLGQQbNePy
 aZE+E4ItqH9X9utGKvmMJyNq7btVn70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-T7A8I6xpNSePynOZHN6EqQ-1; Tue, 24 Aug 2021 12:11:12 -0400
X-MC-Unique: T7A8I6xpNSePynOZHN6EqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BA33802C91;
 Tue, 24 Aug 2021 16:11:11 +0000 (UTC)
Received: from localhost (unknown [10.39.192.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BB2660C05;
 Tue, 24 Aug 2021 16:11:04 +0000 (UTC)
Date: Tue, 24 Aug 2021 16:59:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC v2 06/16] vfio-user: negotiate version with remote
 server
Message-ID: <YSUXVQJwkubjpp9x@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <a14c2c09f41ddda83cd710516cac8d210ec9db08.1629131628.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <a14c2c09f41ddda83cd710516cac8d210ec9db08.1629131628.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WGc7Clc9Kad8XPhK"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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
Cc: john.g.johnson@oracle.com, jag.raman@oracle.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--WGc7Clc9Kad8XPhK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 09:42:39AM -0700, Elena Ufimtseva wrote:
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 7005d9f891..eae33e746f 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3397,6 +3397,12 @@ static void vfio_user_pci_realize(PCIDevice *pdev,=
 Error **errp)
>          proxy->flags |=3D VFIO_PROXY_SECURE;
>      }
> =20
> +    vfio_user_validate_version(vbasedev, &err);
> +    if (err !=3D NULL) {
> +        error_propagate(errp, err);
> +        goto error;
> +    }
> +
>      vbasedev->name =3D g_strdup_printf("VFIO user <%s>", udev->sock_name=
);
>      vbasedev->dev =3D DEVICE(vdev);
>      vbasedev->fd =3D -1;
> @@ -3404,6 +3410,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, =
Error **errp)
>      vbasedev->no_mmap =3D false;
>      vbasedev->ops =3D &vfio_user_pci_ops;
> =20
> +error:

Missing return before error label? We shouldn't disconnect in the
success case.

> +    vfio_user_disconnect(proxy);
> +    error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
>  }
> =20
>  static void vfio_user_instance_finalize(Object *obj)
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index 2fcc77d997..e89464a571 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -23,9 +23,16 @@
>  #include "io/channel-socket.h"
>  #include "io/channel-util.h"
>  #include "sysemu/iothread.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qapi/qmp/qjson.h"
> +#include "qapi/qmp/qnull.h"
> +#include "qapi/qmp/qstring.h"
> +#include "qapi/qmp/qnum.h"
>  #include "user.h"
> =20
>  static uint64_t max_xfer_size =3D VFIO_USER_DEF_MAX_XFER;
> +static uint64_t max_send_fds =3D VFIO_USER_DEF_MAX_FDS;
> +static int wait_time =3D 1000;   /* wait 1 sec for replies */
>  static IOThread *vfio_user_iothread;
> =20
>  static void vfio_user_shutdown(VFIOProxy *proxy);
> @@ -34,7 +41,14 @@ static void vfio_user_send_locked(VFIOProxy *proxy, VF=
IOUserHdr *msg,
>                                    VFIOUserFDs *fds);
>  static void vfio_user_send(VFIOProxy *proxy, VFIOUserHdr *msg,
>                             VFIOUserFDs *fds);
> +static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
> +                                  uint32_t size, uint32_t flags);
> +static void vfio_user_send_recv(VFIOProxy *proxy, VFIOUserHdr *msg,
> +                                VFIOUserFDs *fds, int rsize, int flags);
> =20
> +/* vfio_user_send_recv flags */
> +#define NOWAIT          0x1  /* do not wait for reply */
> +#define NOIOLOCK        0x2  /* do not drop iolock */

Please use "BQL", it's a widely used term while "iolock" isn't used:
s/IOLOCK/BQL/

> =20
>  /*
>   * Functions called by main, CPU, or iothread threads
> @@ -333,6 +347,79 @@ static void vfio_user_cb(void *opaque)
>   * Functions called by main or CPU threads
>   */
> =20
> +static void vfio_user_send_recv(VFIOProxy *proxy, VFIOUserHdr *msg,
> +                                VFIOUserFDs *fds, int rsize, int flags)
> +{
> +    VFIOUserReply *reply;
> +    bool iolock =3D 0;
> +
> +    if (msg->flags & VFIO_USER_NO_REPLY) {
> +        error_printf("vfio_user_send_recv on async message\n");
> +        return;
> +    }
> +
> +    /*
> +     * We may block later, so use a per-proxy lock and let
> +     * the iothreads run while we sleep unless told no to

s/no/not/

> +int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp)
> +{
> +    g_autofree VFIOUserVersion *msgp;
> +    GString *caps;
> +    int size, caplen;
> +
> +    caps =3D caps_json();
> +    caplen =3D caps->len + 1;
> +    size =3D sizeof(*msgp) + caplen;
> +    msgp =3D g_malloc0(size);
> +
> +    vfio_user_request_msg(&msgp->hdr, VFIO_USER_VERSION, size, 0);
> +    msgp->major =3D VFIO_USER_MAJOR_VER;
> +    msgp->minor =3D VFIO_USER_MINOR_VER;
> +    memcpy(&msgp->capabilities, caps->str, caplen);
> +    g_string_free(caps, true);
> +
> +    vfio_user_send_recv(vbasedev->proxy, &msgp->hdr, NULL, 0, 0);
> +    if (msgp->hdr.flags & VFIO_USER_ERROR) {
> +        error_setg_errno(errp, msgp->hdr.error_reply, "version reply");
> +        return -1;
> +    }
> +
> +    if (msgp->major !=3D VFIO_USER_MAJOR_VER ||
> +        msgp->minor > VFIO_USER_MINOR_VER) {
> +        error_setg(errp, "incompatible server version");
> +        return -1;
> +    }
> +    if (caps_check(msgp->minor, (char *)msgp + sizeof(*msgp), errp) !=3D=
 0) {

The reply is untrusted so we cannot treat it as a NUL-terminated string
yet. The final byte msgp->capabilities[] needs to be checked first.

Please be careful about input validation, I might miss something so it's
best if you audit the patches too. QEMU must not trust the device
emulation process and vice versa.

> +        return -1;
> +    }
> +
> +    return 0;
> +}
> --=20
> 2.25.1
>=20

--WGc7Clc9Kad8XPhK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmElF1QACgkQnKSrs4Gr
c8jtCwgAhBwk2rryBONdAXO9/lV7jsw2ov4SZtOry215p5Faj6tssF0MD9/C4uPX
N9HWIu93x6sxsEH3WCpiybzdG8PVFFAKDDWB0iX5vSeesbU4S6Q4y0Qe0NdLRMkc
JHyLnFiUia+WY3bDKx+NFpQZO6jx9u/vp2vco8a0NvjQUUsxFhPPwBHPqmHwTvo0
okZDFSsVELXk4aPyYmEBeUNdqS65/SKPo8er2psIUe4ksMlqOeGR2Grf76p23hAX
cQ341b/yEv3MMvQdS0IEATocBpkfTCjJkS9yLngrqrTTIg1l0q2nOx35S9V93uCD
D4Nhqu49jbzvTpFsUNfX3QgQsmp+9g==
=NXbx
-----END PGP SIGNATURE-----

--WGc7Clc9Kad8XPhK--


