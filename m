Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FB92BFF0E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 05:41:26 +0100 (CET)
Received: from localhost ([::1]:58754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh3fJ-000325-8f
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 23:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh3d7-00012v-VX; Sun, 22 Nov 2020 23:39:10 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:36737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh3d5-0006Qo-Ta; Sun, 22 Nov 2020 23:39:09 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfZDC5fB6z9sVN; Mon, 23 Nov 2020 15:38:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606106331;
 bh=z8/KIFqKP2KVJaarq88UmdDZXcvPZsTDr+0+mhK4msA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cRXcfwXh4FINSzfNcZixcOcptl7oK+CKcybLj8rv1lX4cVj2BhYiD/QKKeqFgRcnI
 OcQhOcF62DDB16ap5SrjmIF5mLhY8GjMO82LDLanNZE9ubWReqjwewGCzO2Q7YN1iK
 R2sj1X6VuCjMM0Y86Bd75y4hoyX0BNBS+8frtgUQ=
Date: Mon, 23 Nov 2020 15:38:32 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 7/8] spapr: Drop "nr_servers" argument of the
 sPAPR IC activate() operation
Message-ID: <20201123043832.GG521467@yekko.fritz.box>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-8-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/Zw+/jwnNHcBRYYu"
Content-Disposition: inline
In-Reply-To: <20201120174646.619395-8-groug@kaod.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/Zw+/jwnNHcBRYYu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 06:46:45PM +0100, Greg Kurz wrote:
> This argument isn't used by the backends anymore.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  include/hw/ppc/spapr_irq.h | 3 +--
>  hw/intc/spapr_xive.c       | 3 +--
>  hw/intc/xics_spapr.c       | 3 +--
>  hw/ppc/spapr_irq.c         | 3 +--
>  4 files changed, 4 insertions(+), 8 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
> index c22a72c9e270..3e1c619d4c06 100644
> --- a/include/hw/ppc/spapr_irq.h
> +++ b/include/hw/ppc/spapr_irq.h
> @@ -43,8 +43,7 @@ DECLARE_CLASS_CHECKERS(SpaprInterruptControllerClass, S=
PAPR_INTC,
>  struct SpaprInterruptControllerClass {
>      InterfaceClass parent;
> =20
> -    int (*activate)(SpaprInterruptController *intc, uint32_t nr_servers,
> -                    Error **errp);

Hm.  Thinking back on this, is the problem just that it's not clear
here if the 'nr_servers' parameter here indicates the number of CPU
targets, or the maximum index of CPU targets?

If so, I wonder if it might be better to pass both numbers as
parameters here, rather than shuffling the properties of the devices
themselves.

> +    int (*activate)(SpaprInterruptController *intc, Error **errp);
>      void (*deactivate)(SpaprInterruptController *intc);
> =20
>      /*
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index d13a2955ce9b..8331026fdb12 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -754,8 +754,7 @@ static void spapr_xive_dt(SpaprInterruptController *i=
ntc, uint32_t nr_servers,
>                       plat_res_int_priorities, sizeof(plat_res_int_priori=
ties)));
>  }
> =20
> -static int spapr_xive_activate(SpaprInterruptController *intc,
> -                               uint32_t nr_servers, Error **errp)
> +static int spapr_xive_activate(SpaprInterruptController *intc, Error **e=
rrp)
>  {
>      SpaprXive *xive =3D SPAPR_XIVE(intc);
> =20
> diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
> index ce147e8980ed..8810bd93c856 100644
> --- a/hw/intc/xics_spapr.c
> +++ b/hw/intc/xics_spapr.c
> @@ -426,8 +426,7 @@ static int xics_spapr_post_load(SpaprInterruptControl=
ler *intc, int version_id)
>      return 0;
>  }
> =20
> -static int xics_spapr_activate(SpaprInterruptController *intc,
> -                               uint32_t nr_servers, Error **errp)
> +static int xics_spapr_activate(SpaprInterruptController *intc, Error **e=
rrp)
>  {
>      if (kvm_enabled()) {
>          return spapr_irq_init_kvm(xics_kvm_connect, intc,
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index be6f4041e433..f2897fbc942a 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -480,7 +480,6 @@ static void set_active_intc(SpaprMachineState *spapr,
>                              SpaprInterruptController *new_intc)
>  {
>      SpaprInterruptControllerClass *sicc;
> -    uint32_t nr_servers =3D spapr_max_server_number(spapr);
> =20
>      assert(new_intc);
> =20
> @@ -498,7 +497,7 @@ static void set_active_intc(SpaprMachineState *spapr,
> =20
>      sicc =3D SPAPR_INTC_GET_CLASS(new_intc);
>      if (sicc->activate) {
> -        sicc->activate(new_intc, nr_servers, &error_fatal);
> +        sicc->activate(new_intc, &error_fatal);
>      }
> =20
>      spapr->active_intc =3D new_intc;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/Zw+/jwnNHcBRYYu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7PMYACgkQbDjKyiDZ
s5LZMA/9FKiKG7DTXKkV3tJvIRPNihkzmL/KWOwFWQnLqOgy75JwfuSg5RLp9Y6T
70AXneDHrYpEu+/JA+RGQqsPEui0cC4h4TwMfdIV/49srfTNJ6x8Sea5vFazu+wd
IHCSfkfYssJDsCOK4jcfIZIKnTwQBsyX/PRQnp5GeKmAdfPCLCSGD2Xu29965IRN
GSasmz2/sYA6h0u98CUDFmocjZpC7KtnQeuzpJyTyiRjfrb8sJWPaL0s1bEotH+Q
tIMqC93zjryk/WtaWdIMoeqi4no6MtIRSwdj266XIP3miPcBxpDHl22GX2N09AmL
GYczhgfFNj5J/ILOZD8BUa9ybBZoIYGIWvyLr4/G+tx29tkziCiNQ7CzfV2/k4WA
r6PK3zqdR9R655sVIEGmy3y/tYRxbH4SdowhhwIwb+HunKfI1EhKmTPMtIpIlLm1
Qj1JEwNtLGVioym4Gha4nHmLIehibitWIRWH7CcHTP4dfHmo45VduUbu3IRjzwQI
DqkN3QWHx/vcaOZBekg9d643QdfWZ4TqeWVKghNkwPoMBUrTuaVcM53BD+mCQ+kG
xUS8np5mhOt9olP6/PXolftdS6POE+aeokjDuuZPYgAqRtUJYv11NcpaG0bADmmX
Eaj1sH3rr4YIxCFBWHHM7j2VUj7k8URJKqXHMvFrTOBKwIDH2Xk=
=jZCv
-----END PGP SIGNATURE-----

--/Zw+/jwnNHcBRYYu--

