Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D866104FD7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 10:57:25 +0100 (CET)
Received: from localhost ([::1]:38044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXjDI-00044h-En
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 04:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iXjCO-0003aS-9I
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 04:56:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iXjCM-0008Ic-PL
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 04:56:28 -0500
Received: from 9.mo68.mail-out.ovh.net ([46.105.78.111]:39272)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iXjCM-0008Fj-Hg
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 04:56:26 -0500
Received: from player746.ha.ovh.net (unknown [10.108.57.150])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 2215F14D6BE
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 10:56:23 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id E068EC74CF30;
 Thu, 21 Nov 2019 09:56:19 +0000 (UTC)
Date: Thu, 21 Nov 2019 10:56:18 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-5.0 v5 15/23] ppc/xive: Use the XiveFabric and
 XivePresenter interfaces
Message-ID: <20191121105618.54486052@bahia.lan>
In-Reply-To: <a0e67a03-46d8-872a-7283-b7407f16d41f@kaod.org>
References: <20191115162436.30548-1-clg@kaod.org>
 <20191115162436.30548-16-clg@kaod.org>
 <20191120193001.5b9229a2@bahia.lan>
 <d03e9084-21e9-90ff-00d2-3c7f11b506c8@kaod.org>
 <20191121083042.190a038a@bahia.lan>
 <e2ff291d-4ec6-5f69-5ea6-5e0cccca1bc2@kaod.org>
 <20191121090801.766e129d@bahia.lan>
 <a0e67a03-46d8-872a-7283-b7407f16d41f@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 6865456161204377995
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudehvddgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqfedtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeegiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.78.111
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

On Thu, 21 Nov 2019 10:22:38 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 21/11/2019 09:08, Greg Kurz wrote:
> > On Thu, 21 Nov 2019 08:40:32 +0100
> > C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >=20
> >> On 21/11/2019 08:30, Greg Kurz wrote:
> >>> On Thu, 21 Nov 2019 08:01:44 +0100
> >>> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >>>
> >>>> On 20/11/2019 19:30, Greg Kurz wrote:
> >>>>> On Fri, 15 Nov 2019 17:24:28 +0100
> >>>>> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >>>>>
> >>>>>> Now that the machines have handlers implementing the XiveFabric and
> >>>>>> XivePresenter interfaces, remove xive_presenter_match() and make u=
se
> >>>>>> of the 'match_nvt' handler of the machine.
> >>>>>>
> >>>>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >>>>>> ---
> >>>>>>  hw/intc/xive.c | 48 +++++++++++++++++----------------------------=
---
> >>>>>>  1 file changed, 17 insertions(+), 31 deletions(-)
> >>>>>>
> >>>>>
> >>>>> Nice diffstat :)
> >>>>>
> >>>>>> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> >>>>>> index 1c9e58f8deac..ab62bda85788 100644
> >>>>>> --- a/hw/intc/xive.c
> >>>>>> +++ b/hw/intc/xive.c
> >>>>>> @@ -1423,30 +1423,6 @@ int xive_presenter_tctx_match(XivePresenter=
 *xptr, XiveTCTX *tctx,
> >>>>>>      return -1;
> >>>>>>  }
> >>>>>> =20
> >>>>>> -static bool xive_presenter_match(XiveRouter *xrtr, uint8_t format,
> >>>>>> -                                 uint8_t nvt_blk, uint32_t nvt_id=
x,
> >>>>>> -                                 bool cam_ignore, uint8_t priorit=
y,
> >>>>>> -                                 uint32_t logic_serv, XiveTCTXMat=
ch *match)
> >>>>>> -{
> >>>>>> -    XivePresenter *xptr =3D XIVE_PRESENTER(xrtr);
> >>>>>> -    XivePresenterClass *xpc =3D XIVE_PRESENTER_GET_CLASS(xptr);
> >>>>>> -    int count;
> >>>>>> -
> >>>>>> -    count =3D xpc->match_nvt(xptr, format, nvt_blk, nvt_idx, cam_=
ignore,
> >>>>>> -                           priority, logic_serv, match);
> >>>>>> -    if (count < 0) {
> >>>>>> -        return false;
> >>>>>> -    }
> >>>>>> -
> >>>>>> -    if (!match->tctx) {
> >>>>>> -        qemu_log_mask(LOG_UNIMP, "XIVE: NVT %x/%x is not dispatch=
ed\n",
> >>>>>> -                      nvt_blk, nvt_idx);
> >>>>>
> >>>>> Maybe keep this trace...
> >>>>
> >>>> It's in spapr_xive_match_nvt() now.
> >>>>
> >>>
> >>> Not really... spapr_xive_match_nvt() has a trace for the opposite cas=
e of duplicate
> >>> matches:
> >>
> >> not that one. The one in spapr.c ... Yes I need to change the name.
> >>
> >=20
> > ... and it seems I cannot memorize a change that was made by the
> > previous patch :-\ Sorry for the noise.
>=20
> np but this is problem for gdb ! Any suggestion on the name :=20
>=20
>    spapr_match_nvt()=20
>=20

I guess having nvt in the name is enough to identify this as
a XIVE related function. It's ok for me.

BTW, the same problem exists in powernv:

$ git grep pnv_xive_match_nvt
hw/intc/pnv_xive.c:static int pnv_xive_match_nvt(XivePresenter *xptr, uint8=
_t format,
hw/intc/pnv_xive.c:    xpc->match_nvt  =3D pnv_xive_match_nvt;
hw/ppc/pnv.c:static int pnv_xive_match_nvt(XiveFabric *xfb, uint8_t format,
hw/ppc/pnv.c:    xfc->match_nvt =3D pnv_xive_match_nvt;

> ?
>  =20
> > With or without the !!count change:
>=20
> I will add the !!=20
>=20
> C.=20
>=20
> >=20
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> >=20
> >> C.
> >>
> >>>
> >>>             if (match->tctx) {
> >>>                 qemu_log_mask(LOG_GUEST_ERROR, "XIVE: already found a=
 thread "
> >>>                               "context NVT %x/%x\n", nvt_blk, nvt_idx=
);
> >>>                 return -1;
> >>>             }
> >>>
> >>>>>
> >>>>>> -        return false;
> >>>>>> -    }
> >>>>>> -
> >>>>>> -    return true;
> >>>>>> -}
> >>>>>> -
> >>>>>>  /*
> >>>>>>   * This is our simple Xive Presenter Engine model. It is merged i=
n the
> >>>>>>   * Router as it does not require an extra object.
> >>>>>> @@ -1462,22 +1438,32 @@ static bool xive_presenter_match(XiveRoute=
r *xrtr, uint8_t format,
> >>>>>>   *
> >>>>>>   * The parameters represent what is sent on the PowerBus
> >>>>>>   */
> >>>>>> -static bool xive_presenter_notify(XiveRouter *xrtr, uint8_t forma=
t,
> >>>>>> +static bool xive_presenter_notify(uint8_t format,
> >>>>>>                                    uint8_t nvt_blk, uint32_t nvt_i=
dx,
> >>>>>>                                    bool cam_ignore, uint8_t priori=
ty,
> >>>>>>                                    uint32_t logic_serv)
> >>>>>>  {
> >>>>>> +    XiveFabric *xfb =3D XIVE_FABRIC(qdev_get_machine());
> >>>>>> +    XiveFabricClass *xfc =3D XIVE_FABRIC_GET_CLASS(xfb);
> >>>>>>      XiveTCTXMatch match =3D { .tctx =3D NULL, .ring =3D 0 };
> >>>>>> -    bool found;
> >>>>>> +    int count;
> >>>>>> =20
> >>>>>> -    found =3D xive_presenter_match(xrtr, format, nvt_blk, nvt_idx=
, cam_ignore,
> >>>>>> -                                 priority, logic_serv, &match);
> >>>>>> -    if (found) {
> >>>>>> +    /*
> >>>>>> +     * Ask the machine to scan the interrupt controllers for a ma=
tch
> >>>>>> +     */
> >>>>>> +    count =3D xfc->match_nvt(xfb, format, nvt_blk, nvt_idx, cam_i=
gnore,
> >>>>>> +                           priority, logic_serv, &match);
> >>>>>> +    if (count < 0) {
> >>>>>> +        return false;
> >>>>>> +    }
> >>>>>> +
> >>>>>> +    /* handle CPU exception delivery */
> >>>>>> +    if (count) {
> >>>>>>          ipb_update(&match.tctx->regs[match.ring], priority);
> >>>>>>          xive_tctx_notify(match.tctx, match.ring);
> >>>>>>      }
> >>>>>
> >>>>> ... in an else block here ^^ ?
> >>>>>
> >>>>>> =20
> >>>>>> -    return found;
> >>>>>> +    return count;
> >>>>>
> >>>>> Implicit cast is ok I guess, but !!count would ensure no paranoid
> >>>>> compiler ever complains.
> >>>>
> >>>> yes.=20
> >>>>
> >>>> Thanks,
> >>>>
> >>>> C.
> >>>>
> >>>>
> >>>>>
> >>>>>>  }
> >>>>>> =20
> >>>>>>  /*
> >>>>>> @@ -1590,7 +1576,7 @@ static void xive_router_end_notify(XiveRoute=
r *xrtr, uint8_t end_blk,
> >>>>>>          return;
> >>>>>>      }
> >>>>>> =20
> >>>>>> -    found =3D xive_presenter_notify(xrtr, format, nvt_blk, nvt_id=
x,
> >>>>>> +    found =3D xive_presenter_notify(format, nvt_blk, nvt_idx,
> >>>>>>                            xive_get_field32(END_W7_F0_IGNORE, end.=
w7),
> >>>>>>                            priority,
> >>>>>>                            xive_get_field32(END_W7_F1_LOG_SERVER_I=
D, end.w7));
> >>>>>
> >>>>
> >>>
> >>
> >=20
>=20


