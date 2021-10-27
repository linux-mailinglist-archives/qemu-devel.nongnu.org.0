Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABC043CEB0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:24:40 +0200 (CEST)
Received: from localhost ([::1]:58090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfljD-0005Iw-SC
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mflLT-0003F4-Kg
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:00:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mflLR-00070O-PK
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635350404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vtwewpg7S+7nsdwzQ6yJeP/9AxCwQ7d+sE55uwHYpOg=;
 b=PktoXS0czvn04uR3CynmoRdcFUAW5HrkeYUBdw3WasruqcSg624eB8QgLbDR5M91DGpq0K
 RV7qz5p+xA1HKJyCPzY2xFcl59Ipsu+/pGVYriZ++CFkr35eNiPVePilzxNh2ZTX6LHuBq
 YjROe7wBfnU4RMMWY5Y2yRq1tAsajJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-xgQ3SGAnObe1YhWyt2t6wg-1; Wed, 27 Oct 2021 12:00:01 -0400
X-MC-Unique: xgQ3SGAnObe1YhWyt2t6wg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14668101B4B6;
 Wed, 27 Oct 2021 16:00:00 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E526C1009AB7;
 Wed, 27 Oct 2021 15:59:52 +0000 (UTC)
Date: Wed, 27 Oct 2021 16:59:51 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v3 04/12] vfio-user: instantiate vfio-user context
Message-ID: <YXl3dzdzNZZZWLOS@stefanha-x1.localdomain>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <82b00867c07020fcf71749627414a80ef6b691cb.1633929457.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <82b00867c07020fcf71749627414a80ef6b691cb.1633929457.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6oJwfi3Jdb6Ima85"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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

--6oJwfi3Jdb6Ima85
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 01:31:09AM -0400, Jagannathan Raman wrote:
> @@ -94,9 +101,31 @@ static void vfu_object_set_device(Object *obj, const =
char *str, Error **errp)
>      trace_vfu_prop("device", str);
>  }
> =20
> +/*
> + * vfio-user-server depends on the availability of the 'socket' and 'dev=
ice'
> + * properties. It also depends on devices instantiated in QEMU. These
> + * dependencies are not available during the instance_init phase of this
> + * object's life-cycle. As such, the server is initialized after the
> + * machine is setup. machine_init_done_notifier notifies vfio-user-serve=
r
> + * when the machine is setup, and the dependencies are available.
> + */
> +static void vfu_object_machine_done(Notifier *notifier, void *data)
> +{
> +    VfuObject *o =3D container_of(notifier, VfuObject, machine_done);

Was there a check for non-NULL o->socket before this? Maybe it's not
needed because QAPI treats 'socket' as a required field and refuses to
create the SocketAddress if it's missing?

> +
> +    o->vfu_ctx =3D vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.pa=
th, 0,
> +                                o, VFU_DEV_TYPE_PCI);
> +    if (o->vfu_ctx =3D=3D NULL) {
> +        error_setg(&error_abort, "vfu: Failed to create context - %s",
> +                   strerror(errno));

The error reporting needs to be synchronous so that hotplugging with
object-add fails instead of succeeding and leaving a failed object.

In the startup case (not hotplug) it's okay to abort.

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
>          error_setg(&error_abort, "vfu: %s only compatible with %s machin=
e",
> @@ -111,7 +140,12 @@ static void vfu_object_init(Object *obj)
>          return;
>      }
> =20
> +    o->vfu_ctx =3D NULL;

The object's fields are initialized to 0 so this isn't necessary.

> +
>      k->nr_devs++;
> +
> +    o->machine_done.notify =3D vfu_object_machine_done;
> +    qemu_add_machine_init_done_notifier(&o->machine_done);

The notifier is invoked immediately if the machine has already been
initialized. That means vfu_object_machine_done() is called before the
properties ('socket' and 'device') have been set when object-add hotplug
is used. I think this needs to be moved elsewhere.
>  }
> =20
>  static void vfu_object_finalize(Object *obj)
> @@ -123,6 +157,10 @@ static void vfu_object_finalize(Object *obj)
> =20
>      g_free(o->socket);
> =20
> +    if (o->vfu_ctx) {
> +        vfu_destroy_ctx(o->vfu_ctx);
> +    }
> +
>      g_free(o->device);
> =20
>      if (k->nr_devs =3D=3D 0) {

Missing qemu_remove_machine_init_done_notifier().

--6oJwfi3Jdb6Ima85
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF5d3cACgkQnKSrs4Gr
c8ijqAgArp5vr7637Jk0EsGMnqJqZ0z3ux20MGeCNvz/2CHLPjzanKlglE3vQvIE
cdYIILdknzfRySmaTiBctgscu2zGQiXlaG0+6Grox6NeYlFzT+Ep2VkuXuTJ2BFP
G3eChwWwyXL4FJ5svsohIzbU0JMCuS0QC57PU76wxMWPRQgr+IeupBisWX9nJO11
Zby0a9eOD2rT/71yU731NXJ33yYb0zBxq1W2qsrx34DH5bE/SpoREnbieEgDR28v
+VonQwjIc4ZOVO6hZlLM02YLGXw9gvtMppcPfudziBZX+LpPc/sXFJn7rd2BbY4Z
/MuxoPFbJIkaphU0LOcG/a8DkF4YkA==
=CboM
-----END PGP SIGNATURE-----

--6oJwfi3Jdb6Ima85--


