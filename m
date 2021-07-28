Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E463D8B97
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 12:18:25 +0200 (CEST)
Received: from localhost ([::1]:59062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8gds-0007gy-6S
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 06:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m8gcD-00070u-2B
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 06:16:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m8gc5-0006M4-J7
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 06:16:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627467391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y38uwUYQQgeBPObogEwsP2ZGPFXYOz2TrUXuZs7HECs=;
 b=J5c19nuba9P+s2YhCzNiEe7hjJbuYohsL4Qi7U04JKZfX2sngg1WhK3jToF5p0Be7HlYys
 lA2UJ7CGUf/B521SvpSRQ+bUf0PZffbMkRFCt+RQuqkZ0Hz0OrvzSXljswYH3bVeW6BJGN
 D3yJQiKYnNdTAzeeXjF5wurF8mmexXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-sIZ1SLbwPk24bTYgoLDATw-1; Wed, 28 Jul 2021 06:16:29 -0400
X-MC-Unique: sIZ1SLbwPk24bTYgoLDATw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 370158799E0;
 Wed, 28 Jul 2021 10:16:28 +0000 (UTC)
Received: from localhost (ovpn-113-160.ams2.redhat.com [10.36.113.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A531210495AD;
 Wed, 28 Jul 2021 10:16:23 +0000 (UTC)
Date: Wed, 28 Jul 2021 11:16:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC 04/19] vfio-user: Define type vfio_user_pci_dev_info
Message-ID: <YQEudt/G5zilt702@stefanha-x1.localdomain>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <c65908895de707a0532aa9dd09932bff329ea416.1626675354.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <c65908895de707a0532aa9dd09932bff329ea416.1626675354.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Wq1xWt42omF7eFYG"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: john.g.johnson@oracle.com, jag.raman@oracle.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, qemu-devel@nongnu.org, alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Wq1xWt42omF7eFYG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 18, 2021 at 11:27:43PM -0700, Elena Ufimtseva wrote:
> From: John G Johnson <john.g.johnson@oracle.com>
>=20
> New class for vfio-user with its class and instance
> constructors and destructors.
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/vfio/pci.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>=20
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index bea95efc33..554b562769 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -42,6 +42,7 @@
>  #include "qapi/error.h"
>  #include "migration/blocker.h"
>  #include "migration/qemu-file.h"
> +#include "hw/vfio/user.h"
> =20
>  #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
> =20
> @@ -3326,3 +3327,51 @@ static void register_vfio_pci_dev_type(void)
>  }
> =20
>  type_init(register_vfio_pci_dev_type)
> +
> +static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
> +{
> +    ERRP_GUARD();
> +    VFIOUserPCIDevice *udev =3D VFIO_USER_PCI(pdev);
> +
> +    if (!udev->sock_name) {
> +        error_setg(errp, "No socket specified");
> +        error_append_hint(errp, "Use -device vfio-user-pci,socket=3D<nam=
e>\n");
> +        return;
> +    }
> +}
> +
> +static void vfio_user_instance_finalize(Object *obj)
> +{
> +}
> +
> +static Property vfio_user_pci_dev_properties[] =3D {
> +    DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),

Please use SocketAddress so that alternative socket connection details
can be supported without inventing custom syntax for vfio-user-pci. For
example, file descriptor passing should be possible.

I think this requires a bit of command-line parsing work, so don't worry
about it for now, but please add a TODO comment. When the -device
vfio-user-pci syntax is finalized (i.e. when the code is merged and the
device name doesn't start with the experimental x- prefix), then it
needs to be solved.

> +    DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure, false),

I'm not sure what "secure-dma" means and the "secure" variable name is
even more inscrutable. Does this mean don't share memory so that each
DMA access is checked individually?

> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void vfio_user_pci_dev_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    PCIDeviceClass *pdc =3D PCI_DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, vfio_user_pci_dev_properties);
> +    dc->desc =3D "VFIO over socket PCI device assignment";
> +    pdc->realize =3D vfio_user_pci_realize;
> +}
> +
> +static const TypeInfo vfio_user_pci_dev_info =3D {
> +    .name =3D TYPE_VFIO_USER_PCI,
> +    .parent =3D TYPE_VFIO_PCI_BASE,
> +    .instance_size =3D sizeof(VFIOUserPCIDevice),
> +    .class_init =3D vfio_user_pci_dev_class_init,
> +    .instance_init =3D vfio_instance_init,
> +    .instance_finalize =3D vfio_user_instance_finalize,
> +};
> +
> +static void register_vfio_user_dev_type(void)
> +{
> +    type_register_static(&vfio_user_pci_dev_info);
> +}
> +
> +type_init(register_vfio_user_dev_type)
> --=20
> 2.25.1
>=20

--Wq1xWt42omF7eFYG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEBLnYACgkQnKSrs4Gr
c8jwLwf/fKDthnsEz3ut3g0e79tiwRR0YlDbkDN/4w6TCdBZL7vuWBgKMbaW3nhY
Tq0OZ2wftYqWzX8tkXmsPWfMJ0WAUie1llqeyskyDU+cSmGjReVgjy66i3zwcRpR
AeDQv7LahoTH25KGOGEiTGOsoA0fh8yUie3cT/qbvEqzzEoU746bL6z44L4e/pJI
hzDgK+oEJa/vtp8l3iAFpKH7fvfAuKipy5Df2WOukoeqj/gRsOb/3jg7jlHT7Dlj
IXWJ/wonO/EZjh8jGl3bU44RZjW9Y0EPRrgqIsUcR5SZBQkEfailvyTBGkWipbCy
vWJ/5KU0+KkIpl19UxhHC7Yh6/E7Yg==
=c0yJ
-----END PGP SIGNATURE-----

--Wq1xWt42omF7eFYG--


