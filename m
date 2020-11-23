Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607632C041A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:20:08 +0100 (CET)
Received: from localhost ([::1]:37252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh9t9-0005k3-Fs
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kh9pr-0003x6-A3; Mon, 23 Nov 2020 06:16:45 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:47313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kh9pp-0001Ij-14; Mon, 23 Nov 2020 06:16:43 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CFF126E271B4;
 Mon, 23 Nov 2020 12:16:37 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 23 Nov
 2020 12:16:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00317b87898-2c77-452d-a2c3-a58a7c7832b4,
 7563B3C8582C4E5C569F12427BEE2CF3FAD9DE82) smtp.auth=groug@kaod.org
Date: Mon, 23 Nov 2020 12:16:35 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-6.0 2/8] spapr/xive: Introduce spapr_xive_nr_ends()
Message-ID: <20201123121635.65506f0c@bahia.lan>
In-Reply-To: <9da660d2-1969-a548-5092-7f645a610e6d@kaod.org>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-3-groug@kaod.org>
 <9da660d2-1969-a548-5092-7f645a610e6d@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 3ef964fc-3158-470e-ac8a-1070a17988b4
X-Ovh-Tracer-Id: 11102780456921831904
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 10:46:38 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 11/20/20 6:46 PM, Greg Kurz wrote:
> > We're going to kill the "nr_ends" field in a subsequent patch.
>=20
> why ? it is one of the tables of the controller and its part of=20
> the main XIVE concepts. Conceptually, we could let the machine=20
> dimension it with an arbitrary value as OPAL does. The controller
> would fail when the table is fully used.=20
>=20

The idea is that the sPAPR machine only true need is to create a
controller that can accommodate up to a certain number of vCPU ids.
It doesn't really to know about the END itself IMHO.

This being said, if we decide to pass both spapr_max_server_number()
and smp.max_cpus down to the backends as function arguments, we won't
have to change "nr_ends" at all.

> =20
> > Prepare ground by using an helper instead of peeking into
> > the sPAPR XIVE structure directly.
>=20
>=20
> I am not against the helper though but we should introduce a=20
> prio_shift value which would let us define the number of=20
> available priorities. To be linked with "hv-prio"
>=20
> C.
>=20
>=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  include/hw/ppc/spapr_xive.h |  1 +
> >  hw/intc/spapr_xive.c        | 23 ++++++++++++++---------
> >  hw/intc/spapr_xive_kvm.c    |  4 ++--
> >  3 files changed, 17 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> > index 26c8d90d7196..4b967f13c030 100644
> > --- a/include/hw/ppc/spapr_xive.h
> > +++ b/include/hw/ppc/spapr_xive.h
> > @@ -75,6 +75,7 @@ void spapr_xive_map_mmio(SpaprXive *xive);
> > =20
> >  int spapr_xive_end_to_target(uint8_t end_blk, uint32_t end_idx,
> >                               uint32_t *out_server, uint8_t *out_prio);
> > +uint32_t spapr_xive_nr_ends(const SpaprXive *xive);
> > =20
> >  /*
> >   * KVM XIVE device helpers
> > diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> > index 60e0d5769dcc..f473ad9cba47 100644
> > --- a/hw/intc/spapr_xive.c
> > +++ b/hw/intc/spapr_xive.c
> > @@ -192,7 +192,7 @@ void spapr_xive_pic_print_info(SpaprXive *xive, Mon=
itor *mon)
> >              uint32_t end_idx =3D xive_get_field64(EAS_END_INDEX, eas->=
w);
> >              XiveEND *end;
> > =20
> > -            assert(end_idx < xive->nr_ends);
> > +            assert(end_idx < spapr_xive_nr_ends(xive));
> >              end =3D &xive->endt[end_idx];
> > =20
> >              if (xive_end_is_valid(end)) {
> > @@ -270,7 +270,7 @@ static void spapr_xive_reset(void *dev)
> >      }
> > =20
> >      /* Clear all ENDs */
> > -    for (i =3D 0; i < xive->nr_ends; i++) {
> > +    for (i =3D 0; i < spapr_xive_nr_ends(xive); i++) {
> >          spapr_xive_end_reset(&xive->endt[i]);
> >      }
> >  }
> > @@ -288,6 +288,11 @@ static void spapr_xive_instance_init(Object *obj)
> >      xive->fd =3D -1;
> >  }
> > =20
> > +uint32_t spapr_xive_nr_ends(const SpaprXive *xive)
> > +{
> > +    return xive->nr_ends;
> > +}
> > +
> >  static void spapr_xive_realize(DeviceState *dev, Error **errp)
> >  {
> >      SpaprXive *xive =3D SPAPR_XIVE(dev);
> > @@ -336,7 +341,7 @@ static void spapr_xive_realize(DeviceState *dev, Er=
ror **errp)
> >       * Allocate the routing tables
> >       */
> >      xive->eat =3D g_new0(XiveEAS, xive->nr_irqs);
> > -    xive->endt =3D g_new0(XiveEND, xive->nr_ends);
> > +    xive->endt =3D g_new0(XiveEND, spapr_xive_nr_ends(xive));
> > =20
> >      xive->nodename =3D g_strdup_printf("interrupt-controller@%" PRIx64,
> >                             xive->tm_base + XIVE_TM_USER_PAGE * (1 << T=
M_SHIFT));
> > @@ -375,7 +380,7 @@ static int spapr_xive_get_end(XiveRouter *xrtr,
> >  {
> >      SpaprXive *xive =3D SPAPR_XIVE(xrtr);
> > =20
> > -    if (end_idx >=3D xive->nr_ends) {
> > +    if (end_idx >=3D spapr_xive_nr_ends(xive)) {
> >          return -1;
> >      }
> > =20
> > @@ -389,7 +394,7 @@ static int spapr_xive_write_end(XiveRouter *xrtr, u=
int8_t end_blk,
> >  {
> >      SpaprXive *xive =3D SPAPR_XIVE(xrtr);
> > =20
> > -    if (end_idx >=3D xive->nr_ends) {
> > +    if (end_idx >=3D spapr_xive_nr_ends(xive)) {
> >          return -1;
> >      }
> > =20
> > @@ -1138,7 +1143,7 @@ static target_ulong h_int_get_source_config(Power=
PCCPU *cpu,
> >      /* EAS_END_BLOCK is unused on sPAPR */
> >      end_idx =3D xive_get_field64(EAS_END_INDEX, eas.w);
> > =20
> > -    assert(end_idx < xive->nr_ends);
> > +    assert(end_idx < spapr_xive_nr_ends(xive));
> >      end =3D &xive->endt[end_idx];
> > =20
> >      nvt_blk =3D xive_get_field32(END_W6_NVT_BLOCK, end->w6);
> > @@ -1216,7 +1221,7 @@ static target_ulong h_int_get_queue_info(PowerPCC=
PU *cpu,
> >          return H_P2;
> >      }
> > =20
> > -    assert(end_idx < xive->nr_ends);
> > +    assert(end_idx < spapr_xive_nr_ends(xive));
> >      end =3D &xive->endt[end_idx];
> > =20
> >      args[0] =3D xive->end_base + (1ull << (end_xsrc->esb_shift + 1)) *=
 end_idx;
> > @@ -1304,7 +1309,7 @@ static target_ulong h_int_set_queue_config(PowerP=
CCPU *cpu,
> >          return H_P2;
> >      }
> > =20
> > -    assert(end_idx < xive->nr_ends);
> > +    assert(end_idx < spapr_xive_nr_ends(xive));
> >      memcpy(&end, &xive->endt[end_idx], sizeof(XiveEND));
> > =20
> >      switch (qsize) {
> > @@ -1470,7 +1475,7 @@ static target_ulong h_int_get_queue_config(PowerP=
CCPU *cpu,
> >          return H_P2;
> >      }
> > =20
> > -    assert(end_idx < xive->nr_ends);
> > +    assert(end_idx < spapr_xive_nr_ends(xive));
> >      end =3D &xive->endt[end_idx];
> > =20
> >      args[0] =3D 0;
> > diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> > index 66bf4c06fe55..1566016f0e28 100644
> > --- a/hw/intc/spapr_xive_kvm.c
> > +++ b/hw/intc/spapr_xive_kvm.c
> > @@ -531,7 +531,7 @@ static int kvmppc_xive_get_queues(SpaprXive *xive, =
Error **errp)
> >      int i;
> >      int ret;
> > =20
> > -    for (i =3D 0; i < xive->nr_ends; i++) {
> > +    for (i =3D 0; i < spapr_xive_nr_ends(xive); i++) {
> >          if (!xive_end_is_valid(&xive->endt[i])) {
> >              continue;
> >          }
> > @@ -701,7 +701,7 @@ int kvmppc_xive_post_load(SpaprXive *xive, int vers=
ion_id)
> >      assert(xive->fd !=3D -1);
> > =20
> >      /* Restore the ENDT first. The targetting depends on it. */
> > -    for (i =3D 0; i < xive->nr_ends; i++) {
> > +    for (i =3D 0; i < spapr_xive_nr_ends(xive); i++) {
> >          if (!xive_end_is_valid(&xive->endt[i])) {
> >              continue;
> >          }
> >=20
>=20


