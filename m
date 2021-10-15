Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B77C42EE20
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:48:29 +0200 (CEST)
Received: from localhost ([::1]:51652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJpE-00082a-JL
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbJTc-00055d-5v; Fri, 15 Oct 2021 05:26:08 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:41859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbJTV-00012K-9i; Fri, 15 Oct 2021 05:26:07 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HW18z6l0Sz4xb9; Fri, 15 Oct 2021 20:25:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634289955;
 bh=to5b9vvZP8VE2mCUed7Ly7nT2s0gBx4jZ/TsGMJ4f1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RqVwVkATsA587DvVdVsYwYQt1U7amcGzjzU27EA88pXX4SFH3jpCPgT560woDqXhN
 p8c3m/DPZm06Bb4lnSW1LMXfC/ZYrnr+zqmsIrEXRfHXtWfOiI09lpXgdg82b4FG0e
 jaSNUzgOjIU52ndjTkxtpC2FT3kh/NlrTAgF5BE8=
Date: Fri, 15 Oct 2021 20:22:29 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/acceptance: Add a test for the bamboo ppc board
Message-ID: <YWlIVbs5U+Jx5qHo@yekko>
References: <20211015090008.1299609-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2tyVUlx6ah7FVROx"
Content-Disposition: inline
In-Reply-To: <20211015090008.1299609-1-thuth@redhat.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
 Willian Rampazzo <willianr@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, clg@kaod.org, Cleber Rosa <crosa@redhat.com>,
 edgar.iglesias@gmail.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2tyVUlx6ah7FVROx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 15, 2021 at 11:00:08AM +0200, Thomas Huth wrote:
> The kernel and initrd from the "Aboriginal Linux" project can be
> used to run some tests on the bamboo ppc machine.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Applied to ppc-for-6.2, thanks.

> ---
>  MAINTAINERS                    |  1 +
>  tests/acceptance/ppc_bamboo.py | 39 ++++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 tests/acceptance/ppc_bamboo.py
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cfefe386ea..730867f129 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1247,6 +1247,7 @@ Bamboo
>  L: qemu-ppc@nongnu.org
>  S: Orphan
>  F: hw/ppc/ppc440_bamboo.c
> +F: tests/acceptance/ppc_bamboo.py
> =20
>  e500
>  L: qemu-ppc@nongnu.org
> diff --git a/tests/acceptance/ppc_bamboo.py b/tests/acceptance/ppc_bamboo=
=2Epy
> new file mode 100644
> index 0000000000..dd33bf66f3
> --- /dev/null
> +++ b/tests/acceptance/ppc_bamboo.py
> @@ -0,0 +1,39 @@
> +# Test that Linux kernel boots on the ppc bamboo board and check the con=
sole
> +#
> +# Copyright (c) 2021 Red Hat
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +from avocado.utils import archive
> +from avocado_qemu import Test
> +from avocado_qemu import wait_for_console_pattern
> +from avocado_qemu import exec_command_and_wait_for_pattern
> +
> +class BambooMachine(Test):
> +
> +    timeout =3D 90
> +
> +    def test_ppc_bamboo(self):
> +        """
> +        :avocado: tags=3Darch:ppc
> +        :avocado: tags=3Dmachine:bamboo
> +        :avocado: tags=3Dcpu:440epb
> +        :avocado: tags=3Ddevice:rtl8139
> +        """
> +        tar_url =3D ('http://landley.net/aboriginal/downloads/binaries/'
> +                   'system-image-powerpc-440fp.tar.gz')
> +        tar_hash =3D '53e5f16414b195b82d2c70272f81c2eedb39bad9'
> +        file_path =3D self.fetch_asset(tar_url, asset_hash=3Dtar_hash)
> +        archive.extract(file_path, self.workdir)
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', self.workdir +
> +                                   '/system-image-powerpc-440fp/linux',
> +                         '-initrd', self.workdir +
> +                                   '/system-image-powerpc-440fp/rootfs.c=
pio.gz',
> +                         '-nic', 'user,model=3Drtl8139,restrict=3Don')
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Type exit when done')
> +        exec_command_and_wait_for_pattern(self, 'ping 10.0.2.2',
> +                                          '10.0.2.2 is alive!')
> +        exec_command_and_wait_for_pattern(self, 'halt', 'System Halted')

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2tyVUlx6ah7FVROx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFpSFMACgkQbDjKyiDZ
s5KsAw//a8pT7lYxhn2Y//5CkxlmKmObc+0TryYHHxC7wUU4uTfRSRrOZjXNTUMJ
55fOrge2Zw7/X07BNpxXPvpyx4UcNaG9bW9yJ/jY8IIlbvjrkwhaMNed8WV8yCuv
XsCbjiDqnctTrBKFpPOGTVlN53VFiKb6//lbQdXQwrvIkW6L3v+WI9pU6b7sZp+X
agWAI3p+FIQT6uo8l7Xbj5dulA6EaONjvL+61+g1tbBHw15bCVMD/DDHGasbo199
HtnoNthnNYwBaNhchb/JKyx5WDIwocxRh1Xc6HS1uKm91Fhl56vsAQmi0fehIi3u
5YE2Dmq6X0zC+FElUF+UTwDGlg9Wxwzuq1rW6jIaXjrFgIFff1/5+ZOcewvh4J0j
B2Rj7qW0/BTDjzxus3WP4YZDcwF9T+2P9kEjx5Ivdsr8m+UBNQOSffmrWll2oyna
5eOvQXYW52wF+np/rjTyiIs6yElH+ArBiStbvqsF5sAJBc4zYf6iJxh7tV0L7mBk
/6yWk+mwhta0dpl5WrpjGpF5SJr2Oglz569ockeaYfm+tpsoVHa+gQjtyv30cHvn
Tt2X7QhR9uPVt7QFPksajXMS4F2sP5mIH0Tfh61vH5O1scMJpN2cicFIN4Sem/uy
fiTkGIVACDSf9I7OvfX6lwfdMwM1vml50iZy4PSLzRfh81vldzk=
=3sjU
-----END PGP SIGNATURE-----

--2tyVUlx6ah7FVROx--

