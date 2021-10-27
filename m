Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7494643CEAC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:24:20 +0200 (CEST)
Received: from localhost ([::1]:57654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflit-00051m-8b
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfl2g-0005fW-0f
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfl2S-0006td-Gg
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635349226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DqvYcta8ONagule8Opef3FJBnMzKeQN2kAPpfkjaXHY=;
 b=eBM8zJJ8AyfS4SmIAXZ8l8f8GpPyORE01piNb60AzGUUSiZRC7lzuDyh6wyW36npgHDUbn
 oc5cawFM8ULSZ1u8jcKozW64p/BdVkFTWLWOxGtDjVk9kQmy7jNxvqs0IQniatsssx8A/e
 3czqMMcA8pLIA4BDyXu6OqIVzHtUWu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450--yVMRHVFN0yDnkPMyJXFjw-1; Wed, 27 Oct 2021 11:40:23 -0400
X-MC-Unique: -yVMRHVFN0yDnkPMyJXFjw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08F1E1B18BC0;
 Wed, 27 Oct 2021 15:40:22 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A6961042AA9;
 Wed, 27 Oct 2021 15:40:11 +0000 (UTC)
Date: Wed, 27 Oct 2021 16:40:10 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v3 03/12] vfio-user: define vfio-user-server object
Message-ID: <YXly2vSh/bhgr0i/@stefanha-x1.localdomain>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <13dba991f1de91711e5c3cad9a332d6e7c5eee7b.1633929457.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <13dba991f1de91711e5c3cad9a332d6e7c5eee7b.1633929457.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MdsxplAPz8LsARlO"
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

--MdsxplAPz8LsARlO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 01:31:08AM -0400, Jagannathan Raman wrote:
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 0222bb4506..97de79cc36 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -705,6 +705,20 @@
>  { 'struct': 'RemoteObjectProperties',
>    'data': { 'fd': 'str', 'devid': 'str' } }
> =20
> +##
> +# @VfioUserServerProperties:
> +#
> +# Properties for vfio-user-server objects.
> +#
> +# @socket: socket to be used by the libvfiouser library
> +#
> +# @device: the id of the device to be emulated at the server
> +#
> +# Since: 6.0

6.2

> +##
> +{ 'struct': 'VfioUserServerProperties',
> +  'data': { 'socket': 'SocketAddress', 'device': 'str' } }
> +
>  ##
>  # @RngProperties:
>  #
> @@ -830,7 +844,8 @@
>      'tls-creds-psk',
>      'tls-creds-x509',
>      'tls-cipher-suites',
> -    'x-remote-object'
> +    'x-remote-object',
> +    'vfio-user-server'

Should it have the experimental prefix ('x-') or is the QAPI interface
stable? I think some things to think about are whether a single process
can host multiple device servers, whether hotplug is possible, etc. If
the interface is stable then it must be able to accomodate future
features (at least ones we can anticipate right now :)).

>    ] }
> =20
>  ##
> @@ -887,7 +902,8 @@
>        'tls-creds-psk':              'TlsCredsPskProperties',
>        'tls-creds-x509':             'TlsCredsX509Properties',
>        'tls-cipher-suites':          'TlsCredsProperties',
> -      'x-remote-object':            'RemoteObjectProperties'
> +      'x-remote-object':            'RemoteObjectProperties',
> +      'vfio-user-server':           'VfioUserServerProperties'
>    } }
> =20
>  ##
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> new file mode 100644
> index 0000000000..c2a300f0ff
> --- /dev/null
> +++ b/hw/remote/vfio-user-obj.c
> @@ -0,0 +1,173 @@
> +/**
> + * QEMU vfio-user-server server object
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
> + *     -object vfio-user-server,id=3D<id>,type=3Dunix,path=3D<socket-pat=
h>,

I expected socket.type=3D and socket.path=3D based on the QAPI schema. Is
this command-line example correct?

> + *             device=3D<pci-dev-id>
> + *
> + * Note that vfio-user-server object must be used with x-remote machine =
only.
> + * This server could only support PCI devices for now.
> + *
> + * type - SocketAddress type - presently "unix" alone is supported. Requ=
ired
> + *        option
> + *
> + * path - named unix socket, it will be created by the server. It is
> + *        a required option
> + *
> + * device - id of a device on the server, a required option. PCI devices
> + *          alone are supported presently.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +
> +#include "qom/object.h"
> +#include "qom/object_interfaces.h"
> +#include "qemu/error-report.h"
> +#include "trace.h"
> +#include "sysemu/runstate.h"
> +#include "hw/boards.h"
> +#include "hw/remote/machine.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-visit-sockets.h"
> +
> +#define TYPE_VFU_OBJECT "vfio-user-server"
> +OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
> +
> +struct VfuObjectClass {
> +    ObjectClass parent_class;
> +
> +    unsigned int nr_devs;
> +
> +    /* Maximum number of devices the server could support */
> +    unsigned int max_devs;
> +};
> +
> +struct VfuObject {
> +    /* private */
> +    Object parent;
> +
> +    SocketAddress *socket;
> +
> +    char *device;
> +};
> +
> +static void vfu_object_set_socket(Object *obj, Visitor *v, const char *n=
ame,
> +                                  void *opaque, Error **errp)
> +{
> +    VfuObject *o =3D VFU_OBJECT(obj);
> +
> +    g_free(o->socket);

qapi_free_SocketAddress(o->socket)?

> +
> +    o->socket =3D NULL;
> +
> +    visit_type_SocketAddress(v, name, &o->socket, errp);
> +
> +    if (o->socket->type !=3D SOCKET_ADDRESS_TYPE_UNIX) {
> +        error_setg(&error_abort, "vfu: Unsupported socket type - %s",
> +                   o->socket->u.q_unix.path);

o->socket must be freed and set it to NULL again, otherwise setting the
property appears to fail but the SocketAddress actually retains the
invalid value.

> +        return;
> +    }
> +
> +    trace_vfu_prop("socket", o->socket->u.q_unix.path);
> +}
> +
> +static void vfu_object_set_device(Object *obj, const char *str, Error **=
errp)
> +{
> +    VfuObject *o =3D VFU_OBJECT(obj);
> +
> +    g_free(o->device);
> +
> +    o->device =3D g_strdup(str);
> +
> +    trace_vfu_prop("device", str);
> +}
> +
> +static void vfu_object_init(Object *obj)
> +{
> +    VfuObjectClass *k =3D VFU_OBJECT_GET_CLASS(obj);
> +
> +    if (!object_dynamic_cast(OBJECT(current_machine), TYPE_REMOTE_MACHIN=
E)) {
> +        error_setg(&error_abort, "vfu: %s only compatible with %s machin=
e",
> +                   TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
> +        return;
> +    }
> +
> +    if (k->nr_devs >=3D k->max_devs) {
> +        error_setg(&error_abort,
> +                   "Reached maximum number of vfio-user-server devices: =
%u",
> +                   k->max_devs);
> +        return;
> +    }
> +
> +    k->nr_devs++;
> +}
> +
> +static void vfu_object_finalize(Object *obj)
> +{
> +    VfuObjectClass *k =3D VFU_OBJECT_GET_CLASS(obj);
> +    VfuObject *o =3D VFU_OBJECT(obj);
> +
> +    k->nr_devs--;
> +
> +    g_free(o->socket);

qapi_free_SocketAddress(o->socket)?

> +
> +    g_free(o->device);
> +
> +    if (k->nr_devs =3D=3D 0) {
> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +    }

This won't work for all use cases. The user may wish to create/delete
vhost-user servers at runtime without terminating the process when there
are none left. An boolean option can be added in the future to control
this behavior, so it's okay to leave this as is.

--MdsxplAPz8LsARlO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF5ctkACgkQnKSrs4Gr
c8i2GAf8D5nkOchDq4yUwh2Idk+oOpWgS/djQwZj92Rhtmex7bUPmKRndQl9WPDG
PPCJuRe9Bd0UeIOF6uWSpJGLejcjLtCMW+XUUo3Yx1XgjKv6OwpoCWwja64zdsYb
4It3tQlQXJ53AlgC9boiyqpM5FZzXGzqOOZp4mKd02VtBquqQjynUHMYr2IoPP65
FAoq0Nn77ebRdPsftUX+YsBCQpGclNJwFzUVOY8mixXpGdsOWgnX94gsAB0t84OG
o6efOJIOLZuOU+SIwhwgYoW8br8ZlRnxdQJo36zDh1KUMmT6iWA1eXlu9lGh4CAz
fZ8qjBvWO7004UMTch6n4kA/+fzdlg==
=VNMb
-----END PGP SIGNATURE-----

--MdsxplAPz8LsARlO--


