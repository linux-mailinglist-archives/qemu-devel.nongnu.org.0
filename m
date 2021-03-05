Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E525732E009
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 04:24:41 +0100 (CET)
Received: from localhost ([::1]:50602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI14y-0002lP-GN
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 22:24:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lI13A-0001dH-TB; Thu, 04 Mar 2021 22:22:48 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:57449 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lI137-0004N1-QR; Thu, 04 Mar 2021 22:22:48 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DsCjD2x4Yz9sSC; Fri,  5 Mar 2021 14:22:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614914560;
 bh=KQm4b5+VVIi9ZY5Du3MbhhtVXzjkvf3d5cW9c7T/xYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b5qbAPE/nkM78LGZghRLmEEj4x8zjsR9DnMcnv3UW3/fZuZ0bX0eeGVEyedhL7hxD
 M3UtvwplpsqV/Jh6d+bEC+rV3pkIm6khGfhdDBPVsg3+EM+yZgOdIwwP2XYGxzKPZz
 OiW/d1bttVDJumSqrcVbQDBsac82CT6zb9LTM8Bk=
Date: Fri, 5 Mar 2021 14:05:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/2] spapr.c: remove duplicated assert in
 spapr_memory_unplug_request()
Message-ID: <YEGgDCPeVRv9xZT7@yekko.fritz.box>
References: <20210302141019.153729-1-danielhb413@gmail.com>
 <20210302141019.153729-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DUWEPfd8a9aT+Qtm"
Content-Disposition: inline
In-Reply-To: <20210302141019.153729-2-danielhb413@gmail.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DUWEPfd8a9aT+Qtm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 11:10:18AM -0300, Daniel Henrique Barboza wrote:
> We are asserting the existence of the first DRC LMB after sending unplug
> requests to all LMBs of the DIMM, where every DRC is being asserted
> inside the loop. This means that the first DRC is being asserted twice.
>=20
> Remove the duplicated assert.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied to ppc-for-6.0.

> ---
>  hw/ppc/spapr.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index aca3ef9d58..b579830832 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3703,7 +3703,6 @@ static void spapr_memory_unplug_request(HotplugHand=
ler *hotplug_dev,
> =20
>      drc =3D spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
>                            addr_start / SPAPR_MEMORY_BLOCK_SIZE);
> -    g_assert(drc);
>      spapr_hotplug_req_remove_by_count_indexed(SPAPR_DR_CONNECTOR_TYPE_LM=
B,
>                                                nr_lmbs, spapr_drc_index(d=
rc));
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DUWEPfd8a9aT+Qtm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBBoAoACgkQbDjKyiDZ
s5IwPRAAneY7syhv/RlT981LF7rJJQYrTKbQuI1SrJrYhszs861yp6X5l1ZfUDm9
ds4Zkl3tOg80S5pFKSlIRy7oxEw9BrKCuufoPlMWsfYCFlzHCri5q5AB+Ff2yMVW
LrU/QdEedwwpSSwj858gJ2KgpaeJR3xxhj7m8jGcALa+0oCFqCOlWpkKvfF3GjQT
5nPUoUxQPN1wTb6EQa874Li7zBpVEaOl9Dk8U4pa+1euR+wc/yVeH2JUtNaaDKau
bbn9NsPqpiklruO35z6M+OFswMJvJIsVetgCl3rLyzEqn7eQwSC9aXKN6MmK2BM5
6kiGND7sbsKkd78ngT3W9rNScz5hmZqmNsQuxiqNj7Wx62QHBOTjO24DWovQsZeh
OB8rDLcC+bp+4MwkA2QMsPSKtgkrwwkKyMjmqTY1FSEZMUU0IsyibJp04P/o4JZ/
gEp0S4pxBgt1dUqqnI0yydC9nUS8YlqW+EebVkKV5x+kOPzM0A7ht+YxSstIX/W8
ho8LYsj9TAU2DTHOyzmxfr+VJZh4wpEXk6/rp01g6ghL+z37wcviopNzi4W9ubvo
HAnk3eA2B619vwYVZZ4s6jdS5v4F1IuuiaOGsCxLS9/USP1IZA3gVwPPWXiEOsKL
CyoINQRloJrA/psX+sUPGCBq32lW/Q95XjfdaP5VhAfN4TJYRi0=
=1An+
-----END PGP SIGNATURE-----

--DUWEPfd8a9aT+Qtm--

