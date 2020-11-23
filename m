Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC8D2BFF0C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 05:41:18 +0100 (CET)
Received: from localhost ([::1]:57896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh3fB-0002cv-97
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 23:41:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh3d2-0000vV-SF; Sun, 22 Nov 2020 23:39:04 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:55839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh3cz-0006Kr-PZ; Sun, 22 Nov 2020 23:39:04 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfZDB2cwfz9sRK; Mon, 23 Nov 2020 15:38:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606106330;
 bh=zoRaOntlRNUrS2y1Qe/d1Oz/+P7aq4E7VZURyOj8ElQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hVy3uPaADHQsxLFaez6AW/Vm1vv2Gqx0C1IfvAbblGrxW06L/e4sILKZZh6kTylGD
 0aVTBPnB/aa+6RnR3SG78zwkaubDWj1SWjK8ns1PjhUETooq0oiVh0W+fzX40V/KMm
 5oGi/MqhCS8qWnkh4/YtTbqcra0g5EyH94oKM7JA=
Date: Mon, 23 Nov 2020 14:33:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 2/8] spapr/xive: Introduce spapr_xive_nr_ends()
Message-ID: <20201123033355.GB521467@yekko.fritz.box>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-3-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline
In-Reply-To: <20201120174646.619395-3-groug@kaod.org>
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


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 06:46:40PM +0100, Greg Kurz wrote:
> We're going to kill the "nr_ends" field in a subsequent patch.
> Prepare ground by using an helper instead of peeking into
> the sPAPR XIVE structure directly.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0, thanks.


> ---
>  include/hw/ppc/spapr_xive.h |  1 +
>  hw/intc/spapr_xive.c        | 23 ++++++++++++++---------
>  hw/intc/spapr_xive_kvm.c    |  4 ++--
>  3 files changed, 17 insertions(+), 11 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> index 26c8d90d7196..4b967f13c030 100644
> --- a/include/hw/ppc/spapr_xive.h
> +++ b/include/hw/ppc/spapr_xive.h
> @@ -75,6 +75,7 @@ void spapr_xive_map_mmio(SpaprXive *xive);
> =20
>  int spapr_xive_end_to_target(uint8_t end_blk, uint32_t end_idx,
>                               uint32_t *out_server, uint8_t *out_prio);
> +uint32_t spapr_xive_nr_ends(const SpaprXive *xive);
> =20
>  /*
>   * KVM XIVE device helpers
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index 60e0d5769dcc..f473ad9cba47 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -192,7 +192,7 @@ void spapr_xive_pic_print_info(SpaprXive *xive, Monit=
or *mon)
>              uint32_t end_idx =3D xive_get_field64(EAS_END_INDEX, eas->w);
>              XiveEND *end;
> =20
> -            assert(end_idx < xive->nr_ends);
> +            assert(end_idx < spapr_xive_nr_ends(xive));
>              end =3D &xive->endt[end_idx];
> =20
>              if (xive_end_is_valid(end)) {
> @@ -270,7 +270,7 @@ static void spapr_xive_reset(void *dev)
>      }
> =20
>      /* Clear all ENDs */
> -    for (i =3D 0; i < xive->nr_ends; i++) {
> +    for (i =3D 0; i < spapr_xive_nr_ends(xive); i++) {
>          spapr_xive_end_reset(&xive->endt[i]);
>      }
>  }
> @@ -288,6 +288,11 @@ static void spapr_xive_instance_init(Object *obj)
>      xive->fd =3D -1;
>  }
> =20
> +uint32_t spapr_xive_nr_ends(const SpaprXive *xive)
> +{
> +    return xive->nr_ends;
> +}
> +
>  static void spapr_xive_realize(DeviceState *dev, Error **errp)
>  {
>      SpaprXive *xive =3D SPAPR_XIVE(dev);
> @@ -336,7 +341,7 @@ static void spapr_xive_realize(DeviceState *dev, Erro=
r **errp)
>       * Allocate the routing tables
>       */
>      xive->eat =3D g_new0(XiveEAS, xive->nr_irqs);
> -    xive->endt =3D g_new0(XiveEND, xive->nr_ends);
> +    xive->endt =3D g_new0(XiveEND, spapr_xive_nr_ends(xive));
> =20
>      xive->nodename =3D g_strdup_printf("interrupt-controller@%" PRIx64,
>                             xive->tm_base + XIVE_TM_USER_PAGE * (1 << TM_=
SHIFT));
> @@ -375,7 +380,7 @@ static int spapr_xive_get_end(XiveRouter *xrtr,
>  {
>      SpaprXive *xive =3D SPAPR_XIVE(xrtr);
> =20
> -    if (end_idx >=3D xive->nr_ends) {
> +    if (end_idx >=3D spapr_xive_nr_ends(xive)) {
>          return -1;
>      }
> =20
> @@ -389,7 +394,7 @@ static int spapr_xive_write_end(XiveRouter *xrtr, uin=
t8_t end_blk,
>  {
>      SpaprXive *xive =3D SPAPR_XIVE(xrtr);
> =20
> -    if (end_idx >=3D xive->nr_ends) {
> +    if (end_idx >=3D spapr_xive_nr_ends(xive)) {
>          return -1;
>      }
> =20
> @@ -1138,7 +1143,7 @@ static target_ulong h_int_get_source_config(PowerPC=
CPU *cpu,
>      /* EAS_END_BLOCK is unused on sPAPR */
>      end_idx =3D xive_get_field64(EAS_END_INDEX, eas.w);
> =20
> -    assert(end_idx < xive->nr_ends);
> +    assert(end_idx < spapr_xive_nr_ends(xive));
>      end =3D &xive->endt[end_idx];
> =20
>      nvt_blk =3D xive_get_field32(END_W6_NVT_BLOCK, end->w6);
> @@ -1216,7 +1221,7 @@ static target_ulong h_int_get_queue_info(PowerPCCPU=
 *cpu,
>          return H_P2;
>      }
> =20
> -    assert(end_idx < xive->nr_ends);
> +    assert(end_idx < spapr_xive_nr_ends(xive));
>      end =3D &xive->endt[end_idx];
> =20
>      args[0] =3D xive->end_base + (1ull << (end_xsrc->esb_shift + 1)) * e=
nd_idx;
> @@ -1304,7 +1309,7 @@ static target_ulong h_int_set_queue_config(PowerPCC=
PU *cpu,
>          return H_P2;
>      }
> =20
> -    assert(end_idx < xive->nr_ends);
> +    assert(end_idx < spapr_xive_nr_ends(xive));
>      memcpy(&end, &xive->endt[end_idx], sizeof(XiveEND));
> =20
>      switch (qsize) {
> @@ -1470,7 +1475,7 @@ static target_ulong h_int_get_queue_config(PowerPCC=
PU *cpu,
>          return H_P2;
>      }
> =20
> -    assert(end_idx < xive->nr_ends);
> +    assert(end_idx < spapr_xive_nr_ends(xive));
>      end =3D &xive->endt[end_idx];
> =20
>      args[0] =3D 0;
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index 66bf4c06fe55..1566016f0e28 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -531,7 +531,7 @@ static int kvmppc_xive_get_queues(SpaprXive *xive, Er=
ror **errp)
>      int i;
>      int ret;
> =20
> -    for (i =3D 0; i < xive->nr_ends; i++) {
> +    for (i =3D 0; i < spapr_xive_nr_ends(xive); i++) {
>          if (!xive_end_is_valid(&xive->endt[i])) {
>              continue;
>          }
> @@ -701,7 +701,7 @@ int kvmppc_xive_post_load(SpaprXive *xive, int versio=
n_id)
>      assert(xive->fd !=3D -1);
> =20
>      /* Restore the ENDT first. The targetting depends on it. */
> -    for (i =3D 0; i < xive->nr_ends; i++) {
> +    for (i =3D 0; i < spapr_xive_nr_ends(xive); i++) {
>          if (!xive_end_is_valid(&xive->endt[i])) {
>              continue;
>          }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7LaMACgkQbDjKyiDZ
s5LGNg/8CA6FVa5gsYJAnWqGABnAKEmDKQH7GyVDeKXX6btUNws8EYS1rOf7pxk5
eeCNApgHaeS22DCucsRaqdyMe9/W7+6dixhEXAqsu506DFmm86rUo4ipLKdwEq2e
qI9wmW6iii/vqeC7q4TewJz3PlxxEuWiY9gOGZJtlc9nvdgSvVHlbMHxCxUat8Kl
SBaEUjNlmtSecOZqagUjErnzgSUlsyjPDmzL23BbRHCxMtYP10eVmM+Boiz3SLjb
CJK9DSb0V5kOdCGs/6xg5e1ea0uaUZfCn0gebeOIoCBYqIWopuzR3U71f7MMOxjG
Qr+Ni4FNEhGN8g1Hgcx8xk1rcuI1WJYdLJjWE3b7PKTWOoe3AJrNRftzqWeN0XFv
iPaLcbOP2wtNLJtrqBR36urDzzRHnYMigs0l+8bVtyuWsESnlvDLjwcPSIBYpQt/
xZSZZwYvSslpzG7GCBfPajWTxnzUH5LbOPSUhtP08Ek/3tS6fam88shDzn5OkeaZ
WsbZUYQcfM443/y38zTztbMcQo6HNc6JNWyV7noSKs8OA+GDaDImVGYe+GxO8no9
3YY6n9+BJEeeQNOgpj/Il4pRFfJcg1bGC/N+9fkw4Way6OHk2sznuYtTHUAKuiJL
lxw45MO4at9d4/acVFaOTqexoxOjmrF/5PQqgCsyhqHs33+NoZ8=
=KsR3
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--

