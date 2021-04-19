Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EA63638F6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 03:03:17 +0200 (CEST)
Received: from localhost ([::1]:35816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYIJo-0008M7-Uf
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 21:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYIGN-0006cr-Qy; Sun, 18 Apr 2021 20:59:43 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45489 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYIGL-00009h-CC; Sun, 18 Apr 2021 20:59:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNpPG16lQz9vDw; Mon, 19 Apr 2021 10:59:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618793970;
 bh=OoyCuFLQ1jtf3NCPgzuTVb2p7lhSchsW9y+e96ZRqD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CQI7WxCxJ7mzB8kiUXqzhFs5KyfhYSMR5P8YIcGx/u9BBk0r7qb7Vhoif7bAzA3FY
 3dTmEZVieXjKZPIijtA03SQvvUrucvjjfgGIXz4GV2Pl5Rx6DwwhQODj22HDViYp4U
 ksuVRlJDBpqYG1YZg0fSV3kPX7Qv59rdcgF+iZAQ=
Date: Mon, 19 Apr 2021 10:47:19 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 05/11] hw/pci-host/raven: Add PCI_IO_BASE_ADDR
 definition
Message-ID: <YHzTF0lBlJSA5l7i@yekko.fritz.box>
References: <20210417103028.601124-1-f4bug@amsat.org>
 <20210417103028.601124-6-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CjpwkO0qb6SlqiBE"
Content-Disposition: inline
In-Reply-To: <20210417103028.601124-6-f4bug@amsat.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--CjpwkO0qb6SlqiBE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 17, 2021 at 12:30:22PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Rather than using the magic 0x80000000 number for the PCI I/O BAR
> physical address on the main system bus, use a definition.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/pci-host/raven.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
> index 0a9162fba97..730f31a8931 100644
> --- a/hw/pci-host/raven.c
> +++ b/hw/pci-host/raven.c
> @@ -82,6 +82,8 @@ struct PRePPCIState {
> =20
>  #define BIOS_SIZE (1 * MiB)
> =20
> +#define PCI_IO_BASE_ADDR    0x80000000  /* Physical address on main bus =
*/
> +
>  static inline uint32_t raven_pci_io_config(hwaddr addr)
>  {
>      int i;
> @@ -159,7 +161,7 @@ static uint64_t raven_io_read(void *opaque, hwaddr ad=
dr,
>      uint8_t buf[4];
> =20
>      addr =3D raven_io_address(s, addr);
> -    address_space_read(&s->pci_io_as, addr + 0x80000000,
> +    address_space_read(&s->pci_io_as, addr + PCI_IO_BASE_ADDR,
>                         MEMTXATTRS_UNSPECIFIED, buf, size);
> =20
>      if (size =3D=3D 1) {
> @@ -191,7 +193,7 @@ static void raven_io_write(void *opaque, hwaddr addr,
>          g_assert_not_reached();
>      }
> =20
> -    address_space_write(&s->pci_io_as, addr + 0x80000000,
> +    address_space_write(&s->pci_io_as, addr + PCI_IO_BASE_ADDR,
>                          MEMTXATTRS_UNSPECIFIED, buf, size);
>  }
> =20
> @@ -294,8 +296,9 @@ static void raven_pcihost_initfn(Object *obj)
>      address_space_init(&s->pci_io_as, &s->pci_io, "raven-io");
> =20
>      /* CPU address space */
> -    memory_region_add_subregion(address_space_mem, 0x80000000, &s->pci_i=
o);
> -    memory_region_add_subregion_overlap(address_space_mem, 0x80000000,
> +    memory_region_add_subregion(address_space_mem, PCI_IO_BASE_ADDR,
> +                                &s->pci_io);
> +    memory_region_add_subregion_overlap(address_space_mem, PCI_IO_BASE_A=
DDR,
>                                          &s->pci_io_non_contiguous, 1);
>      memory_region_add_subregion(address_space_mem, 0xc0000000, &s->pci_m=
emory);
>      pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj=
), NULL,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CjpwkO0qb6SlqiBE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB80xcACgkQbDjKyiDZ
s5KvNw//a4FJ3OQKfE0vRSP6b6Tudm+4INfdg6aQBbB5Z3H43fz4OwuqZOb2a5hm
DnixrpKpeQVH/nQZt3h9oYO9YENv8amJzpIy/Ogdmp9ljySCdGq/TENE821KYjNw
u9eh0fX86ooAKRFDANX97e62yR+cVHafcLhsbjIAPKVa2STpY5qB6tADuYA8Tf8L
faBdJ4hkPEiu/gb0IgBR9QKEsnLWAci/iNmbbgd12g/FEigxl4HKpO30oOP1TdFa
4HJzS3irxGSjGseAkLj0BTxOHvxh1PRUyc2Go6YXadXtU6O+UrINZnYA3to+wlJH
d4J1J1npQhIcd7CYLAutFefSimcpq464JSJe/VCvx4qhMdswLv+rmjjMaP2j+Lm4
gSvncFuliZdnz7jZIGY3euZ4XZImPKr+CLXzfyJxdx9a/uNrtr2bkbFSQgJnpR06
c5k3Igy+0AZcLsCABT2nIAx3Ex6ZbjIiaTfJeOL4pFemeaJ66gHY6LMIUUz9pvn3
9mvgW++ZQsIXhBXHFQcRLjLuyVBqH0yn679M+7Erzv27Y9hQCahDEHr4hTDHMyy7
fJv9MXMWYxKlLoASxaUynRG4jKOMQXXPEE5zVRX7uJxZxy3YVLsxzorJ1c+WgnuZ
Zb4phzHhnuz8H2YUvrPrxFbOhM7A/jNSQ71rsKLQQSwdD+G8bi8=
=uB/i
-----END PGP SIGNATURE-----

--CjpwkO0qb6SlqiBE--

