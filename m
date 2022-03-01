Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295ED4C8197
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 04:18:38 +0100 (CET)
Received: from localhost ([::1]:41402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOt24-0007qJ-Is
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 22:18:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nOsxy-0006p7-FE; Mon, 28 Feb 2022 22:14:22 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:58143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nOsxu-0007ZQ-1H; Mon, 28 Feb 2022 22:14:21 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4K72Ql3xN7z4xmt; Tue,  1 Mar 2022 14:14:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1646104447;
 bh=77MeObx4mzxq3ZzQSJuMeKPdfB4ruQUPuzFN8j/q7P0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D5ktg9aFqERT6jrKBHjSJrRCLbfMWPGxPvCTW5vlLlaHZ2Q2Ogjn7GfCjb14m8IRn
 JG+zlWqMq7ODcuSKzF1of/CAaL0XlJOl0vvyaow9jY7+A/0ODSZiW7obf2nSPkI/jv
 SG7uWNSWwJ5Q8QC6PVXyioVBGtIl4xe4HW3j33/U=
Date: Tue, 1 Mar 2022 13:24:19 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 02/14] hw/ppc/spapr.c: fail early if no firmware found in
 machine_init()
Message-ID: <Yh2D0wofGDJlxpHd@yekko>
References: <20220228175004.8862-1-danielhb413@gmail.com>
 <20220228175004.8862-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ER3vV02U5JfkKxi2"
Content-Disposition: inline
In-Reply-To: <20220228175004.8862-3-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ER3vV02U5JfkKxi2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 02:49:52PM -0300, Daniel Henrique Barboza wrote:
> The firmware check consists on a file search (qemu_find_file) and load
> it via load_imag_targphys(). This validation is not dependent on any
> other machine state but it currently being done at the end of
> spapr_machine_init(). This means that we can do a lot of stuff and end
> up failing at the end for something that we can verify right out of the
> gate.
>=20
> Move this validation to the start of spapr_machine_init() to fail
> earlier.  While we're at it, use g_autofree in the 'filename' pointer.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index c74543ace3..4cc204f90d 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2707,15 +2707,25 @@ static void spapr_machine_init(MachineState *mach=
ine)
>      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
>      const char *bios_default =3D spapr->vof ? FW_FILE_NAME_VOF : FW_FILE=
_NAME;
>      const char *bios_name =3D machine->firmware ?: bios_default;
> +    g_autofree char *filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bi=
os_name);
>      const char *kernel_filename =3D machine->kernel_filename;
>      const char *initrd_filename =3D machine->initrd_filename;
>      PCIHostState *phb;
>      int i;
>      MemoryRegion *sysmem =3D get_system_memory();
>      long load_limit, fw_size;
> -    char *filename;
>      Error *resize_hpt_err =3D NULL;
> =20
> +    if (!filename) {
> +        error_report("Could not find LPAR firmware '%s'", bios_name);
> +        exit(1);
> +    }
> +    fw_size =3D load_image_targphys(filename, 0, FW_MAX_SIZE);
> +    if (fw_size <=3D 0) {
> +        error_report("Could not load LPAR firmware '%s'", filename);
> +        exit(1);
> +    }
> +
>      /*
>       * if Secure VM (PEF) support is configured, then initialize it
>       */
> @@ -2996,18 +3006,6 @@ static void spapr_machine_init(MachineState *machi=
ne)
>          }
>      }
> =20
> -    filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> -    if (!filename) {
> -        error_report("Could not find LPAR firmware '%s'", bios_name);
> -        exit(1);
> -    }
> -    fw_size =3D load_image_targphys(filename, 0, FW_MAX_SIZE);
> -    if (fw_size <=3D 0) {
> -        error_report("Could not load LPAR firmware '%s'", filename);
> -        exit(1);
> -    }
> -    g_free(filename);
> -
>      /* FIXME: Should register things through the MachineState's qdev
>       * interface, this is a legacy from the sPAPREnvironment structure
>       * which predated MachineState but had a similar function */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ER3vV02U5JfkKxi2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIdg8sACgkQgypY4gEw
YSIp+g//Wwp1sg65uFxwREYW3dkmcusZApJLlAitV7T9Wp5EZRMZ7/FQjce0wa6C
b/J7svbUrhKVYBugI+/ApE52xwCfcneEjBhJ85aGrdXggZReGfxLI6BTOIOnu4oH
h6qE5eE339OYLBlEpNz2zJuq+s5obJ0Z7YCM41p3KiuAtCK8T+BYCNBmj9qi3AnR
RJ0li2D8LxkQcuSxtoNNPMyfiwFZOtfTiamiC3BFshC8xZWvKm0LfIE4J+5F5GGD
KzKzucUMAGP43Gr5cOgwI+CmTZcpw5IvtAAhFVHDHKeKF8FK5jEDpvU2SfsYhlri
9rpvEJ0WSYJsX8wUUtANV4HbSIsm+Kv2fFdbEmaCXamxDdWXw8iFyxk8Vrxd2McX
cfouhzZ21dGXacWA3SmBarwwWt0ARMYaw7jDTLsW+7k6VHDKXmEKZSb3S25D3eX6
/WUG4sxkyBzVB38uOd+pXij/Nq7Vs/nG/+CMc1GNQtJHPkP15MqZ8q+kQjhmD85S
3lCxA4TgyaiuezW64BDEvGTAaEJUfxMAC8TxrN+FEOOW7FClsTYCJ7tUHlC5Ogop
EYgyci6DU4bI557+qyeVEFdRtZTixVyBkzK7mxrzVXbJ6Rt5LKsSIe5PRuW/zmP3
fjHMrHu6FcNFMwP4b8ednA+jOhBc5mv3Xd2TMTVqsJzNKCT3uFY=
=NLgt
-----END PGP SIGNATURE-----

--ER3vV02U5JfkKxi2--

