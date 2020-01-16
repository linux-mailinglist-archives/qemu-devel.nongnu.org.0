Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168BF13D620
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 09:50:43 +0100 (CET)
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is0rS-0002fa-1P
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 03:50:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60592)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1is0pz-0001JI-Jr
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 03:49:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1is0pv-0004el-QR
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 03:49:11 -0500
Received: from 9.mo179.mail-out.ovh.net ([46.105.76.148]:51089)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1is0pu-0004d5-Gv
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 03:49:07 -0500
Received: from player746.ha.ovh.net (unknown [10.108.16.46])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id D6BD315650C
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 09:49:02 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id 57B95E5AD7EF;
 Thu, 16 Jan 2020 08:48:53 +0000 (UTC)
Date: Thu, 16 Jan 2020 09:48:48 +0100
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] spapr: Migrate CAS reboot flag
Message-ID: <20200116094848.555c170d@bahia.lan>
In-Reply-To: <ed2df775-b4d5-4ea7-ccf6-637c037f897b@redhat.com>
References: <157911051688.345768.16136592081655557565.stgit@bahia.lan>
 <ed2df775-b4d5-4ea7-ccf6-637c037f897b@redhat.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 2557481640314116390
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrtdeggdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeegiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.76.148
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

On Wed, 15 Jan 2020 19:10:37 +0100
Laurent Vivier <lvivier@redhat.com> wrote:

> Hi,
>=20
> On 15/01/2020 18:48, Greg Kurz wrote:
> > Migration can potentially race with CAS reboot. If the migration thread
> > completes migration after CAS has set spapr->cas_reboot but before the
> > mainloop could pick up the reset request and reset the machine, the
> > guest is migrated unrebooted and the destination doesn't reboot it
> > either because it isn't aware a CAS reboot was needed (eg, because a
> > device was added before CAS). This likely result in a broken or hung
> > guest.
> >=20
> > Even if it is small, the window between CAS and CAS reboot is enough to
> > re-qualify spapr->cas_reboot as state that we should migrate. Add a new
> > subsection for that and always send it when a CAS reboot is pending.
> > This may cause migration to older QEMUs to fail but it is still better
> > than end up with a broken guest.
> >=20
> > The destination cannot honour the CAS reboot request from a post load
> > handler because this must be done after the guest is fully restored.
> > It is thus done from a VM change state handler.
> >=20
> > Reported-by: Luk=C3=A1=C5=A1 Doktor <ldoktor@redhat.com>
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >=20
>=20
> I'm wondering if the problem can be related with the fact that
> main_loop_should_exit() could release qemu_global_mutex in
> pause_all_vcpus() in the reset case?
>=20
> 1602 static bool main_loop_should_exit(void)
> 1603 {
> ...
> 1633     request =3D qemu_reset_requested();
> 1634     if (request) {
> 1635         pause_all_vcpus();
> 1636         qemu_system_reset(request);
> 1637         resume_all_vcpus();
> 1638         if (!runstate_check(RUN_STATE_RUNNING) &&
> 1639                 !runstate_check(RUN_STATE_INMIGRATE)) {
> 1640             runstate_set(RUN_STATE_PRELAUNCH);
> 1641         }
> 1642     }
> ...
>=20
> I already sent a patch for this kind of problem (in current Juan pull
> request):
>=20
> "runstate: ignore finishmigrate -> prelaunch transition"
>=20

IIUC your patch avoids an invalid 'prelaunch' -> 'postmigrate' runstate
transition that can happen if the migration thread sets the runstate to
'finishmigrate' when pause_all_vcpus() releases the main loop mutex.

ie. symptom of the problem is QEMU aborting, correct ? The issue I'm
trying to fix is a guest breakage caused by a discrepancy between
QEMU and the guest after migration has succeeded.

> but I don't know if it could fix this one.
>=20

I don't think so and your patch kinda illustrates it. If the runstate
is 'finishmigrate' when returning from pause_all_vcpus(), this means
that state was sent to the destination before we could actually reset
the machine.

> Thanks,
> Laurent
>=20


