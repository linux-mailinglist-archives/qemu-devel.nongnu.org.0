Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051AB144A74
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 04:31:25 +0100 (CET)
Received: from localhost ([::1]:36146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu6jj-0006bu-Vm
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 22:31:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49116)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iu6iJ-0005WH-MU
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 22:29:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iu6iI-0001b5-EO
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 22:29:55 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:38617 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iu6iE-0001U0-Mp; Tue, 21 Jan 2020 22:29:51 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 482W9j65swz9sRl; Wed, 22 Jan 2020 14:29:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1579663785;
 bh=gjTAxwHzUT9Y2XJryNV78jmmw6wmxlDJiwWlvkg8lD4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V2AIv1YiSaTJxJGYcpG5GJARvNowCbcT45DfepJElLR2zyBT4ytQXyeDoGsp7hhQr
 ZRoc7UyjSMLji4w6HepmTURDCG/wvRq8zPhdrg+sO/0uLcWQBdjbz4vzWm9CJ8zsV3
 xmbeWCr1uXGe51xePb+KTd9Z0xNo8wn4lwo1yhzc=
Date: Wed, 22 Jan 2020 14:27:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 03/10] hw/ppc/spapr_rtas: Remove local variable
Message-ID: <20200122032758.GH2347@umbus.fritz.box>
References: <20200121110349.25842-1-philmd@redhat.com>
 <20200121110349.25842-4-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="smOfPzt+Qjm5bNGJ"
Content-Disposition: inline
In-Reply-To: <20200121110349.25842-4-philmd@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--smOfPzt+Qjm5bNGJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2020 at 12:03:42PM +0100, Philippe Mathieu-Daud=E9 wrote:
> We only access this variable in the RTAS_SYSPARM_SPLPAR_CHARACTERISTICS
> case. Use it in place and remove the local declaration.
>=20
> Suggested-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>


> ---
> v2: Do not reduce MachineState variable scope (David Gibson)
> ---
>  hw/ppc/spapr_rtas.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 6f06e9d7fe..85135e0e1a 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -268,7 +268,6 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU =
*cpu,
>  {
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
>      MachineState *ms =3D MACHINE(spapr);
> -    unsigned int max_cpus =3D ms->smp.max_cpus;
>      target_ulong parameter =3D rtas_ld(args, 0);
>      target_ulong buffer =3D rtas_ld(args, 1);
>      target_ulong length =3D rtas_ld(args, 2);
> @@ -280,10 +279,10 @@ static void rtas_ibm_get_system_parameter(PowerPCCP=
U *cpu,
>                                            "DesMem=3D%" PRIu64 ","
>                                            "DesProcs=3D%d,"
>                                            "MaxPlatProcs=3D%d",
> -                                          max_cpus,
> +                                          ms->smp.max_cpus,
>                                            ms->ram_size / MiB,
>                                            ms->smp.cpus,
> -                                          max_cpus);
> +                                          ms->smp.max_cpus);
>          if (pcc->n_host_threads > 0) {
>              char *hostthr_val, *old =3D param_val;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--smOfPzt+Qjm5bNGJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4nwT4ACgkQbDjKyiDZ
s5IHpQ//cLXRksjKykIvTGt/oULaExpniGSv6KKkSZeN5dVrMLas9BRslr7kNOlU
gTud6nZVcIcbM7nP3p9Y040xstHR7v8MOFaz+gwWMjY4xxKNV2J3lTY8X+281t/K
LymrQkiLVJyHZEqspswbLrEBsD2+IEhovCstFuQPtj8zqZSy/XUp5OSDhxckgLlg
W9L0pYp5djFhXKbCHblGHFR22ziHioysWA/9hUTJiym4CpatX9/em18/pDlh8otO
I29lce+FMX1m1oNt3kI8UAUJdYt5j2Vh8V5SbVCLQZkLa7UVRJzkE3hL+3W0hxai
paHbXfsmySYKguxCsbzvlNaSFFUO8epSaG2DxCbFPJmGzzIN0wMjIep+vsnawSGt
KjDQWJGa0L0VMQ+fIp+UMFTddY2VM6pO99MyFcrKJoYsCHhOTEnLkxQwfZ5nlpaK
ch3qgPKTSjeE0R6nLki7aZQNdXP35is2TA9zgNwuEicvR4ECDfKNPLNSmzmZyaFi
vp8rAjCDX3A3gyFsE/0B8DmYA8+vEANrwW7Z+dfeL+47Bi5KO7FD0SK/N3QK31gm
Hz5otN6Ck857g/OIImzfzyf4+ZIF6YAQLCi03o2KdWOiUd2oJ9zCKfPE4jZCOez6
pXHvqZ+SP5c7rpS2IsZdmQ98+G+LLkyLQHJTZwX/eZwRMXM9G6Y=
=80hk
-----END PGP SIGNATURE-----

--smOfPzt+Qjm5bNGJ--

