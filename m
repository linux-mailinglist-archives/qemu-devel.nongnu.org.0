Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98F12F97E3
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 03:40:03 +0100 (CET)
Received: from localhost ([::1]:34736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1KSY-0002dm-RO
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 21:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1KQg-0000w4-AE; Sun, 17 Jan 2021 21:38:12 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50187 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1KQd-0001Re-NX; Sun, 17 Jan 2021 21:38:06 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DJwtg5cHHz9sWp; Mon, 18 Jan 2021 13:37:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610937467;
 bh=GZN6pOPrau+T6vAb6zUkSCNLRQrgaEZlVE5SuEfGLlQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SXzOQ/qiJz5Phv/50sbSEFucBpdnCV0Uqi08axOKXvqfoZazA8SrzmIDEdzaavmvj
 Z9vCYhrSXNRXUPVRB3oR71gXVYMXcdmBRgVYjlZ4ClS68Pw4jYjLrGGpndyxqc0EvF
 ZypZXg9UKIE+iV/uU2SvoqWVpwPz4DVgQC9dAmYc=
Date: Mon, 18 Jan 2021 12:18:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v1 7/7] spapr.c: consider CPU core online state before
 allowing unplug
Message-ID: <20210118011848.GD2089552@yekko.fritz.box>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
 <20210114180628.1675603-8-danielhb413@gmail.com>
 <20210115182216.6dccadee@bahia.lan>
 <14cfa384-9972-6817-5c5f-f37bc1880043@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DrWhICOqskFTAXiy"
Content-Disposition: inline
In-Reply-To: <14cfa384-9972-6817-5c5f-f37bc1880043@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Xujun Ma <xuma@redhat.com>, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DrWhICOqskFTAXiy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 03:52:56PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 1/15/21 2:22 PM, Greg Kurz wrote:
> > On Thu, 14 Jan 2021 15:06:28 -0300
> > Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> >=20
> > > The only restriction we have when unplugging CPUs is to forbid unplug=
 of
> > > the boot cpu core. spapr_core_unplug_possible() does not contemplate =
the
>=20
> I'll look into it.
>=20
> >=20
> > I can't remember why this restriction was introduced in the first place=
=2E..
> > This should be investigated and documented if the limitation still stan=
ds.
> >=20
> > > possibility of some cores being offlined by the guest, meaning that w=
e're
> > > rolling the dice regarding on whether we're unplugging the last online
> > > CPU core the guest has.
> > >=20
> >=20
> > Trying to unplug the last CPU is obviously something that deserves
> > special care. LoPAPR is quite explicit on the outcome : this should
> > terminate the partition.
> >=20
> > 13.7.4.1.1. Isolation of CPUs
> >=20
> > The isolation of a CPU, in all cases, is preceded by the stop-self
> > RTAS function for all processor threads, and the OS insures that all
> > the CPU=E2=80=99s threads are in the RTAS stopped state prior to isolat=
ing the
> > CPU. Isolation of a processor that is not stopped produces unpredictable
> > results. The stopping of the last processor thread of a LPAR partition
> > effectively kills the partition, and at that point, ownership of all
> > partition resources reverts to the platform firmware.
>=20
>=20
> I was just investigating a reason why we should check for all thread
> states before unplugging the core, like David suggested in his reply.
> rtas_stop_self() was setting 'cs->halted =3D 1' without a thread activity
> check like ibm,suspend-me() does and I was wondering why. This text you s=
ent
> explains it, quoting:
>=20
> "> The isolation of a CPU, in all cases, is preceded by the stop-self
>  RTAS function for all processor threads, and the OS insures that all
>  the CPU=E2=80=99s threads are in the RTAS stopped state prior to isolati=
ng the
>  CPU."
>=20
>=20
> This seems to be corroborated by arch/powerpc/platform/pseries/hotplug-cp=
u.c:

Um... this seems like you're overcomplicating this.  The crucial point
here is that 'start-cpu' and 'stop-self' operate on individual
threads, where as dynamic reconfiguration hotplug and unplug works on
whole cores.

> static void pseries_cpu_offline_self(void)
> {
> 	unsigned int hwcpu =3D hard_smp_processor_id();
>=20
> 	local_irq_disable();
> 	idle_task_exit();
> 	if (xive_enabled())
> 		xive_teardown_cpu();
> 	else
> 		xics_teardown_cpu();
>=20
> 	unregister_slb_shadow(hwcpu);
> 	rtas_stop_self();
>=20
> 	/* Should never get here... */
> 	BUG();
> 	for(;;);
> }
>=20
>=20
> IIUC this means that we can rely on cs->halted =3D 1 since it's coming ri=
ght
> after a rtas_stop_self() call. This is still a bit confusing though and I
> wouldn't mind standardizing the 'CPU core is offline' condition with what
> ibm,suspend-me is already doing.

At the moment we have no tracking of whether a core is online.  We
kinda-sorta track whether a *thread* is online through stop-self /
start-cpu.

> David, what do you think?

I think we can rely on cs->halted =3D 1 when the thread is offline.
What I'm much less certain about is whether we can count on the thread
being offline when cs->halted =3D 1.

> > R1-13.7.4.1.1-1. For the LRDR option: Prior to issuing the RTAS
> > set-indicator specifying isolate isolation-state of a CPU DR
> > connector type, all the CPU threads must be in the RTAS stopped
> > state.
> >=20
> > R1-13.7.4.1.1-2. For the LRDR option: Stopping of the last processor
> > thread of a LPAR partition with the stop-self RTAS function, must kill
> > the partition, with ownership of all partition resources reverting to
> > the platform firmware.
> >=20
> > This is clearly not how things work today : linux doesn't call
> > "stop-self" on the last vCPU and even if it did, QEMU doesn't
> > terminate the VM.
> >=20
> > If there's a valid reason to not implement this PAPR behavior, I'd like
> > it to be documented.
>=20
>=20
> I can only speculate. This would create a unorthodox way of shutting down
> the guest, when the user can just shutdown the whole thing gracefully.
>=20
> Unless we're considering borderline cases, like the security risk mention=
ed
> in the kernel docs (Documentation/core-api/cpu_hotplug.rst):
>=20
> "Such advances require CPUs available to a kernel to be removed either for
> provisioning reasons, or for RAS purposes to keep an offending CPU off
> system execution path. Hence the need for CPU hotplug support in the
> Linux kernel."
>=20
> In this extreme scenario I can see a reason to kill the partition/guest
> by offlining the last online CPU - if it's compromising the host we'd
> rather terminate immediately instead of waiting for graceful
> shutdown.

I'm a bit confused by this comment.  You seem to be conflating
online/offline operations (start-cpu/stop-self) with hot plug/unplug
operations - they're obviously related, but they're not the same
thing.

> > > If we hit the jackpot, we're going to detach the core DRC and pulse t=
he
> > > hotplug IRQ, but the guest OS will refuse to release the CPU. Our
> > > spapr_core_unplug() DRC release callback will never be called and the=
 CPU
> > > core object will keep existing in QEMU. No error message will be sent
> > > to the user, but the CPU core wasn't unplugged from the guest.
> > >=20
> > > If the guest OS onlines the CPU core again we won't be able to hotunp=
lug it
> > > either. 'dmesg' inside the guest will report a failed attempt to offl=
ine an
> > > unknown CPU:
> > >=20
> > > [  923.003994] pseries-hotplug-cpu: Failed to offline CPU <NULL>, rc:=
 -16
> > >=20
> > > This is the result of stopping the DRC state transition in the middle=
 in the
> > > first failed attempt.
> > >=20
> >=20
> > Yes, at this point only a machine reset can fix things up.
> >=20
> > Given this is linux's choice not to call "stop-self" as it should do, I=
'm not
> > super fan of hardcoding this logic in QEMU, unless there are really good
> > reasons to do so.
>=20
> I understand where are you coming from and I sympathize. Not sure about h=
ow users
> would feel about that though. They expect a somewhat compatible behavior =
of
> multi-arch features like hotplug/hotunplug, and x86 will neither hotunplu=
g nor offline
> the last CPU as well.
>=20
> There is a very high chance that, even if we pull this design off, I'll n=
eed to go to
> Libvirt and disable it because we broke compatibility with how vcpu unplu=
g operated
> earlier.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DrWhICOqskFTAXiy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAE4fgACgkQbDjKyiDZ
s5JJOBAAuAZp/2yn7qpUt2ATDJMZx/9EEzKLhF1t/z1Qj/RZbhkMJZRPQoXvdzIA
xeng17Oa5kpE5RMcaH+e8ooIvTQQAKDVJEbbPUCgPemMXCLosU/t0My21jqYm4p7
8adBMVjbajh01cCmKcglyf9AAPnPY5NGAeQXLXv3dp03QlYLZMZ2SPskb76sOhtf
/p6eEcUPLkSZe7/ALZJipuOLQO49sCYjFjUo6esGG+2skB+cho0S5yv2irgT9q98
Uyj6QggHedPAYkwtsCUnAqGPKaxkTlqsT9ETwDREcRhW0qYvaVz4EPTrQCV2Q+hD
yBA67Z+i/w89pO/gB2NKdPwqRCwcrNZ1WrzonZ1ydCdsUI0hWF9LYgK3ZoEDuc0A
uz8neKklG1AdilSefUweL/b506/ldFSmrE9ii/DiAF1yR6rDelTZ9qIbKupkxIlf
Eoo1E7q2RZz5RqydhDYuJsofGk/+pM4aZi2FZAkRcHGMT7owYydQLBTtd6HSl0hc
h6xTJgGc9yl5Pboxnpb58wmJK7RFQMlSHc4tGr1yUdCtEKzh+W9eyJC+NSp6C9P7
tJewvEIqr12uDGLrQqTUfIYPDwatqEQqM56nAx7lMbdA6iZdLWTIfWq+O3xwyU0q
VnDQ+y+Kuc2tvPJcqX6UpHD25xhe1uODUR52aok/+uUywCpmJkw=
=+z3l
-----END PGP SIGNATURE-----

--DrWhICOqskFTAXiy--

