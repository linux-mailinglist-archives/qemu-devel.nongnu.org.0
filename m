Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3D22C4011
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 13:28:29 +0100 (CET)
Received: from localhost ([::1]:39172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khtuM-0008Fm-7g
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 07:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1khtsH-0007AE-R4; Wed, 25 Nov 2020 07:26:17 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:56163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1khtsF-0004XM-Sf; Wed, 25 Nov 2020 07:26:17 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.173])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 75DD77543629;
 Wed, 25 Nov 2020 13:26:05 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 25 Nov
 2020 13:26:04 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004522fc838-181f-425b-a275-d1f117638e14,
 13817E1CA0648EB9EE095497159C33290D197662) smtp.auth=groug@kaod.org
Date: Wed, 25 Nov 2020 13:26:03 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-6.0 2/8] spapr/xive: Introduce spapr_xive_nr_ends()
Message-ID: <20201125132603.11a0c08e@bahia.lan>
In-Reply-To: <be6b856e-1517-eb77-ae27-80a851b78168@kaod.org>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-3-groug@kaod.org>
 <9da660d2-1969-a548-5092-7f645a610e6d@kaod.org>
 <20201123121635.65506f0c@bahia.lan>
 <e7a4b597-300a-6f9b-337e-507703dc4d35@kaod.org>
 <20201124180120.7a86f49c@bahia.lan>
 <353fd413-6c50-64ea-f2cf-24d42ee8010d@kaod.org>
 <20201125103337.4716b0d0@bahia.lan>
 <be6b856e-1517-eb77-ae27-80a851b78168@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 9b4adee6-cec4-4fe8-8f8a-2a6d00ce2cec
X-Ovh-Tracer-Id: 5574330442215692768
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehtddggeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
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

On Wed, 25 Nov 2020 12:34:25 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> =20
> >>> This complexifies migration because we have to guess at
> >>> post load if we should claim the IPI in KVM or not. The
> >>> simple presence of the vCPU isn't enough : we need to
> >>> guess if the guest actually configured the IPI or not.
> >>
> >> The EAT will be transferred from the source and the call to=20
> >> kvmppc_xive_source_reset_one() should initialize the KVM=20
> >> device correctly on the target for all interrupts.
> >>
> >=20
> > Except that the EAS appears as valid for all IPIs, even
> > though the source didn't claim them at the KVM level.=20
>=20
> why ? we would stop claiming IPIs in spapr_irq_init() and so
> they won't appear as being valid anymore, at boot time or
> restore time.
>=20

If we don't claim the IPIs in spapr_irq_init() anymore then
we must at least claim them on the path of H_INT_GET_SOURCE_INFO
otherwise it will fail with H_P2 and the guest won't even
try to setup the IPI. Even if we do that, we still have a
window where the source is valid in QEMU but not yet at
the KVM level.

>=20
> C.


