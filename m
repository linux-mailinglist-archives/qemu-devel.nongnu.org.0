Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3EE4009DC
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 07:42:15 +0200 (CEST)
Received: from localhost ([::1]:50112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMORR-000395-JL
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 01:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mMOM2-0000Hq-Tn; Sat, 04 Sep 2021 01:36:40 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46111 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mMOM0-0000Xg-TU; Sat, 04 Sep 2021 01:36:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630733791;
 bh=hODncbRxZb+5J14YcZnIgq6EXW9tP5Fmu8R04Gf2lsE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eULuJIkwjFK1cuIpwPcSOeBngDp84uxzYSVQKOLf3dvQj+dUDJeY2pm+7wFEf+Boz
 BMXLliSV61bFVXVzXEEwACAGilcGPpuDq3MbFV9ViPDCLisCOeVwfpZlp2hSH7G+lf
 L6tn5RqPNyygvXd9SsKukwE64RtqbKEw8jEJHYs0=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H1k1C5wJfz9sW5; Sat,  4 Sep 2021 15:36:31 +1000 (AEST)
Date: Sat, 4 Sep 2021 13:38:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 16/28] hw/ppc/spapr_pci: Replace g_memdup() by
 g_memdup2()
Message-ID: <YTLqPHswPmg0yFQW@yekko>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-17-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="M3+GtE8/tO4A26e2"
Content-Disposition: inline
In-Reply-To: <20210903174510.751630-17-philmd@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--M3+GtE8/tO4A26e2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 07:44:58PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-mem=
dup2-now/5538
>=20
>   The old API took the size of the memory to duplicate as a guint,
>   whereas most memory functions take memory sizes as a gsize. This
>   made it easy to accidentally pass a gsize to g_memdup(). For large
>   values, that would lead to a silent truncation of the size from 64
>   to 32 bits, and result in a heap area being returned which is
>   significantly smaller than what the caller expects. This can likely
>   be exploited in various modules to cause a heap buffer overflow.
>=20
> Replace g_memdup() by the safer g_memdup2() wrapper.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropber.id.au>

> ---
>  hw/ppc/spapr_pci.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 7430bd63142..8e36cffab79 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -2201,10 +2201,9 @@ static int spapr_pci_post_load(void *opaque, int v=
ersion_id)
>      int i;
> =20
>      for (i =3D 0; i < sphb->msi_devs_num; ++i) {
> -        key =3D g_memdup(&sphb->msi_devs[i].key,
> -                       sizeof(sphb->msi_devs[i].key));
> -        value =3D g_memdup(&sphb->msi_devs[i].value,
> -                         sizeof(sphb->msi_devs[i].value));
> +        key =3D g_memdup2(&sphb->msi_devs[i].key, sizeof(sphb->msi_devs[=
i].key));
> +        value =3D g_memdup2(&sphb->msi_devs[i].value,
> +                          sizeof(sphb->msi_devs[i].value));
>          g_hash_table_insert(sphb->msi, key, value);
>      }
>      g_free(sphb->msi_devs);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--M3+GtE8/tO4A26e2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEy6jwACgkQbDjKyiDZ
s5J7ixAAsneh6qhvTS9tA+ZAoRedPtcXclRP5xkl0BUJ4PHYARVO2BgOPK5GsxCF
qFmwoX5ipNASF9PAlheCrIUVzLOGxWqGqbDdA9xQjbzZGOaK34GJrGFwI9EBX3Bm
Goro0bp9j4ns5d1igU7MyIpY73yPTXwRYdNQea7p4FD6LdLnOteJTImbesKHJEFG
BFoOPsihbl0LFOeT5B5pX6xmuN5oNBc3ylARXZ79S/pCQuP4o8P0OveSnUAEODGd
WooYtcEgbQl5moe+1qZ3vKL+WqLubg4OJjHjeD5XOgHNvaf7XnJwHciBw/QGDm3F
xh9k9JeojX8Jd0VpvCt7et7nt82BkzPFn8c6VdcLw5Pk6fNh//AMvgJ8PxpSrr5V
8SRs/MkJlh07s8hbQLWo7KSrs9ecb9m1PSykWaHryiYA06rKpw6ePHkvrb7WpcQi
A83F6P7d92oe/HM9nxJfZCoxClphDzShw1zjXlwZZ7xXVIOO4xopziLYc/ZKIeeO
4wATZtriWub27Mqk04N4gc2wsMed1mljBMPrg5HjzG+6GTbyrn4L98deosxmjx68
XUkI7AT1Gd38TVHUxkdOoEdiuOIT98SnEc1de5loknay1+NPFMNLi2onlzYfaRhT
j9qva+td5VLYjgtlveTBM7983yDGr3pgjayAjtHkPDzUTtd9kXA=
=ub2z
-----END PGP SIGNATURE-----

--M3+GtE8/tO4A26e2--

