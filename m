Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37C82F4120
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 02:23:27 +0100 (CET)
Received: from localhost ([::1]:44468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzUsg-00061L-OF
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 20:23:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzUqW-0004pG-Oz; Tue, 12 Jan 2021 20:21:13 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36673 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzUqU-0006Tv-14; Tue, 12 Jan 2021 20:21:12 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DFqQT4wCBz9sWF; Wed, 13 Jan 2021 12:21:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610500865;
 bh=V+jZ1eWyHWeyWLTDXral+XTildPYvcVMdveakF92hIc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dFGuEf4I4diHTqYJrBQJtsHnjas+MFtbvhpXLw/KDvdgoTW1QGwgA1eIrFLYVu+XU
 EA03lVewhOgwVeViM/VFwEbBN2Bntebh/VDD9M3OIP88NsT00qymsN8exhP4av1oUc
 xW1JeB95T/6fNT+u8Wrti0YKK+TCUDqdF4nAw5C8=
Date: Wed, 13 Jan 2021 12:14:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>, "@yekko.fritz.box"@ozlabs.org
Subject: Re: [PATCH 2/3] tests/acceptance: Test the mpc8544ds machine
Message-ID: <20210113011455.GH435587@yekko.fritz.box>
References: <20210112164045.98565-1-thuth@redhat.com>
 <20210112164045.98565-3-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8/pVXlBMPtxfSuJG"
Content-Disposition: inline
In-Reply-To: <20210112164045.98565-3-thuth@redhat.com>
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8/pVXlBMPtxfSuJG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 05:40:44PM +0100, Thomas Huth wrote:
> We can use the "Stupid creek" image to test the mpc8544ds ppc machine.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  tests/acceptance/machine_ppc.py | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/tests/acceptance/machine_ppc.py b/tests/acceptance/machine_p=
pc.py
> index 51bbfd411c..71025d296c 100644
> --- a/tests/acceptance/machine_ppc.py
> +++ b/tests/acceptance/machine_ppc.py
> @@ -5,6 +5,7 @@
>  # This work is licensed under the terms of the GNU GPL, version 2 or
>  # later.  See the COPYING file in the top-level directory.
> =20
> +from avocado.utils import archive
>  from avocado_qemu import Test
>  from avocado_qemu import wait_for_console_pattern
> =20
> @@ -32,3 +33,19 @@ class PpcMachine(Test):
>          self.vm.launch()
>          console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
>          wait_for_console_pattern(self, console_pattern, self.panic_messa=
ge)
> +
> +    def test_ppc_mpc8544ds(self):
> +        """
> +        :avocado: tags=3Darch:ppc
> +        :avocado: tags=3Dmachine:mpc8544ds
> +        """
> +        tar_url =3D ('https://www.qemu-advent-calendar.org'
> +                   '/2020/download/day17.tar.gz')
> +        tar_hash =3D '7a5239542a7c4257aa4d3b7f6ddf08fb6775c494'
> +        file_path =3D self.fetch_asset(tar_url, asset_hash=3Dtar_hash)
> +        archive.extract(file_path, self.workdir)
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', self.workdir + '/creek/creek.bin')
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
> +                                 self.panic_message)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8/pVXlBMPtxfSuJG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/+SY8ACgkQbDjKyiDZ
s5ImWRAAiwVHdxhWH7j5BpOFAD9BMyT9uO88ayiHUl35bW9vLq09RUbcykQQ3PPi
9IJjcpelfBXsxARhhQX7euQY5mD/beXdO5cilxpUfb+8gzQnE2e97fTODLXwCsIE
mWP27jN+CGTXKDDzi2aEGV+ZEB6w6yEHv15ioiQauOKFW97/L2LIKfE1miMdgvbG
ktDVwXxRHPs+j8jdOAuByq+kTSFJ8vC87vdQE9L8om33QcyWBwS9/g1Rl4Nz1/Xk
a/F/s/TGwnwkt67hMZqAiaIw4/KwadxSgs1LbFCq9V/Rezpra3wVY2l3oyXUaeV9
yWRmU4Fq3Frl9eH1/USSO7iuccbAPSYSPRh+5A+C2bARN77N6tp6iqHYfAi7QI7e
tsQ6FFQNnI7ssRfmbCP3at0eBNs5vQVuMRkAt2IjfNolUy8Uv9Xaye1+N4z53RQB
Px+r/EQQeV7UsTmupqDoBBFL0BEAkQcfylNrax1DfkILo5WsDm6VT34RSvPmVajH
bZdC4iHZ77LsydUW/lnR/49aSisgE3kJx4W9AZ5vpsXyAvyNGV384geVlrY1j4ek
6WuRAT6xm3lK/1pO8m4ZRfBKZjgRy1F0kGQk53P6OIOdHnKo/D0KgJ5FokDf59vk
LVxQMF9babG+WvQIgadzjMccwa1s/3BLi7i262ltbzt2dF6HNLo=
=4bm2
-----END PGP SIGNATURE-----

--8/pVXlBMPtxfSuJG--

