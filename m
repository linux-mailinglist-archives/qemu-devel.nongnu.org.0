Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCD02F412B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 02:28:01 +0100 (CET)
Received: from localhost ([::1]:48838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzUx6-0007xj-Ij
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 20:28:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzUqY-0004qr-7G; Tue, 12 Jan 2021 20:21:14 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:40481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzUqU-0006Tw-1R; Tue, 12 Jan 2021 20:21:13 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DFqQT4QpRz9sWd; Wed, 13 Jan 2021 12:21:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610500865;
 bh=vU4LBULX4pV70uZWVAHnJonWFTgH8TLeM6bwwTfc/94=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jy4DbggAZiShk5OSJjCC084+VhEVlonHUTQG1u1w2KIccqqI0AYrw8PQy/RI0IHiT
 iRcceHuDINGdBxYFU2ua2xHfbYy/KwF5atUZE1CXWKjLKEY2hpwx9Yj5lc0AcUZAVA
 dAdfO7YiVxFo+eURa51vfZB/cpgpdhM09UCDL5Nk=
Date: Wed, 13 Jan 2021 12:14:33 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/3] tests/acceptance: Move the pseries test to a
 separate file
Message-ID: <20210113011433.GG435587@yekko.fritz.box>
References: <20210112164045.98565-1-thuth@redhat.com>
 <20210112164045.98565-2-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ahP6B03r4gLOj5uD"
Content-Disposition: inline
In-Reply-To: <20210112164045.98565-2-thuth@redhat.com>
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


--ahP6B03r4gLOj5uD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 05:40:43PM +0100, Thomas Huth wrote:
> Let's gather the POWER-related tests in a separate file.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  MAINTAINERS                            |  1 +
>  tests/acceptance/boot_linux_console.py | 19 --------------
>  tests/acceptance/machine_ppc.py        | 34 ++++++++++++++++++++++++++
>  3 files changed, 35 insertions(+), 19 deletions(-)
>  create mode 100644 tests/acceptance/machine_ppc.py
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4be087b88e..189776a036 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -280,6 +280,7 @@ F: target/ppc/
>  F: hw/ppc/
>  F: include/hw/ppc/
>  F: disas/ppc.c
> +F: tests/acceptance/machine_ppc.py
> =20
>  RISC-V TCG CPUs
>  M: Palmer Dabbelt <palmer@dabbelt.com>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
> index fb41bb7144..41d2c86e98 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -976,25 +976,6 @@ class BootLinuxConsole(LinuxKernelTest):
>          console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
>          self.wait_for_console_pattern(console_pattern)
> =20
> -    def test_ppc64_pseries(self):
> -        """
> -        :avocado: tags=3Darch:ppc64
> -        :avocado: tags=3Dmachine:pseries
> -        """
> -        kernel_url =3D ('https://archives.fedoraproject.org/pub/archive'
> -                      '/fedora-secondary/releases/29/Everything/ppc64le/=
os'
> -                      '/ppc/ppc64/vmlinuz')
> -        kernel_hash =3D '3fe04abfc852b66653b8c3c897a59a689270bc77'
> -        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel=
_hash)
> -
> -        self.vm.set_console()
> -        kernel_command_line =3D self.KERNEL_COMMON_COMMAND_LINE + 'conso=
le=3Dhvc0'
> -        self.vm.add_args('-kernel', kernel_path,
> -                         '-append', kernel_command_line)
> -        self.vm.launch()
> -        console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
> -        self.wait_for_console_pattern(console_pattern)
> -
>      def test_m68k_q800(self):
>          """
>          :avocado: tags=3Darch:m68k
> diff --git a/tests/acceptance/machine_ppc.py b/tests/acceptance/machine_p=
pc.py
> new file mode 100644
> index 0000000000..51bbfd411c
> --- /dev/null
> +++ b/tests/acceptance/machine_ppc.py
> @@ -0,0 +1,34 @@
> +# Test that Linux kernel boots on ppc machines and check the console
> +#
> +# Copyright (c) 2018, 2020 Red Hat, Inc.
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +from avocado_qemu import Test
> +from avocado_qemu import wait_for_console_pattern
> +
> +class PpcMachine(Test):
> +
> +    timeout =3D 90
> +    KERNEL_COMMON_COMMAND_LINE =3D 'printk.time=3D0 '
> +    panic_message =3D 'Kernel panic - not syncing'
> +
> +    def test_ppc64_pseries(self):
> +        """
> +        :avocado: tags=3Darch:ppc64
> +        :avocado: tags=3Dmachine:pseries
> +        """
> +        kernel_url =3D ('https://archives.fedoraproject.org/pub/archive'
> +                      '/fedora-secondary/releases/29/Everything/ppc64le/=
os'
> +                      '/ppc/ppc64/vmlinuz')
> +        kernel_hash =3D '3fe04abfc852b66653b8c3c897a59a689270bc77'
> +        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel=
_hash)
> +
> +        self.vm.set_console()
> +        kernel_command_line =3D self.KERNEL_COMMON_COMMAND_LINE + 'conso=
le=3Dhvc0'
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-append', kernel_command_line)
> +        self.vm.launch()
> +        console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
> +        wait_for_console_pattern(self, console_pattern, self.panic_messa=
ge)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ahP6B03r4gLOj5uD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/+SXkACgkQbDjKyiDZ
s5KlAg//Tx3L1B/mkWUw9QxZpTt3RlNRPyGvDRfxenRqJLEP1tXpdnZVdwHWI5d5
ND2eabKV8b34cChmdYQsKTfDkRfOlRmwTBXtDA3QOfnjQmMsc+IGrsHv1djTkCVs
pKkzouE8rR4u5yAiZuKB8FhsjMpmfxPt5xV2WVzEMQqV5UhvqsTVHiAN416ttDYw
vdTPkN7tv7bqrz9OLlWlmgFzUx+r257zGpXL7VYmdOnH6GEcK+J5+GfZLPkydNEc
eMnZAsDhlbfrIR2p2/NiNL/F0LqxiIceQr9eDZnzy7fMKEo+eXpcI+f01BOT3Oit
BQJSV7lAuRZbROTjM7sypSRj3FDgbL7Bm590ONMB3e5wZ6sXr9ZzaRP3PMThXc3O
y8AhdYEOZL0c7ppXkRb8YzOoxH7WCV5JONPcY6tmyn9crmxAHSRg4LKtPkOF9anD
u+NvvTwMKs3UD2MWh3M5ahMIm5aPy8XAgShR5Lpn7V6IoZ32l7Soz1Y7RNSV8eN+
+x+nnOq7NVyOJPPpR4BQ/9CTgtdTQ0mkq0Wt9jCSCLK5TsFScuDiYUO9Jfv49T8Z
fKAl5FjAKkC7JCBISAfo1ArTLd5a3fnmm6JoJZHrlfOCpS9hJyXv+naNbJNswtVs
uga+EuRncY09M7AlasEDFhJv4UZCZCTiWrf2YUNM2az7kSOvdWY=
=eHz9
-----END PGP SIGNATURE-----

--ahP6B03r4gLOj5uD--

