Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC8C403A14
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:43:21 +0200 (CEST)
Received: from localhost ([::1]:57834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwvA-00014M-KI
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNwsl-0006xV-NV
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:40:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNwsh-0003j1-4V
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631104845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y+sKGYYbiERfqtXQ6i4vHKXNut39e+4KO17fThWw+ds=;
 b=e4d658fG+EHfESyCB/CjFTCj7z3jrtTAr4qgsYyzu6Z/eqdSBu+h0o2mm86nLpSEFaQn92
 dDS7aKzBZnOoEO9rNXTK4Wqqb7NxjrlcM62BZwt7cs2UuS9p5hWai0eG1EZauWi3EUoD9v
 ey58rbgUsCI54p14Xj13I0dUe/amMSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-FwKcoV78OCavIJStJtviDA-1; Wed, 08 Sep 2021 08:40:44 -0400
X-MC-Unique: FwKcoV78OCavIJStJtviDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35CF41018720;
 Wed,  8 Sep 2021 12:40:43 +0000 (UTC)
Received: from localhost (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7219160C04;
 Wed,  8 Sep 2021 12:40:39 +0000 (UTC)
Date: Wed, 8 Sep 2021 13:40:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH RFC server v2 03/11] vfio-user: instantiate vfio-user
 context
Message-ID: <YTivRjPEi8mF+gK0@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <4bf892091b1c08c79907ee2460f5f7aa797139af.1630084211.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <4bf892091b1c08c79907ee2460f5f7aa797139af.1630084211.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XSfEtKTxf/2Gb5MS"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

--XSfEtKTxf/2Gb5MS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2021 at 01:53:22PM -0400, Jagannathan Raman wrote:
> create a context with the vfio-user library to run a PCI device
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/vfio-user-obj.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index 4a1e297..99d3dd1 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -27,11 +27,17 @@
>  #include "qemu/osdep.h"
>  #include "qemu-common.h"
> =20
> +#include <errno.h>

qemu/osdep.h already includes <errno.h>

> +
>  #include "qom/object.h"
>  #include "qom/object_interfaces.h"
>  #include "qemu/error-report.h"
>  #include "trace.h"
>  #include "sysemu/runstate.h"
> +#include "qemu/notify.h"
> +#include "qapi/error.h"
> +#include "sysemu/sysemu.h"
> +#include "libvfio-user.h"
> =20
>  #define TYPE_VFU_OBJECT "vfio-user"
>  OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
> @@ -51,6 +57,10 @@ struct VfuObject {
> =20
>      char *socket;
>      char *devid;
> +
> +    Notifier machine_done;
> +
> +    vfu_ctx_t *vfu_ctx;
>  };
> =20
>  static void vfu_object_set_socket(Object *obj, const char *str, Error **=
errp)
> @@ -75,9 +85,23 @@ static void vfu_object_set_devid(Object *obj, const ch=
ar *str, Error **errp)
>      trace_vfu_prop("devid", str);
>  }
> =20
> +static void vfu_object_machine_done(Notifier *notifier, void *data)

Please document the reason for using a machine init done notifier.

> +{
> +    VfuObject *o =3D container_of(notifier, VfuObject, machine_done);
> +
> +    o->vfu_ctx =3D vfu_create_ctx(VFU_TRANS_SOCK, o->socket, 0,
> +                                o, VFU_DEV_TYPE_PCI);
> +    if (o->vfu_ctx =3D=3D NULL) {
> +        error_setg(&error_abort, "vfu: Failed to create context - %s",
> +                   strerror(errno));
> +        return;
> +    }
> +}
> +
>  static void vfu_object_init(Object *obj)
>  {
>      VfuObjectClass *k =3D VFU_OBJECT_GET_CLASS(obj);
> +    VfuObject *o =3D VFU_OBJECT(obj);
> =20
>      if (!object_dynamic_cast(OBJECT(current_machine), TYPE_REMOTE_MACHIN=
E)) {
>          error_report("vfu: %s only compatible with %s machine",
> @@ -92,6 +116,9 @@ static void vfu_object_init(Object *obj)
>      }
> =20
>      k->nr_devs++;
> +
> +    o->machine_done.notify =3D vfu_object_machine_done;
> +    qemu_add_machine_init_done_notifier(&o->machine_done);
>  }
> =20
>  static void vfu_object_finalize(Object *obj)
> @@ -101,6 +128,8 @@ static void vfu_object_finalize(Object *obj)
> =20
>      k->nr_devs--;
> =20
> +    vfu_destroy_ctx(o->vfu_ctx);

Will this function ever be called before vfu_object_machine_done() is
called? In that case vfu_ctx isn't initialized.

--XSfEtKTxf/2Gb5MS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE4r0YACgkQnKSrs4Gr
c8gL8gf/X9ClMk6s4PdveY7P2E56aBLtz9b/OMripcw3UiHS0I75UcKFZeLyGqdc
I6dgI6A5hc+3IZViSv24g2XykRziuTJrnq7Irb3C2WhsxEG4AYzyrovKcRDtFIQf
BEuboX8bmFdxFoZ8tNH5h6ahX18P3hqcV70J0PFWvYWZRKAiVDine7X2FWo9PZdG
BB8nT5En4Z9nZ1IhHfj/YPvb6wIqwv+FhL4kKr+yfIxKJEX4DDga+6gzFFg+y4yB
iMoxUNWFp2/JmiO804T8m0ze0bEV+pCO4jfqv45bRI3VgU7uqyHmvF8n6rmxrYJb
Ezw52UVWZ1+iNERZiCsKut7+bJl7EA==
=UVew
-----END PGP SIGNATURE-----

--XSfEtKTxf/2Gb5MS--


