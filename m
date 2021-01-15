Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EC22F6FDC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 02:11:30 +0100 (CET)
Received: from localhost ([::1]:50708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0DeD-0006zL-85
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 20:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0DaI-00041h-MN; Thu, 14 Jan 2021 20:07:26 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:34989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0DaC-0003QB-PW; Thu, 14 Jan 2021 20:07:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DH31b6W02z9sWD; Fri, 15 Jan 2021 12:07:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610672835;
 bh=se0TKPLrPaRB+8U+0iptuhC9dWqrKC3eKk/NRRSYD30=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C39xRqOoQZuRdnJmN0NAUXDQ6y9ShM0Lic8325YYTylvwqQaQrnNb6Tmj4j4z9RQf
 3YsmogkBP8Ht8lwja0D9eWRvnndYRvbaA9un+rym0ho/VG1YOIzElyEEXJ52/tfKV2
 WQDQcfiiX8fYS2yryyOFFd/ZQBr/Q+QylMySN9qI=
Date: Fri, 15 Jan 2021 11:49:35 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v1 5/7] spapr_cpu_core.c: use g_auto* in
 spapr_create_vcpu()
Message-ID: <20210115004935.GU435587@yekko.fritz.box>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
 <20210114180628.1675603-6-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ULJ2Z7kCM1hyNsWd"
Content-Disposition: inline
In-Reply-To: <20210114180628.1675603-6-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ULJ2Z7kCM1hyNsWd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 03:06:26PM -0300, Daniel Henrique Barboza wrote:
> Use g_autoptr() with Object and g_autofree with the string to
> avoid the need of a cleanup path.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/spapr_cpu_core.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index 2f7dc3c23d..4f316a6f9d 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -277,8 +277,8 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *sc=
, int i, Error **errp)
>  {
>      SpaprCpuCoreClass *scc =3D SPAPR_CPU_CORE_GET_CLASS(sc);
>      CPUCore *cc =3D CPU_CORE(sc);
> -    Object *obj;
> -    char *id;
> +    g_autoptr(Object) obj =3D NULL;
> +    g_autofree char *id =3D NULL;
>      CPUState *cs;
>      PowerPCCPU *cpu;
> =20
> @@ -293,23 +293,17 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *=
sc, int i, Error **errp)
>      cs->start_powered_off =3D true;
>      cs->cpu_index =3D cc->core_id + i;
>      if (!spapr_set_vcpu_id(cpu, cs->cpu_index, errp)) {
> -        goto err;
> +        return NULL;
>      }
> =20
>      cpu->node_id =3D sc->node_id;
> =20
>      id =3D g_strdup_printf("thread[%d]", i);
>      object_property_add_child(OBJECT(sc), id, obj);
> -    g_free(id);
> =20
>      cpu->machine_data =3D g_new0(SpaprCpuState, 1);
> =20
> -    object_unref(obj);
>      return cpu;
> -
> -err:
> -    object_unref(obj);
> -    return NULL;
>  }
> =20
>  static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ULJ2Z7kCM1hyNsWd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAA5p8ACgkQbDjKyiDZ
s5JPUhAA4OvKkiXZ6OVBPUi4hEYZQcPYOLBeZbmxFuSOVhh+vlWKZcJUXwoaB8Oi
0TtDAcB4gTGxA+Oq+M+ESTFo9S3QFZbnMqjQRXN3uhz0YMjcuzxpmZlB9W+0JyEj
N1qe3XkPG1uUVTtTkNnK2oPfqlWoYXbXPVhauWPtujw810G1coDSByXDwrtkNTiE
2CU3JOly4iuQ+DxMRFpdMBjG453nxKZXaXpfzN5zyQg2CaAZCPZ9WbgfLQNCyNPc
erQg/y/+D9KHa5mhXTXHHDm13cRbsbDEQjK65CQP73IRVIEcMEp4hfbNtNxK3st9
OouaK6U8GJqHscSTwbJF1N4CeM1bcEq4APTLoL8YoeD6zomL+c/yJ2JrbknHmCXX
7jo1ELsG8d9VN0QNqm758m4fa724rHyR6UNHKqGLS0wRxXrdTDxiGuNuGvUK5EXA
jgBQRYjJ2eK50SCm3FhLtea4NwGg/MTBsa6oddLKXIgOjQ1/65aEllYQYxTyZHNO
ablchSt83OIF/vazXiWw5uolL+vsN0lhUTZSAErXynCzZ1KX8v4fUjFHRb/GMT4y
txd9ayaQQWPa23hFufmGzwL0srjofo5IlZH37AkEcG9ANfghjZdqHDOOMGhbkEWc
KGzYyPcMTbevPzh0bXjsOEwWhQLgPRJ/+Tg6cxZnC0+JI0GTqaA=
=um0k
-----END PGP SIGNATURE-----

--ULJ2Z7kCM1hyNsWd--

