Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC682F4131
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 02:30:16 +0100 (CET)
Received: from localhost ([::1]:51088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzUzH-0000WC-Ni
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 20:30:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzUqY-0004r0-C7; Tue, 12 Jan 2021 20:21:14 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:42277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzUqU-0006Ty-1R; Tue, 12 Jan 2021 20:21:14 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DFqQT5s8Hz9sWg; Wed, 13 Jan 2021 12:21:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610500865;
 bh=ZpKyWX+GBQMIHqSaYYQBjUQb5uXm4Kwwjg2kLaK1jkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YwU4oyp7Xq5cszZSDdGJe27Swl7qvD3W2dnOOw11LVgYAVgWMdoDc8O2BRoZmbGDG
 bqBmJKPyrdcRf8VH3lvkCFMwBrkeZarM3g685Sy2epY8Jv4mjSDlF4ux3S1lil8+jq
 c65O9tICPdOeddzOfh09oRqmJ8MQKcmSsLmTbzB4=
Date: Wed, 13 Jan 2021 12:15:14 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/3] tests/acceptance: Add a test for the virtex-ml507
 ppc machine
Message-ID: <20210113011514.GI435587@yekko.fritz.box>
References: <20210112164045.98565-1-thuth@redhat.com>
 <20210112164045.98565-4-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="G3juXO9GfR42w+sw"
Content-Disposition: inline
In-Reply-To: <20210112164045.98565-4-thuth@redhat.com>
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


--G3juXO9GfR42w+sw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 05:40:45PM +0100, Thomas Huth wrote:
> The "And a hippo new year" image from the QEMU advent calendar 2020
> can be used to test the virtex-ml507 ppc machine.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  tests/acceptance/machine_ppc.py | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/tests/acceptance/machine_ppc.py b/tests/acceptance/machine_p=
pc.py
> index 71025d296c..a836e2496f 100644
> --- a/tests/acceptance/machine_ppc.py
> +++ b/tests/acceptance/machine_ppc.py
> @@ -49,3 +49,21 @@ class PpcMachine(Test):
>          self.vm.launch()
>          wait_for_console_pattern(self, 'QEMU advent calendar 2020',
>                                   self.panic_message)
> +
> +    def test_ppc_virtex_ml507(self):
> +        """
> +        :avocado: tags=3Darch:ppc
> +        :avocado: tags=3Dmachine:virtex-ml507
> +        """
> +        tar_url =3D ('https://www.qemu-advent-calendar.org'
> +                   '/2020/download/hippo.tar.gz')
> +        tar_hash =3D '306b95bfe7d147f125aa176a877e266db8ef914a'
> +        file_path =3D self.fetch_asset(tar_url, asset_hash=3Dtar_hash)
> +        archive.extract(file_path, self.workdir)
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', self.workdir + '/hippo/hippo.linux',
> +                         '-dtb', self.workdir + '/hippo/virtex440-ml507.=
dtb',
> +                         '-m', '512')
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
> +                                 self.panic_message)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--G3juXO9GfR42w+sw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/+SaIACgkQbDjKyiDZ
s5K32w/9FKzW5vj2YUgQdpUxmK7NDDLv/jr81TABIgUnBxSH4egpLiCK9MUq3KtR
65DyqonYHGeuGsabNm7BmUhNR5n3szqwX1JRoCUcToiz/FatJdLtBAOQ7aaE5Anx
78SyzKfYBdjRVaLm8MTQN5GTPuOEDZuJSOwHZul5QFV4sNAPBWbaCX6Ap5e2O9lH
nH1RE69FIVgbiw+SjVIJLu97oQ9P/omCOzAlK/qWatrWM2gcgVKFhdPv/6UCGqBS
CbUkgHHsGTmcjzF/zy6JMcQ3Fd6ZI/+vptgfTN+ITq8UDrY2vx4n75mGnBMB9o6U
zrW/YZbhTI3K/s8qID7mL7UbCpEYW+C+kBxSJA9TENx+TuT7ZKqjgXpAT6dZOAsf
tmJlioYyoHd2DWYeLvljyKhyGTcHDJIXA+4/YBUcqj6MX/BYNpt9kZoOw66DHNV3
UhbNywreYGKtD9gF1gm8ZfXsT8/gl276qHxAz4v1JJviYWQJEoUQ+4xEGoz9xzE6
DoUJV9oNceSJE3TOdenvEPWsqvo7qf18NILnsdq2XGHSQk5LFXXES63kfqDn7/ij
LUgqPZQ5rOm79qbdeC//S5bVOpqMuG6dznbMH2VKOUiiquxc9YKhV//ar/HNPBRh
i5C0NudU7UBoUSMF2XTNVaPGritJF8uBUPTLveD5y0QWk/XM7eQ=
=jEQu
-----END PGP SIGNATURE-----

--G3juXO9GfR42w+sw--

