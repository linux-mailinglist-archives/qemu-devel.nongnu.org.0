Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FB82C027D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 10:49:29 +0100 (CET)
Received: from localhost ([::1]:42936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh8TQ-0001V8-Bd
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 04:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kh8Rq-0000EQ-2G; Mon, 23 Nov 2020 04:47:50 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:55127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kh8Rn-0001PA-LX; Mon, 23 Nov 2020 04:47:49 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.147])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 23D6C7487B3E;
 Mon, 23 Nov 2020 10:47:43 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 23 Nov
 2020 10:47:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00177f5ea59-0a37-482b-9a43-701ec71c3b52,
 7563B3C8582C4E5C569F12427BEE2CF3FAD9DE82) smtp.auth=groug@kaod.org
Date: Mon, 23 Nov 2020 10:47:41 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH for-6.0 7/8] spapr: Drop "nr_servers" argument of the
 sPAPR IC activate() operation
Message-ID: <20201123104741.7866bae9@bahia.lan>
In-Reply-To: <20201123043832.GG521467@yekko.fritz.box>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-8-groug@kaod.org>
 <20201123043832.GG521467@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6sWzdgofr0MDIsUVd31f8Zc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: e91aeb5e-b0e6-44c4-be2f-2e9146bddff6
X-Ovh-Tracer-Id: 9601392934588619232
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheplefggfefueegudegkeevieevveejfffhuddvgeffteekieevueefgfeltdfgieetnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/6sWzdgofr0MDIsUVd31f8Zc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Nov 2020 15:38:32 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Nov 20, 2020 at 06:46:45PM +0100, Greg Kurz wrote:
> > This argument isn't used by the backends anymore.
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  include/hw/ppc/spapr_irq.h | 3 +--
> >  hw/intc/spapr_xive.c       | 3 +--
> >  hw/intc/xics_spapr.c       | 3 +--
> >  hw/ppc/spapr_irq.c         | 3 +--
> >  4 files changed, 4 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
> > index c22a72c9e270..3e1c619d4c06 100644
> > --- a/include/hw/ppc/spapr_irq.h
> > +++ b/include/hw/ppc/spapr_irq.h
> > @@ -43,8 +43,7 @@ DECLARE_CLASS_CHECKERS(SpaprInterruptControllerClass,=
 SPAPR_INTC,
> >  struct SpaprInterruptControllerClass {
> >      InterfaceClass parent;
> > =20
> > -    int (*activate)(SpaprInterruptController *intc, uint32_t nr_server=
s,
> > -                    Error **errp);
>=20
> Hm.  Thinking back on this, is the problem just that it's not clear
> here if the 'nr_servers' parameter here indicates the number of CPU
> targets, or the maximum index of CPU targets?
>=20

AIUI 'nr_servers' has always been referring to the number of consecutive
server ids that we put in the "ibm,interrupt-server-ranges" property for
XICS.

> If so, I wonder if it might be better to pass both numbers as
> parameters here, rather than shuffling the properties of the devices
> themselves.
>=20

Maybe. I'll give a try.

> > +    int (*activate)(SpaprInterruptController *intc, Error **errp);
> >      void (*deactivate)(SpaprInterruptController *intc);
> > =20
> >      /*
> > diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> > index d13a2955ce9b..8331026fdb12 100644
> > --- a/hw/intc/spapr_xive.c
> > +++ b/hw/intc/spapr_xive.c
> > @@ -754,8 +754,7 @@ static void spapr_xive_dt(SpaprInterruptController =
*intc, uint32_t nr_servers,
> >                       plat_res_int_priorities, sizeof(plat_res_int_prio=
rities)));
> >  }
> > =20
> > -static int spapr_xive_activate(SpaprInterruptController *intc,
> > -                               uint32_t nr_servers, Error **errp)
> > +static int spapr_xive_activate(SpaprInterruptController *intc, Error *=
*errp)
> >  {
> >      SpaprXive *xive =3D SPAPR_XIVE(intc);
> > =20
> > diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
> > index ce147e8980ed..8810bd93c856 100644
> > --- a/hw/intc/xics_spapr.c
> > +++ b/hw/intc/xics_spapr.c
> > @@ -426,8 +426,7 @@ static int xics_spapr_post_load(SpaprInterruptContr=
oller *intc, int version_id)
> >      return 0;
> >  }
> > =20
> > -static int xics_spapr_activate(SpaprInterruptController *intc,
> > -                               uint32_t nr_servers, Error **errp)
> > +static int xics_spapr_activate(SpaprInterruptController *intc, Error *=
*errp)
> >  {
> >      if (kvm_enabled()) {
> >          return spapr_irq_init_kvm(xics_kvm_connect, intc,
> > diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> > index be6f4041e433..f2897fbc942a 100644
> > --- a/hw/ppc/spapr_irq.c
> > +++ b/hw/ppc/spapr_irq.c
> > @@ -480,7 +480,6 @@ static void set_active_intc(SpaprMachineState *spap=
r,
> >                              SpaprInterruptController *new_intc)
> >  {
> >      SpaprInterruptControllerClass *sicc;
> > -    uint32_t nr_servers =3D spapr_max_server_number(spapr);
> > =20
> >      assert(new_intc);
> > =20
> > @@ -498,7 +497,7 @@ static void set_active_intc(SpaprMachineState *spap=
r,
> > =20
> >      sicc =3D SPAPR_INTC_GET_CLASS(new_intc);
> >      if (sicc->activate) {
> > -        sicc->activate(new_intc, nr_servers, &error_fatal);
> > +        sicc->activate(new_intc, &error_fatal);
> >      }
> > =20
> >      spapr->active_intc =3D new_intc;
>=20


--Sig_/6sWzdgofr0MDIsUVd31f8Zc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAl+7hT0ACgkQcdTV5YIv
c9YhpxAAs187x1aZ0rXX+/WIbzkNPWfuO6Xt7trwfK/f+dE4RNfKJXQuv+P0uUWF
qzC16UU3JUyCXVbY1kxpUPihOy30J5vcLttBSpdzHw8YlH6c+OV5wEj9S6/2TKaz
BgmGR3niuOrHZXdZz+LXIKTLinS3mo5mvfEr1kHDOctDTbAZvQJuIaWWyjFTRpyp
/tATGyzw8JlZWGFkS3z46VaJ9zPl6K7brU3z4V4bYpLP7uq51ERZPDs5qUbWo7CX
GYkQeg+Lzq6Z1qrvb/rffOdeHlbA9hmHzafX/45FlLrRcQsadk/mmRsVTvUWU3al
qhr7G7aLm0HKS/F2vjPXnPVtmcwydKB/RvPdGq3Trl9+3Tma71DVCMpjGe+3euQB
yDyciQsOGV3HuasXI3kE1nZyVggDnlSFvVnDEyuxOTjL/FihJo8BHdrbRFtR+mdt
1PhnIvpEcTsxzak8bUYETuWmWSPWconsMWTfvNWFgxP0C3UaLyxf8Bq4Lu+XHp/7
safjIlAofUV+6Lk/nmJj3/ScWv9uVsN+r2ciPbIfChwlZQX32EAtj70pTwgOictd
nczIPpZHco8vqovNoVopN0ejP6IpkY0wyuYFZuHh74j2eMoNdVEdMClqq8BP7aWx
1Zv/MWjR8UP2tUd22TM3AZIDlkNBplTdbcCTY3PWTfR4bXL8aCE=
=sezM
-----END PGP SIGNATURE-----

--Sig_/6sWzdgofr0MDIsUVd31f8Zc--

