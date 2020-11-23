Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DA12BFFD7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 07:17:53 +0100 (CET)
Received: from localhost ([::1]:37990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh5Ae-000130-5a
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 01:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh58m-0008Dl-7P; Mon, 23 Nov 2020 01:15:56 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:47977 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh58k-0000WS-D4; Mon, 23 Nov 2020 01:15:55 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfcN60FWFz9s0b; Mon, 23 Nov 2020 17:15:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606112150;
 bh=zS7LbG0eR4BbGOC6MpNDzkX4NqGPgP/CZhApPosKE0g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gmM3yLmi7JAEnkQVYwTyyoU6Ns0YZjECO7NWGI7pIZcNqhqDikUSlDEYx+ZAznkcm
 GDUVYvcKIm2phevun/72cqUngig4hoNV9t+4iCzJFg9oa5e2KOt9AolwKXcN80tNoy
 JDaeL6nphk4dNX6s6fh8OSS/vfU/2BdAEuzgTrcU=
Date: Mon, 23 Nov 2020 17:15:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2 3/4] hw/ppc/spapr_tpm_proxy: Fix hexadecimal
 format string specifier
Message-ID: <20201123061536.GW521467@yekko.fritz.box>
References: <20201103112558.2554390-1-philmd@redhat.com>
 <20201103112558.2554390-4-philmd@redhat.com>
 <20201103113948.GG143651@yekko.fritz.box>
 <91914453-4c0a-c364-22e2-92ca9d1e50e4@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2DJuma0xDHN2clgl"
Content-Disposition: inline
In-Reply-To: <91914453-4c0a-c364-22e2-92ca9d1e50e4@redhat.com>
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Dov Murik <dovmurik@linux.vnet.ibm.com>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2DJuma0xDHN2clgl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2020 at 03:28:24PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Hi David,
>=20
> On 11/3/20 12:39 PM, David Gibson wrote:
> > On Tue, Nov 03, 2020 at 12:25:57PM +0100, Philippe Mathieu-Daud=C3=A9 w=
rote:
> >> The '%u' conversion specifier is for decimal notation.
> >> When prefixing a format with '0x', we want the hexadecimal
> >> specifier ('%x').
> >>
> >> Inspired-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >=20
> > Acked-by: David Gibson <david@gibson.dropbear.id.au>
>=20
> As there is no qemu-trivial@ pull request during freeze/rc,
> can you queue this patch via your ppc tree?

Done, applied to ppc-for-6.0.

>=20
> Thanks,
>=20
> Phil.
>=20
> >=20
> >> ---
> >>  hw/ppc/trace-events | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
> >> index dcc06d49b5a..6d8d095aa28 100644
> >> --- a/hw/ppc/trace-events
> >> +++ b/hw/ppc/trace-events
> >> @@ -19,7 +19,7 @@ spapr_update_dt_failed_size(unsigned cbold, unsigned=
 cbnew, unsigned magic) "Old
> >>  spapr_update_dt_failed_check(unsigned cbold, unsigned cbnew, unsigned=
 magic) "Old blob %u bytes, new blob %u bytes, magic 0x%x"
> >> =20
> >>  # spapr_tpm_proxy.c
> >> -spapr_h_tpm_comm(const char *device_path, uint64_t operation) "tpm_de=
vice_path=3D%s operation=3D0x%"PRIu64
> >> +spapr_h_tpm_comm(const char *device_path, uint64_t operation) "tpm_de=
vice_path=3D%s operation=3D0x%"PRIx64
> >>  spapr_tpm_execute(uint64_t data_in, uint64_t data_in_sz, uint64_t dat=
a_out, uint64_t data_out_sz) "data_in=3D0x%"PRIx64", data_in_sz=3D%"PRIu64"=
, data_out=3D0x%"PRIx64", data_out_sz=3D%"PRIu64
> >> =20
> >>  # spapr_iommu.c
> >=20
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2DJuma0xDHN2clgl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7U4gACgkQbDjKyiDZ
s5Ko0BAAo8aIGyHGsehykVR9yXdK5pYNL8zxFr3APhxaJaodh71Ox7bCLuz0ibEI
66TPz7eNFoCQ8wv/OI8EpAeFprOfcRSIKXxL9U7lsIhBUCCz5mXqckCMGbl1CyxZ
g2XxdKpIWEBKact/dKgXceCQMvZo2ArHgl1q1xTRPbPVNwv5MW3IxvnUcpRgxzRa
dDDA+8G7sWzsf0SxVfURea8RXyZxKmK4b1zlOaha+eu44h2CErRCw6h37zsrw1Lj
zi18DuXNbNz69OE3xki163Q8cnHbD4xorzh0fZT+2/3pxI73F/smPedJspjEi/AL
zsy45sEwrqoY4vt5KdXJguwutp5JGuqO2q9+qVUxmra56VSK6XlKRf2geLeCvzJy
qPMq8eCQsf0VAxK7StQNnuLsIex2iU4mtuvu+t9T/YeCCGfdjHv1fzay27XcVU/6
cyychIt029oXzig8babaWf1+8CLqqosF2FgKpwKCRUxq79L1Ef4LfC6/vNlW4jB0
B1gyakEBZMaCaa1079xkVko8X4lD0xahfz+IYn30bbJF376k2k8xzzpnmqoJGv2k
u6KKHT8uTzlYEFC0zoNXpEhBNv1FQ60iSjj+gJ2oUmjuXCVjEXMDR9QRdTywZTMW
6Ve7FtPJYpvr6IqsVSmaV+PuSIrX/M68aRcrhx/XaOImxrjnJ5g=
=56jq
-----END PGP SIGNATURE-----

--2DJuma0xDHN2clgl--

