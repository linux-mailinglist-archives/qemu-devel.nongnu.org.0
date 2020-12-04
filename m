Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4082CEA89
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 10:13:42 +0100 (CET)
Received: from localhost ([::1]:36424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl79p-0004xE-54
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 04:13:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kl78F-0004ME-TH; Fri, 04 Dec 2020 04:12:03 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:54003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kl78E-0002Wu-0D; Fri, 04 Dec 2020 04:12:03 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6E2CC714F377;
 Fri,  4 Dec 2020 10:11:57 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 4 Dec 2020
 10:11:56 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001eb14436e-e25b-444d-b43f-f0ef48395fc1,
 977776E1094EFD99122EFBBE6561ABC933400753) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Fri, 4 Dec 2020 10:11:55 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-6.0 v2 2/3] spapr/xive: Fix size of END table and
 number of claimed IPIs
Message-ID: <20201204101155.509969df@bahia.lan>
In-Reply-To: <94ebf767-0a60-7faf-ddf5-b141b6722807@kaod.org>
References: <20201130165258.744611-1-groug@kaod.org>
 <20201130165258.744611-3-groug@kaod.org>
 <ffc2ef57-e90f-7f07-650e-d85be0746c49@kaod.org>
 <b3292b6e-f1a4-40d1-ff8b-f43be8748dd6@kaod.org>
 <20201203115030.532d89d7@bahia.lan>
 <94ebf767-0a60-7faf-ddf5-b141b6722807@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: dbb5db2c-90a9-405d-8d6b-c9be58f2c2e0
X-Ovh-Tracer-Id: 18256466990982863328
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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

On Fri, 4 Dec 2020 09:46:31 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> >> I don't think we need much more than patch 1 which clarifies the=20
> >> nature of the values being manipulated, quantities vs. numbering.
> >>
> >> The last 2 patches are adding complexity to try to optimize the=20
> >> XIVE VP space in a case scenario which is not very common (vSMT).=20
> >> May be it's not worth it.=20
> >>
> >=20
> > Well, the motivation isn't about optimization really since
> > a non-default vSMT setting already wastes VP space because
> > of the vCPU spacing.=20
>=20
> I don't see any VPs being wasted when not using vSMT. What's
> your command line ?
>=20

I think there's confusion here. VSMT is always being used.
When you don't specify it on the command line, the machine
code sets it internally for you to be equal to the number
of threads/core of the guest. Thanks to that, you get
consecutive vCPU ids and no VP waste. Of course, you
get the same result if you do:

-M pseries,vsmt=3DN -smp threads=3DN

If you pass different values to vsmt and threads, though,
you get the spacing and the VP waste.

> > This is more about not using values
> > with wrong semantics in the code to avoid confusion in
> > future changes.
>=20
> yes.
>=20
> > I agree though that the extra complexity, especially the
> > compat crust, might be excessive.=20
>=20
> It's nice and correct but it seems a bit like extra noise=20
> if the default case is not wasting VPs. Let's check that=20
> first.=20
>=20
> > So maybe I should just
> > add comments in the code to clarify when we're using the
> > wrong semantics ?
>=20
> yes. I think this is enough.
>=20

I'll do this in v3 then.

> Thanks,
>=20
> C.


