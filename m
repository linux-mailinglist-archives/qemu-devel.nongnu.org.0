Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBC830A0C3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 05:02:55 +0100 (CET)
Received: from localhost ([::1]:45796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6QQQ-0002CT-DW
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 23:02:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l6QPY-0001ee-WA; Sun, 31 Jan 2021 23:02:01 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44593 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l6QPV-0001VT-29; Sun, 31 Jan 2021 23:02:00 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DTZ500fLgz9t2g; Mon,  1 Feb 2021 15:01:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612152100;
 bh=ygLJOgfVpsox/i3OBzci9Nph0wpBebtRQBeihnGbp+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZXMHv90N84Q5LC91UMU5F90XlRdi8GIy/jzDBzFwVFTtfuRff7BNQz2/4b352JIco
 3AkjihtN2N4OFcK0Pmozidh8m5X/BkxSsx7qQejycapQGNox1M0Uv1pD++6spGx6Nd
 RnohDvnfGXmRolsu9YoFxXlfk4G+wgBx7cP0t5pA=
Date: Mon, 1 Feb 2021 14:59:33 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2] ppc/pnv: Set default RAM size to 1 GB
Message-ID: <20210201035933.GA2251@yekko.fritz.box>
References: <20210129111719.790692-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
In-Reply-To: <20210129111719.790692-1-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2021 at 12:17:19PM +0100, C=E9dric Le Goater wrote:
65;6201;1c> The memory layout of the PowerNV machine is defined as :
>=20
>   #define KERNEL_LOAD_BASE	((void *)0x20000000)
>   #define KERNEL_LOAD_SIZE	0x08000000
>=20
>   #define INITRAMFS_LOAD_BASE	KERNEL_LOAD_BASE + KERNEL_LOAD_SIZE
>   #define INITRAMFS_LOAD_SIZE	0x08000000
>=20
>   #define SKIBOOT_BASE		0x30000000
>   #define SKIBOOT_SIZE		0x01c10000
>=20
>   #define CPU_STACKS_BASE	(SKIBOOT_BASE + SKIBOOT_SIZE)
>   #define STACK_SHIFT		15
>   #define STACK_SIZE		(1 << STACK_SHIFT)
>=20
> The overall size of the CPU stacks is (max PIR + 1) * 32K and the
> machine easily reaches 800MB of minimum required RAM.
>=20
> Any value below will result in a skiboot crash :
>=20
>     [    0.034949905,3] MEM: Partial overlap detected between regions:
>     [    0.034959039,3] MEM: ibm,firmware-stacks [0x31c10000-0x3a450000] =
(new)
>     [    0.034968576,3] MEM: ibm,firmware-allocs-memory@0 [0x31c10000-0x3=
8400000]
>     [    0.034980367,3] Out of memory adding skiboot reserved areas
>     [    0.035074945,3] ***********************************************
>     [    0.035093627,3] < assert failed at core/mem_region.c:1129 >
>     [    0.035104247,3]     .
>     [    0.035108025,3]      .
>     [    0.035111651,3]       .
>     [    0.035115231,3]         OO__)
>     [    0.035119198,3]        <"__/
>     [    0.035122980,3]         ^ ^
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/pnv.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 50810df83815..77af846cdfea 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -21,6 +21,7 @@
>  #include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/units.h"
> +#include "qemu/cutils.h"
>  #include "qapi/error.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/sysemu.h"
> @@ -725,8 +726,11 @@ static void pnv_init(MachineState *machine)
>      DeviceState *dev;
> =20
>      /* allocate RAM */
> -    if (machine->ram_size < (1 * GiB)) {
> -        warn_report("skiboot may not work with < 1GB of RAM");
> +    if (machine->ram_size < mc->default_ram_size) {
> +        char *sz =3D size_to_str(mc->default_ram_size);
> +        error_report("Invalid RAM size, should be bigger than %s", sz);
> +        g_free(sz);
> +        exit(EXIT_FAILURE);
>      }
>      memory_region_add_subregion(get_system_memory(), 0, machine->ram);
> =20
> @@ -1994,7 +1998,7 @@ static void pnv_machine_class_init(ObjectClass *oc,=
 void *data)
>       * RAM defaults to less than 2048 for 32-bit hosts, and large
>       * enough to fit the maximum initrd size at it's load address
>       */
> -    mc->default_ram_size =3D INITRD_LOAD_ADDR + INITRD_MAX_SIZE;
> +    mc->default_ram_size =3D 1 * GiB;
>      mc->default_ram_id =3D "pnv.ram";
>      ispc->print_info =3D pnv_pic_print_info;
>      nc->nmi_monitor_handler =3D pnv_nmi;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAXfKQACgkQbDjKyiDZ
s5LwJw/+IuRqrvpOyclywbUBXVJp0UKWh1H2i47DMlDhaljUvUigAyxkbnVGpEP5
iPkaiLljsBIKCR0sVlUALa6UUcdz7TnTfJ1g29/fcd4+YKqVNksTrwhjXddtJXw+
gBfg8Q5zGZfS7fmThL63CZ2bknncE/TDnrfUjPA/BJtm5WsKU4nm2mFrp3Q462Jb
RFkGoWEOTLUsqaNIvampd39/ajmCeHunKRbWNvYfW8FfCKScklsEJmzlmJ0AWPlb
cB4fg2xMfpcJ6FJWKmcPB1Iyk1rrdYFUOZramnmuphqL/2IHqllNKzFa7YOW41B7
6/q1pcoU6aIN68AgCraDXoWZ+Sfy2+jLgzjqhq0FGAw7QW6vV/qkFCbO2ymr+vA4
C8+DtKbnthhFwRKCLqbDAze1eAREmcrMpYwnlyb8Abvbz0XXVcE6KO3LvWuwzFBC
eInBaCVbdMjxb4U2OgrMR5ewiH/Ugj8nmQbg9oVe3z/Le3Q2KSsg/YgwU3AeMmHJ
TXzw3r7kyBS25S425lw818GhKpHyYf+0VhlcxT8DM7enkoPSULijGbh2cnegF9g/
uxI3QGtKkL2DAO1Axt4Ot/G0Tm0bHTDDTE/k8L3tgEZUKb4Yd5WyKubZ8RXC2Ib7
bDB6zaMmWYdSLu2VFeDR7KTybopRoQ/4FTKBd3YcXhvw4A8ozC8=
=MtlZ
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--

