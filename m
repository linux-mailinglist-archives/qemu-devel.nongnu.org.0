Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873711389B5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 04:27:07 +0100 (CET)
Received: from localhost ([::1]:45106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqqNe-0001iH-Ho
	for lists+qemu-devel@lfdr.de; Sun, 12 Jan 2020 22:27:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33631)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iqqKq-0007IL-1N
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 22:24:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iqqKp-0003If-0r
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 22:24:11 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:60869)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iqqKk-000375-Gq; Sun, 12 Jan 2020 22:24:07 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47wzTB6nylz9s4Y; Mon, 13 Jan 2020 14:23:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578885838;
 bh=VP7yNU/KIZVHXNs4kkGriW1bjHfnY45nlkhaEeGBXB4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hr6m8MgXuoEXCF8Nsw8V+sFalz3dFQPYhMJ1Ziw2/2EWkg61D5mxEOfjiLpHmeH9b
 1L/8K2Oz7yx07GGdBRhgxckptYNjfumL/Vpfe+oN2rXw6nSdZGR4tJMJGpXC+pAIZz
 vUD+G5Z77HEVwMxwfpy6rgBwvFpmMVy+qXF/YYDg=
Date: Mon, 13 Jan 2020 11:11:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 03/15] hw/ppc/spapr_rtas: Access MachineState via
 SpaprMachineState argument
Message-ID: <20200113011129.GB7045@umbus>
References: <20200109152133.23649-1-philmd@redhat.com>
 <20200109152133.23649-4-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Content-Disposition: inline
In-Reply-To: <20200109152133.23649-4-philmd@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2020 at 04:21:21PM +0100, Philippe Mathieu-Daud=E9 wrote:
> We received a SpaprMachineState argument. Since SpaprMachineState
> inherits of MachineState, use it instead of calling qdev_get_machine.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_rtas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index e88bb1930e..6f06e9d7fe 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -267,7 +267,7 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU =
*cpu,
>                                            uint32_t nret, target_ulong re=
ts)
>  {
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> -    MachineState *ms =3D MACHINE(qdev_get_machine());
> +    MachineState *ms =3D MACHINE(spapr);
>      unsigned int max_cpus =3D ms->smp.max_cpus;
>      target_ulong parameter =3D rtas_ld(args, 0);
>      target_ulong buffer =3D rtas_ld(args, 1);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4bw8EACgkQbDjKyiDZ
s5Ka5BAAhSNLPIhoInFnP9CxnaJbV9mhIjn8pnrM7awPSiWiWJauBXV8BcC7QTL/
Myc6yEf55vjg+kA3Lt+Z4Q4zk17tSNa777IsYB+Yqi1ZELp2Y1/dLV0uH9qvFZHo
o3GfEylWJ6s9S2NVrgF6xllliJpnR1yescXMIpU9ecj04rfaJAmkBzW6NqSLAzSN
YsJHTDebT6ZYG9wyj/BKIup+k/e/wfbKjs+So5lLEN5TasHuyTJjapLxq/g9A0lE
KLYbBxrHtZt/B3Bmajytcp7zIUvwQUECX10l3PGlitZigvrGQ42Wj/Y8w+8tEmoa
A6mY/PNqhjP/Lb/fMIWoIq/SiL23B17Y3OjdPUdgYrwRSBkzOd6njW4GDfAkdh/z
zOAyIrZY0DekDb3lh9NUmOqeUFQ7egRURG/yijA54Fq/t2poieCxqPiNmwhPor/E
P74T+n7s8FlsYaUoz10jxmCJqHgQYNh6Vr2gET2D7L2U9rf8837nV6pw4FcBScWL
TzvKCxWSRkP+sXROtw8+AjrUlIxp4q7t4g2Iun2dCQjGQ4A8VbYtsMzKr2Qd7fes
ReM413SdHXxqpPSlo8u922bU3bArJr3Ljv82/RK+rm4lTiCzRc7khG/eOX+j40pm
w5nsxgCEZNc+4SdIJFWDhQawZjSpl/0yugafNR8Dq5h+NsL5pxY=
=Asp2
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--

