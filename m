Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555A143CF8F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:17:51 +0200 (CEST)
Received: from localhost ([::1]:36980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfmYg-00046n-Dg
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mflQy-0001e9-Hm
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:05:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mflQw-00088a-5e
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635350744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y5Z7YnLXMgRPdsq6eDIBnUgkMOS40jPOn+WDBxcqYzw=;
 b=clpwG4MagpOtXoae9rjkxpTK3AcqxZHa+rOA3UHy6190pJtK/inpYTETaxlD9KpT9Iz/JY
 d77hZ6PadlUZYhfdONm/bGIqaLqlrm+LzdIapQ0rcN/9GZS89uN4VEr6iBcTCbViOcHqOy
 TDVpRHu8JO3iCSyHkJQvP6HaJ4fzAaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-FELZTkg2NdORUcTVhsVn4w-1; Wed, 27 Oct 2021 12:05:43 -0400
X-MC-Unique: FELZTkg2NdORUcTVhsVn4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E74680A5C1;
 Wed, 27 Oct 2021 16:05:41 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 533021980E;
 Wed, 27 Oct 2021 16:05:23 +0000 (UTC)
Date: Wed, 27 Oct 2021 17:05:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v3 05/12] vfio-user: find and init PCI device
Message-ID: <YXl4wsLA1/+pCfTb@stefanha-x1.localdomain>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <697ee91edc2af1aae07a01d49a27156d0e87c00c.1633929457.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <697ee91edc2af1aae07a01d49a27156d0e87c00c.1633929457.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R8AkGei4dghkh7+C"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, philmd@redhat.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--R8AkGei4dghkh7+C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 01:31:10AM -0400, Jagannathan Raman wrote:
> Find the PCI device with specified id. Initialize the device context
> with the QEMU PCI device
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/vfio-user-obj.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index d26e5ec9e9..7ce4e5b256 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -44,6 +44,8 @@
>  #include "qemu/notify.h"
>  #include "sysemu/sysemu.h"
>  #include "libvfio-user.h"
> +#include "hw/qdev-core.h"
> +#include "hw/pci/pci.h"
> =20
>  #define TYPE_VFU_OBJECT "vfio-user-server"
>  OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
> @@ -68,6 +70,8 @@ struct VfuObject {
>      Notifier machine_done;
> =20
>      vfu_ctx_t *vfu_ctx;
> +
> +    PCIDevice *pci_dev;
>  };
> =20
>  static void vfu_object_set_socket(Object *obj, Visitor *v, const char *n=
ame,
> @@ -112,6 +116,9 @@ static void vfu_object_set_device(Object *obj, const =
char *str, Error **errp)
>  static void vfu_object_machine_done(Notifier *notifier, void *data)
>  {
>      VfuObject *o =3D container_of(notifier, VfuObject, machine_done);
> +    DeviceState *dev =3D NULL;
> +    vfu_pci_type_t pci_type =3D VFU_PCI_TYPE_CONVENTIONAL;
> +    int ret;
> =20
>      o->vfu_ctx =3D vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.pa=
th, 0,
>                                  o, VFU_DEV_TYPE_PCI);
> @@ -120,6 +127,31 @@ static void vfu_object_machine_done(Notifier *notifi=
er, void *data)
>                     strerror(errno));
>          return;
>      }
> +
> +    dev =3D qdev_find_recursive(sysbus_get_default(), o->device);
> +    if (dev =3D=3D NULL) {
> +        error_setg(&error_abort, "vfu: Device %s not found", o->device);
> +        return;
> +    }
> +
> +    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        error_setg(&error_abort, "vfu: %s not a PCI device", o->device);
> +        return;
> +    }
> +
> +    o->pci_dev =3D PCI_DEVICE(dev);
> +
> +    if (pci_is_express(o->pci_dev)) {
> +        pci_type =3D VFU_PCI_TYPE_EXPRESS;
> +    }
> +
> +    ret =3D vfu_pci_init(o->vfu_ctx, pci_type, PCI_HEADER_TYPE_NORMAL, 0=
);
> +    if (ret < 0) {
> +        error_setg(&error_abort,
> +                   "vfu: Failed to attach PCI device %s to context - %s"=
,
> +                   o->device, strerror(errno));
> +        return;
> +    }

It's unclear what happens when one of these error code paths is taken.
o->vfu_ctx and o->pci_dev might both be initialized, so how does the
code know not to service the vfio-user connection? It would be easy to
tell that this is correct if o->pci_dev and o->vfu_ctx were destroyed
when an error occurs.

--R8AkGei4dghkh7+C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF5eMIACgkQnKSrs4Gr
c8gAbgf6Avxyx0WVu023pGi6Jb/Z8t1XEq13mmSYfOn8CuE9Iy0l4p4Yo/A6+iGN
ko948Tl4jTLdSk04ngYmZay+wxcOytavQMeHVXu8zm0PcJTM/O/sMT+7ZwwEL7by
nzNMkX3zwfGczwMREDmZrzdMF/nFFOS4CIJ3RA3ZUnE/1nb4/vd5a5juwum91zlO
rO/4AGi8vbzVXl3dzZiw23Ohc5w9IFzpvOunaKXRhwo8JVxZjj/z0Itwpx6IKowf
PyNy9fEDwWzBKqILRxUhBSoWkrLnmMUmPpNgUdtkyMk+DmnJ4E1tGQHj03b7blKA
RWQA68W/wtTV0nIRPT7es0otFHcCSQ==
=gNPj
-----END PGP SIGNATURE-----

--R8AkGei4dghkh7+C--


