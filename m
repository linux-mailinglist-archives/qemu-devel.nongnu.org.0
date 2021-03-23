Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A8C346DE6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 00:36:26 +0100 (CET)
Received: from localhost ([::1]:34150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOqZU-00030v-Vm
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 19:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOqXZ-0001Xm-EU; Tue, 23 Mar 2021 19:34:27 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36325 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOqXW-0006GZ-0Z; Tue, 23 Mar 2021 19:34:24 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4nks5Q1fz9sVb; Wed, 24 Mar 2021 10:34:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616542453;
 bh=SfSc3hw3U0Ry9jXuE55RNexm4vktny9CHDg1qyjVAVc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NNLa1IAxBA8o9E+mxXUzpF0aKwLF6btStKBi6EKUOk6zPjkOILnqV8Vv4v/grvxGw
 Sv/QmzYavBKp03NNMBkupOoI0tb1OaSLtMxhkllkTGy8t8b79BvKLkMYLw323qilPu
 DMlYIzR4psab/hftNUvBbTB7YKb7C2hbWrV+Cl/E=
Date: Wed, 24 Mar 2021 10:09:59 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 08/13] blobs: Only install blobs if powerpc system
 targets are built
Message-ID: <YFp1R/aPG0nMlztU@yekko.fritz.box>
References: <20210323155132.238193-1-f4bug@amsat.org>
 <20210323155132.238193-9-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fj1lHCzLlXiZwZX1"
Content-Disposition: inline
In-Reply-To: <20210323155132.238193-9-f4bug@amsat.org>
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
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fj1lHCzLlXiZwZX1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 04:51:27PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: qemu-ppc@nongnu.org
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Herv=E9 Poussineau <hpoussin@reactos.org>
> Cc: C=E9dric Le Goater <clg@kaod.org>
> Cc: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  meson.build         |  2 ++
>  pc-bios/meson.build | 21 +++++++++++++--------
>  2 files changed, 15 insertions(+), 8 deletions(-)

Acked-by: David Gibson <david@gibson.dropbear.id.au>

>=20
> diff --git a/meson.build b/meson.build
> index e3418815b04..6f5561c2212 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -97,6 +97,7 @@
>  install_blobs_arm =3D false
>  install_blobs_hppa =3D false
>  install_blobs_microblaze =3D false
> +install_blobs_ppc =3D false
>  if get_option('install_blobs')
>    foreach target : target_dirs
>      install_edk2_blobs =3D install_edk2_blobs or target in edk2_targets
> @@ -104,6 +105,7 @@
>      install_blobs_arm =3D install_blobs_hppa or target in ['arm-softmmu'=
, 'aarch64-softmmu']
>      install_blobs_hppa =3D install_blobs_hppa or target in ['hppa-softmm=
u']
>      install_blobs_microblaze =3D install_blobs_microblaze or target in [=
'microblaze-softmmu', 'microblazeel-softmmu']
> +    install_blobs_ppc =3D install_blobs_ppc or (target.startswith('ppc')=
 and target.endswith('softmmu'))
>    endforeach
>  endif
> =20
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index a6185feff58..73d02a57628 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -43,7 +43,6 @@
>    'vgabios-ati.bin',
>    'openbios-sparc32',
>    'openbios-sparc64',
> -  'openbios-ppc',
>    'QEMU,tcx.bin',
>    'QEMU,cgthree.bin',
>    'pxe-e1000.rom',
> @@ -60,8 +59,6 @@
>    'efi-virtio.rom',
>    'efi-e1000e.rom',
>    'efi-vmxnet3.rom',
> -  'bamboo.dtb',
> -  'canyonlands.dtb',
>    'multiboot.bin',
>    'linuxboot.bin',
>    'linuxboot_dma.bin',
> @@ -69,11 +66,6 @@
>    'pvh.bin',
>    's390-ccw.img',
>    's390-netboot.img',
> -  'slof.bin',
> -  'skiboot.lid',
> -  'u-boot.e500',
> -  'u-boot-sam460-20100605.bin',
> -  'qemu_vga.ndrv',
>    'opensbi-riscv32-generic-fw_dynamic.bin',
>    'opensbi-riscv64-generic-fw_dynamic.bin',
>    'opensbi-riscv32-generic-fw_dynamic.elf',
> @@ -111,6 +103,19 @@
>    ))
>  endif
> =20
> +if install_blobs_ppc
> +  blobs_ss.add(files(
> +    'bamboo.dtb',
> +    'canyonlands.dtb',
> +    'openbios-ppc',
> +    'qemu_vga.ndrv',
> +    'slof.bin',
> +    'skiboot.lid',
> +    'u-boot.e500',
> +    'u-boot-sam460-20100605.bin',
> +  ))
> +endif
> +
>  blobs_ss =3D blobs_ss.apply(config_host, strict: false)
> =20
>  if get_option('install_blobs')

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fj1lHCzLlXiZwZX1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBadUQACgkQbDjKyiDZ
s5JR4g//eBar2iEQ4JWQ8xjHDIGeBUg6upAi/9ZE1hODrnMIoQntxaYWMMIie8GB
gwDnYjRP+zHTx9S4F8Kq4ywwlTiXihJ6EQBaPOKYm2jJtWgjcJzKKs8U7MUpp9hq
uF63KGYUCJaSKGPFxaFEta/Y/Ww9prhDVCySJRIrOKTkPnPfLiE2pW0RNSNPhnEj
IiHhiHe4N/9bJTrZV6yMnP/n+5QjvtpnzJ5J9psvNzeTLvT8+1P6TUz+kUjLVngN
JeLcm9ioN92emotga8LsgoMtZArkvqY1vWm54yC0fp+xaxAm8RTfqKdWjON2K2hL
3nnho60UQyBrY/tKYLMmRFSCqRHY2beMonDS1t++PiK9KaWspUCA3oH2/0w5E3ct
dC+m5m7yvZ/1yXkoVMaJkhko83U6qagrVY8WTuydUedF//KnU4CJIK8lKFQnNZrY
x2LWOckRjPbGazoQp95qQ0oPYr0FPSq9vKLluiPjnVIeLmMtF1bZFka3L1z7NR/T
D1WM4QffnY1V5efFGSOdodn196H3vZR1+Wai2UwPpJSKfeOgfKGeHG5sEL9uJRZB
Gx6zAzC3ncrtwXek2Rdh2yCEo6qEjhrW5Mn8yITfj1A+gJrkVE/03889vcYQvJFk
j0i9+qKSKNosDl6iPhrB/y5umhc9+s+dokBePHXQ+uQx6l8GpA8=
=KUwq
-----END PGP SIGNATURE-----

--fj1lHCzLlXiZwZX1--

