Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31D83FE802
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 05:31:13 +0200 (CEST)
Received: from localhost ([::1]:51382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLdRY-0005eA-LE
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 23:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLdLR-0001SR-63; Wed, 01 Sep 2021 23:24:53 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57971 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLdLJ-0008Mk-JF; Wed, 01 Sep 2021 23:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630553072;
 bh=qBqFz4n0xcxdLbRjY9a3DNt+x7iEM6o6/AuJ8zJMA2c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lKchevN/eazmJNyC+gUQ4YJJzNyEVaK7lPUEZJyZzPoNeh82zeM1BppdOeXUnzwV3
 AqBupTliqS6jFZCeFHpdZTbYgv7aHp/If80l1HVY7i/7s6vvJVpu/U1868MZUGln8n
 kZPvz8hAjyH8kKRXf2zJXSYNPq/5Qh9IeO2Mf+R8=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H0R9r10bpz9t0T; Thu,  2 Sep 2021 13:24:32 +1000 (AEST)
Date: Thu, 2 Sep 2021 11:36:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 4/8] ppc/pnv: Remove useless variable
Message-ID: <YTAqnBFMld1b7ivq@yekko>
References: <20210901094153.227671-1-clg@kaod.org>
 <20210901094153.227671-5-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3bp7n1xmmtlldx9x"
Content-Disposition: inline
In-Reply-To: <20210901094153.227671-5-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3bp7n1xmmtlldx9x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 11:41:49AM +0200, C=E9dric Le Goater wrote:
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.2.

> ---
>  hw/ppc/pnv.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 2f5358b70c95..a62e90b15e27 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -838,8 +838,7 @@ static void pnv_init(MachineState *machine)
>      for (i =3D 0; i < pnv->num_chips; i++) {
>          char chip_name[32];
>          Object *chip =3D OBJECT(qdev_new(chip_typename));
> -        int chip_id =3D i;
> -        uint64_t chip_ram_size =3D  pnv_chip_get_ram_size(pnv, chip_id);
> +        uint64_t chip_ram_size =3D  pnv_chip_get_ram_size(pnv, i);
> =20
>          pnv->chips[i] =3D PNV_CHIP(chip);
> =20
> @@ -850,9 +849,9 @@ static void pnv_init(MachineState *machine)
>                                  &error_fatal);
>          chip_ram_start +=3D chip_ram_size;
> =20
> -        snprintf(chip_name, sizeof(chip_name), "chip[%d]", chip_id);
> +        snprintf(chip_name, sizeof(chip_name), "chip[%d]", i);
>          object_property_add_child(OBJECT(pnv), chip_name, chip);
> -        object_property_set_int(chip, "chip-id", chip_id, &error_fatal);
> +        object_property_set_int(chip, "chip-id", i, &error_fatal);
>          object_property_set_int(chip, "nr-cores", machine->smp.cores,
>                                  &error_fatal);
>          object_property_set_int(chip, "nr-threads", machine->smp.threads,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3bp7n1xmmtlldx9x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEwKpwACgkQbDjKyiDZ
s5LshBAAkKrkVr43aJ9xvshdwgvD5IbP5E/X+1V6S7K/2+MDjtrQyIRTjREZTsNw
Tcf+sgzdB4XPU37GYJxOcoWrLJIXtdfMYNr2Pj+jiN/rGX8aGnkXgvAUilIJuvIL
IFQFYIktOwrasx6S3gp5OvnqYFL+yYljPSK0039rrz7ZCDcCz3Er+gNeePpMUAaa
QlPx2/u1vTfATItSDE13nu8iRyDDYIRYr/JoSV8mcNG8L5reI9UCXEXvM24q1jc+
rg8Bc2BQ9IcQ0bxjnNh09tpXnGc0u/iAmELID4I//jgrV2L57ecE0Yys0mFxwWC5
lghET2TmZ+SjNegrqTC3y0VtZj9I5rxNwAUC3J+Lrny5+KyZ8A6LIls39MRPI5gK
4V5QsinhC79SuopB8v8rGeiE/b8X5cAJz39G4oVtZAy8Rtmmad7RcFacmphlKiUx
l5Xki+XkOFe/PcFsmJiBPOpWGnclTm3RDetAhquIsPkFvDTuCEF47M3/z7foI2X1
3yYYAJhcAPpX4xcuEbWK3YJug4xTJsRXRzK6+bSFroYmeRt1r1EIjiZGfMKQIZNq
JoOPNYoNZf6qSgh8eEhhBZEum3n9/wPFrHGQ7hCpJczPWvWvRuuR/aYM1hwmnDNG
MM87K+c8k+jQU4GRe3eqPE21uBobXUjsxxFWwaiVgMW3xkfEXEU=
=0zFb
-----END PGP SIGNATURE-----

--3bp7n1xmmtlldx9x--

