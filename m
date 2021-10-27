Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBF343CF0C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:52:27 +0200 (CEST)
Received: from localhost ([::1]:34734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfmA6-0005L0-Oq
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mflgO-00012W-Fo
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:21:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mflgK-00040V-C6
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635351698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6yHroobUybbRa25KXF60pdE4jj3BBqZFpsK/nkCLGFE=;
 b=YLtevKuqxiwkIS9fRMJbgmfN4hx8EKWU8JNgYhIWrOLsnohr/XTwBEC8O6pGXYN7kqd9F8
 Ym/Ecb9OO4wW4HABF9i6IXKO/zFC0QOb3b0jBWft9901g3fUv1HktjDs5nQh9/N8Jkd3uo
 T8y1rjEW/PndBE4/2ZeicIq/ZiXCBGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-_kOAH6l4Nq2h7clxjX8Z3w-1; Wed, 27 Oct 2021 12:21:33 -0400
X-MC-Unique: _kOAH6l4Nq2h7clxjX8Z3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D73FD18D6A25;
 Wed, 27 Oct 2021 16:21:31 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 408BA5DF35;
 Wed, 27 Oct 2021 16:21:31 +0000 (UTC)
Date: Wed, 27 Oct 2021 17:21:30 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v3 06/12] vfio-user: run vfio-user context
Message-ID: <YXl8ilTXICU+0EHk@stefanha-x1.localdomain>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <489671ef49381437a03917a87dc143dd9fc90559.1633929457.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <489671ef49381437a03917a87dc143dd9fc90559.1633929457.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="epZhOi5c+BLGmMUR"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 thanos.makatos@nutanix.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--epZhOi5c+BLGmMUR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 01:31:11AM -0400, Jagannathan Raman wrote:
> Setup a handler to run vfio-user context. The context is driven by
> messages to the file descriptor associated with it - get the fd for
> the context and hook up the handler with it
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/vfio-user-obj.c | 75 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 74 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index 7ce4e5b256..05f7fff19c 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -42,6 +42,7 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-visit-sockets.h"
>  #include "qemu/notify.h"
> +#include "qemu/thread.h"
>  #include "sysemu/sysemu.h"
>  #include "libvfio-user.h"
>  #include "hw/qdev-core.h"
> @@ -72,6 +73,8 @@ struct VfuObject {
>      vfu_ctx_t *vfu_ctx;
> =20
>      PCIDevice *pci_dev;
> +
> +    int vfu_poll_fd;
>  };
> =20
>  static void vfu_object_set_socket(Object *obj, Visitor *v, const char *n=
ame,
> @@ -105,6 +108,58 @@ static void vfu_object_set_device(Object *obj, const=
 char *str, Error **errp)
>      trace_vfu_prop("device", str);
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
> +                           o->device, strerror(errno));
> +                 break;
> +            }

The libvfio-user.h doc comments say this function can return -1 (EAGAIN)
when LIBVFIO_USER_FLAG_ATTACH_NB was used. Is the doc comment wrong
since this patch seems to rely on vfu_run_ctx() returning 0 when there
are no more commands to process?

> +        }
> +    }
> +}
> +
> +static void vfu_object_attach_ctx(void *opaque)
> +{
> +    VfuObject *o =3D opaque;
> +    int ret;
> +
> +    qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
> +    o->vfu_poll_fd =3D -1;
> +
> +retry_attach:
> +    ret =3D vfu_attach_ctx(o->vfu_ctx);
> +    if (ret < 0 && (errno =3D=3D EAGAIN || errno =3D=3D EWOULDBLOCK)) {
> +        goto retry_attach;

Can we wait for the poll fd to become readable instead of spinning? I
don't know the libvfio-user APIs so I'm not sure, but it would be nice
to avoid a busy loop.

> +    } else if (ret < 0) {
> +        error_setg(&error_abort,

error_abort is not appropriate for hotplugged objects, where it's less
likely that the user wants to terminate the process when a failure
occurs. If asynchronous errors occur then QMP Events should be raised so
the QMP client gets notified and can deal with them.

> +                   "vfu: Failed to attach device %s to context - %s",
> +                   o->device, strerror(errno));
> +        return;
> +    }
> +
> +    o->vfu_poll_fd =3D vfu_get_poll_fd(o->vfu_ctx);
> +    if (o->vfu_poll_fd < 0) {
> +        error_setg(&error_abort, "vfu: Failed to get poll fd %s", o->dev=
ice);
> +        return;
> +    }
> +
> +    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
> +}
> +
>  /*
>   * vfio-user-server depends on the availability of the 'socket' and 'dev=
ice'
>   * properties. It also depends on devices instantiated in QEMU. These
> @@ -120,7 +175,8 @@ static void vfu_object_machine_done(Notifier *notifie=
r, void *data)
>      vfu_pci_type_t pci_type =3D VFU_PCI_TYPE_CONVENTIONAL;
>      int ret;
> =20
> -    o->vfu_ctx =3D vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.pa=
th, 0,
> +    o->vfu_ctx =3D vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.pa=
th,
> +                                LIBVFIO_USER_FLAG_ATTACH_NB,
>                                  o, VFU_DEV_TYPE_PCI);
>      if (o->vfu_ctx =3D=3D NULL) {
>          error_setg(&error_abort, "vfu: Failed to create context - %s",
> @@ -152,6 +208,21 @@ static void vfu_object_machine_done(Notifier *notifi=
er, void *data)
>                     o->device, strerror(errno));
>          return;
>      }
> +
> +    ret =3D vfu_realize_ctx(o->vfu_ctx);
> +    if (ret < 0) {
> +        error_setg(&error_abort, "vfu: Failed to realize device %s- %s",
> +                   o->device, strerror(errno));
> +        return;
> +    }
> +
> +    o->vfu_poll_fd =3D vfu_get_poll_fd(o->vfu_ctx);
> +    if (o->vfu_poll_fd < 0) {
> +        error_setg(&error_abort, "vfu: Failed to get poll fd %s", o->dev=
ice);
> +        return;
> +    }
> +
> +    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_attach_ctx, NULL, o);
>  }
> =20
>  static void vfu_object_init(Object *obj)
> @@ -178,6 +249,8 @@ static void vfu_object_init(Object *obj)
> =20
>      o->machine_done.notify =3D vfu_object_machine_done;
>      qemu_add_machine_init_done_notifier(&o->machine_done);
> +
> +    o->vfu_poll_fd =3D -1;

This must be done before the qemu_add_machine_init_done_notifier() call
in the hotplug case. qemu_add_machine_init_done_notifier() invokes the
notifier callback immediately if machine init was already done.

--epZhOi5c+BLGmMUR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF5fIoACgkQnKSrs4Gr
c8hjMQgAqYvZZXhAQ5LSdSIJMGsT3zhqGk+gOypk8y1YC+gr3A6ZPcn4IUSKOeMH
Q4qkLQKNmH8uRh36UtOoXAfiBanOqJKicuGbC20rD3r4QcbBv0RZa9SZCDAUyVGt
A6YNiBsAUUTVZ+khAXJSSDElH7ZAQ9hEx+JZEF4JVGKBYzCB4xKkBHiFdvkFqION
/ksJ06QR95xOX9nllkzgMNDvChg6HGGul+MYoJoW8Z+hnWPh9QK/lRDK+CDyJzaK
nLFluOmqbou/rcAf8/2EOVhOtO1z36AE67OwStL4DfwJwSdp3uPVKBqrI+uULcXu
1Lr0H/kI5u++TaThbl2S7mGpkqZw7A==
=fXBn
-----END PGP SIGNATURE-----

--epZhOi5c+BLGmMUR--


