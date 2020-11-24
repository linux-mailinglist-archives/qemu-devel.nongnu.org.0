Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA4E2C2E0F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:10:43 +0100 (CET)
Received: from localhost ([::1]:54644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khbpy-0000Le-N4
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1khbhB-0000CC-BF; Tue, 24 Nov 2020 12:01:37 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:51143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1khbh2-0007ad-MB; Tue, 24 Nov 2020 12:01:36 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.68])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1630E6E99617;
 Tue, 24 Nov 2020 18:01:21 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 24 Nov
 2020 18:01:21 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005ac311be1-a345-468b-81e6-f0005f8937a3,
 886B3C846F729F79F342FB8F3892F62368E4F687) smtp.auth=groug@kaod.org
Date: Tue, 24 Nov 2020 18:01:20 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-6.0 2/8] spapr/xive: Introduce spapr_xive_nr_ends()
Message-ID: <20201124180120.7a86f49c@bahia.lan>
In-Reply-To: <e7a4b597-300a-6f9b-337e-507703dc4d35@kaod.org>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-3-groug@kaod.org>
 <9da660d2-1969-a548-5092-7f645a610e6d@kaod.org>
 <20201123121635.65506f0c@bahia.lan>
 <e7a4b597-300a-6f9b-337e-507703dc4d35@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: bc3728d3-4055-4a88-af76-6933e58622d5
X-Ovh-Tracer-Id: 4350758718038252000
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegkedgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedvueekgfffjedufeegfeduffffieetteeghfdttefgtdfhgeeuvedvieefkeetffenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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

On Tue, 24 Nov 2020 14:54:38 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 11/23/20 12:16 PM, Greg Kurz wrote:
> > On Mon, 23 Nov 2020 10:46:38 +0100
> > C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >=20
> >> On 11/20/20 6:46 PM, Greg Kurz wrote:
> >>> We're going to kill the "nr_ends" field in a subsequent patch.
> >>
> >> why ? it is one of the tables of the controller and its part of=20
> >> the main XIVE concepts. Conceptually, we could let the machine=20
> >> dimension it with an arbitrary value as OPAL does. The controller
> >> would fail when the table is fully used.=20
> >>
> >=20
> > The idea is that the sPAPR machine only true need is to create a
> > controller that can accommodate up to a certain number of vCPU ids.
> > It doesn't really to know about the END itself IMHO.>=20
> > This being said, if we decide to pass both spapr_max_server_number()
> > and smp.max_cpus down to the backends as function arguments, we won't
> > have to change "nr_ends" at all.
>=20
> I would prefer that but I am still not sure what they represent.=20
>=20
> Looking at the sPAPR XIVE code, we deal with numbers/ranges in the=20
> following places today.
>=20
>  * spapr_xive_dt()=20
>=20
>    It defines a range of interrupt numbers to be used by the guest=20
>    for the threads/vCPUs IPIs. It's a subset of interrupt numbers=20
>    in :
>=20
> 		[ SPAPR_IRQ_IPI - SPAPR_IRQ_EPOW [
>=20
>    These are not vCPU ids.
>=20
>    Since these interrupt numbers will be considered as free to use
>    by the OS, it makes sense to pre-claim them. But claiming an=20
>    interrupt number in the guest can potentially set up, through=20
>    the KVM device, a mapping on the host and in HW. See below why
>    this can be a problem.
>=20
>  * kvmppc_xive_cpu_connect()  =20
>=20
>    This sizes the NVT tables in OPAL for the guest. This is the =20
>    max number of vCPUs of the guest (not vCPU ids)
>=20

I guess you're talking about KVM_DEV_XIVE_NR_SERVERS in
kvmppc_xive_connect() actually. We're currently passing
spapr_max_server_number() (vCPU id) but you might be
right.

I need to re-read the story around VSMT and XIVE.

commit 1e175d2e07c71d9574f5b1c74523abca54e2654f
Author: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date:   Wed Jul 25 16:12:02 2018 +1000

    KVM: PPC: Book3S HV: Pack VCORE IDs to access full VCPU ID space

>  * spapr_irq_init()
>=20
>    This is where the IPI interrupt numbers are claimed today.=20
>    Directly in QEMU and KVM, if the machine is running XIVE only,=20
>    indirectly if it's dual, first in QEMU and then in KVM when=20
>    the machine switches of interrupt mode in CAS.=20
>=20
>    The problem is that the underlying XIVE resources in HW are=20
>    allocated where the QEMU process is running. Which is not the
>    best option when the vCPUs are pinned on different chips.
>=20
>    My patchset was trying to improve that by claiming the IPI on=20
>    demand when the vCPU is connected to the KVM device. But it=20
>    was using the vCPU id as the IPI interrupt number which is=20
>    utterly wrong, the guest OS could use any number in the range=20
>    exposed in the DT.
>   =20
>    The last patch you sent was going in the right direction I think.
>    That is to claim the IPI when the guest OS is requesting for it.=20
>=20
>    http://patchwork.ozlabs.org/project/qemu-devel/patch/160528045027.8045=
22.6161091782230763832.stgit@bahia.lan/
>   =20
>    But I don't understand why it was so complex. It should be like
>    the MSIs claimed by PCI devices.
>=20

The difference here is that the guest doesn't claim IPIs. They are
supposedly pre-claimed in "ibm,xive-lisn-ranges". And this is actually
the case in QEMU.

The IPI setup sequence in the guest is basically:
1) grab a free irq from the bitmap, ie. "ibm,xive-lisn-ranges"
2) calls H_INT_GET_SOURCE_INFO, ie. populate_irq_data()
3) calls H_INT_SET_SOURCE_CONFIG, ie, configure_irq())

If we want an IPI to be claimed by the appropriate vCPU, we
can only do this from under H_INT_SET_SOURCE_CONFIG. And
until the guest eventually configures the IPI, KVM and QEMU
are out of sync.

This complexifies migration because we have to guess at
post load if we should claim the IPI in KVM or not. The
simple presence of the vCPU isn't enough : we need to
guess if the guest actually configured the IPI or not.

>=20
> All this to say, that we need to size better the range in the=20
> "ibm,xive-lisn-ranges" property if that's broken for vSMT.=20
>=20

Sizing the range to smp.max_cpus as proposed in this series
is fine, no matter what the VSMT is.

> Then, I think the IPIs can be treated just like the PCI MSIs
> but they need to be claimed first. That's the ugly part.=20
>=20

Yeah that's the big difference. For PCI MSIs, QEMU owns the
bitmap and the guest can claim (or release) a number of
MSIs the "ibm,change-msi" RTAS interface. There's no
such thing for IPIs : they are supposedly already claimed.

> Should we add a special check in h_int_set_source_config to
> deal with unclaimed IPIs that are being configured ?
>=20

This is what my tentative fix does.

>=20
> C.


