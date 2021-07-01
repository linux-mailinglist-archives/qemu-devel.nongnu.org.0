Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59EF3B8D46
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 07:02:54 +0200 (CEST)
Received: from localhost ([::1]:42044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyoqj-0001pD-Qk
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 01:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lyoji-0003I7-Dp
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:55:38 -0400
Received: from ozlabs.org ([203.11.71.1]:54911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lyoje-0001DV-AX
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:55:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GFm9l5DyFz9sXL; Thu,  1 Jul 2021 14:55:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625115323;
 bh=/ZGbKOKENLqK9RVzpY0gG2+WuCDSpQlpKsMi//KeyzQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K3nR1+UeFVukAp0t0o//azg9xjI0B0eGJyU4FfZvFaIn6wFJEFK0AZMZnvDh4jYS7
 Yx6E29Pkivr3LoU5h9yVSDOAISttzc0qoBzp0yel/KiXsohtstIjXa0VBXTxNCHfFH
 XeoxwmNUneF+y5UOTgA6mLVmpAbU6pkem7Qcbyu0=
Date: Thu, 1 Jul 2021 14:17:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v5 1/7] hw/acpi/pcihp: Enhance
 acpi_pcihp_disable_root_bus() to support Q35
Message-ID: <YN1B9PJTSfXukxng@yekko>
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-2-jusual@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="98rvXSDl6XtOxNQD"
Content-Disposition: inline
In-Reply-To: <20210617190739.3673064-2-jusual@redhat.com>
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


--98rvXSDl6XtOxNQD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 09:07:33PM +0200, Julia Suvorova wrote:
> PCI Express does not allow hot-plug on pcie.0. Check for Q35 in
> acpi_pcihp_disable_root_bus() to be able to forbid hot-plug using the
> 'acpi-root-pci-hotplug' flag.
>=20
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/acpi/pcihp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 4999277d57..09f531e941 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -122,13 +122,14 @@ static void acpi_set_pci_info(void)
>  static void acpi_pcihp_disable_root_bus(void)
>  {
>      static bool root_hp_disabled;
> +    Object *host =3D acpi_get_i386_pci_host();
>      PCIBus *bus;
> =20
>      if (root_hp_disabled) {
>          return;
>      }
> =20
> -    bus =3D find_i440fx();
> +    bus =3D PCI_HOST_BRIDGE(host)->bus;
>      if (bus) {
>          /* setting the hotplug handler to NULL makes the bus non-hotplug=
gable */
>          qbus_set_hotplug_handler(BUS(bus), NULL);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--98rvXSDl6XtOxNQD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDdQfIACgkQbDjKyiDZ
s5IsxBAAqWG6QHrfFp+4gETHLsU2fnFQcm/vnWDA+aSPjki2BkNJfkuS9EFzcf3L
oJHUI9gfVMT1QZQvasqHkDxeJaJC/ZyojmxNhM+Vwr7RwQ6SO5DNVVtQrDqFQPO5
yIDfavjVCMjkHItn6ymOLpsMAFbx1MkMikRsVKd3IjfnXB+rl1qddKrtYW/t4QFA
zmciTThqaR3saIYKcGqZGFVvfienfaddt9dDPHXsD0CP2gW7wCC3i4aMVDxSB8Xu
x8KrhbrpndK7OyaA9m1hY4pk9167Pnb65awdWJnr/5EaBlvOyVVO+rjIcwqQspOl
3+h43ifDJwhDkE6OVZOgahlZOm2CD0tT/QQdcp5kszcBgHmpxxEmQa93pSr9X0l0
vbqm49JvhT3DN228abayvdDiReC0VCyGV7B0hmwNF/9uAF087NAwBuq33OKIwSz0
raPZNbMw6YvwxNJbk2JV8eM0ks6uA+jfCs0kF4wY7tXo+jdl6CtP4OV0y0IAOvXt
rWfvrdBsj+a6sFGTbJYs/Vlm/cJC9tzBjq6IFzUU22on5EdKFzkI7eCrwL8wEU4g
qZ1OopU1uh9zG5+P6ZqnycvL3vS+5lp3Nt0W3H7FlXceDaZS56b8i0fliFx8ofEh
RSo00d2ypiL6ZzFBpzJ/b7YIzRHBKyyzVJ05mpJg81ZfXDEHUeA=
=0OSe
-----END PGP SIGNATURE-----

--98rvXSDl6XtOxNQD--

