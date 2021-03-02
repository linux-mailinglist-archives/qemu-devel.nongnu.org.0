Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E474B3295A1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 03:15:17 +0100 (CET)
Received: from localhost ([::1]:56676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGuZ5-0007eY-By
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 21:15:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGuVq-00068Z-GH; Mon, 01 Mar 2021 21:11:50 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:55019 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGuVm-0005ZR-Qc; Mon, 01 Mar 2021 21:11:49 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DqLGb3Zfxz9sW1; Tue,  2 Mar 2021 13:11:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614651095;
 bh=ZEvVlixmPASXGPZuAKYOWK57/u2TT7UWwwnBbnSpJYg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pdNcBgoqZCGKGJVCP5L/6xk2KSNluyWpsd/OV6YQ53oop8QBnTgx2VcSVUFVSODIt
 3AVgUzUjTiFmxSMN0xxw/+HH9vm8BDkV4Z2GLP9x1JzJ7SMCp++OXTzDF8lmS7sPQm
 YM1FvuaoXnc49X+t/Jz6IzLe33D1w+7sgXfl6guk=
Date: Tue, 2 Mar 2021 13:06:29 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 3/5] spapr.c: add 'unplug already in progress' message
 for PHB unplug
Message-ID: <YD2dpWNbA1IPNOwz@yekko.fritz.box>
References: <20210226163301.419727-1-danielhb413@gmail.com>
 <20210226163301.419727-4-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4X5tmujzayshMRpB"
Content-Disposition: inline
In-Reply-To: <20210226163301.419727-4-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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


--4X5tmujzayshMRpB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 01:32:59PM -0300, Daniel Henrique Barboza wrote:
> Both CPU hotunplug and PC_DIMM unplug reports an user warning,
> mentioning that the hotunplug is in progress, if consecutive
> 'device_del' are issued in quick succession.
>=20
> Do the same for PHBs in spapr_phb_unplug_request().
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

LGTM, and doesn't have strong dependencies on the other patches, so
applied to ppc-for-6.0.

> ---
>  hw/ppc/spapr.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 149dc2113f..6ef72ee7bd 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4030,6 +4030,10 @@ static void spapr_phb_unplug_request(HotplugHandle=
r *hotplug_dev,
>      if (!spapr_drc_unplug_requested(drc)) {
>          spapr_drc_unplug_request(drc);
>          spapr_hotplug_req_remove_by_index(drc);
> +    } else {
> +        error_setg(errp,
> +                   "PCI Host Bridge unplug already in progress for devic=
e %s",
> +                   dev->id);
>      }
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4X5tmujzayshMRpB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA9naUACgkQbDjKyiDZ
s5Icww//RVDZWOQ1LITmslqZhzYcBeNVlwnEMm94kinvWE+X93hquNPiWyRgBjUI
NADzkrB2FUkeT0H4tcbRRYHKOeHa1km2x1cMnIKtzX4DcL5xi1279qU2M0Ujh40p
YbIDKXUgADVPpqL2CnIDUhnfnnkaDF/jWaIwKrlGDaXDNNU8hNif+Aesjbiz6dGo
tPG33yL+KlmUHWE9ZYY9HMwfJlcQTD9j4hBNEUualMMC6l3K6gOYRQMHjfl929nm
qUYc8dNDqAMhetS13ZutkIMJ8ftSsAtAVVFhmnWPdU65LfhcsmIIF4XXV3a8wbwM
WXPm31qK/glNKxJypQfzmN99ZWtbM3e5ZuUCKjeNj1jCUfqfpEF7MT5eZ7kJxsss
LxDYaJDDF3sQJKOq/zysBadQ44cT9BijS1IpB7eFIAvJT7EuFD/u+8PXi3/cynHa
AgUJn0wOQTgegxY70NmbzPqHVdurs0gdV5M5ItZvNMIWUqU2H5ajvJX0QL6jCxc1
u1CNCNNVoqHSe49VGA4BkrO4F3v4M4yZ96guw06isqgD6leWypsi9O6sgsRzRMWm
hP/whZRC41TtZM7bY5ya4ExTe9MMqPASzsq1mjbzBqj4sIcFaExcWHEABUwV/2v2
2XgaaDwcdZcY/nfM5Hx4dgyMVsUha4Sq9FdY6cqEIlG3mSnFFMk=
=IyW4
-----END PGP SIGNATURE-----

--4X5tmujzayshMRpB--

