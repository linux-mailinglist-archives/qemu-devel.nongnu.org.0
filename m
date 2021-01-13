Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1852F50EA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 18:19:58 +0100 (CET)
Received: from localhost ([::1]:52758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzjoL-0003Ab-5Q
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 12:19:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kzjWa-0007bi-EG
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:01:36 -0500
Received: from 3.mo51.mail-out.ovh.net ([188.165.32.156]:50474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kzjWX-0005b3-4C
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:01:36 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.148])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 3582D253722;
 Wed, 13 Jan 2021 18:01:29 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 13 Jan
 2021 18:01:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00672a8cae8-720b-4516-ad6a-799113fc9446,
 87373C232FD81A0C2A6A5091B5FAE526A42BEBB1) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Wed, 13 Jan 2021 18:01:27 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] spapr: Improve handling of memory unplug with old guests
Message-ID: <20210113180127.563126ad@bahia.lan>
In-Reply-To: <20210113012058.GJ435587@yekko.fritz.box>
References: <161012708715.801107.11418801796987916516.stgit@bahia.lan>
 <20210113012058.GJ435587@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/njlbZkkcINPOWt=Xk6VbYt7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: ef9ed1ec-11d1-42fd-b28b-d0c241b609bc
X-Ovh-Tracer-Id: 2839519568444496352
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedukedrtdefgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtghisehgtderreertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelgffgfeeugedugeekveeiveevjeffhfduvdegffetkeeiveeufefgledtgfeiteenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheplhgruhhrvghnthesvhhivhhivghrrdgvuh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=groug@kaod.org;
 helo=3.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/njlbZkkcINPOWt=Xk6VbYt7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Jan 2021 12:20:58 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Jan 08, 2021 at 06:31:27PM +0100, Greg Kurz wrote:
> > Since commit 1e8b5b1aa16b ("spapr: Allow memory unplug to always succee=
d")
> > trying to unplug memory from a guest that doesn't support it (eg. rhel6)
> > no longer generates an error like it used to. Instead, it leaves the
> > memory around : only a subsequent reboot or manual use of drmgr within
> > the guest can complete the hot-unplug sequence. A flag was added to
> > SpaprMachineClass so that this new behavior only applies to the default
> > machine type.
> >=20
> > We can do better. CAS processes all pending hot-unplug requests. This
> > means that we don't really care about what the guest supports if
> > the hot-unplug request happens before CAS.
> >=20
> > All guests that we care for, even old ones, set enough bits in OV5
> > that lead to a non-empty bitmap in spapr->ov5_cas. Use that as a
> > heuristic to decide if CAS has already occured or not.
> >=20
> > Always accept unplug requests that happen before CAS since CAS will
> > process them. Restore the previous behavior of rejecting them after
> > CAS when we know that the guest doesn't support memory hot-unplug.
> >=20
> > This behavior is suitable for all machine types : this allows to
> > drop the pre_6_0_memory_unplug flag.
> >=20
> > Fixes: 1e8b5b1aa16b ("spapr: Allow memory unplug to always succeed")
> > Signed-off-by: Greg Kurz <groug@kaod.org>
>=20
> Applied, sorry it too me so long.
>=20

No problem. Any estimate for your next PR ?

> > ---
> >  hw/ppc/spapr.c              |   24 +++++++++++++-----------
> >  hw/ppc/spapr_events.c       |    3 +--
> >  hw/ppc/spapr_ovec.c         |    7 +++++++
> >  include/hw/ppc/spapr.h      |    2 +-
> >  include/hw/ppc/spapr_ovec.h |    1 +
> >  5 files changed, 23 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index 2c403b574e37..6c47466fc2f1 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -4048,6 +4048,18 @@ static void spapr_machine_device_unplug(HotplugH=
andler *hotplug_dev,
> >      }
> >  }
> > =20
> > +bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr)
> > +{
> > +    return spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT) ||
> > +        /*
> > +         * CAS will process all pending unplug requests.
> > +         *
> > +         * HACK: a guest could theoretically have cleared all bits in =
OV5,
> > +         * but none of the guests we care for do.
> > +         */
>=20
> Hrm.  This is pretty ugly - I thought we had a better canonical way of
> determining if CAS had already happened this boot, but it appears
> not.  I don't want to delay this patch, since it is an important fix,
> but it would be nice if you could do a later cleanup to have a nicer
> way of detecting CAS-hasn't-happened.
>=20

Yeah, I fully agree this is ugly. I'll try to find something nicer later.

Thanks for taking it anyway !

Cheers,

--
Greg

> > +        spapr_ovec_empty(spapr->ov5_cas);
> > +}
> > +
> >  static void spapr_machine_device_unplug_request(HotplugHandler *hotplu=
g_dev,
> >                                                  DeviceState *dev, Erro=
r **errp)
> >  {
> > @@ -4056,16 +4068,9 @@ static void spapr_machine_device_unplug_request(=
HotplugHandler *hotplug_dev,
> >      SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> > =20
> >      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > -        if (!smc->pre_6_0_memory_unplug ||
> > -            spapr_ovec_test(sms->ov5_cas, OV5_HP_EVT)) {
> > +        if (spapr_memory_hot_unplug_supported(sms)) {
> >              spapr_memory_unplug_request(hotplug_dev, dev, errp);
> >          } else {
> > -            /* NOTE: this means there is a window after guest reset, p=
rior to
> > -             * CAS negotiation, where unplug requests will fail due to=
 the
> > -             * capability not being detected yet. This is a bit differ=
ent than
> > -             * the case with PCI unplug, where the events will be queu=
ed and
> > -             * eventually handled by the guest after boot
> > -             */
> >              error_setg(errp, "Memory hot unplug not supported for this=
 guest");
> >          }
> >      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_CPU_CORE)) {
> > @@ -4543,11 +4548,8 @@ DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
> >   */
> >  static void spapr_machine_5_2_class_options(MachineClass *mc)
> >  {
> > -    SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> > -
> >      spapr_machine_6_0_class_options(mc);
> >      compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_le=
n);
> > -    smc->pre_6_0_memory_unplug =3D true;
> >  }
> > =20
> >  DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
> > diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> > index 6aedd988b3d0..d51daedfa6e0 100644
> > --- a/hw/ppc/spapr_events.c
> > +++ b/hw/ppc/spapr_events.c
> > @@ -658,8 +658,7 @@ static void spapr_hotplug_req_event(uint8_t hp_id, =
uint8_t hp_action,
> >          /* we should not be using count_indexed value unless the guest
> >           * supports dedicated hotplug event source
> >           */
> > -        g_assert(!SPAPR_MACHINE_GET_CLASS(spapr)->pre_6_0_memory_unplu=
g ||
> > -                 spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT));
> > +        g_assert(spapr_memory_hot_unplug_supported(spapr));
> >          hp->drc_id.count_indexed.count =3D
> >              cpu_to_be32(drc_id->count_indexed.count);
> >          hp->drc_id.count_indexed.index =3D
> > diff --git a/hw/ppc/spapr_ovec.c b/hw/ppc/spapr_ovec.c
> > index dd003f1763fd..b2567caa5cf4 100644
> > --- a/hw/ppc/spapr_ovec.c
> > +++ b/hw/ppc/spapr_ovec.c
> > @@ -125,6 +125,13 @@ bool spapr_ovec_test(SpaprOptionVector *ov, long b=
itnr)
> >      return test_bit(bitnr, ov->bitmap) ? true : false;
> >  }
> > =20
> > +bool spapr_ovec_empty(SpaprOptionVector *ov)
> > +{
> > +    g_assert(ov);
> > +
> > +    return bitmap_empty(ov->bitmap, OV_MAXBITS);
> > +}
> > +
> >  static void guest_byte_to_bitmap(uint8_t entry, unsigned long *bitmap,
> >                                   long bitmap_offset)
> >  {
> > diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> > index 1cc19575f548..3ad2ff713279 100644
> > --- a/include/hw/ppc/spapr.h
> > +++ b/include/hw/ppc/spapr.h
> > @@ -142,7 +142,6 @@ struct SpaprMachineClass {
> >      hwaddr rma_limit;          /* clamp the RMA to this size */
> >      bool pre_5_1_assoc_refpoints;
> >      bool pre_5_2_numa_associativity;
> > -    bool pre_6_0_memory_unplug;
> > =20
> >      bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
> >                            uint64_t *buid, hwaddr *pio,=20
> > @@ -950,4 +949,5 @@ bool spapr_check_pagesize(SpaprMachineState *spapr,=
 hwaddr pagesize,
> > =20
> >  void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
> >  hwaddr spapr_get_rtas_addr(void);
> > +bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
> >  #endif /* HW_SPAPR_H */
> > diff --git a/include/hw/ppc/spapr_ovec.h b/include/hw/ppc/spapr_ovec.h
> > index d4dee9e06a01..48b716a060c2 100644
> > --- a/include/hw/ppc/spapr_ovec.h
> > +++ b/include/hw/ppc/spapr_ovec.h
> > @@ -71,6 +71,7 @@ void spapr_ovec_cleanup(SpaprOptionVector *ov);
> >  void spapr_ovec_set(SpaprOptionVector *ov, long bitnr);
> >  void spapr_ovec_clear(SpaprOptionVector *ov, long bitnr);
> >  bool spapr_ovec_test(SpaprOptionVector *ov, long bitnr);
> > +bool spapr_ovec_empty(SpaprOptionVector *ov);
> >  SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, in=
t vector);
> >  int spapr_dt_ovec(void *fdt, int fdt_offset,
> >                    SpaprOptionVector *ov, const char *name);
> >=20
> >=20
>=20


--Sig_/njlbZkkcINPOWt=Xk6VbYt7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAl//J2cACgkQcdTV5YIv
c9ZEDRAArFOiKp8sQOoLOnYo8BdcPV0uKlMnKV0KHktz31mOUFDho2J2lqeCzOq1
m42isd1fg0sbn6iu7At+HXa1QFO1G4ca+nX2eMax9xabj6uOltfH7apaLTtYGX3+
/JLbyufB1e8BBDxsBfmhJ7893HdLXfar6aKJinLD65i7RpqbY95FSBEEwHmB1iaB
6ysewnzVpfF6cYQ5hVIg8SlOSY9mpiJZMaGSsEEjTiQCAo2f3CrgR6uIR6qMpQjb
jqKgbZnLHlTaxEAqkm1hhQG3YefHdLDc7efLVtlJe5HLW5mr2qDQxsnZd/eRfNAO
CEQNGtjI3eX/qRwCYKjGj1/5UQ0iYd789sZvobpfm/LkGB/do+3bKyHfTkJpqsLv
efB5hNHyeBVLDWjzmGr2k/K9G27KGMj8RGng2qsgKJfHS2LyKiXOgsW4aSWUnPjB
cWv29TkQ7wWUFhps6FhIVWJmZXL6NINx9FSM4WxDRkNTxwcyczvQf+1rTXiZnsso
tkDTgdvRtF5EVt8j3O+TxhYSeRLPeNkna57KMQ+UQE3uFWSrP0VCZ15CB5QQab33
h2AmUrS+kosMMnOgyZ86agHixZhFf6lTT0gv4JfE2H4V30JZl8mK5vwuWmreG41M
FupTu0ol62NxAZmfwZfTR2abGcbFBDzynaZyTbM1KXz0S1YEWkI=
=FGfQ
-----END PGP SIGNATURE-----

--Sig_/njlbZkkcINPOWt=Xk6VbYt7--

