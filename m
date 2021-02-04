Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D0D30EBAD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 06:00:58 +0100 (CET)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7WlF-0004BI-A3
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 00:00:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l7WjK-0002v2-3T; Wed, 03 Feb 2021 23:58:58 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56267 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l7WjE-0000Bv-6a; Wed, 03 Feb 2021 23:58:57 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DWRCP3BfMz9sjJ; Thu,  4 Feb 2021 15:58:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612414721;
 bh=85gnzEwgMLQwDBx+09x6KUi+lKRX5MSGEd4xuoqm6Q8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NnBJhULxYOPXpN+BypmByaAeh0QcycC7bhjlSAM41fqf1AwjTae9LQykD2ZAruNdM
 Ha/pR6VeOf63PH8niaOPCE4zsiN26DSIQ7GiDLju2rV0IBr+yMU50E65FEUMeoN9ke
 Y9AHZIbZM8lCIHlimZ01xA3uR/ssOmq63ZzsZ4/c=
Date: Thu, 4 Feb 2021 13:59:07 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 1/2] hw/ppc: e500: Use a macro for the platform clock
 frequency
Message-ID: <20210204025907.GD4729@yekko.fritz.box>
References: <1612362288-22216-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n2Pv11Ogg/Ox8ay5"
Content-Disposition: inline
In-Reply-To: <1612362288-22216-1-git-send-email-bmeng.cn@gmail.com>
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--n2Pv11Ogg/Ox8ay5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2021 at 10:24:47PM +0800, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
>=20
> At present the platform clock frequency is using a magic number.
> Convert it to a macro and use it everywhere.
>=20
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Applied to ppc-for-6.0, thanks.

>=20
> ---
>=20
> Changes in v2:
> - Rename the macro per Philippe's comments
>=20
>  hw/ppc/e500.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index c64b5d0..c795276 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -74,6 +74,8 @@
>  #define MPC8544_I2C_IRQ            43
>  #define RTC_REGS_OFFSET            0x68
> =20
> +#define PLATFORM_CLK_FREQ_HZ       (400 * 1000 * 1000)
> +
>  struct boot_info
>  {
>      uint32_t dt_base;
> @@ -320,8 +322,8 @@ static int ppce500_load_device_tree(PPCE500MachineSta=
te *pms,
>      int fdt_size;
>      void *fdt;
>      uint8_t hypercall[16];
> -    uint32_t clock_freq =3D 400000000;
> -    uint32_t tb_freq =3D 400000000;
> +    uint32_t clock_freq =3D PLATFORM_CLK_FREQ_HZ;
> +    uint32_t tb_freq =3D PLATFORM_CLK_FREQ_HZ;
>      int i;
>      char compatible_sb[] =3D "fsl,mpc8544-immr\0simple-bus";
>      char *soc;
> @@ -890,7 +892,7 @@ void ppce500_init(MachineState *machine)
>          env->spr_cb[SPR_BOOKE_PIR].default_value =3D cs->cpu_index =3D i;
>          env->mpic_iack =3D pmc->ccsrbar_base + MPC8544_MPIC_REGS_OFFSET =
+ 0xa0;
> =20
> -        ppc_booke_timers_init(cpu, 400000000, PPC_TIMER_E500);
> +        ppc_booke_timers_init(cpu, PLATFORM_CLK_FREQ_HZ, PPC_TIMER_E500);
> =20
>          /* Register reset handler */
>          if (!i) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--n2Pv11Ogg/Ox8ay5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAbYvsACgkQbDjKyiDZ
s5KnIRAA01bEEMXE6R4QdS+voix2z7WYtTylwbHBCrMMIND2tvtmNS29/zeRxAl7
Vu1l2RDyaIuAl6K7LMOK5uV2KVzWVKTbzbRLp+PO8G8lIO9tD9piD+/a3QICk95l
vt/Js1BZ/cV5zgUdinUgnyTVj/krG2dAPDD43ebAMQksZ+60PA+lqL7PttgYRG0N
qQWuWI7rmEZZj0c2qUPNcCCqug4xXU5JNr6zfwJlen0LVdgJ6u5rg/DXHe1Jp7j6
JL0438R2Ukj04/NvfXZiWS4SC26GG+ThnxtqZ154/rj6miFtncQGk34nRaif5WDi
swDWrkarbuLVFTTQumyf54NvyG9amD9scz1b/JAc4HkUjqWltMvL/h0sObmdw4kd
0ywxQhdp8JiwelBV/AVIAT11qj0iL0TjUn6Ojxs+9hDDhxevpyS1QYC2yM3UXPkM
jzg6UIUNu21c9MqCp+EygT7OI7BVo0jxUHqFZbST1onBVf2h6jM102YIWHrf1NLo
8H5bv4nesvnMHHvK0X+1qoWlbyUE5fLsnpQ1JVie4litYb8Scailm2WET1jR5QUR
2yQB3KBPvkavWN5ZzwoOQxGzJbMuDt9O5krnpM+I4ukHeEqFSs/VmLdRAU9pa/ud
sJiMJXVIjgBqRqLlToUv6OI0qHhL2NGM98pj9fKG1Zd4mAtusZM=
=3GNx
-----END PGP SIGNATURE-----

--n2Pv11Ogg/Ox8ay5--

