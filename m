Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D355144C51
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 08:03:49 +0100 (CET)
Received: from localhost ([::1]:37712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuA3H-0003ts-Er
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 02:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36234)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iu9qe-00052v-1T
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 01:50:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iu9qb-0008EV-I1
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 01:50:43 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:58277)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iu9qa-00089r-CC; Wed, 22 Jan 2020 01:50:41 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 482bdP5m6Sz9sRR; Wed, 22 Jan 2020 17:50:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1579675833;
 bh=+/Emv2f4SjkNHVEGzr2pw/2s55Uoc0Wi4MgHSdtwyLA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kwcJ0ILMSA0UwxHGHbQU3j79TTzzPKAxnFuxTmyKoTVZ60T1JzqD8fVhCX8uTAV+l
 qJODQtI86McNg/zNcDAilNwbD4yYQq/TRv/ldlx5hw3FYDc7OjokTEqvFg1d88/YiN
 tJzjt4B8vYI6eUkeHQ934xTns3oro+CIqFVOk47A=
Date: Wed, 22 Jan 2020 17:50:28 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] spapr: Migrate CAS reboot flag
Message-ID: <20200122065028.GK2347@umbus.fritz.box>
References: <ed2df775-b4d5-4ea7-ccf6-637c037f897b@redhat.com>
 <20200116094848.555c170d@bahia.lan>
 <2dda458a-dfa1-ab23-4a97-d27d9266226b@redhat.com>
 <20200116131435.3985e86e@bahia.lan>
 <20200116192902.63674769@bahia.lan> <20200117091608.GV54439@umbus>
 <20200117164427.2c238412@bahia.lan>
 <20200120090438.75ff9e65@bahia.lan>
 <20200121034332.GC265522@umbus.fritz.box>
 <20200121103255.6a25aaa9@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="huBJOJF9BsF479P6"
Content-Disposition: inline
In-Reply-To: <20200121103255.6a25aaa9@bahia.lan>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: Laurent Vivier <lvivier@redhat.com>, Lukas Doktor <ldoktor@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--huBJOJF9BsF479P6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2020 at 10:32:55AM +0100, Greg Kurz wrote:
> On Tue, 21 Jan 2020 14:43:32 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Jan 20, 2020 at 09:04:38AM +0100, Greg Kurz wrote:
> > > On Fri, 17 Jan 2020 16:44:27 +0100
> > > Greg Kurz <groug@kaod.org> wrote:
> > >=20
> > > > On Fri, 17 Jan 2020 19:16:08 +1000
> > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > >=20
> > > > > On Thu, Jan 16, 2020 at 07:29:02PM +0100, Greg Kurz wrote:
> > > > > > On Thu, 16 Jan 2020 13:14:35 +0100
> > > > > > Greg Kurz <groug@kaod.org> wrote:
> > > > > >=20
> > > > > > > On Thu, 16 Jan 2020 11:37:24 +0100
> > > > > > > Laurent Vivier <lvivier@redhat.com> wrote:
> > > > > > >=20
> > > > > > > > On 16/01/2020 09:48, Greg Kurz wrote:
> > > > > > > > > On Wed, 15 Jan 2020 19:10:37 +0100
> > > > > > > > > Laurent Vivier <lvivier@redhat.com> wrote:
> > > > > > > > >=20
> > > > > > > > >> Hi,
> > > > > > > > >>
> > > > > > > > >> On 15/01/2020 18:48, Greg Kurz wrote:
> > > > > > > > >>> Migration can potentially race with CAS reboot. If the =
migration thread
> > > > > > > > >>> completes migration after CAS has set spapr->cas_reboot=
 but before the
> > > > > > > > >>> mainloop could pick up the reset request and reset the =
machine, the
> > > > > > > > >>> guest is migrated unrebooted and the destination doesn'=
t reboot it
> > > > > > > > >>> either because it isn't aware a CAS reboot was needed (=
eg, because a
> > > > > > > > >>> device was added before CAS). This likely result in a b=
roken or hung
> > > > > > > > >>> guest.
> > > > > > > > >>>
> > > > > > > > >>> Even if it is small, the window between CAS and CAS reb=
oot is enough to
> > > > > > > > >>> re-qualify spapr->cas_reboot as state that we should mi=
grate. Add a new
> > > > > > > > >>> subsection for that and always send it when a CAS reboo=
t is pending.
> > > > > > > > >>> This may cause migration to older QEMUs to fail but it =
is still better
> > > > > > > > >>> than end up with a broken guest.
> > > > > > > > >>>
> > > > > > > > >>> The destination cannot honour the CAS reboot request fr=
om a post load
> > > > > > > > >>> handler because this must be done after the guest is fu=
lly restored.
> > > > > > > > >>> It is thus done from a VM change state handler.
> > > > > > > > >>>
> > > > > > > > >>> Reported-by: Luk=C3=A1=C5=A1 Doktor <ldoktor@redhat.com>
> > > > > > > > >>> Signed-off-by: Greg Kurz <groug@kaod.org>
> > > > > > > > >>> ---
> > > > > > > > >>>
> > > > > > > > >>
> > > > > > > > >> I'm wondering if the problem can be related with the fac=
t that
> > > > > > > > >> main_loop_should_exit() could release qemu_global_mutex =
in
> > > > > > > > >> pause_all_vcpus() in the reset case?
> > > > > > > > >>
> > > > > > > > >> 1602 static bool main_loop_should_exit(void)
> > > > > > > > >> 1603 {
> > > > > > > > >> ...
> > > > > > > > >> 1633     request =3D qemu_reset_requested();
> > > > > > > > >> 1634     if (request) {
> > > > > > > > >> 1635         pause_all_vcpus();
> > > > > > > > >> 1636         qemu_system_reset(request);
> > > > > > > > >> 1637         resume_all_vcpus();
> > > > > > > > >> 1638         if (!runstate_check(RUN_STATE_RUNNING) &&
> > > > > > > > >> 1639                 !runstate_check(RUN_STATE_INMIGRATE=
)) {
> > > > > > > > >> 1640             runstate_set(RUN_STATE_PRELAUNCH);
> > > > > > > > >> 1641         }
> > > > > > > > >> 1642     }
> > > > > > > > >> ...
> > > > > > > > >>
> > > > > > > > >> I already sent a patch for this kind of problem (in curr=
ent Juan pull
> > > > > > > > >> request):
> > > > > > > > >>
> > > > > > > > >> "runstate: ignore finishmigrate -> prelaunch transition"
> > > > > > > > >>
> > > > > > > > >=20
> > > > > > > > > IIUC your patch avoids an invalid 'prelaunch' -> 'postmig=
rate' runstate
> > > > > > > > > transition that can happen if the migration thread sets t=
he runstate to
> > > > > > > > > 'finishmigrate' when pause_all_vcpus() releases the main =
loop mutex.
> > > > > > > > >=20
> > > > > > > > > ie. symptom of the problem is QEMU aborting, correct ? Th=
e issue I'm
> > > > > > > > > trying to fix is a guest breakage caused by a discrepancy=
 between
> > > > > > > > > QEMU and the guest after migration has succeeded.
> > > > > > > > >=20
> > > > > > > > >> but I don't know if it could fix this one.
> > > > > > > > >>
> > > > > > > > >=20
> > > > > > > > > I don't think so and your patch kinda illustrates it. If =
the runstate
> > > > > > > > > is 'finishmigrate' when returning from pause_all_vcpus(),=
 this means
> > > > > > > > > that state was sent to the destination before we could ac=
tually reset
> > > > > > > > > the machine.
> > > > > > > >=20
> > > > > > > > Yes, you're right.
> > > > > > > >=20
> > > > > > > > But the question behind my comment was: is it expected to h=
ave a pending
> > > > > > > > reset while we are migrating?
> > > > > > > >=20
> > > > > > >=20
> > > > > > > Nothing prevents qemu_system_reset_request() to be called whe=
n migration
> > > > > > > is active.=20
> > > > > > >=20
> > > > > > > > Perhaps H_CAS can return H_BUSY and wait the end of the mig=
ration and
> > > > > > > > then be fully executed on destination?
> > > > > > > >=20
> > > > > > >=20
> > > > > > > And so we would need to teach SLOF to try H_CAS again until i=
t stops
> > > > > > > returning H_BUSY ? It seems safer to migrate the CAS reboot f=
lag IMHO.
> > > > > > >=20
> > > > > >=20
> > > > > > Ok I've tried that with a patched SLOF that sleeps 500ms and tr=
ies CAS
> > > > > > again if H_BUSY was returned. It fixes the issue but it looks a=
 bit
> > > > > > ugly because of the polling with an arbitrary timeout in SLOF..=
=2E I'm
> > > > > > not very comfortable either with calling migration_is_active() =
=66rom
> > > > > > the CAS code in QEMU.
> > > > > >=20
> > > > > > David,
> > > > > >=20
> > > > > > Any suggestion ?
> > > > >=20
> > > > > Yeah, I think looping in SLOF is a worse idea than migrating the
> > > > > cas_reboot flag.
> > > > >=20
> > > > > But.. a better solution still might be to just remove the remaini=
ng
> > > > > causes for CAS reboot entirely.  CAS reboots pretty much suck when
> > > > > they happen, anyway.
> > > > >=20
> > > >=20
> > > > I Agree.
> > > >=20
> > > > > With the irq changeover condition removed, I think the remaining
> > > > > causes are more theoretical than practical situations at this poi=
nt.
> > > > >=20
> > > >=20
> > > > FWIW, hotpluggging a PCI device before CAS result in a hung guest (=
not yet
> > > > investigated the details).
> > >=20
> > > commit 10f12e6450407b18b4d5a6b50d3852dcfd7fff75
> > > Author: Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>
> > > Date:   Wed Aug 30 15:21:41 2017 -0300
> > >=20
> > >     hw/ppc: CAS reset on early device hotplug
> > >=20
> > > I'll have a look to see what can be done here.
> >=20
> > Ah.. yes, that one might be a bit tricky.
> >=20
>=20
> So far it seems to be related to SLOF not being able to create
> new nodes in the DT when parsing the FDT returned by CAS. SLOF
> stops the parsing and returns an error. The guest ends up with
> a broken DT and eventually hangs later (in my case the kernel
> believes it is going to do hash while radix was negotiated with
> QEMU). I need to dig some more.

Uh... I don't think this is right.  I'm pretty sure SLOF *does* create
new nodes when parsing the CAS FDT, it will need to for
"ibm,dynamic-reconfiguration-memory" at least.

I've done some looking and I think the actual reasons here are a bit
more complicated (but also possibly easier to handle).

  1. We can't send hotplug events to the guest until after CAS,
     because before then we don't know if it can process them, or if
     it can, which interrupt it uses for them.

  2. Queueing hotplug events across CAS for delivery afterwards
     introduces other complications

  3. We need to make sure that each device appears exactly once in
     either the  initial device tree that the guest OS sees, *or* in a
     hotplug event, not both or neither.

Now that we rebuild the DT at CAS time, I think we mightd be able toy
handle this by converting such devices to "cold plugged" at CAS time
(similarly to what we already do at reset).  Since they're in the
CAS-time DT which is what the OS will consume, cold plugged is
effectively how the OS will see them.

A remaining problem is that new PCI devices won't get BARs assigned by
SLOF in this scenario.  We'll probably get away with it because of the
linux,pci-probe-only property, but I don't know we want to rely on
that.  PCI bridges hotplugged introduce further complications, because
they won't get enumerated.

> > > But I agree the other check is more theoretical:
> > >=20
> > >     /* capabilities that have been added since CAS-generated guest re=
set.
> > >      * if capabilities have since been removed, generate another reset
> > >      */
> > >     spapr->cas_reboot =3D !spapr_ovec_subset(ov5_cas_old, spapr->ov5_=
cas);
> > >=20
> > > Unless changing kernels or tempering with the kernel command line, I =
don't
> > > see how some capabilities could change between the two CAS in practic=
e.
> >=20
> > Well, we want to be robust and it's at least theoretically possible
> > that the guest will request different things on subsequent reboots.
>=20
> Yes but in the latter case a full machine reset occurs and

Not necessarily.  A guest could ask for something on one CAS cycle,
then reject it on another, without doing a full reboot.  It'd be a
pointless thing for the guest to do, but it's possible.

> spapr->ov5_cas gets cleared, ie. spapr_ovec_subset() returns
> true in the check above no matter what.

Well, also it could happen if the guest rejects something we put in
the initial value of ov5_cas (which is populated from spapr->ov5, so
it's not entirely empty).

> > However I believe that the original rationale for this check was that
> > while we could add things to the device tree for added capabilities,
> > we didn't have a way to roll back the changes for removed
> > capabilities.
> >=20
>=20
> IIUC this is specifically for "removed capabilities since last
> CAS". This can happen if:
> 1) we're already processing a CAS reboot or,
> 2) a freshly rebooted guest calls CAS twice without being rebooted
>    in between.
>=20
> Since a freshly booted or rebooted guest can only trigger a CAS
> reboot because of a "hotplug-before-CAS", if we manage to get rid
> of this limitation, 1) cannot happen anymore.
>=20
> The linux kernel seems to be only calling "ibm,client-architecture-suppor=
t"
> once during early boot so 2) should _never_ happen. Do we care to support
> this scenario anyway ?

I think you've missed some things in your reasoning.  But it doesn't
really matter because the full dt rebuilt should handle it anyway.  I
have a draft patch which removes this cause for CAS reboots.

Still grappling with the hotplug-before-CAS case.

> > Now that we fully rebuild the device tree at CAS, I think this test
> > can probably just go, although there's some double checking to do.
> >=20
>=20
> I tend to agree.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--huBJOJF9BsF479P6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4n8LIACgkQbDjKyiDZ
s5LhLg/9GYQPWolQX1HMFobJ8GXav4hdij23rmbV7kBGIKVUOn+StO+XAKeHUEDP
c80xldP/fQe1GAeua9JkNETw9b/1BM6rNubO2stJq/tl8H/wUovcr3l96aD92Nsw
sth+RlxEp7YGp4uCxEwH38TNQBc4I5HzguEIE8HjwAzv/ewT6CmERUWcjDYd2mt2
gv/pgW+4VAKdFNoc4OSvOgvP/FXSunN3Iyn0LL/FCMPUX8W3JciayxBHRgsEw6bG
i5kPXumXEOuHmHKLxOMvwzAHYmWs0vfZG1+mgJuZTeOPLx8nh9yheH6zSWqOv9DD
vSdjWkKj01c5+FlRVdoFnMOQ6PyBXdMGOX93/sBvJaO/XQmAotMYxhIXugqDNuTg
XWVJh7iZDwXazW6PzhqyxzOVOSYfvgrPR+ktHAt9JsYmS29gwc0xuP9iOEZY8uP0
K/Wuxn9bnSPvxivc+9hHxOc6ZF8HuUyV1IkWVk6cXyKkDXO4B9bmK/ugkbdDz4tk
U+JD81Jvx851VdzHsc+XCBn+U9wdfc4DEcKnmlFaQeQA8BMZYUv/0YnodA1NbCJi
t4OXs49HN8KhKKT4ANmSvIKY1Yz//nmA1/GH9nt1dLdKufZeBfow5Y1l7EWxbY5Q
OdPeUmIzrTu+iTNiXnaRpVU0NT+qcli9AEc9YpwfXyUv9Bh6nGs=
=6gNm
-----END PGP SIGNATURE-----

--huBJOJF9BsF479P6--

