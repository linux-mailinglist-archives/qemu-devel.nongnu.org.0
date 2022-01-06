Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73628486051
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 06:37:13 +0100 (CET)
Received: from localhost ([::1]:52354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5LSa-0006vL-0t
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 00:37:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5LNx-0004nN-SA; Thu, 06 Jan 2022 00:32:25 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=59533
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5LNp-0002Wt-AY; Thu, 06 Jan 2022 00:32:23 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JTw2z6kYLz4xgr; Thu,  6 Jan 2022 16:32:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641447131;
 bh=YyZ6ZxMKbAzrOo/gkI9Bm7hG7AKHooHcZPpWJdkyeEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k4+VqdyGRNUFcIbknpDL8e/brfNc5rvAtOBgeilN9H9Qo2wtzU6W5HX8ys1rCq9X1
 jcFJBoaWEoBtyJsnVUcbF2MoEpAMBglZZLp6eUNqJr0cv85QuLXtmsuk3j6NoN0aIq
 UDh92P6ZPkug9MGGeCLk4H39i+nicRsgZOkvDPps=
Date: Thu, 6 Jan 2022 16:26:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 3/7] target/ppc: powerpc_excp: Group unimplemented
 exceptions
Message-ID: <YdZ9n4D49ie9Tak6@yekko>
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
 <20220105204029.4058500-4-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Twv1sX95TLXUcfVY"
Content-Disposition: inline
In-Reply-To: <20220105204029.4058500-4-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Twv1sX95TLXUcfVY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 05:40:25PM -0300, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/excp_helper.c | 77 +++++-----------------------------------
>  1 file changed, 8 insertions(+), 69 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index ce86b2ae37..fa41f8048d 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -701,23 +701,6 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
>      case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable=
/VPU  */
>          env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
>          break;
> -    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interru=
pt   */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Embedded floating point data exception "
> -                  "is not implemented yet !\n");
> -        env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
> -        break;
> -    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interr=
upt  */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Embedded floating point round exception "
> -                  "is not implemented yet !\n");
> -        env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
> -        break;
> -    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interru=
pt   */
> -        /* XXX: TODO */
> -        cpu_abort(cs,
> -                  "Performance counter exception is not implemented yet =
!\n");
> -        break;
>      case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt         =
     */
>          break;
>      case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt=
     */
> @@ -782,19 +765,6 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
>      case POWERPC_EXCP_PIT:       /* Programmable interval timer interrup=
t    */
>          trace_ppc_excp_print("PIT");
>          break;
> -    case POWERPC_EXCP_IO:        /* IO error exception                  =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "601 IO error exception is not implemented yet !\n=
");
> -        break;
> -    case POWERPC_EXCP_RUNM:      /* Run mode exception                  =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "601 run mode exception is not implemented yet !\n=
");
> -        break;
> -    case POWERPC_EXCP_EMUL:      /* Emulation trap exception            =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "602 emulation trap exception "
> -                  "is not implemented yet !\n");
> -        break;
>      case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error         =
     */
>      case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                  =
     */
>      case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                 =
     */
> @@ -821,56 +791,25 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
>              break;
>          }
>          break;
> +    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interru=
pt   */
> +    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interr=
upt  */
> +    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interru=
pt   */
> +    case POWERPC_EXCP_IO:        /* IO error exception                  =
     */
> +    case POWERPC_EXCP_RUNM:      /* Run mode exception                  =
     */
> +    case POWERPC_EXCP_EMUL:      /* Emulation trap exception            =
     */
>      case POWERPC_EXCP_FPA:       /* Floating-point assist exception     =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Floating point assist exception "
> -                  "is not implemented yet !\n");
> -        break;
>      case POWERPC_EXCP_DABR:      /* Data address breakpoint             =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "DABR exception is not implemented yet !\n");
> -        break;
>      case POWERPC_EXCP_IABR:      /* Instruction address breakpoint      =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "IABR exception is not implemented yet !\n");
> -        break;
>      case POWERPC_EXCP_SMI:       /* System management interrupt         =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "SMI exception is not implemented yet !\n");
> -        break;
>      case POWERPC_EXCP_THERM:     /* Thermal interrupt                   =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Thermal management exception "
> -                  "is not implemented yet !\n");
> -        break;
>      case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interru=
pt   */
> -        /* XXX: TODO */
> -        cpu_abort(cs,
> -                  "Performance counter exception is not implemented yet =
!\n");
> -        break;
>      case POWERPC_EXCP_VPUA:      /* Vector assist exception             =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "VPU assist exception is not implemented yet !\n");
> -        break;
>      case POWERPC_EXCP_SOFTP:     /* Soft patch exception                =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs,
> -                  "970 soft-patch exception is not implemented yet !\n");
> -        break;
>      case POWERPC_EXCP_MAINT:     /* Maintenance exception               =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs,
> -                  "970 maintenance exception is not implemented yet !\n"=
);
> -        break;
>      case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint        =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Maskable external exception "
> -                  "is not implemented yet !\n");
> -        break;
>      case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint    =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Non maskable external exception "
> -                  "is not implemented yet !\n");
> +        cpu_abort(cs, "%s exception not implemented\n",
> +                  powerpc_excp_name(excp));
>          break;
>      default:
>      excp_invalid:

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Twv1sX95TLXUcfVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHWfZ8ACgkQbDjKyiDZ
s5L6bhAAknkMAfM5BZ+yJj23p9mbpR8jfrbBk0QHC8NXlSQEPhVaMiWetlwutScT
Uz5qOKO6YfHk51n3pm7Uu+UL8CinG2lVLqHnxDw9kEXUO+uifPtyM7XvyXe1eqsA
v4CwdS48j4C29G35e38PI9fydYB6aMQQq0w+obBp28utZs6jmETbvR+s1HVzE3zO
o1fpABORtgeGN3Qb3J+MRd4eprIek1xNJRluTl/6Mv+S1XIjmzYJMlsQrR0V8akE
00x85nHSrYraBzNYk5WqmkIxvSAQIsoEUYGdOkL5ab5jYkQesCJtLSxC6o5aWs+Q
F7IqWzi7ZL5IsxwFldyTSJjvlm0VWOMt9AdhrLz9Oez68deipiySncLrbCvIyIXq
JgKiz1kmXH93dEOxxRYRhDdCATnSqwiRkT9dKqyHGsk34bwCW0Zw3SnsQ9H2ydcV
Zp6+Xq56cUvGKd3hKfZhT+Tx5Z3QNoj+GmSimQrQ4ZPeViVO+QWohfOEPclIwqYb
Rygapcdarl4UlhOhDybLPvTM1e7YM1gyuSZ9dPcwSky+uHOz/HUFuu39ojfbZD50
R7wmtuyfuOewtJFNDh3WL8mKpD408mnCIn5RdP6CtEKe0s43oFwYK7hFy3w0a+sU
NLH8TbnoawBjukBjj0kRRhwN44hz9FrrTUXmL5rl3+0nkPrIMtw=
=5bj8
-----END PGP SIGNATURE-----

--Twv1sX95TLXUcfVY--

