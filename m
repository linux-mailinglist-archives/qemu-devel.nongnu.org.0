Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8E0104C9D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 08:32:04 +0100 (CET)
Received: from localhost ([::1]:37236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXgwd-0000Kb-JQ
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 02:32:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47868)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iXgvU-0008Et-8P
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 02:30:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iXgvS-0005Kb-Vi
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 02:30:52 -0500
Received: from 3.mo177.mail-out.ovh.net ([46.105.36.172]:54466)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iXgvS-0005Jz-PM
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 02:30:50 -0500
Received: from player776.ha.ovh.net (unknown [10.108.57.245])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 689E7114A06
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 08:30:48 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player776.ha.ovh.net (Postfix) with ESMTPSA id 18271C54FF68;
 Thu, 21 Nov 2019 07:30:44 +0000 (UTC)
Date: Thu, 21 Nov 2019 08:30:42 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-5.0 v5 15/23] ppc/xive: Use the XiveFabric and
 XivePresenter interfaces
Message-ID: <20191121083042.190a038a@bahia.lan>
In-Reply-To: <d03e9084-21e9-90ff-00d2-3c7f11b506c8@kaod.org>
References: <20191115162436.30548-1-clg@kaod.org>
 <20191115162436.30548-16-clg@kaod.org>
 <20191120193001.5b9229a2@bahia.lan>
 <d03e9084-21e9-90ff-00d2-3c7f11b506c8@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 4406772235652340107
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudehuddguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.36.172
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

On Thu, 21 Nov 2019 08:01:44 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 20/11/2019 19:30, Greg Kurz wrote:
> > On Fri, 15 Nov 2019 17:24:28 +0100
> > C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >=20
> >> Now that the machines have handlers implementing the XiveFabric and
> >> XivePresenter interfaces, remove xive_presenter_match() and make use
> >> of the 'match_nvt' handler of the machine.
> >>
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >> ---
> >>  hw/intc/xive.c | 48 +++++++++++++++++-------------------------------
> >>  1 file changed, 17 insertions(+), 31 deletions(-)
> >>
> >=20
> > Nice diffstat :)
> >=20
> >> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> >> index 1c9e58f8deac..ab62bda85788 100644
> >> --- a/hw/intc/xive.c
> >> +++ b/hw/intc/xive.c
> >> @@ -1423,30 +1423,6 @@ int xive_presenter_tctx_match(XivePresenter *xp=
tr, XiveTCTX *tctx,
> >>      return -1;
> >>  }
> >> =20
> >> -static bool xive_presenter_match(XiveRouter *xrtr, uint8_t format,
> >> -                                 uint8_t nvt_blk, uint32_t nvt_idx,
> >> -                                 bool cam_ignore, uint8_t priority,
> >> -                                 uint32_t logic_serv, XiveTCTXMatch *=
match)
> >> -{
> >> -    XivePresenter *xptr =3D XIVE_PRESENTER(xrtr);
> >> -    XivePresenterClass *xpc =3D XIVE_PRESENTER_GET_CLASS(xptr);
> >> -    int count;
> >> -
> >> -    count =3D xpc->match_nvt(xptr, format, nvt_blk, nvt_idx, cam_igno=
re,
> >> -                           priority, logic_serv, match);
> >> -    if (count < 0) {
> >> -        return false;
> >> -    }
> >> -
> >> -    if (!match->tctx) {
> >> -        qemu_log_mask(LOG_UNIMP, "XIVE: NVT %x/%x is not dispatched\n=
",
> >> -                      nvt_blk, nvt_idx);
> >=20
> > Maybe keep this trace...
>=20
> It's in spapr_xive_match_nvt() now.
>=20

Not really... spapr_xive_match_nvt() has a trace for the opposite case of d=
uplicate
matches:

            if (match->tctx) {
                qemu_log_mask(LOG_GUEST_ERROR, "XIVE: already found a threa=
d "
                              "context NVT %x/%x\n", nvt_blk, nvt_idx);
                return -1;
            }

> >=20
> >> -        return false;
> >> -    }
> >> -
> >> -    return true;
> >> -}
> >> -
> >>  /*
> >>   * This is our simple Xive Presenter Engine model. It is merged in the
> >>   * Router as it does not require an extra object.
> >> @@ -1462,22 +1438,32 @@ static bool xive_presenter_match(XiveRouter *x=
rtr, uint8_t format,
> >>   *
> >>   * The parameters represent what is sent on the PowerBus
> >>   */
> >> -static bool xive_presenter_notify(XiveRouter *xrtr, uint8_t format,
> >> +static bool xive_presenter_notify(uint8_t format,
> >>                                    uint8_t nvt_blk, uint32_t nvt_idx,
> >>                                    bool cam_ignore, uint8_t priority,
> >>                                    uint32_t logic_serv)
> >>  {
> >> +    XiveFabric *xfb =3D XIVE_FABRIC(qdev_get_machine());
> >> +    XiveFabricClass *xfc =3D XIVE_FABRIC_GET_CLASS(xfb);
> >>      XiveTCTXMatch match =3D { .tctx =3D NULL, .ring =3D 0 };
> >> -    bool found;
> >> +    int count;
> >> =20
> >> -    found =3D xive_presenter_match(xrtr, format, nvt_blk, nvt_idx, ca=
m_ignore,
> >> -                                 priority, logic_serv, &match);
> >> -    if (found) {
> >> +    /*
> >> +     * Ask the machine to scan the interrupt controllers for a match
> >> +     */
> >> +    count =3D xfc->match_nvt(xfb, format, nvt_blk, nvt_idx, cam_ignor=
e,
> >> +                           priority, logic_serv, &match);
> >> +    if (count < 0) {
> >> +        return false;
> >> +    }
> >> +
> >> +    /* handle CPU exception delivery */
> >> +    if (count) {
> >>          ipb_update(&match.tctx->regs[match.ring], priority);
> >>          xive_tctx_notify(match.tctx, match.ring);
> >>      }
> >=20
> > ... in an else block here ^^ ?
> >=20
> >> =20
> >> -    return found;
> >> +    return count;
> >=20
> > Implicit cast is ok I guess, but !!count would ensure no paranoid
> > compiler ever complains.
>=20
> yes.=20
>=20
> Thanks,
>=20
> C.
>=20
>=20
> >=20
> >>  }
> >> =20
> >>  /*
> >> @@ -1590,7 +1576,7 @@ static void xive_router_end_notify(XiveRouter *x=
rtr, uint8_t end_blk,
> >>          return;
> >>      }
> >> =20
> >> -    found =3D xive_presenter_notify(xrtr, format, nvt_blk, nvt_idx,
> >> +    found =3D xive_presenter_notify(format, nvt_blk, nvt_idx,
> >>                            xive_get_field32(END_W7_F0_IGNORE, end.w7),
> >>                            priority,
> >>                            xive_get_field32(END_W7_F1_LOG_SERVER_ID, e=
nd.w7));
> >=20
>=20


