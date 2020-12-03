Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B60C2CD400
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 11:52:24 +0100 (CET)
Received: from localhost ([::1]:47798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmDn-0002nj-Er
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 05:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kkmC9-0002B6-Ec
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:50:41 -0500
Received: from 3.mo51.mail-out.ovh.net ([188.165.32.156]:40584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kkmC6-0000YH-85
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:50:41 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.52])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 71C3623F7F5;
 Thu,  3 Dec 2020 11:50:33 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 3 Dec 2020
 11:50:31 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001002f60cc-006b-4ca3-891d-1998aad55bf5,
 D4304C32AB1A6EF3B20A6066E8569460ED01B025) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Thu, 3 Dec 2020 11:50:30 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-6.0 v2 2/3] spapr/xive: Fix size of END table and
 number of claimed IPIs
Message-ID: <20201203115030.532d89d7@bahia.lan>
In-Reply-To: <b3292b6e-f1a4-40d1-ff8b-f43be8748dd6@kaod.org>
References: <20201130165258.744611-1-groug@kaod.org>
 <20201130165258.744611-3-groug@kaod.org>
 <ffc2ef57-e90f-7f07-650e-d85be0746c49@kaod.org>
 <b3292b6e-f1a4-40d1-ff8b-f43be8748dd6@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: dc5c5753-2889-4e3f-87c5-0f0fc086a5c4
X-Ovh-Tracer-Id: 14048979038103771616
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeiiedgvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtgfelhfeiheetjeejgeevgeelkeduveekheejudfgjefffeehueeukefgfffhgeenucffohhmrghinheplhgruhhntghhphgrugdrnhgvthenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=groug@kaod.org;
 helo=3.mo51.mail-out.ovh.net
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

On Thu, 3 Dec 2020 10:51:10 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 11/30/20 7:07 PM, C=C3=A9dric Le Goater wrote:
> > On 11/30/20 5:52 PM, Greg Kurz wrote:
> >> The sPAPR XIVE device has an internal ENDT table the size of
> >> which is configurable by the machine. This table is supposed
> >> to contain END structures for all possible vCPUs that may
> >> enter the guest. The machine must also claim IPIs for all
> >> possible vCPUs since this is expected by the guest.
> >>
> >> spapr_irq_init() takes care of that under the assumption that
> >> spapr_max_vcpu_ids() returns the number of possible vCPUs.
> >> This happens to be the case when the VSMT mode is set to match
> >> the number of threads per core in the guest (default behavior).
> >> With non-default VSMT settings, this limit is > to the number
> >> of vCPUs. In the worst case, we can end up allocating an 8 times
> >> bigger ENDT and claiming 8 times more IPIs than needed. But more
> >> importantly, this creates a confusion between number of vCPUs and
> >> vCPU ids, which can lead to subtle bugs like [1].
> >>
> >> Use smp.max_cpus instead of spapr_max_vcpu_ids() in
> >> spapr_irq_init() for the latest machine type. Older machine
> >> types continue to use spapr_max_vcpu_ids() since the size of
> >> the ENDT is migration visible.
> >>
> >> [1] https://bugs.launchpad.net/qemu/+bug/1900241
> >>
> >> Signed-off-by: Greg Kurz <groug@kaod.org>
> >=20
> >=20
> > Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
>=20
> I gave patch 2 and 3 a little more thinking.=20
>=20
> I don't think we need much more than patch 1 which clarifies the=20
> nature of the values being manipulated, quantities vs. numbering.
>=20
> The last 2 patches are adding complexity to try to optimize the=20
> XIVE VP space in a case scenario which is not very common (vSMT).=20
> May be it's not worth it.=20
>=20

Well, the motivation isn't about optimization really since
a non-default vSMT setting already wastes VP space because
of the vCPU spacing. This is more about not using values
with wrong semantics in the code to avoid confusion in
future changes.

I agree though that the extra complexity, especially the
compat crust, might be excessive. So maybe I should just
add comments in the code to clarify when we're using the
wrong semantics ?

> Today, we can start 4K (-2) KVM guests with 16 vCPUs each on=20
> a witherspoon (2 socket P9) and we are far from reaching the=20
> limits of the VP space. Available RAM is more a problem.=20
>=20
> VP space is even bigger on P10. The width was increased to 24bit=20
> per chip.
>=20
> C.


