Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D82749B826
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:03:39 +0100 (CET)
Received: from localhost ([::1]:37056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCOIE-00055g-59
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:03:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCN3x-0000jL-7O
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:44:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCN3v-0001JS-1E
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643121885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EMLc7ZiWnpo0m3A76NpV5mllpsa4Bl2t2mUAOO5RZn4=;
 b=g2XjkYwJWarV8lKsLJvYp4V4Yr3colC3R8/MYjgI3GIu7RJXQDe5b4PAguTdKX56QuXUC3
 tAJt4m28iX3bNEFpjeNUute/fiXpuvDXXO+Cwt+zVyGPavv3TMVauO+UHMVmXyexPKaeGk
 QOuLTdC05DOzwG84QzsLFaB0uy3+npQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-7hMWG5-PMbuEnIJspSRFzg-1; Tue, 25 Jan 2022 09:44:44 -0500
X-MC-Unique: 7hMWG5-PMbuEnIJspSRFzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B7DF8145E1;
 Tue, 25 Jan 2022 14:44:42 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2F82703BA;
 Tue, 25 Jan 2022 14:44:14 +0000 (UTC)
Date: Tue, 25 Jan 2022 14:44:13 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 10/18] vfio-user: instantiate vfio-user context
Message-ID: <YfAMvTOdrdFpU700@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <66bb8c18bb5372f72aaa66d62f09258ec7775100.1642626515.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qjwPoUAM8COl9n0i"
Content-Disposition: inline
In-Reply-To: <66bb8c18bb5372f72aaa66d62f09258ec7775100.1642626515.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--qjwPoUAM8COl9n0i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2022 at 04:41:59PM -0500, Jagannathan Raman wrote:
> create a context with the vfio-user library to run a PCI device
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/vfio-user-obj.c | 78 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
>=20
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index 80757b0029..810a7c3943 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -41,6 +41,9 @@
>  #include "hw/remote/machine.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-visit-sockets.h"
> +#include "qemu/notify.h"
> +#include "sysemu/sysemu.h"
> +#include "libvfio-user.h"
> =20
>  #define TYPE_VFU_OBJECT "x-vfio-user-server"
>  OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
> @@ -82,13 +85,23 @@ struct VfuObject {
>      char *device;
> =20
>      Error *err;
> +
> +    Notifier machine_done;
> +
> +    vfu_ctx_t *vfu_ctx;
>  };
> =20
> +static void vfu_object_init_ctx(VfuObject *o, Error **errp);
> +
>  static void vfu_object_set_socket(Object *obj, Visitor *v, const char *n=
ame,
>                                    void *opaque, Error **errp)
>  {
>      VfuObject *o =3D VFU_OBJECT(obj);
> =20
> +    if (o->vfu_ctx) {
> +        return;
> +    }

No error?

> +
>      qapi_free_SocketAddress(o->socket);
> =20
>      o->socket =3D NULL;
> @@ -104,17 +117,68 @@ static void vfu_object_set_socket(Object *obj, Visi=
tor *v, const char *name,
>      }
> =20
>      trace_vfu_prop("socket", o->socket->u.q_unix.path);
> +
> +    vfu_object_init_ctx(o, errp);
>  }
> =20
>  static void vfu_object_set_device(Object *obj, const char *str, Error **=
errp)
>  {
>      VfuObject *o =3D VFU_OBJECT(obj);
> =20
> +    if (o->vfu_ctx) {
> +        return;
> +    }

No error?

> +
>      g_free(o->device);
> =20
>      o->device =3D g_strdup(str);
> =20
>      trace_vfu_prop("device", str);
> +
> +    vfu_object_init_ctx(o, errp);
> +}
> +
> +/*
> + * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'devi=
ce'
> + * properties. It also depends on devices instantiated in QEMU. These
> + * dependencies are not available during the instance_init phase of this
> + * object's life-cycle. As such, the server is initialized after the
> + * machine is setup. machine_init_done_notifier notifies TYPE_VFU_OBJECT
> + * when the machine is setup, and the dependencies are available.
> + */
> +static void vfu_object_machine_done(Notifier *notifier, void *data)
> +{
> +    VfuObject *o =3D container_of(notifier, VfuObject, machine_done);
> +    Error *err =3D NULL;
> +
> +    vfu_object_init_ctx(o, &err);
> +
> +    if (err) {
> +        error_propagate(&error_abort, err);
> +    }
> +}
> +
> +static void vfu_object_init_ctx(VfuObject *o, Error **errp)
> +{
> +    ERRP_GUARD();
> +
> +    if (o->vfu_ctx || !o->socket || !o->device ||
> +            !phase_check(PHASE_MACHINE_READY)) {
> +        return;
> +    }
> +
> +    if (o->err) {
> +        error_propagate(errp, o->err);
> +        o->err =3D NULL;
> +        return;
> +    }
> +
> +    o->vfu_ctx =3D vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.pa=
th, 0,
> +                                o, VFU_DEV_TYPE_PCI);
> +    if (o->vfu_ctx =3D=3D NULL) {
> +        error_setg(errp, "vfu: Failed to create context - %s", strerror(=
errno));
> +        return;
> +    }
>  }
> =20
>  static void vfu_object_init(Object *obj)
> @@ -124,6 +188,11 @@ static void vfu_object_init(Object *obj)
> =20
>      k->nr_devs++;
> =20
> +    if (!phase_check(PHASE_MACHINE_READY)) {
> +        o->machine_done.notify =3D vfu_object_machine_done;
> +        qemu_add_machine_init_done_notifier(&o->machine_done);
> +    }
> +
>      if (!object_dynamic_cast(OBJECT(current_machine), TYPE_REMOTE_MACHIN=
E)) {
>          error_setg(&o->err, "vfu: %s only compatible with %s machine",
>                     TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
> @@ -142,6 +211,10 @@ static void vfu_object_finalize(Object *obj)
> =20
>      o->socket =3D NULL;
> =20
> +    if (o->vfu_ctx) {
> +        vfu_destroy_ctx(o->vfu_ctx);
> +    }
> +
>      g_free(o->device);
> =20
>      o->device =3D NULL;
> @@ -149,6 +222,11 @@ static void vfu_object_finalize(Object *obj)
>      if (!k->nr_devs && k->auto_shutdown) {
>          qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>      }
> +
> +    if (o->machine_done.notify) {
> +        qemu_remove_machine_init_done_notifier(&o->machine_done);
> +        o->machine_done.notify =3D NULL;
> +    }
>  }
> =20
>  static void vfu_object_class_init(ObjectClass *klass, void *data)
> --=20
> 2.20.1
>=20

--qjwPoUAM8COl9n0i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHwDL0ACgkQnKSrs4Gr
c8jI8AgAmRaLRKkiaR0nhMbEJccv5bYyGghUyw0Xke9Qct1CcxIiTL3kH3CONK9o
n9EvEn8o0eANWDDpAyvBUvQiieBgmTI06UVaVOWKc9UzLqrE6qX39zr9r3ZRgD3a
GoTjOr0alpW7MrcBwUqrGckoHdUldPast3mJYU5cuG7weNTW6j+i8dxQ23oC53IA
wQNRPXAGUEBPIdwuzBOVuKCvZOSj06eCM2nDl9dWjej8MhpmzQ6o2kXBJiUlRyzC
91MtCg/5q1M35RZ7xZ9AAKRd+g0UHBoYicsSzW/Kf328lcnIX9kFfpv14PJwFGF6
nSOyRyjghtZOHZbmB+pHRZ3GaTDkWQ==
=2G9e
-----END PGP SIGNATURE-----

--qjwPoUAM8COl9n0i--


