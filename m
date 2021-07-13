Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369673C691F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 06:16:50 +0200 (CEST)
Received: from localhost ([::1]:45558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m39qj-0002s4-3G
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 00:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m39mF-00084P-TV
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:12:11 -0400
Received: from ozlabs.org ([203.11.71.1]:48341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m39mC-00053y-UW
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:12:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GP6f74hJwz9sWl; Tue, 13 Jul 2021 14:11:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626149519;
 bh=HnVqV+OYtVIoPETjajxkaWT2CCHlHi88WUfMbmFjdR0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=maMhsCIK+wcYMHLsrD0MbunIS+vuFYa//cWDVef1+/SjECzHHw1sXoBe9w0SmfIuR
 PiDLELSFSK8MOXW4yUiOAFhrLULjfq+lrEjHk08uQeDNE5zIUPUpE5QbxM/ppVOc2h
 bxn/usmun10aSi6vp/kVtUdC7leN+i9bIdoNuu2o=
Date: Tue, 13 Jul 2021 14:09:59 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v6 2/6] hw/acpi/ich9: Enable ACPI PCI hot-plug
Message-ID: <YO0SF+gPFYc6OYn6@yekko>
References: <20210713004205.775386-1-jusual@redhat.com>
 <20210713004205.775386-3-jusual@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6KSy56HsYQ0s+wnj"
Content-Disposition: inline
In-Reply-To: <20210713004205.775386-3-jusual@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, David Gibson <dgibson@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6KSy56HsYQ0s+wnj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 13, 2021 at 02:42:01AM +0200, Julia Suvorova wrote:
> Add acpi_pcihp to ich9_pm as part of
> 'acpi-pci-hotplug-with-bridge-support' option. Set default to false.
>=20
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Since it looks safe, however I think there are a couple of unnecessary
changes here:


[snip]
> @@ -103,6 +105,7 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
>  static void acpi_set_pci_info(void)
>  {
>      static bool bsel_is_set;
> +    Object *host =3D acpi_get_i386_pci_host();
>      PCIBus *bus;
>      unsigned bsel_alloc =3D ACPI_PCIHP_BSEL_DEFAULT;
> =20
> @@ -111,7 +114,11 @@ static void acpi_set_pci_info(void)
>      }
>      bsel_is_set =3D true;
> =20
> -    bus =3D find_i440fx(); /* TODO: Q35 support */
> +    if (!host) {

AFAICT acpi_get_i386_pci_host() still can't return NULL, so I'm not
sure this test is necessary.

[snip]
> -static Object *acpi_get_i386_pci_host(void)
> +Object *acpi_get_i386_pci_host(void)
>  {
>      PCIHostState *host;
> =20
> @@ -320,7 +320,10 @@ static void acpi_get_pci_holes(Range *hole, Range *h=
ole64)
>      Object *pci_host;
> =20
>      pci_host =3D acpi_get_i386_pci_host();
> -    g_assert(pci_host);
> +
> +    if (!pci_host) {
> +        return;
> +    }

Likewise this change.

> =20
>      range_set_bounds1(hole,
>                        object_property_get_uint(pci_host,
> @@ -1765,6 +1768,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          PCIBus *bus =3D NULL;
> =20
>          pci_host =3D acpi_get_i386_pci_host();
> +
>          if (pci_host) {
>              bus =3D PCI_HOST_BRIDGE(pci_host)->bus;
>          }
> @@ -2321,7 +2325,9 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
>      QObject *o;
> =20
>      pci_host =3D acpi_get_i386_pci_host();
> -    g_assert(pci_host);
> +    if (!pci_host) {
> +        return false;
> +    }

And this one.

> =20
>      o =3D object_property_get_qobject(pci_host, PCIE_HOST_MCFG_BASE, NUL=
L);
>      if (!o) {
> @@ -2351,7 +2357,7 @@ void acpi_build(AcpiBuildTables *tables, MachineSta=
te *machine)
>      AcpiPmInfo pm;
>      AcpiMiscInfo misc;
>      AcpiMcfgInfo mcfg;
> -    Range pci_hole, pci_hole64;
> +    Range pci_hole =3D {}, pci_hole64 =3D {};
>      uint8_t *u;
>      size_t aml_len =3D 0;
>      GArray *tables_blob =3D tables->table_data;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6KSy56HsYQ0s+wnj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDtEhcACgkQbDjKyiDZ
s5KINhAAyCxrj1Tw3fe/wdgkK7KiJx5nkBloFXrOWWSRQQ6pxAbh9rqe1AxlNkd6
59VMVKBUCQ83/ccx8cENRc5jv+YItLnaN32eIwlZUf6zixDjnCmS+KHqZQJ4qVEI
1JMlrFPG2ie7xFCwxO3hzrOgZjrRH+kmX2nwWGXoJny5BZHKFv2nGGdd1nXz4+oY
U/fD5MrHAMye+s3EYdyyVuqfNGzISyYhN5qpTTXbHhy5LTQddl2sPBFJjyRmOaMl
LCmD+RdmDTaKnwd48U4AcE0mPByMs6MVkyRCpjP5qmljz5cQ2Aq5g2AOWMtaCheL
hm2Lj6eRFlgwXLx7c1kSAy+dtR7O++n24RI0JniXUpRBydnQxNO3Zdvip/Rv/MAM
JvGmWsCFlIpI56DG7AJ5xhr5eeWj3n7bF9L0h+L3lDbkHo+jWbXkEnn9b0WBKvWf
DxtWo043vjOQ/vSL1aO061JzhFAJ9OYMjgKT16K//+2G10sCzRgFBBcaALvqgz/3
/R5Bp2bviGcWNoBjjcTmFnDh3ZM8RuGOdQ7aukiAJqtevQn40UFMZwUYAJZsXFYx
SZLXmuy3qM7HcvEqb4Pmemh+TDMmvdYjwBjvIXo996CMedf5GpaSE+ohx+bGoEfd
TjJh7rDeQqiDYl5Tx2LMxtFoC5/kMNZ++a6974ukBCQuFUyN+C0=
=ZBx5
-----END PGP SIGNATURE-----

--6KSy56HsYQ0s+wnj--

