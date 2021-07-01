Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F4B3B8D3D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:59:04 +0200 (CEST)
Received: from localhost ([::1]:35150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyon1-0005TW-Hg
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lyoji-0003I6-7d
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:55:38 -0400
Received: from ozlabs.org ([203.11.71.1]:43767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lyoje-0001DT-3R
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:55:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GFm9l5ffSz9sX5; Thu,  1 Jul 2021 14:55:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625115323;
 bh=RXrGdhNl1HdFBS6k7ZcjyyVyzoCPrpr9JGlp0v7cJ8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iKQWWd1K0hFPff0P8a4eTsj3i188Rnh1cd2dfNwgZ9/t4mUHTkefbVadYPxfGtlo3
 Wha3DcVQ+KYrtlB9zbThwfmNF5Nk9ejXIP9q1BgKPwy6PB7A6JfZnqZOE1+WaktLBz
 A9+BPWUkzTXtqTV7QLSPIxRTOQBmxgQ6nSy43cvw=
Date: Thu, 1 Jul 2021 14:36:30 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v5 2/7] hw/i386/acpi-build: Add ACPI PCI hot-plug methods
 to Q35
Message-ID: <YN1GTsJmU5oQdFOJ@yekko>
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-3-jusual@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="A29u94Ct9oH4YIBj"
Content-Disposition: inline
In-Reply-To: <20210617190739.3673064-3-jusual@redhat.com>
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--A29u94Ct9oH4YIBj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 09:07:34PM +0200, Julia Suvorova wrote:
> Implement notifications and gpe to support q35 ACPI PCI hot-plug.
> Use 0xcc4 - 0xcd7 range for 'acpi-pci-hotplug' io ports.
>=20
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

I don't know ACPI or x86 particular well, so I could well have missed
something, but..

[snip]
> @@ -392,6 +392,9 @@ static void build_append_pci_bus_devices(Aml *parent_=
scope, PCIBus *bus,
> =20
>          if (!pdev) {
>              if (bsel) { /* add hotplug slots for non present devices */
> +                if (pci_bus_is_express(bus) && slot > 0) {
> +                    break;
> +                }
>                  dev =3D aml_device("S%.02X", PCI_DEVFN(slot, 0));
>                  aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
>                  aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16=
)));
> @@ -516,7 +519,7 @@ static void build_append_pci_bus_devices(Aml *parent_=
scope, PCIBus *bus,
>              QLIST_FOREACH(sec, &bus->child, sibling) {
>                  int32_t devfn =3D sec->parent_dev->devfn;
> =20
> -                if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
> +                if (pci_bus_is_root(sec)) {
>                      continue;
>                  }

=2E. what will this logic do if we encounter a PCIe-switch.  AIUI, it
should be possible to hotplug 1 slot under each downstream port, but
we can't hotplug anything directly under the upstream port.  AFAICT
both the upstream and downstream ports will show up as 'is_bridge'
though.

So, IIUC we want to traverse a PCIe upstream switch port, but not
generate hotplug slots until we encounter the downstream ports below
it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--A29u94Ct9oH4YIBj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDdRksACgkQbDjKyiDZ
s5KmmA/+NS/iyen16hHGP4j5XsjGgZf8UHZjwvCkHdw/PC6m6NI3G/phSBhi2dBk
UgjeN7OahNqftDlSSMMVxyL56j5HWBqNb5cK45/tnqkmAcbwo6ANrDqcBek1xX4J
yR2ABr830SdUxQQYyxO1STfB0AqP8Ef8EZdMlgcPmcyMBZM7j2JyPximN/b1/B7K
Q4hnLAOEtZjaWMR/kRZrwVmNcY8JNOKCG9PkC4DRQfaavN4WeaoQ2ltKS2QRiQwQ
ni6DKh/K/peCTipwBsIMrTNO2dVe3DwSt9IG2fqTcI0NQbEZZB+SyvqVnTTP/sCn
zrnPzISB4f0MlnBC2IhNn/SmCnKap3twmkRRsqYme2KYoeObLkLl7QQ6wAqoOMFk
Ht3u9SmSvhTN6iDQ8wqxZpgyyPlRUBJEGLujyM1PJiCmZ7gQ43JnqfWLENueEoL5
7D4l6Ihoqbf5s06G6Bf1gNBseQ72GLxpLLbgogiP2x26++CsPdwK2g1GxCKQpvsG
7Hu8AqRC20brpvS+6WJY4xX5Lce/u45BnPht0k62CwSGOKa/ZuEPYzJCZkUeP2qX
EWTT+gtQ3ADlJsdz+cUpxc6jVFN8d9Eiyk+cXcCCDxTFVGsQq8vKdJFI5GEZBqVu
y1lKsQWPHzxfoD0ykDPtVJj7SZSz1MekCBCTwsdSqwl2Yx972hI=
=7V92
-----END PGP SIGNATURE-----

--A29u94Ct9oH4YIBj--

