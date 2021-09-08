Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8A1403A2F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 15:01:32 +0200 (CEST)
Received: from localhost ([::1]:41560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNxCj-0001Vs-2i
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 09:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNxAO-0000Ox-73
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:59:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNxAL-0007nF-54
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631105939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x/gdDbK6sKUgqtRsj4IImCE/reoXbQTCsZZHhl2phL8=;
 b=g/3YCyPnSZ1MrFxBRSpsdhSHA9KXRKvWqgTe7Bxjrpc6ezIrakSFyPHJQPxK1qRkEwyMdK
 6Bc7a8rAPlOa6lTArjBSrcnAg8WzGL7jiB9h9msg60XGI4US6UGUlQPaK5BGmKhWEuXupo
 tnxesVAGJq5gjrvWBfKdYn2ksYb/xQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-TDZrmjRRNK24GvJGqqxzfg-1; Wed, 08 Sep 2021 08:58:58 -0400
X-MC-Unique: TDZrmjRRNK24GvJGqqxzfg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9826919057A0;
 Wed,  8 Sep 2021 12:58:56 +0000 (UTC)
Received: from localhost (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57E7A196FC;
 Wed,  8 Sep 2021 12:58:52 +0000 (UTC)
Date: Wed, 8 Sep 2021 13:58:46 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH RFC server v2 05/11] vfio-user: run vfio-user context
Message-ID: <YTizhs1m7EsAs9UG@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <3c043becf2b6e820f5392e0cadb465d5d9b9e6f8.1630084211.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <3c043becf2b6e820f5392e0cadb465d5d9b9e6f8.1630084211.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qZftpQjE6A7lYJYb"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, philmd@redhat.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qZftpQjE6A7lYJYb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2021 at 01:53:24PM -0400, Jagannathan Raman wrote:
> Setup a handler to run vfio-user context. The context is driven by
> messages to the file descriptor associated with it - get the fd for
> the context and hook up the handler with it
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/vfio-user-obj.c | 71 +++++++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 70 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index 5ae0991..0726eb9 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -35,6 +35,7 @@
>  #include "trace.h"
>  #include "sysemu/runstate.h"
>  #include "qemu/notify.h"
> +#include "qemu/thread.h"
>  #include "qapi/error.h"
>  #include "sysemu/sysemu.h"
>  #include "libvfio-user.h"
> @@ -65,6 +66,8 @@ struct VfuObject {
>      vfu_ctx_t *vfu_ctx;
> =20
>      PCIDevice *pci_dev;
> +
> +    int vfu_poll_fd;
>  };
> =20
>  static void vfu_object_set_socket(Object *obj, const char *str, Error **=
errp)
> @@ -89,13 +92,67 @@ static void vfu_object_set_devid(Object *obj, const c=
har *str, Error **errp)
>      trace_vfu_prop("devid", str);
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
> +                qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
> +                o->vfu_poll_fd =3D -1;
> +                object_unparent(OBJECT(o));
> +                break;
> +            } else {
> +                error_setg(&error_abort, "vfu: Failed to run device %s -=
 %s",
> +                           o->devid, strerror(errno));
> +                 break;
> +            }
> +        }
> +    }
> +}
> +
> +static void *vfu_object_attach_ctx(void *opaque)
> +{
> +    VfuObject *o =3D opaque;
> +    int ret;
> +
> +retry_attach:
> +    ret =3D vfu_attach_ctx(o->vfu_ctx);
> +    if (ret < 0 && (errno =3D=3D EAGAIN || errno =3D=3D EWOULDBLOCK)) {

Does this loop consume 100% CPU since this is non-blocking?

Is it possible to register the fd with a QEMU AioContext instead of
spawning a separate thread?

libvfio-user has non-blocking listen_fd but conn_fd is always blocking.
This means ATTACH_NB is not useful because vfu_attach_ctx() is actually
blocking. I think this means vfu_run_ctx() is also blocking in some
places and QEMU's event loop might hang :(.

Can you make libvfio-user non-blocking in order to solve these issues?

> +        goto retry_attach;
> +    } else if (ret < 0) {
> +        error_setg(&error_abort,
> +                   "vfu: Failed to attach device %s to context - %s",
> +                   o->devid, strerror(errno));
> +        return NULL;
> +    }
> +
> +    o->vfu_poll_fd =3D vfu_get_poll_fd(o->vfu_ctx);
> +    if (o->vfu_poll_fd < 0) {
> +        error_setg(&error_abort, "vfu: Failed to get poll fd %s", o->dev=
id);
> +        return NULL;
> +    }
> +
> +    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run,
> +                        NULL, o);
> +
> +    return NULL;
> +}
> +
>  static void vfu_object_machine_done(Notifier *notifier, void *data)
>  {
>      VfuObject *o =3D container_of(notifier, VfuObject, machine_done);
>      DeviceState *dev =3D NULL;
> +    QemuThread thread;
>      int ret;
> =20
> -    o->vfu_ctx =3D vfu_create_ctx(VFU_TRANS_SOCK, o->socket, 0,
> +    o->vfu_ctx =3D vfu_create_ctx(VFU_TRANS_SOCK, o->socket,
> +                                LIBVFIO_USER_FLAG_ATTACH_NB,
>                                  o, VFU_DEV_TYPE_PCI);
>      if (o->vfu_ctx =3D=3D NULL) {
>          error_setg(&error_abort, "vfu: Failed to create context - %s",
> @@ -124,6 +181,16 @@ static void vfu_object_machine_done(Notifier *notifi=
er, void *data)
>                     o->devid, strerror(errno));
>          return;
>      }
> +
> +    ret =3D vfu_realize_ctx(o->vfu_ctx);
> +    if (ret < 0) {
> +        error_setg(&error_abort, "vfu: Failed to realize device %s- %s",
> +                   o->devid, strerror(errno));
> +        return;
> +    }
> +
> +    qemu_thread_create(&thread, o->socket, vfu_object_attach_ctx, o,
> +                       QEMU_THREAD_DETACHED);

Is this thread leaked when the object is destroyed?

>  }
> =20
>  static void vfu_object_init(Object *obj)
> @@ -147,6 +214,8 @@ static void vfu_object_init(Object *obj)
> =20
>      o->machine_done.notify =3D vfu_object_machine_done;
>      qemu_add_machine_init_done_notifier(&o->machine_done);
> +
> +    o->vfu_poll_fd =3D -1;
>  }
> =20
>  static void vfu_object_finalize(Object *obj)
> --=20
> 1.8.3.1
>=20

--qZftpQjE6A7lYJYb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE4s4UACgkQnKSrs4Gr
c8i1gggArmPRncryFbJSKXwwcMw/l4hckAf5D4iLPY1no+5UZWBvAirDmFYMYxWp
hJ4BvbuhdCntFscwEn55laDUepXt7iQXNEoMgYsnmIvf2MBuR2qz8lxSsJH5oPEt
tY+HdLaEcVbxqNPPxwdYVciJeQoCv7qM+Bp05fHvojuekU/cDiq51Ed+875QivsD
vEDLK1JKLE6tkmbvq+tnHD8ZZGpJ5x6k+bp0P5F1JPKGVAeHsSRNamtQgBlPfiMw
kw3i+lypgrVMhJ838Y9zqIRezAekR+OuyUF2JWXlQytU/gTPyL2gxH7Cj09KAQRP
N4sejI5h372L44f7UogoHMFEpsBQKA==
=L6vR
-----END PGP SIGNATURE-----

--qZftpQjE6A7lYJYb--


