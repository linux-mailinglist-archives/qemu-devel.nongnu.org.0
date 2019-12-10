Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C20117E8D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 04:51:57 +0100 (CET)
Received: from localhost ([::1]:49992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieWZ2-0001Kw-5G
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 22:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ieWXv-0000IW-KZ
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 22:50:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ieWXu-00073x-CE
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 22:50:47 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:39859 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ieWXt-00072u-Aw; Mon, 09 Dec 2019 22:50:46 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47X5gh2kKkz9sR7; Tue, 10 Dec 2019 14:50:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1575949840;
 bh=2MD5Awgc6RucPtUwIU39SdeLZwiSee1UNQtrx6dURa0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=No4rpPz2Y4nMlGFtQh+akHhA//0x5mQVUikYo3asBJwk1U0hJHDNpD3hwUxQiSm27
 ETr+9a+6T0DgYLZDd2S10Z83vc0lV1j7FgxRXPVgVTCa2scRYfz9wJ31kFsI6+aOwG
 LYYchurF/aEjPyxrxaXCW5cR1FwfIe58NsZdiwSQ=
Date: Tue, 10 Dec 2019 14:33:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 0/5] ppc/pnv: add a POWER10 PnvChip and a powernv10 machine
Message-ID: <20191210033347.GD207300@umbus.fritz.box>
References: <20191205184454.10722-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qGV0fN9tzfkG3CxV"
Content-Disposition: inline
In-Reply-To: <20191205184454.10722-1-clg@kaod.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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


--qGV0fN9tzfkG3CxV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2019 at 07:44:49PM +0100, C=E9dric Le Goater wrote:
> Hello,
>=20
> The POWER10 and POWER9 processors are very similar and this series
> adds the basic framework for a POWER10 chip and a machine using this
> chip. The PSI and LPC models are provided first because there are no
> changes. XIVE needs some adaptation and will come later.

Applied to ppc-for-5.0, thanks.

>=20
> Thanks,
>=20
> C.
>=20
> C=E9dric Le Goater (5):
>   target/ppc: Add POWER10 DD1.0 model information
>   ppc/pnv: Introduce a POWER10 PnvChip and a powernv10 machine
>   ppc/psi: cleanup definitions
>   ppc/pnv: add a PSI bridge model for POWER10
>   ppc/pnv: add a LPC Controller model for POWER10
>=20
>  include/hw/ppc/pnv.h            |  46 +++++++
>  include/hw/ppc/pnv_lpc.h        |   6 +-
>  include/hw/ppc/pnv_psi.h        |   2 +
>  include/hw/ppc/pnv_xscom.h      |  22 ++++
>  target/ppc/cpu-models.h         |   3 +
>  target/ppc/cpu.h                |   1 +
>  hw/ppc/pnv.c                    | 192 ++++++++++++++++++++++++++--
>  hw/ppc/pnv_core.c               |  10 ++
>  hw/ppc/pnv_lpc.c                |  30 +++--
>  hw/ppc/pnv_psi.c                |  32 ++++-
>  hw/ppc/pnv_xscom.c              |  23 +++-
>  target/ppc/compat.c             |  21 +++-
>  target/ppc/cpu-models.c         |   3 +
>  target/ppc/translate_init.inc.c | 215 ++++++++++++++++++++++++++++++++
>  14 files changed, 576 insertions(+), 30 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qGV0fN9tzfkG3CxV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl3vEhsACgkQbDjKyiDZ
s5L3KhAAmKhBwNr+TWpclFbXDu2IEjrChAwwoz/EEA+yxnABf8RFxFZdA75qV9bx
zDes2SM6cujJxU/R5qWw93zPvMephLitFaoLQSUeKCgPipAOP5XXGDLmJsIY5oQv
Ash3HeufaU4+Yn7GP/hfxTWDOuVw151gUMKikUMpY3agvxH+Iz5wtEwCXufGHMGw
NPtPbzV7P74UHhGVhdCj+TMDSaSi6fgrwgQAtp8TzXMywwGsRSuml8ymCMzVkZZA
Nwsa6RRPt5vW4SdD93d4VjYfM8jFibnp/Xe7e63d6BWK63eUVrFf7FzBZYtQOtwv
imD7ooKvFcy4J3N5DqmXv5aaqvK5bE9VHf2lOQsgWyQlBZRvhdrdz5fo+7TiXV6z
NdMQABO8f2cqKn0ifpjvQZPsWLoj4QXvTNC2W8cEF/FDjgg/7+S9tmHkjq5y2NZE
a4nbl3gZtXH1SDXSpKBFOcYuQSp/UflOiwpWHe+dizbd+BBbeSuMPUCtlFsLgNtf
WjJaDcoQeMTnVGuN0LOzXyd1ERxWQLaePZmgoH7uv6zq+rlikcfXwCZwRLOyqVG3
Qe/uymBOXVDKse9GAk3PHqUQMIrzAEu5YmBXQ1KArO5ivzyO1VpWlfkDwR4sw/f2
rJh0zW5oXxJTvyt4sLrsHVmkQssKn4CJJ1KEre/Dvsx1aVW+WTE=
=ZvJv
-----END PGP SIGNATURE-----

--qGV0fN9tzfkG3CxV--

