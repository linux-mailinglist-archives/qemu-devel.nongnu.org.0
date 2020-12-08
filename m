Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902AA2D2742
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 10:16:33 +0100 (CET)
Received: from localhost ([::1]:48748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmZ6m-0007Di-ND
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 04:16:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kmZ5C-0006co-FZ
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 04:14:54 -0500
Received: from 4.mo51.mail-out.ovh.net ([188.165.42.229]:49338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kmZ5A-0004tL-6v
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 04:14:54 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.7])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 3A529240DBC;
 Tue,  8 Dec 2020 10:06:21 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 8 Dec 2020
 10:06:10 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005fe8bf47e-cbb1-49aa-92bb-416239970c77,
 17D40A658B0D6C300559F39EE9B5E954A2DF46D1) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Tue, 8 Dec 2020 10:06:09 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH for-6.0] spapr: Allow memory unplug to always succeed
Message-ID: <20201208100609.5fcc604a@bahia.lan>
In-Reply-To: <20201208043004.GE2555@yekko.fritz.box>
References: <20201207133704.952459-1-groug@kaod.org>
 <20201208043004.GE2555@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NmXCFx8eODNYV3iugKJVIiY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 09b186b6-ff8f-4ea6-8a28-b52d3f48f2bb
X-Ovh-Tracer-Id: 4756645634320996829
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejhedguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtghisehgtderreertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelgffgfeeugedugeekveeiveevjeffhfduvdegffetkeeiveeufefgledtgfeiteenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=groug@kaod.org;
 helo=4.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/NmXCFx8eODNYV3iugKJVIiY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Dec 2020 15:30:04 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Dec 07, 2020 at 02:37:04PM +0100, Greg Kurz wrote:
> > It is currently impossible to hot-unplug a memory device between
> > machine reset and CAS.
> >=20
> > (qemu) device_del dimm1
> > Error: Memory hot unplug not supported for this guest
> >=20
> > This limitation was introduced in order to provide an explicit
> > error path for older guests that didn't support hot-plug event
> > sources (and thus memory hot-unplug).
> >=20
> > The linux kernel has been supporting these since 4.11. All recent
> > enough guests are thus capable of handling the removal of a memory
> > device at all time, including during early boot.
> >=20
> > Lift the limitation for the latest machine type. This means that
> > trying to unplug memory from a guest that doesn't support it will
> > likely just do nothing and the memory will only get removed at
> > next reboot. Such older guests can still get the existing behavior
> > by using an older machine type.
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
>=20
> Looks like this conflicts with something I've added to for-6.0
> recently.  Can you rebase and resend, please.
>=20

I'm not quite sure what for-6.0 you're talking about. Despite
you're recent announcement about moving to gitlab, it seems
that the branch at github is the most up to date.

gitlab:
- HEAD is "xive: Add trace events"
- Date: 26 Nov, 2020

github:
- HEAD is "MAINTAINERS: Add Greg Kurz as co-maintainer for ppc"
- Date: Dec 4, 2020

I've thus based this patch on github. Also, this is based on Connie's
"hw: add compat machines for 6.0" patch...

> > ---
> > Based-on: 20201109173928.1001764-1-cohuck@redhat.com

... maybe I should have made it more clear than just
mentioning the message id ?

I think I'll just wait for Connie's patch to get merged and I'll repost aft=
er
you've rebased ppc-for-6.0.

> > ---
> >  include/hw/ppc/spapr.h | 1 +
> >  hw/ppc/spapr.c         | 6 +++++-
> >  hw/ppc/spapr_events.c  | 3 ++-
> >  3 files changed, 8 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> > index b7ced9faebf5..7aa630350326 100644
> > --- a/include/hw/ppc/spapr.h
> > +++ b/include/hw/ppc/spapr.h
> > @@ -139,6 +139,7 @@ struct SpaprMachineClass {
> >      hwaddr rma_limit;          /* clamp the RMA to this size */
> >      bool pre_5_1_assoc_refpoints;
> >      bool pre_5_2_numa_associativity;
> > +    bool pre_6_0_memory_unplug;
> > =20
> >      bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
> >                            uint64_t *buid, hwaddr *pio,=20
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index 7e954bc84bed..f0b26b2af30d 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -4044,7 +4044,8 @@ static void spapr_machine_device_unplug_request(H=
otplugHandler *hotplug_dev,
> >      SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> > =20
> >      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > -        if (spapr_ovec_test(sms->ov5_cas, OV5_HP_EVT)) {
> > +        if (!smc->pre_6_0_memory_unplug ||
> > +            spapr_ovec_test(sms->ov5_cas, OV5_HP_EVT)) {
> >              spapr_memory_unplug_request(hotplug_dev, dev, errp);
> >          } else {
> >              /* NOTE: this means there is a window after guest reset, p=
rior to
> > @@ -4530,8 +4531,11 @@ DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
> >   */
> >  static void spapr_machine_5_2_class_options(MachineClass *mc)
> >  {
> > +    SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> > +
> >      spapr_machine_6_0_class_options(mc);
> >      compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_le=
n);
> > +    smc->pre_6_0_memory_unplug =3D true;
> >  }
> > =20
> >  DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
> > diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> > index 1add53547ec3..c30123177b16 100644
> > --- a/hw/ppc/spapr_events.c
> > +++ b/hw/ppc/spapr_events.c
> > @@ -659,7 +659,8 @@ static void spapr_hotplug_req_event(uint8_t hp_id, =
uint8_t hp_action,
> >          /* we should not be using count_indexed value unless the guest
> >           * supports dedicated hotplug event source
> >           */
> > -        g_assert(spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT));
> > +        g_assert(!SPAPR_MACHINE_GET_CLASS(spapr)->pre_6_0_memory_unplu=
g ||
> > +                 spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT));
> >          hp->drc_id.count_indexed.count =3D
> >              cpu_to_be32(drc_id->count_indexed.count);
> >          hp->drc_id.count_indexed.index =3D
>=20


--Sig_/NmXCFx8eODNYV3iugKJVIiY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAl/PQgEACgkQcdTV5YIv
c9bCvw//VTmV+g3PNMPvK9DdsXZKoIDXxwgamuymlMSLVeQHZU3zvnaKyxLqwsyh
jZV4oU9TiHE+RWw43TTPSf/wrMXiFS8PKXEsFJ9bOsJ8Roa4U0FBc/tW+8dmfCCs
Iwa9TURfPrARmJPAndPKajGR7VcmcrRBYenlgY2Ivgl/7RPy8j/GOQkXEB+taXXH
X0+7C3pD5XxBnW6RyeMJGitWqnBtVccpWuy3U9RGVzTLPac2vJE2zchwUlPyXolQ
046EqlRFEk40TOuMpWSV7iTuoey1ElpOyR1MIyBYTjNPK2k9oAwNdxMNs582V12s
i4/j++ehge3o03DVkrcP17GbWOk07gXWVzir/mF0gdqDr7Q482u3bE5p6igj68aX
J1G+2+l6xinnO9XAtMma0qhUK1LWQD5V/zLb4NAL9fNefckXpIYlRKJOVNUhajHJ
icLv27Z5UPcCvJo5pvzq3vyxn8haRrW9e03hNcIP5UzdKv5msC0Ye4nCHUTFALJs
gEiB5kr61lrDF79P5ypPDamYvm56eH+iGDZL1GtRMwWB13OJL26HCZX9572l+ij3
g1dkOtD/ESpHxSptBC6Q4OFH6jGb/inLgTIfte/52/0Ic1X9+iQsVlKzVVe1PGRZ
rIYsYa0dxx878e7bkjMnA7S9ikN5Q5aQCKhynK/V1Qbk/U6xLPY=
=EVTp
-----END PGP SIGNATURE-----

--Sig_/NmXCFx8eODNYV3iugKJVIiY--

