Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C293104F22
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 10:23:56 +0100 (CET)
Received: from localhost ([::1]:37786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXigt-0007Tx-6e
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 04:23:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34286)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iXifq-0006x3-3T
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 04:22:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iXifo-0007X8-RZ
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 04:22:50 -0500
Received: from 5.mo173.mail-out.ovh.net ([46.105.40.148]:40775)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iXifo-0007WI-Ik
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 04:22:48 -0500
Received: from player778.ha.ovh.net (unknown [10.108.35.211])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 21956123211
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 10:22:45 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player778.ha.ovh.net (Postfix) with ESMTPSA id 75D79C4CD941;
 Thu, 21 Nov 2019 09:22:40 +0000 (UTC)
Subject: Re: [PATCH for-5.0 v5 15/23] ppc/xive: Use the XiveFabric and
 XivePresenter interfaces
To: Greg Kurz <groug@kaod.org>
References: <20191115162436.30548-1-clg@kaod.org>
 <20191115162436.30548-16-clg@kaod.org> <20191120193001.5b9229a2@bahia.lan>
 <d03e9084-21e9-90ff-00d2-3c7f11b506c8@kaod.org>
 <20191121083042.190a038a@bahia.lan>
 <e2ff291d-4ec6-5f69-5ea6-5e0cccca1bc2@kaod.org>
 <20191121090801.766e129d@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a0e67a03-46d8-872a-7283-b7407f16d41f@kaod.org>
Date: Thu, 21 Nov 2019 10:22:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191121090801.766e129d@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 6297439655342672723
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudehvddgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.40.148
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

On 21/11/2019 09:08, Greg Kurz wrote:
> On Thu, 21 Nov 2019 08:40:32 +0100
> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>=20
>> On 21/11/2019 08:30, Greg Kurz wrote:
>>> On Thu, 21 Nov 2019 08:01:44 +0100
>>> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>>
>>>> On 20/11/2019 19:30, Greg Kurz wrote:
>>>>> On Fri, 15 Nov 2019 17:24:28 +0100
>>>>> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>>>>
>>>>>> Now that the machines have handlers implementing the XiveFabric an=
d
>>>>>> XivePresenter interfaces, remove xive_presenter_match() and make u=
se
>>>>>> of the 'match_nvt' handler of the machine.
>>>>>>
>>>>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>>>>> ---
>>>>>>  hw/intc/xive.c | 48 +++++++++++++++++----------------------------=
---
>>>>>>  1 file changed, 17 insertions(+), 31 deletions(-)
>>>>>>
>>>>>
>>>>> Nice diffstat :)
>>>>>
>>>>>> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
>>>>>> index 1c9e58f8deac..ab62bda85788 100644
>>>>>> --- a/hw/intc/xive.c
>>>>>> +++ b/hw/intc/xive.c
>>>>>> @@ -1423,30 +1423,6 @@ int xive_presenter_tctx_match(XivePresenter=
 *xptr, XiveTCTX *tctx,
>>>>>>      return -1;
>>>>>>  }
>>>>>> =20
>>>>>> -static bool xive_presenter_match(XiveRouter *xrtr, uint8_t format=
,
>>>>>> -                                 uint8_t nvt_blk, uint32_t nvt_id=
x,
>>>>>> -                                 bool cam_ignore, uint8_t priorit=
y,
>>>>>> -                                 uint32_t logic_serv, XiveTCTXMat=
ch *match)
>>>>>> -{
>>>>>> -    XivePresenter *xptr =3D XIVE_PRESENTER(xrtr);
>>>>>> -    XivePresenterClass *xpc =3D XIVE_PRESENTER_GET_CLASS(xptr);
>>>>>> -    int count;
>>>>>> -
>>>>>> -    count =3D xpc->match_nvt(xptr, format, nvt_blk, nvt_idx, cam_=
ignore,
>>>>>> -                           priority, logic_serv, match);
>>>>>> -    if (count < 0) {
>>>>>> -        return false;
>>>>>> -    }
>>>>>> -
>>>>>> -    if (!match->tctx) {
>>>>>> -        qemu_log_mask(LOG_UNIMP, "XIVE: NVT %x/%x is not dispatch=
ed\n",
>>>>>> -                      nvt_blk, nvt_idx);
>>>>>
>>>>> Maybe keep this trace...
>>>>
>>>> It's in spapr_xive_match_nvt() now.
>>>>
>>>
>>> Not really... spapr_xive_match_nvt() has a trace for the opposite cas=
e of duplicate
>>> matches:
>>
>> not that one. The one in spapr.c ... Yes I need to change the name.
>>
>=20
> ... and it seems I cannot memorize a change that was made by the
> previous patch :-\ Sorry for the noise.

np but this is problem for gdb ! Any suggestion on the name :=20

   spapr_match_nvt()=20

?
 =20
> With or without the !!count change:

I will add the !!=20

C.=20

>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
>=20
>> C.
>>
>>>
>>>             if (match->tctx) {
>>>                 qemu_log_mask(LOG_GUEST_ERROR, "XIVE: already found a=
 thread "
>>>                               "context NVT %x/%x\n", nvt_blk, nvt_idx=
);
>>>                 return -1;
>>>             }
>>>
>>>>>
>>>>>> -        return false;
>>>>>> -    }
>>>>>> -
>>>>>> -    return true;
>>>>>> -}
>>>>>> -
>>>>>>  /*
>>>>>>   * This is our simple Xive Presenter Engine model. It is merged i=
n the
>>>>>>   * Router as it does not require an extra object.
>>>>>> @@ -1462,22 +1438,32 @@ static bool xive_presenter_match(XiveRoute=
r *xrtr, uint8_t format,
>>>>>>   *
>>>>>>   * The parameters represent what is sent on the PowerBus
>>>>>>   */
>>>>>> -static bool xive_presenter_notify(XiveRouter *xrtr, uint8_t forma=
t,
>>>>>> +static bool xive_presenter_notify(uint8_t format,
>>>>>>                                    uint8_t nvt_blk, uint32_t nvt_i=
dx,
>>>>>>                                    bool cam_ignore, uint8_t priori=
ty,
>>>>>>                                    uint32_t logic_serv)
>>>>>>  {
>>>>>> +    XiveFabric *xfb =3D XIVE_FABRIC(qdev_get_machine());
>>>>>> +    XiveFabricClass *xfc =3D XIVE_FABRIC_GET_CLASS(xfb);
>>>>>>      XiveTCTXMatch match =3D { .tctx =3D NULL, .ring =3D 0 };
>>>>>> -    bool found;
>>>>>> +    int count;
>>>>>> =20
>>>>>> -    found =3D xive_presenter_match(xrtr, format, nvt_blk, nvt_idx=
, cam_ignore,
>>>>>> -                                 priority, logic_serv, &match);
>>>>>> -    if (found) {
>>>>>> +    /*
>>>>>> +     * Ask the machine to scan the interrupt controllers for a ma=
tch
>>>>>> +     */
>>>>>> +    count =3D xfc->match_nvt(xfb, format, nvt_blk, nvt_idx, cam_i=
gnore,
>>>>>> +                           priority, logic_serv, &match);
>>>>>> +    if (count < 0) {
>>>>>> +        return false;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* handle CPU exception delivery */
>>>>>> +    if (count) {
>>>>>>          ipb_update(&match.tctx->regs[match.ring], priority);
>>>>>>          xive_tctx_notify(match.tctx, match.ring);
>>>>>>      }
>>>>>
>>>>> ... in an else block here ^^ ?
>>>>>
>>>>>> =20
>>>>>> -    return found;
>>>>>> +    return count;
>>>>>
>>>>> Implicit cast is ok I guess, but !!count would ensure no paranoid
>>>>> compiler ever complains.
>>>>
>>>> yes.=20
>>>>
>>>> Thanks,
>>>>
>>>> C.
>>>>
>>>>
>>>>>
>>>>>>  }
>>>>>> =20
>>>>>>  /*
>>>>>> @@ -1590,7 +1576,7 @@ static void xive_router_end_notify(XiveRoute=
r *xrtr, uint8_t end_blk,
>>>>>>          return;
>>>>>>      }
>>>>>> =20
>>>>>> -    found =3D xive_presenter_notify(xrtr, format, nvt_blk, nvt_id=
x,
>>>>>> +    found =3D xive_presenter_notify(format, nvt_blk, nvt_idx,
>>>>>>                            xive_get_field32(END_W7_F0_IGNORE, end.=
w7),
>>>>>>                            priority,
>>>>>>                            xive_get_field32(END_W7_F1_LOG_SERVER_I=
D, end.w7));
>>>>>
>>>>
>>>
>>
>=20


