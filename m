Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF36813F1C1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 19:31:21 +0100 (CET)
Received: from localhost ([::1]:46802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is9vM-0007Bq-SH
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 13:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37309)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1is9tP-0005yl-NQ
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 13:29:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1is9tL-0007yg-T5
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 13:29:19 -0500
Received: from 2.mo3.mail-out.ovh.net ([46.105.75.36]:34382)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1is9tL-0007x6-M7
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 13:29:15 -0500
Received: from player695.ha.ovh.net (unknown [10.108.16.72])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 548A123CCC2
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 19:29:13 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player695.ha.ovh.net (Postfix) with ESMTPSA id 77B3BE31553E;
 Thu, 16 Jan 2020 18:29:03 +0000 (UTC)
Date: Thu, 16 Jan 2020 19:29:02 +0100
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] spapr: Migrate CAS reboot flag
Message-ID: <20200116192902.63674769@bahia.lan>
In-Reply-To: <20200116131435.3985e86e@bahia.lan>
References: <157911051688.345768.16136592081655557565.stgit@bahia.lan>
 <ed2df775-b4d5-4ea7-ccf6-637c037f897b@redhat.com>
 <20200116094848.555c170d@bahia.lan>
 <2dda458a-dfa1-ab23-4a97-d27d9266226b@redhat.com>
 <20200116131435.3985e86e@bahia.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 12355907053416519974
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrtdehgdduudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqfedtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.75.36
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
Cc: Lukas Doktor <ldoktor@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Jan 2020 13:14:35 +0100
Greg Kurz <groug@kaod.org> wrote:

> On Thu, 16 Jan 2020 11:37:24 +0100
> Laurent Vivier <lvivier@redhat.com> wrote:
>=20
> > On 16/01/2020 09:48, Greg Kurz wrote:
> > > On Wed, 15 Jan 2020 19:10:37 +0100
> > > Laurent Vivier <lvivier@redhat.com> wrote:
> > >=20
> > >> Hi,
> > >>
> > >> On 15/01/2020 18:48, Greg Kurz wrote:
> > >>> Migration can potentially race with CAS reboot. If the migration th=
read
> > >>> completes migration after CAS has set spapr->cas_reboot but before =
the
> > >>> mainloop could pick up the reset request and reset the machine, the
> > >>> guest is migrated unrebooted and the destination doesn't reboot it
> > >>> either because it isn't aware a CAS reboot was needed (eg, because a
> > >>> device was added before CAS). This likely result in a broken or hung
> > >>> guest.
> > >>>
> > >>> Even if it is small, the window between CAS and CAS reboot is enoug=
h to
> > >>> re-qualify spapr->cas_reboot as state that we should migrate. Add a=
 new
> > >>> subsection for that and always send it when a CAS reboot is pending.
> > >>> This may cause migration to older QEMUs to fail but it is still bet=
ter
> > >>> than end up with a broken guest.
> > >>>
> > >>> The destination cannot honour the CAS reboot request from a post lo=
ad
> > >>> handler because this must be done after the guest is fully restored.
> > >>> It is thus done from a VM change state handler.
> > >>>
> > >>> Reported-by: Luk=C3=A1=C5=A1 Doktor <ldoktor@redhat.com>
> > >>> Signed-off-by: Greg Kurz <groug@kaod.org>
> > >>> ---
> > >>>
> > >>
> > >> I'm wondering if the problem can be related with the fact that
> > >> main_loop_should_exit() could release qemu_global_mutex in
> > >> pause_all_vcpus() in the reset case?
> > >>
> > >> 1602 static bool main_loop_should_exit(void)
> > >> 1603 {
> > >> ...
> > >> 1633     request =3D qemu_reset_requested();
> > >> 1634     if (request) {
> > >> 1635         pause_all_vcpus();
> > >> 1636         qemu_system_reset(request);
> > >> 1637         resume_all_vcpus();
> > >> 1638         if (!runstate_check(RUN_STATE_RUNNING) &&
> > >> 1639                 !runstate_check(RUN_STATE_INMIGRATE)) {
> > >> 1640             runstate_set(RUN_STATE_PRELAUNCH);
> > >> 1641         }
> > >> 1642     }
> > >> ...
> > >>
> > >> I already sent a patch for this kind of problem (in current Juan pull
> > >> request):
> > >>
> > >> "runstate: ignore finishmigrate -> prelaunch transition"
> > >>
> > >=20
> > > IIUC your patch avoids an invalid 'prelaunch' -> 'postmigrate' runsta=
te
> > > transition that can happen if the migration thread sets the runstate =
to
> > > 'finishmigrate' when pause_all_vcpus() releases the main loop mutex.
> > >=20
> > > ie. symptom of the problem is QEMU aborting, correct ? The issue I'm
> > > trying to fix is a guest breakage caused by a discrepancy between
> > > QEMU and the guest after migration has succeeded.
> > >=20
> > >> but I don't know if it could fix this one.
> > >>
> > >=20
> > > I don't think so and your patch kinda illustrates it. If the runstate
> > > is 'finishmigrate' when returning from pause_all_vcpus(), this means
> > > that state was sent to the destination before we could actually reset
> > > the machine.
> >=20
> > Yes, you're right.
> >=20
> > But the question behind my comment was: is it expected to have a pending
> > reset while we are migrating?
> >=20
>=20
> Nothing prevents qemu_system_reset_request() to be called when migration
> is active.=20
>=20
> > Perhaps H_CAS can return H_BUSY and wait the end of the migration and
> > then be fully executed on destination?
> >=20
>=20
> And so we would need to teach SLOF to try H_CAS again until it stops
> returning H_BUSY ? It seems safer to migrate the CAS reboot flag IMHO.
>=20

Ok I've tried that with a patched SLOF that sleeps 500ms and tries CAS
again if H_BUSY was returned. It fixes the issue but it looks a bit
ugly because of the polling with an arbitrary timeout in SLOF... I'm
not very comfortable either with calling migration_is_active() from
the CAS code in QEMU.

David,

Any suggestion ?

> > Thanks,
> > Laurent
> >=20
>=20


