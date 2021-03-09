Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B5C331D70
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 04:23:40 +0100 (CET)
Received: from localhost ([::1]:44994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJSyB-000832-Tz
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 22:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJSx6-0007VN-Q1; Mon, 08 Mar 2021 22:22:32 -0500
Received: from ozlabs.org ([203.11.71.1]:52817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJSx2-0001av-Tr; Mon, 08 Mar 2021 22:22:32 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DvgVv6ncVz9sW8; Tue,  9 Mar 2021 14:22:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615260135;
 bh=D3nIBoavsCBs75Y2GcObvpz5Eiw6BxjLwk9/11CZ4oU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A2aGKcUVHL3bufeZWXFVla/paUqCh/rOEI15cpzE2wUrOBDXeo1jQTs+biWKprztS
 OEUGlxFLWzvzV8wtH/FJ3TaHeA55ADYpO/NRtSBlsom/6nho5q50PxwO4yzBPItIFN
 muZBIIsSr8+4sZFrsB8UmYPnDZw9hJC2UeyD0uc0=
Date: Tue, 9 Mar 2021 14:22:11 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [RFC] adding a generic QAPI event for failed device hotunplug
Message-ID: <YEbp4wKK/QY7uKYw@yekko.fritz.box>
References: <155911cc-8764-1a65-4bb3-2fc0628d52e5@gmail.com>
 <877dmkrcpl.fsf@dusky.pond.sub.org>
 <d9567bf3-8740-e8fe-b29b-a3b0ebdb5809@gmail.com>
 <87blbt60hc.fsf@dusky.pond.sub.org>
 <8b79c207-f653-9eec-77f1-ea46c7c75ad5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2HWfSg8NMa+VUZoO"
Content-Disposition: inline
In-Reply-To: <8b79c207-f653-9eec-77f1-ea46c7c75ad5@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, michael.roth@amd.com,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2HWfSg8NMa+VUZoO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 08, 2021 at 03:01:53PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 3/8/21 2:04 PM, Markus Armbruster wrote:
> > Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> >=20
> > > On 3/6/21 3:57 AM, Markus Armbruster wrote:
> > > > Cc: ACPI maintainers for additional expertise.
> > > >=20
> > > > Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> > > >=20
> > > > > Hi,
> > > > >=20
> > > > > Recent changes in pseries code (not yet pushed, available at Davi=
d's
> > > > > ppc-for-6.0) are using the QAPI event MEM_UNPLUG_ERROR to report =
memory
> > > > > hotunplug errors in the pseries machine.
> > > > >=20
> > > > > The pseries machine is also using a timeout to cancel CPU hotunpl=
ugs that
> > > > > takes too long to finish (in which we're assuming a guest side er=
ror) and
> > > > > it would be desirable to also send a QAPI event for this case as =
well.
> > > > >=20
> > > > > At this moment, there is no "CPU_UNPLUG_ERROR" in QAPI (guess ACP=
I doesn't
> > > > > need it).
> > > >=20
> > > > I see two interpretations of "ACPI doesn't need":
> > > >=20
> > > > 1. Unplug can't fail, or QEMU can't detect failure.  Michael, Igor?
> > > >=20
> > > > 2. Management applications haven't needed to know badly enough to
> > > > implement an event.
> > > >=20
> > > > >             Before sending patches to implement this new event I =
had a talk
> > > > > with David Gibson and he suggested that, instead of adding a new =
CPU_UNPLUG_ERROR
> > > > > event, we could add a generic event (e.g. DEVICE_UNPLUG_ERROR) th=
at can be
> > > > > used by the pseries machine in both error scenarios (MEM and CPU).
> > > >=20
> > > > Good point.  One general event is better than two special ones that
> > > > could easily grow siblings.
> > > >=20
> > > > > This could also be used by x86 as well, although I believe the us=
e of
> > > > > MEM_UNPLUG_ERROR would need to be kept for awhile to avoid breaki=
ng ABI.
> > > >=20
> > > > Yes.  Our rules for interface deprecation apply.
> > > >=20
> > > > > Any suggestions/comments?
> > > >=20
> > > > We should document the event's reliability.  Are there unplug opera=
tions
> > > > where we can't detect failure?  Are there unplug operations where we
> > > > could, but haven't implemented the event?
> > >=20
> > > The current version of the PowerPC spec that the pseries machine impl=
ements
> > > (LOPAR) does not predict a way for the virtual machine to report a ho=
tunplug
> > > error back to the hypervisor. If something fails, the hypervisor is l=
eft
> > > in the dark.
> > >=20
> > > What happened in the 6.0.0 dev cycle is that we faced a reliable way =
of
> >=20
> > Do you mean "unreliable way"?
>=20
> I guess a better word would be 'reproducible', as in we discovered a repr=
oducible
> way of getting the guest kernel to refuse the CPU hotunplug.

Right.  It's worth noting here that in the PAPR model, there are no
"forced" unplugs.  Unplugs always consist of a request to the guest,
which is then resposible for offlining the device and signalling back
to the hypervisor that it's done with it.

> > > making CPU hotunplug fail in the guest (trying to hotunplug the last =
online
> > > CPU) and the pseries machine was unprepared for dealing with it. We e=
nded up
> > > implementing a hotunplug timeout and, if the timeout kicks in, we're =
assuming
> > > that the CPU hotunplug failed in the guest. This is the first scenari=
o we have
> > > today where we want to send a QAPI event informing the CPU hotunplug =
error,
> > > but this event does not exist in QEMU ATM.
> >=20
> > When the timeout kicks in, how can you know the operation failed?  You
> > better be sure when you send an error event.  In other words: what
> > prevents the scenario where the operation is much slower than you
> > expect, the timeout expires, the error event is sent, and then the
> > operation completes successfully?
>=20
> A CPU hotunplug in a pseries guest takes no more than a couple of seconds=
, even
> if the guest is under heavy load. The timeout is set to 15 seconds.

Right.  We're well aware that a timeout is an ugly hack, since it's
not really possible to distinguish it from a guest that's just being
really slow.

It was the best thing we could come up with in the short term though.
Without the changes we're suggesting here, the guest can positively
assert the unplug is complete, but it has no way to signal failure.
So, without a timeout qemu is stuck waiting indefinitely (or at least
until the next machine reset) on the guest for an unplug that might
never complete.

It's particularly nasty if the guest does really fail the hotplug
internally, but then conditions change so that the same unplug could
now succeed.  The unplug request is just a message - there's no guest
visible persistent state saying we want the device unplugged, so if
conditions change the guest won't then re-attempt the unplug.
Meanwhile the user can't re-attempt the device_del, because on the
qemu side it's still stuck in a pending unplug waiting on the guest.

As we're discussing we think we have a better way, but it relies on
guest changes, so we can't assume we already have that on the qemu
side.

> I'm aware that there's always that special use case, that we haven't seen=
 yet,
> where this assumption is no longer valid. The plan is to change the spec =
and the
> guest kernel to signal the CPU hotunplug error back to QEMU before the dr=
agon
> lands. For now, timing out the CPU hotunplug process when we're almost ce=
rtain
> (but not 100%) that it failed in the guest is the best can do.
>=20
> For both cases I want to use DEVICE_UNPLUG_ERROR right from the start, av=
oiding
> guest visible changes when we change how we're detecting the unplug error=
s.
>=20
> > > The second scenario is a memory hotunplug error. I found out that the=
 pseries
> > > guest kernel does a reconfiguration step when re-attaching the DIMM r=
ight
> > > after refusing the hotunplug, and this reconfiguration is visible to =
QEMU.
> > > I proceeded to make the pseries machine detect this error case, rollb=
ack the
> > > unplug operation and fire up the MEM_UNPLUG_ERROR. This case is alrea=
dy covered
> > > by QAPI, but if we add a DEVICE_UNPLUG_ERROR event I would use it in =
this case as
> > > well instead of the MEM specific one.
> > >=20
> > > This investigation and work in the mem hotunplug error path triggered=
 a
> > > discussion in qemu-ppc, where we're considering whether we should do =
the same
> > > signalling the kernel does for the DIMM hotunplug error for all other=
 device
> > > hotunplug errors, given that the reconfiguration per se is not forbid=
den by LOPAR
> > > and it's currently a no-op. We would make a LOPAR spec change to make=
 this an
> > > official hotunplug error report mechanism, and all pseries hotunplug =
operations,
> > > for all devices, would report DEVICE_UNPLUG_ERROR QAPI events in the =
error path.
> > >=20
> > > Granted, the spec change + Kernel change is not something that we wil=
l be able
> > > to nail down in the 6.0.0 cycle, but having the DEVICE_UNPLUG_ERROR Q=
API event
> > > already in place would make it easier for the future as well.
> > >=20
> > >=20
> > > I have a doc draft of these changes/infos that I forgot to post. I wo=
uld post
> > > it as docs/system/ppc-spapr-hotunplug-notes.rst. I can add the QAPI e=
vents
> > > information there as well. Does that work for you as far as documenta=
tion
> > > goes?
> >=20
> > A DEVICE_UNPLUG_ERROR event makes perfect sense regardless of machine
> > and device.

Ack.  Fwiw, I don't think this can ever be more than a "best effort"
notification.  Even with a machine and OS that should support it, a
guest bug or hang could mean that it never acks *or* nacks an unplug
request.

> > I'm not asking you to to implement it for all machines and devices.  But
> > I want its design to support growth towards that goal, and its
> > documentation reflect its current state.
> >=20
> > In particular, the doc comment in the QAPI schema should list the
> > limitation.  If the event is only implemented for LOPAR for now, say so.
> > If it's only implemented for certain devices, say so.
> >=20
> > Questions?
>=20
>=20
> Nope. Thanks for the pointers. I'll add the DEVICE_UNPLUG_ERROR QAPI event
> in a way that it can be used by other machines in the future, and documen=
ting
> where the event is being used ATM.
>=20
>=20
> Thanks,
>=20
>=20
> DHB
>=20
>=20
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2HWfSg8NMa+VUZoO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBG6eEACgkQbDjKyiDZ
s5IJDg//VZV1V9c49zYM+j/soY4/buFtyU+61JybqoY+1g4GP6k76yRX5UHmpuSQ
3RLye7i6aKRaTri07ivt0C8LnYmJIdOcC4yB+ylZGW5WHJyW2imvONmbD7wSLlEe
4SwnKhbFNrwKXr84+hXnTtvExfPogtag8Jfl8lPgOgE2hjTh5PBPlpS7C5WmOV8N
W6ZrAFQ07eqUVgkFbxvwrLYd2uPWKIw74RRe3+cQF7LMc2ckGT156u+goXg95gkc
yjLy9/sVHH23YHKAnuUm7GzplsQCYeRG6jI7BQZCJELpTAKjnfUn3RbkpChm3fgD
h788Wk8E74xRk2pUs4JAz8iMLs4VTirYg+Mbn7/2Mq+L2Akl6DhN0oYUAQQ34A1s
YpmeMo9ggCVCPSpl2rkjbP1s7tWqGysooqgkx8mb83J/WTFi7tY3WlJHGB9AuQ1h
OEuWpAzm+p/eLAn4MwI7AGgBOnLCm4BnMkd2oILiP8+K88Ff7BPSofFeLaJDx0d5
EPMy1w2pPL5fPjZodLsBxPdlx9XlPDlxjp7DgH3FTfQ19RkEshfMhmtpcykXDxiF
IRT39vtX1jUvM9wvcLTEJiw70oyAchiB1nyhHICa3Ghws2oUojSgriH0N27WL9mr
jtq2etygFG0C/jd9MEyiado7reItSxs3aFxQKZhkc44iZXuokvM=
=USzY
-----END PGP SIGNATURE-----

--2HWfSg8NMa+VUZoO--

