Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121812D4BB6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:26:33 +0100 (CET)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn62i-000395-4T
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:26:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kn611-0002VP-KX; Wed, 09 Dec 2020 15:24:47 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:58245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kn60x-0002XA-IY; Wed, 09 Dec 2020 15:24:47 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.118])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id CA6757936ACF;
 Wed,  9 Dec 2020 21:24:38 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 9 Dec 2020
 21:24:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002deedbacb-1fa8-47d2-a68c-62ab9f4b832f,
 661A724A132DD26A84B163D3BB90DC3732340046) smtp.auth=groug@kaod.org
Date: Wed, 9 Dec 2020 21:24:36 +0100
From: Greg Kurz <groug@kaod.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 1/6] spapr: Add an "spapr" property to sPAPR CPU core
Message-ID: <20201209212436.2f7a1b6f@bahia.lan>
In-Reply-To: <20201209182617.GV1289986@habkost.net>
References: <20201209170052.1431440-1-groug@kaod.org>
 <20201209170052.1431440-2-groug@kaod.org>
 <de3d6170-3e28-ce78-41a3-59eca3cb6b67@redhat.com>
 <20201209184225.1b544523@bahia.lan>
 <d0f7cde7-c550-4a6c-8730-c3422002516c@redhat.com>
 <b8474a48-5dcd-343e-ef29-531c628b2ff2@redhat.com>
 <20201209182617.GV1289986@habkost.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 486a93ca-eac9-4c3d-8d37-fbbabef40760
X-Ovh-Tracer-Id: 3640597349798222243
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejkedgudefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
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
Cc: qemu-ppc@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Dec 2020 13:26:17 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Wed, Dec 09, 2020 at 07:11:40PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> [...]
> > >>>> @@ -200,7 +199,7 @@ static void spapr_cpu_core_reset(DeviceState *=
dev)
> > >>>>      int i;
> > >>>> =20
> > >>>>      for (i =3D 0; i < cc->nr_threads; i++) {
> > >>>> -        spapr_reset_vcpu(sc->threads[i]);
> > >>>> +        spapr_reset_vcpu(sc->threads[i], sc->spapr);
> > >>>
> > >>> Why reset() needs access to the machine state, don't
> > >>> you have it in realize()?
> > >>>
> > >>
> > >> This is for the vCPU threads of the sPAPR CPU core. They don't have =
the
> > >> link to the machine state.
> > >=20
> > > They are created by spapr_create_vcpu() + spapr_realize_vcpu() in
> > > spapr_cpu_core_realize(), which has sc->spapr set... Am I missing
> > > something?
> >=20
> > Anyhow, from a QOM design point of view, resetfn() is not the correct
> > place to set a property IMHO, so Cc'ing Eduardo.
>=20
> This patch is not setting the property on resetfn(), it is
> setting it on CPU core pre_plug().
>=20
> This is more complex than simply using qdev_get_machine() and I
> don't see why it would be better, but I don't think it's wrong.
>=20

The reference to the machine state is basically needed to
setup/reset/teardown interrupt presenters in the IRQ chip
backend. It is a bit unfortunate to express this dependency
at realize(), reset() and unrealize(). Maybe having an
"irq_chip" property linked to the IRQ chip backend would
make more sense ?

