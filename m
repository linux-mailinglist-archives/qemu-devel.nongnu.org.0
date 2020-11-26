Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA512C4DD3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 04:37:33 +0100 (CET)
Received: from localhost ([::1]:55812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki867-0003F0-TV
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 22:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ki84o-0002cE-3E; Wed, 25 Nov 2020 22:36:10 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:48421 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ki84i-0004st-Py; Wed, 25 Nov 2020 22:36:09 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4ChNh56bH0z9sTv; Thu, 26 Nov 2020 14:35:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606361749;
 bh=v5pzWHwwpy4XstzUNY5Yar+r0jLf22T9K+lFriDlVfQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PIKml/n/xlhBUM9FxbN1pYZfaWpafKR5qbCUEtSf0dEjgkQQgPQegbRHRmgeZR7gz
 1xpHn7tnoWUrGy1r0s/5rujxJURvP/8GAPr1AOkUSfEe/hzf8r8gwaNWyMMWkdl6Sq
 o+BjOASTzEO8sFpbGtIP+tDxmgBkiQ82Ly2nmFAw=
Date: Thu, 26 Nov 2020 11:06:23 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 2/8] spapr/xive: Introduce spapr_xive_nr_ends()
Message-ID: <20201126000623.GA4980@yekko.fritz.box>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-3-groug@kaod.org>
 <20201123033355.GB521467@yekko.fritz.box>
 <20201125234326.1c26c7b8@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <20201125234326.1c26c7b8@bahia.lan>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 11:43:26PM +0100, Greg Kurz wrote:
> On Mon, 23 Nov 2020 14:33:55 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Fri, Nov 20, 2020 at 06:46:40PM +0100, Greg Kurz wrote:
> > > We're going to kill the "nr_ends" field in a subsequent patch.
> > > Prepare ground by using an helper instead of peeking into
> > > the sPAPR XIVE structure directly.
> > >=20
> > > Signed-off-by: Greg Kurz <groug@kaod.org>
> >=20
> > Applied to ppc-for-6.0, thanks.
> >=20
>=20
> I'm working on a new approach that doesn't need this change. Especially t=
he
> new approach doesn't kill the "nr_ends" fields, which makes the changelog=
 of
> this patch slightly wrong. Since it doesn't bring much in the end, maybe =
you
> can just drop it from ppc-for-6.0 ?

Done.

>=20
> >=20
> > > ---
> > >  include/hw/ppc/spapr_xive.h |  1 +
> > >  hw/intc/spapr_xive.c        | 23 ++++++++++++++---------
> > >  hw/intc/spapr_xive_kvm.c    |  4 ++--
> > >  3 files changed, 17 insertions(+), 11 deletions(-)
> > >=20
> > > diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> > > index 26c8d90d7196..4b967f13c030 100644
> > > --- a/include/hw/ppc/spapr_xive.h
> > > +++ b/include/hw/ppc/spapr_xive.h
> > > @@ -75,6 +75,7 @@ void spapr_xive_map_mmio(SpaprXive *xive);
> > > =20
> > >  int spapr_xive_end_to_target(uint8_t end_blk, uint32_t end_idx,
> > >                               uint32_t *out_server, uint8_t *out_prio=
);
> > > +uint32_t spapr_xive_nr_ends(const SpaprXive *xive);
> > > =20
> > >  /*
> > >   * KVM XIVE device helpers
> > > diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> > > index 60e0d5769dcc..f473ad9cba47 100644
> > > --- a/hw/intc/spapr_xive.c
> > > +++ b/hw/intc/spapr_xive.c
> > > @@ -192,7 +192,7 @@ void spapr_xive_pic_print_info(SpaprXive *xive, M=
onitor *mon)
> > >              uint32_t end_idx =3D xive_get_field64(EAS_END_INDEX, eas=
->w);
> > >              XiveEND *end;
> > > =20
> > > -            assert(end_idx < xive->nr_ends);
> > > +            assert(end_idx < spapr_xive_nr_ends(xive));
> > >              end =3D &xive->endt[end_idx];
> > > =20
> > >              if (xive_end_is_valid(end)) {
> > > @@ -270,7 +270,7 @@ static void spapr_xive_reset(void *dev)
> > >      }
> > > =20
> > >      /* Clear all ENDs */
> > > -    for (i =3D 0; i < xive->nr_ends; i++) {
> > > +    for (i =3D 0; i < spapr_xive_nr_ends(xive); i++) {
> > >          spapr_xive_end_reset(&xive->endt[i]);
> > >      }
> > >  }
> > > @@ -288,6 +288,11 @@ static void spapr_xive_instance_init(Object *obj)
> > >      xive->fd =3D -1;
> > >  }
> > > =20
> > > +uint32_t spapr_xive_nr_ends(const SpaprXive *xive)
> > > +{
> > > +    return xive->nr_ends;
> > > +}
> > > +
> > >  static void spapr_xive_realize(DeviceState *dev, Error **errp)
> > >  {
> > >      SpaprXive *xive =3D SPAPR_XIVE(dev);
> > > @@ -336,7 +341,7 @@ static void spapr_xive_realize(DeviceState *dev, =
Error **errp)
> > >       * Allocate the routing tables
> > >       */
> > >      xive->eat =3D g_new0(XiveEAS, xive->nr_irqs);
> > > -    xive->endt =3D g_new0(XiveEND, xive->nr_ends);
> > > +    xive->endt =3D g_new0(XiveEND, spapr_xive_nr_ends(xive));
> > > =20
> > >      xive->nodename =3D g_strdup_printf("interrupt-controller@%" PRIx=
64,
> > >                             xive->tm_base + XIVE_TM_USER_PAGE * (1 <<=
 TM_SHIFT));
> > > @@ -375,7 +380,7 @@ static int spapr_xive_get_end(XiveRouter *xrtr,
> > >  {
> > >      SpaprXive *xive =3D SPAPR_XIVE(xrtr);
> > > =20
> > > -    if (end_idx >=3D xive->nr_ends) {
> > > +    if (end_idx >=3D spapr_xive_nr_ends(xive)) {
> > >          return -1;
> > >      }
> > > =20
> > > @@ -389,7 +394,7 @@ static int spapr_xive_write_end(XiveRouter *xrtr,=
 uint8_t end_blk,
> > >  {
> > >      SpaprXive *xive =3D SPAPR_XIVE(xrtr);
> > > =20
> > > -    if (end_idx >=3D xive->nr_ends) {
> > > +    if (end_idx >=3D spapr_xive_nr_ends(xive)) {
> > >          return -1;
> > >      }
> > > =20
> > > @@ -1138,7 +1143,7 @@ static target_ulong h_int_get_source_config(Pow=
erPCCPU *cpu,
> > >      /* EAS_END_BLOCK is unused on sPAPR */
> > >      end_idx =3D xive_get_field64(EAS_END_INDEX, eas.w);
> > > =20
> > > -    assert(end_idx < xive->nr_ends);
> > > +    assert(end_idx < spapr_xive_nr_ends(xive));
> > >      end =3D &xive->endt[end_idx];
> > > =20
> > >      nvt_blk =3D xive_get_field32(END_W6_NVT_BLOCK, end->w6);
> > > @@ -1216,7 +1221,7 @@ static target_ulong h_int_get_queue_info(PowerP=
CCPU *cpu,
> > >          return H_P2;
> > >      }
> > > =20
> > > -    assert(end_idx < xive->nr_ends);
> > > +    assert(end_idx < spapr_xive_nr_ends(xive));
> > >      end =3D &xive->endt[end_idx];
> > > =20
> > >      args[0] =3D xive->end_base + (1ull << (end_xsrc->esb_shift + 1))=
 * end_idx;
> > > @@ -1304,7 +1309,7 @@ static target_ulong h_int_set_queue_config(Powe=
rPCCPU *cpu,
> > >          return H_P2;
> > >      }
> > > =20
> > > -    assert(end_idx < xive->nr_ends);
> > > +    assert(end_idx < spapr_xive_nr_ends(xive));
> > >      memcpy(&end, &xive->endt[end_idx], sizeof(XiveEND));
> > > =20
> > >      switch (qsize) {
> > > @@ -1470,7 +1475,7 @@ static target_ulong h_int_get_queue_config(Powe=
rPCCPU *cpu,
> > >          return H_P2;
> > >      }
> > > =20
> > > -    assert(end_idx < xive->nr_ends);
> > > +    assert(end_idx < spapr_xive_nr_ends(xive));
> > >      end =3D &xive->endt[end_idx];
> > > =20
> > >      args[0] =3D 0;
> > > diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> > > index 66bf4c06fe55..1566016f0e28 100644
> > > --- a/hw/intc/spapr_xive_kvm.c
> > > +++ b/hw/intc/spapr_xive_kvm.c
> > > @@ -531,7 +531,7 @@ static int kvmppc_xive_get_queues(SpaprXive *xive=
, Error **errp)
> > >      int i;
> > >      int ret;
> > > =20
> > > -    for (i =3D 0; i < xive->nr_ends; i++) {
> > > +    for (i =3D 0; i < spapr_xive_nr_ends(xive); i++) {
> > >          if (!xive_end_is_valid(&xive->endt[i])) {
> > >              continue;
> > >          }
> > > @@ -701,7 +701,7 @@ int kvmppc_xive_post_load(SpaprXive *xive, int ve=
rsion_id)
> > >      assert(xive->fd !=3D -1);
> > > =20
> > >      /* Restore the ENDT first. The targetting depends on it. */
> > > -    for (i =3D 0; i < xive->nr_ends; i++) {
> > > +    for (i =3D 0; i < spapr_xive_nr_ends(xive); i++) {
> > >          if (!xive_end_is_valid(&xive->endt[i])) {
> > >              continue;
> > >          }
> >=20
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl++8X0ACgkQbDjKyiDZ
s5LQYBAAyBH4ZVqrbvbzgu7bbKvZkgmGUWkIr2ElgYWnjchaxp3sAx2Udj8FbM/Q
fViROLTnjl/yNBEZ82gRGo+qxlhkKPkIiwJBMlk5Rpfaz8njLyP3H5M0rB2/psf1
kh8brwpv9/tqjRyX+2ZtbUgtti6fkdzzQH14dkpunAVcK+9rpSDjCfG4pmEdnY5N
iL8IN1ZOOlFD927loZ+s8zH9kUZhr2YppDaMw/rP5xlsvdmQ4GQz3D4thx+kOGej
72xMUHNCUdSPWZMwWfk6uGmU1+RFNQidqeZ+UdELvJF1KaTnT/qzF/Z1ibqNYCf9
bbxDHswbgB0D2N9LcSd/JS9yXETKn1AVhdUCbOtdPHl5xT85EkVdwiavQYYzl0M9
SHujDK8I6Sb9N1JlFlfNfw4xBh1D6lhohDrI3RatUeJ2xr4j71ZKcw6Z25miG+F5
KDp8KEdXfjbP1laGW7eYhcVf9l1VR5g18zrLGGKig0nDtIDzEfY5oQmTICBvDxHo
p90NbMo7uhHajUhaPRn4lG/xACIai7mCkowOQ203e5C5fpyoce7ms5zb/c3HYNUa
4eZSpqmyVrcXcuUSTuA/qEoyw+ZUMJvXZ5UyYII9m4hKKLXu/UpWdCi12sBK7IR9
l03pyjdei6PoIIOpucSdw2gfFuSNSDNk5B0Ax1/DAplUAHUbyO8=
=qx7d
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--

