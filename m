Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DDB42EA2A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:29:26 +0200 (CEST)
Received: from localhost ([::1]:58666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbHef-0005jz-EC
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbHHR-0004So-Ky; Fri, 15 Oct 2021 03:05:25 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:41463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbHH8-0006MT-7G; Fri, 15 Oct 2021 03:05:21 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HVy2N36djz4xbZ; Fri, 15 Oct 2021 18:05:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634281500;
 bh=OS4W6FOmaAhQgzAZlgkqj2NYnTOoXVKtK42mt5ZGtig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W+GK3zIAVtMa4+fMi6drqEsdtd57GLACv8JCQBUwvjdI+VAU/A895OxSYxX3rdgDR
 4+MA/hy7cjxGvVvxisvYvxf2uj9ATG/uNFsE/m79ZB8k95jaHaPY7Xg0DTeRmYk32n
 eEv9O46csWwRkx6aZ8rPQe9ipkR/ey38ibhxOxoQ=
Date: Fri, 15 Oct 2021 14:15:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 1/6] ppc/pegasos2: Restrict memory to 2 gigabytes
Message-ID: <YWjyWH1Fj9o31heX@yekko>
References: <cover.1634241019.git.balaton@eik.bme.hu>
 <54f58229a69c9c1cca21bcecad700b3d7052edd5.1634241019.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jrANfFXfRCoH8OYC"
Content-Disposition: inline
In-Reply-To: <54f58229a69c9c1cca21bcecad700b3d7052edd5.1634241019.git.balaton@eik.bme.hu>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jrANfFXfRCoH8OYC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 09:50:19PM +0200, BALATON Zoltan wrote:
> The CHRP spec this board confirms to only allows 2 GiB of system
> memory below 4 GiB as the high 2 GiB is allocated to IO and system
> resources. To avoid problems with memory overlapping these areas
> restrict RAM to 2 GiB similar to mac_newworld.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Applied, thanks.

> ---
>  hw/ppc/pegasos2.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index b8ce859f1a..474cfdeabf 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -117,6 +117,10 @@ static void pegasos2_init(MachineState *machine)
>      qemu_register_reset(pegasos2_cpu_reset, pm->cpu);
> =20
>      /* RAM */
> +    if (machine->ram_size > 2 * GiB) {
> +        error_report("RAM size more than 2 GiB is not supported");
> +        exit(1);
> +    }
>      memory_region_add_subregion(get_system_memory(), 0, machine->ram);
> =20
>      /* allocate and load firmware */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jrANfFXfRCoH8OYC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFo8lcACgkQbDjKyiDZ
s5J0cxAAmTh2LjXHnGIFxvJDSgpGQxlMcGBdClDwB+YGx9PykVor4CQT4jNvSpjL
GDnzXA+k+m9FdFl4xBn/PCLcLqsBLTfXSqCXvT5E+ddsryxQxvHHeHpuVzLyJy8A
ejp102hVIQetcKUffgkmbxnbV4e9UQEvLGTABXLsi0MQ4VZYibV/2ciRqMkLHJqw
Z/9y4pr4gi/8MI5VwXQ5awgvbf+emypC3tzR98FainsF/EpePaROs8S1R7im+qxN
v1XSg3Ldpo3c8q314Al6AX++VJXbh0dj2G0wB3ODtqZhPVZVjU5W6MhSl+pnclB3
kMOGWOOM9i9coqB1IaWEacTIvoER0NTPBQ/xuaMrG4Bk5XGmIg2FHMdIqplGGoyF
zbyJjkPnisow6pi2dIOb9tIyIt80JsIGwHnzKhNrONtpUmTQDO/zyO7rSwH5czqV
WCZSFHSYjSEofICJVVBkpTpGcdz/g6RIZbK67hUx28pypDM0x9iNTpcQ+ifmmRbO
sH2KDttiXJFtW6amED482qtvAorUe+cRL8lGeuFJx+TuEAH8nI3cMG4riXZr9t3R
5QlBd/Gc3Fkn8NMJ4UZ3LhZ77W698n86KIQrHePinaB3vSddRIICd/IOXmMUY2FE
uMDPrFFmSEnwB2XFhls4M9d9IkF5Y0OtjGurLDisevsN6ZXx+78=
=tTOy
-----END PGP SIGNATURE-----

--jrANfFXfRCoH8OYC--

