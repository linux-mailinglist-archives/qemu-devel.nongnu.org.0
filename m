Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B96D1037EA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 11:50:35 +0100 (CET)
Received: from localhost ([::1]:56074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXNZC-0007sr-5i
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 05:50:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59740)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iXNUZ-0004Ra-5X
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 05:45:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iXNUX-0006Oa-0K
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 05:45:46 -0500
Received: from 9.mo69.mail-out.ovh.net ([46.105.56.78]:58811)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iXNUV-0006FF-Eb
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 05:45:44 -0500
Received: from player732.ha.ovh.net (unknown [10.108.54.74])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 4BBE872A7B
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 11:45:36 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player732.ha.ovh.net (Postfix) with ESMTPSA id CF530C38123E;
 Wed, 20 Nov 2019 10:45:31 +0000 (UTC)
Subject: Re: [PATCH for-5.0 v5 09/23] ppc/xive: Implement the XivePresenter
 interface
To: Greg Kurz <groug@kaod.org>
References: <20191115162436.30548-1-clg@kaod.org>
 <20191115162436.30548-10-clg@kaod.org> <20191120111852.6bd519c2@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <625d0e83-671a-8d28-0b90-2f004bab30f7@kaod.org>
Date: Wed, 20 Nov 2019 11:45:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191120111852.6bd519c2@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 1823676377487018835
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudehtddgudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.56.78
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

On 20/11/2019 11:18, Greg Kurz wrote:
> On Fri, 15 Nov 2019 17:24:22 +0100
> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>=20
>> Each XIVE Router model, sPAPR and PowerNV, now implements the 'match_n=
vt'
>> handler of the XivePresenter QOM interface. This is simply moving code
>> and taking into account the new API.
>>
>> To be noted that the xive_router_get_tctx() helper is not used anymore
>> when doing CAM matching and will be removed later on after other chang=
es.
>>
>> The XIVE presenter model is still too simple for the PowerNV machine
>> and the CAM matching algo is not correct on multichip system. Subseque=
nt
>> patches will introduce more changes to scan all chips of the system.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/intc/pnv_xive.c   | 41 +++++++++++++++++++++++++++++++++++
>>  hw/intc/spapr_xive.c | 49 ++++++++++++++++++++++++++++++++++++++++++
>>  hw/intc/xive.c       | 51 ++++++-------------------------------------=
-
>>  3 files changed, 97 insertions(+), 44 deletions(-)
>>
>> diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
>> index a394331ddd6a..087cbfbaad48 100644
>> --- a/hw/intc/pnv_xive.c
>> +++ b/hw/intc/pnv_xive.c
>> @@ -372,6 +372,45 @@ static int pnv_xive_get_eas(XiveRouter *xrtr, uin=
t8_t blk, uint32_t idx,
>>      return pnv_xive_vst_read(xive, VST_TSEL_IVT, blk, idx, eas);
>>  }
>> =20
>> +static int pnv_xive_match_nvt(XivePresenter *xptr, uint8_t format,
>> +                              uint8_t nvt_blk, uint32_t nvt_idx,
>> +                              bool cam_ignore, uint8_t priority,
>> +                              uint32_t logic_serv, XiveTCTXMatch *mat=
ch)
>> +{
>> +    CPUState *cs;
>> +    int count =3D 0;
>> +
>> +    CPU_FOREACH(cs) {
>> +        PowerPCCPU *cpu =3D POWERPC_CPU(cs);
>> +        XiveTCTX *tctx =3D XIVE_TCTX(pnv_cpu_state(cpu)->intc);
>> +        int ring;
>> +
>=20
> I guess it's ok not to check tctx here because the powernv machine type
> doesn't support cpu hotplug.

patch 10 and patch 11 add some more changes in that area.

C.

>=20
> LGTM despite the non-strict CamelCase type :)
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
>=20
>> +        /*
>> +         * Check the thread context CAM lines and record matches.
>> +         */
>> +        ring =3D xive_presenter_tctx_match(xptr, tctx, format, nvt_bl=
k, nvt_idx,
>> +                                         cam_ignore, logic_serv);
>> +        /*
>> +         * Save the context and follow on to catch duplicates, that w=
e
>> +         * don't support yet.
>> +         */
>> +        if (ring !=3D -1) {
>> +            if (match->tctx) {
>> +                qemu_log_mask(LOG_GUEST_ERROR, "XIVE: already found a=
 "
>> +                              "thread context NVT %x/%x\n",
>> +                              nvt_blk, nvt_idx);
>> +                return -1;
>> +            }
>> +
>> +            match->ring =3D ring;
>> +            match->tctx =3D tctx;
>> +            count++;
>> +        }
>> +    }
>> +
>> +    return count;
>> +}
>> +
>>  static XiveTCTX *pnv_xive_get_tctx(XiveRouter *xrtr, CPUState *cs)
>>  {
>>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
>> @@ -1810,6 +1849,7 @@ static void pnv_xive_class_init(ObjectClass *kla=
ss, void *data)
>>      PnvXScomInterfaceClass *xdc =3D PNV_XSCOM_INTERFACE_CLASS(klass);
>>      XiveRouterClass *xrc =3D XIVE_ROUTER_CLASS(klass);
>>      XiveNotifierClass *xnc =3D XIVE_NOTIFIER_CLASS(klass);
>> +    XivePresenterClass *xpc =3D XIVE_PRESENTER_CLASS(klass);
>> =20
>>      xdc->dt_xscom =3D pnv_xive_dt_xscom;
>> =20
>> @@ -1825,6 +1865,7 @@ static void pnv_xive_class_init(ObjectClass *kla=
ss, void *data)
>>      xrc->get_tctx =3D pnv_xive_get_tctx;
>> =20
>>      xnc->notify =3D pnv_xive_notify;
>> +    xpc->match_nvt  =3D pnv_xive_match_nvt;
>>  };
>> =20
>>  static const TypeInfo pnv_xive_info =3D {
>> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
>> index 729246e906c9..bb3b2dfdb77f 100644
>> --- a/hw/intc/spapr_xive.c
>> +++ b/hw/intc/spapr_xive.c
>> @@ -405,6 +405,52 @@ static XiveTCTX *spapr_xive_get_tctx(XiveRouter *=
xrtr, CPUState *cs)
>>      return spapr_cpu_state(cpu)->tctx;
>>  }
>> =20
>> +static int spapr_xive_match_nvt(XivePresenter *xptr, uint8_t format,
>> +                                uint8_t nvt_blk, uint32_t nvt_idx,
>> +                                bool cam_ignore, uint8_t priority,
>> +                                uint32_t logic_serv, XiveTCTXMatch *m=
atch)
>> +{
>> +    CPUState *cs;
>> +    int count =3D 0;
>> +
>> +    CPU_FOREACH(cs) {
>> +        PowerPCCPU *cpu =3D POWERPC_CPU(cs);
>> +        XiveTCTX *tctx =3D spapr_cpu_state(cpu)->tctx;
>> +        int ring;
>> +
>> +        /*
>> +         * Skip partially initialized vCPUs. This can happen when
>> +         * vCPUs are hotplugged.
>> +         */
>> +        if (!tctx) {
>> +            continue;
>> +        }
>> +
>> +        /*
>> +         * Check the thread context CAM lines and record matches.
>> +         */
>> +        ring =3D xive_presenter_tctx_match(xptr, tctx, format, nvt_bl=
k, nvt_idx,
>> +                                         cam_ignore, logic_serv);
>> +        /*
>> +         * Save the matching thread interrupt context and follow on t=
o
>> +         * check for duplicates which are invalid.
>> +         */
>> +        if (ring !=3D -1) {
>> +            if (match->tctx) {
>> +                qemu_log_mask(LOG_GUEST_ERROR, "XIVE: already found a=
 thread "
>> +                              "context NVT %x/%x\n", nvt_blk, nvt_idx=
);
>> +                return -1;
>> +            }
>> +
>> +            match->ring =3D ring;
>> +            match->tctx =3D tctx;
>> +            count++;
>> +        }
>> +    }
>> +
>> +    return count;
>> +}
>> +
>>  static const VMStateDescription vmstate_spapr_xive_end =3D {
>>      .name =3D TYPE_SPAPR_XIVE "/end",
>>      .version_id =3D 1,
>> @@ -684,6 +730,7 @@ static void spapr_xive_class_init(ObjectClass *kla=
ss, void *data)
>>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>>      XiveRouterClass *xrc =3D XIVE_ROUTER_CLASS(klass);
>>      SpaprInterruptControllerClass *sicc =3D SPAPR_INTC_CLASS(klass);
>> +    XivePresenterClass *xpc =3D XIVE_PRESENTER_CLASS(klass);
>> =20
>>      dc->desc    =3D "sPAPR XIVE Interrupt Controller";
>>      dc->props   =3D spapr_xive_properties;
>> @@ -708,6 +755,8 @@ static void spapr_xive_class_init(ObjectClass *kla=
ss, void *data)
>>      sicc->print_info =3D spapr_xive_print_info;
>>      sicc->dt =3D spapr_xive_dt;
>>      sicc->post_load =3D spapr_xive_post_load;
>> +
>> +    xpc->match_nvt  =3D spapr_xive_match_nvt;
>>  }
>> =20
>>  static const TypeInfo spapr_xive_info =3D {
>> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
>> index 344bb3f3bc4b..da6196ca958f 100644
>> --- a/hw/intc/xive.c
>> +++ b/hw/intc/xive.c
>> @@ -1428,51 +1428,14 @@ static bool xive_presenter_match(XiveRouter *x=
rtr, uint8_t format,
>>                                   bool cam_ignore, uint8_t priority,
>>                                   uint32_t logic_serv, XiveTCTXMatch *=
match)
>>  {
>> -    CPUState *cs;
>> +    XivePresenter *xptr =3D XIVE_PRESENTER(xrtr);
>> +    XivePresenterClass *xpc =3D XIVE_PRESENTER_GET_CLASS(xptr);
>> +    int count;
>> =20
>> -    /*
>> -     * TODO (PowerNV): handle chip_id overwrite of block field for
>> -     * hardwired CAM compares
>> -     */
>> -
>> -    CPU_FOREACH(cs) {
>> -        XiveTCTX *tctx =3D xive_router_get_tctx(xrtr, cs);
>> -        int ring;
>> -
>> -        /*
>> -         * Skip partially initialized vCPUs. This can happen when
>> -         * vCPUs are hotplugged.
>> -         */
>> -        if (!tctx) {
>> -            continue;
>> -        }
>> -
>> -        /*
>> -         * HW checks that the CPU is enabled in the Physical Thread
>> -         * Enable Register (PTER).
>> -         */
>> -
>> -        /*
>> -         * Check the thread context CAM lines and record matches. We
>> -         * will handle CPU exception delivery later
>> -         */
>> -        ring =3D xive_presenter_tctx_match(XIVE_PRESENTER(xrtr), tctx=
, format,
>> -                                         nvt_blk, nvt_idx,
>> -                                         cam_ignore, logic_serv);
>> -        /*
>> -         * Save the context and follow on to catch duplicates, that w=
e
>> -         * don't support yet.
>> -         */
>> -        if (ring !=3D -1) {
>> -            if (match->tctx) {
>> -                qemu_log_mask(LOG_GUEST_ERROR, "XIVE: already found a=
 thread "
>> -                              "context NVT %x/%x\n", nvt_blk, nvt_idx=
);
>> -                return false;
>> -            }
>> -
>> -            match->ring =3D ring;
>> -            match->tctx =3D tctx;
>> -        }
>> +    count =3D xpc->match_nvt(xptr, format, nvt_blk, nvt_idx, cam_igno=
re,
>> +                           priority, logic_serv, match);
>> +    if (count < 0) {
>> +        return false;
>>      }
>> =20
>>      if (!match->tctx) {
>=20


