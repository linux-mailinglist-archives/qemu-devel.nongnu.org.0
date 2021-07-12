Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9A53C413C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 04:32:35 +0200 (CEST)
Received: from localhost ([::1]:33696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2lkI-00070Z-41
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 22:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m2lgu-0005N0-H6; Sun, 11 Jul 2021 22:29:04 -0400
Received: from ozlabs.org ([203.11.71.1]:60871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m2lgr-0001dW-HY; Sun, 11 Jul 2021 22:29:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GNSPZ6XwWz9sWX; Mon, 12 Jul 2021 12:28:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626056930;
 bh=b2lh6VYYjoqBaGkmJniHmwaoBmUiSEoA3QUtIJKpoRI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D2QXR3loMQ+LE+vDNNPfw2XqTZHJSbb9PzYp8OivCTEvJrQTAPiA4+bt0C44NSsIL
 2EOMiN/FhFGIv/vRVVLuPibTIvB5N5Y/tup0nHr4+MeVkFzDeANV5uv2MhjGrTHH1/
 w4NcZi5yZIZetRKQI4/xOmuQpCp1IhhGLCJuRrQ0=
Date: Mon, 12 Jul 2021 12:05:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH] ppc/pegasos2: Allow setprop in VOF
Message-ID: <YOujXajojVJH9gKB@yekko>
References: <20210709132920.6544E7457EF@zero.eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gEDFuDk9LtCY7PQ8"
Content-Disposition: inline
In-Reply-To: <20210709132920.6544E7457EF@zero.eik.bme.hu>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--gEDFuDk9LtCY7PQ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 09, 2021 at 03:19:13PM +0200, BALATON Zoltan wrote:
> Linux needs setprop to fix up the device tree, otherwise it's not
> finding devices and cannot boot. Since recent VOF change now we need
> to add a callback to allow this which is what this patch does.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Applied to ppc-for-6.1.

> ---
>  hw/ppc/pegasos2.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 5c4e2ae8bf..f25816082c 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -443,10 +443,17 @@ static target_ulong vhyp_encode_hpt_for_kvm_pr(PPCV=
irtualHypervisor *vhyp)
>      return POWERPC_CPU(current_cpu)->env.spr[SPR_SDR1];
>  }
> =20
> +static bool pegasos2_setprop(MachineState *ms, const char *path,
> +                             const char *propname, void *val, int vallen)
> +{
> +    return true;
> +}
> +
>  static void pegasos2_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
>      PPCVirtualHypervisorClass *vhc =3D PPC_VIRTUAL_HYPERVISOR_CLASS(oc);
> +    VofMachineIfClass *vmc =3D VOF_MACHINE_CLASS(oc);
> =20
>      mc->desc =3D "Genesi/bPlan Pegasos II";
>      mc->init =3D pegasos2_init;
> @@ -462,6 +469,8 @@ static void pegasos2_machine_class_init(ObjectClass *=
oc, void *data)
>      vhc->cpu_exec_enter =3D vhyp_nop;
>      vhc->cpu_exec_exit =3D vhyp_nop;
>      vhc->encode_hpt_for_kvm_pr =3D vhyp_encode_hpt_for_kvm_pr;
> +
> +    vmc->setprop =3D pegasos2_setprop;
>  }
> =20
>  static const TypeInfo pegasos2_machine_info =3D {
> @@ -471,6 +480,7 @@ static const TypeInfo pegasos2_machine_info =3D {
>      .instance_size =3D sizeof(Pegasos2MachineState),
>      .interfaces =3D (InterfaceInfo[]) {
>          { TYPE_PPC_VIRTUAL_HYPERVISOR },
> +        { TYPE_VOF_MACHINE_IF },
>          { }
>      },
>  };

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gEDFuDk9LtCY7PQ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDro1sACgkQbDjKyiDZ
s5L9Aw//dWxShLXw//AGRisnQ0mlggZLM3VfuLI1dpH6p4hKl4UkdUYnDHL+4AxB
kxMs+Jjg67lc325APhFL8MwB3lPwKI7mm1XmmjSMVmzZ+c0ppGCmp8EzivrXVDO2
zlL9P3MUsvpZaHd0G/m6NgFKM9WMSDJuZBBHNJDUxArEcK+H3XnsJGkqYOUwHUeh
5Qt60f7lfrhpQCIiPGZqOVwUF9qE/MVikObfst+Ct6tqDBP7HD27QSVLreSp6Okl
RaHVYepThg3tdXtdY21Xb/hS57X9bk9oBXrFw/Z/2EQMJ4iTSYG2i8aO835mhY92
SqwRvAwlskKtoRafsAcf5tZ1i0M06BVPdIH4D5OUtCYVGgCT3zUQtcoIqWAj1bi7
MwDBA+RA/+G/vThmOQUlGuNttF0u3YzNlFGxd5+F49uTwEugembgTBtmycUunCjI
azQ0guwsXGrlAbPxCtd6YvS+C8BM3VR8Y3ToEKtEsMRDj9iA6IzJAGFS6sRIgwQH
SfOOPYkMGsyF1QaZitjD0YT2QPCSDAj+kTpizpQP3vzLh/Z174cIg/GEcyeIz9+Y
c1NDyVD5kJlibCVJLS2ESC53mmSRsEC57DjVGsr2kOnG+wahoNZcKl5hpS76i+i/
Gq1lbIWjlGCvuLeAql5+BAKaUbUSWCMAwBW3bONxIXPiKu6Xh4g=
=WYoR
-----END PGP SIGNATURE-----

--gEDFuDk9LtCY7PQ8--

