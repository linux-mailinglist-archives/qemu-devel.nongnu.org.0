Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8462C3C38
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 10:35:22 +0100 (CET)
Received: from localhost ([::1]:36656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khrCr-0006u5-Qd
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 04:35:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khrBK-000621-IO
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 04:33:46 -0500
Received: from 2.mo51.mail-out.ovh.net ([178.33.255.19]:52461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khrBH-0007DV-1w
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 04:33:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.186])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 02F5023CF2F;
 Wed, 25 Nov 2020 10:33:38 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 25 Nov
 2020 10:33:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005bc949051-a878-4425-aba2-0f49e18599dd,
 13817E1CA0648EB9EE095497159C33290D197662) smtp.auth=groug@kaod.org
Date: Wed, 25 Nov 2020 10:33:37 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-6.0 2/8] spapr/xive: Introduce spapr_xive_nr_ends()
Message-ID: <20201125103337.4716b0d0@bahia.lan>
In-Reply-To: <353fd413-6c50-64ea-f2cf-24d42ee8010d@kaod.org>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-3-groug@kaod.org>
 <9da660d2-1969-a548-5092-7f645a610e6d@kaod.org>
 <20201123121635.65506f0c@bahia.lan>
 <e7a4b597-300a-6f9b-337e-507703dc4d35@kaod.org>
 <20201124180120.7a86f49c@bahia.lan>
 <353fd413-6c50-64ea-f2cf-24d42ee8010d@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 6adcd8b0-45f5-4926-8363-bd2fe2678837
X-Ovh-Tracer-Id: 2662190330070931936
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehtddgtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.255.19; envelope-from=groug@kaod.org;
 helo=2.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Nov 2020 18:56:02 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

[...]

> >=20
> > I guess you're talking about KVM_DEV_XIVE_NR_SERVERS in
> > kvmppc_xive_connect() actually. We're currently passing
> > spapr_max_server_number() (vCPU id) but you might be
> > right.
> >=20
> > I need to re-read the story around VSMT and XIVE.
>=20
> ok. What we care about here, is a size to allocate the NVT block
> representing the vCPUs in HW. NVT ids are pushed in the thread=20
> contexts when the vCPUs are scheduled to run and looked for by=20
> the presenter when an interrupt is to be delivered.
>=20

Yeah, looking at the code again, I realize there was a confusion
when we added the possibility to size the NVT. This should not
depend on the vCPU id limnit as it is done today, it should just
be the maximum number of possible vCPUs (ie. smp.max_cpus).

[...]
> >=20
> > The difference here is that the guest doesn't claim IPIs. They are
> > supposedly pre-claimed in "ibm,xive-lisn-ranges". And this is actually
> > the case in QEMU.
>=20
> yes. That's what I want to change (for performance)
>=20

I understand the purpose of claiming the IPI from its associated
vCPU context. But this can only be done on a path where we have
both the vCPU id and the IPI ; kvmppc_xive_set_source_config()
looks like a good candidate to handle this for runtime and
post-load.

> > The IPI setup sequence in the guest is basically:
> > 1) grab a free irq from the bitmap, ie. "ibm,xive-lisn-ranges"
> > 2) calls H_INT_GET_SOURCE_INFO, ie. populate_irq_data()
> > 3) calls H_INT_SET_SOURCE_CONFIG, ie, configure_irq())
> >=20
> > If we want an IPI to be claimed by the appropriate vCPU, we
> > can only do this from under H_INT_SET_SOURCE_CONFIG. And
> > until the guest eventually configures the IPI, KVM and QEMU
> > are out of sync.
>=20
> Well, KVM doesn't know either how much PCI MSIs will be claimed.
> It all depends on the guest OS.=20
>=20

Yes but QEMU and KVM are always in sync for them. When the
guest calls the "ibm,change-msi" RTAS interface to get some
MSIs for a device, they are immediately claimed both in
QEMU and KVM.

> I don't think this is a problem to expose unclaimed interrupt
> numbers to the guest if they are IPIs. We can detect that
> easily with the range and claim the source at KVM level when=20
> it's configured or in h_int_get_source_info(). Talking of which,=20

We cannot claim the source at the KVM level from
H_INT_GET_SOURCE_INFO because we don't know about
the vCPU id here =3D> we can't do the run_on_cpu()
optimization.

> it might be good to have a KVM command to query the source=20
> characteristics on the host. I sent a patchset a while ago in=20
> that sense.
>=20
> > This complexifies migration because we have to guess at
> > post load if we should claim the IPI in KVM or not. The
> > simple presence of the vCPU isn't enough : we need to
> > guess if the guest actually configured the IPI or not.
>=20
> The EAT will be transferred from the source and the call to=20
> kvmppc_xive_source_reset_one() should initialize the KVM=20
> device correctly on the target for all interrupts.
>=20

Except that the EAS appears as valid for all IPIs, even
though the source didn't claim them at the KVM level. It
looks wrong to blindly restore all of them in post-load.

> >> All this to say, that we need to size better the range in the=20
> >> "ibm,xive-lisn-ranges" property if that's broken for vSMT.=20
> >>
> >=20
> > Sizing the range to smp.max_cpus as proposed in this series
> > is fine, no matter what the VSMT is.
>=20
> ok. That's a fix for spapr_irq_dt() then. And possibly, there=20
> is a similar one for KVM_DEV_XIVE_NR_SERVERS.
> =20

Yup.

> >> Then, I think the IPIs can be treated just like the PCI MSIs
> >> but they need to be claimed first. That's the ugly part.=20
> >>
> >=20
> > Yeah that's the big difference. For PCI MSIs, QEMU owns the
> > bitmap and the guest can claim (or release) a number of
> > MSIs the "ibm,change-msi" RTAS interface. There's no
> > such thing for IPIs : they are supposedly already claimed.
>=20
> IPIs are a bit special because there are no I/O devices to
> claim them. We could consider the vCPU has being the device.=20
> That was my first attempt but it was wrong since the OS is=20
> in charge of choosing an interrupt number for the IPI.=20
>=20
> >> Should we add a special check in h_int_set_source_config to
> >> deal with unclaimed IPIs that are being configured ?
> >>
> >=20
> > This is what my tentative fix does.
>=20
> I didn't understand the complexity of it, may be due to my
> patchset.
>=20
> You should try again :)
>=20

Will do when I've fixed the misuses of spapr_max_server_number().

> C.


