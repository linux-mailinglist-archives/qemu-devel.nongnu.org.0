Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F983B8D50
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 07:08:54 +0200 (CEST)
Received: from localhost ([::1]:46426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyowX-0004zN-KN
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 01:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lyojl-0003JM-Fu
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:55:41 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:54639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lyojj-0001QM-Nt
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:55:41 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GFm9m0SYTz9svs; Thu,  1 Jul 2021 14:55:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625115324;
 bh=QGBBycKpREvYh3AS4tCwYI4jdV1j5WDVeVtGyfXV5dA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pJTaB+HUvZvR/8LHVGsOVEnhg+YKFfrYH88+esG7ROzxzQ2R2bNQdOuvyaOTXZ7rE
 HBiGHKMzvA1PuyYBez3fqIGmhPKLsuVAftNVFHmX6RY+g9TGlc44gI3dEqhYTRSUb+
 xpdUQxjOGNKMJT/Fd63NBA4pBnd5kYxxITCelZOI=
Date: Thu, 1 Jul 2021 14:55:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH] hw/pci/pcie_port: Rename "enable-native-hotplug" property
Message-ID: <YN1KqroBnponHAJ9@yekko>
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210623144747.285302-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PyLwoAoac4/hgixL"
Content-Disposition: inline
In-Reply-To: <20210623144747.285302-1-jusual@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PyLwoAoac4/hgixL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 23, 2021 at 04:47:47PM +0200, Julia Suvorova wrote:
> PCIE_SLOT property renamed to "native-hotplug" to be more concise
> and consistent with other properties.
>=20
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/i386/pc_q35.c   | 4 ++--
>  hw/pci/pcie_port.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index a0ec7964cc..04b4a4788d 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -243,8 +243,8 @@ static void pc_q35_init(MachineState *machine)
>                                            NULL);
> =20
>      if (acpi_pcihp) {
> -        object_register_sugar_prop(TYPE_PCIE_SLOT, "enable-native-hotplu=
g",
> -                                  "false", true);
> +        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hotplug",
> +                                   "false", true);
>      }
> =20
>      /* irq lines */
> diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
> index a410111825..da850e8dde 100644
> --- a/hw/pci/pcie_port.c
> +++ b/hw/pci/pcie_port.c
> @@ -148,7 +148,7 @@ static Property pcie_slot_props[] =3D {
>      DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
>      DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
>      DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
> -    DEFINE_PROP_BOOL("enable-native-hotplug", PCIESlot, native_hotplug, =
true),
> +    DEFINE_PROP_BOOL("native-hotplug", PCIESlot, native_hotplug, true),
>      DEFINE_PROP_END_OF_LIST()
>  };
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PyLwoAoac4/hgixL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDdSqoACgkQbDjKyiDZ
s5LTBw//ePxWnUyDVGgmq9flZPxeh+MiUMqlAjkFHH+y1Jmc4+st1YJVyDvjFoxw
lzXrJfkeZ6nAOo1QMoplsqvIK/vgNsPl0JpP7wEk4V+S/YBhdmK4FnV3AJAuhlOS
+U5yvL8CIMuAo4RFbbLHl6BCcioAORAY4hvYuewQ3xoBLI8TV9ALZ0Re8OnDCrwG
EjpiB5H5mMoJpMwwbiAeOlEDYbQrK95s4K2NyYnh2no55vn7HzcI7jgLILWn8Bwi
shp0ZgcdFP9zJnMeIE49SMtI0POjuphLB+0QULgBCmqU8AnxiAFAe/Y3flJmLe+V
8GEBACLHBMs88+NUpm85DtpTACygPfDz6pV7nYP+knd3cUwMObcwenxWxgMh4Xah
NM1+4wElNnYx1ifo1pJhNoDAd2cNBA0E5x1jLs8gKSOxFupKkTVZLy1X9EKM8yCN
E8tQnAMNP+SAlCBtKpbvHv75gRr+16h1ymHWbvvv9+PlNGwAXC3qGoRegEi+m0bS
hyITAmRgv9w4y+so+ks9BHN/Z7gQ27zOVE3Wwt3eblM6I3Z/vbW+XCDd658Dx1Ob
UkxX4NjhTN2E9ilNiZeWQCBpALe4E/BI1yEIgk/dKxIPeWDsQ1CTW3imT9jly2ij
zTjeyBuZtOPUSGfKkrA/A6+yyjTKhrX2HrWEuYhEVLjwjsdEyQw=
=zy1C
-----END PGP SIGNATURE-----

--PyLwoAoac4/hgixL--

