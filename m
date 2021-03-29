Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D344834C373
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 08:01:04 +0200 (CEST)
Received: from localhost ([::1]:55306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQkxT-00010E-UJ
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 02:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lQkve-0000Dz-Lk; Mon, 29 Mar 2021 01:59:10 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56721 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lQkvb-0008Kp-I4; Mon, 29 Mar 2021 01:59:10 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F822Y4jy0z9sVS; Mon, 29 Mar 2021 16:59:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616997541;
 bh=8tOgkwH0bp/9Q+XxBpMBiCgPyX1H3G+TqRzQgKi/6HI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ibSwkrbnUqP7e92XUwvkdHb3kqhUrgAPDhOJMBlqq154YnwYpkoEPUXOC3nwipeS3
 B3oX/PVt9322fI5hQ7PBVt4KP3wmqf5Fkg2NQ92H79GnwbaJ8EL2K7ZAStIVOGOIUs
 rA/t2Pem2kR1IQTKiBG/Guhnf9EK825Pt1ahpsn8=
Date: Mon, 29 Mar 2021 16:35:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [RFC] adding a generic QAPI event for failed device hotunplug
Message-ID: <YGFnEGa2Hyt4cZMT@yekko.fritz.box>
References: <8b79c207-f653-9eec-77f1-ea46c7c75ad5@gmail.com>
 <YEbp4wKK/QY7uKYw@yekko.fritz.box>
 <87mtvczvzw.fsf@dusky.pond.sub.org>
 <98d44670-5a63-1feb-aad8-9dbc62cf2e7a@gmail.com>
 <YErBpf7w25xho1so@yekko.fritz.box>
 <875z1w7ptm.fsf@dusky.pond.sub.org>
 <YFg7qYYBqGZuKSO+@yekko.fritz.box>
 <fc4b9be9-8fca-cfba-5c26-f3ad8ae8035c@redhat.com>
 <YFlhiNorrttIslFf@yekko.fritz.box>
 <20210323140636.1a89eaab@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mIHjn4UdoAEPudQT"
Content-Disposition: inline
In-Reply-To: <20210323140636.1a89eaab@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Julia Suvorova <jusual@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Laine Stump <laine@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, jfreimann@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mIHjn4UdoAEPudQT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 02:06:36PM +0100, Igor Mammedov wrote:
> On Tue, 23 Mar 2021 14:33:28 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Mar 22, 2021 at 01:06:53PM +0100, Paolo Bonzini wrote:
> > > On 22/03/21 07:39, David Gibson wrote: =20
> > > > > QEMU doesn't really keep track of "in flight" unplug requests, an=
d as
> > > > > long as that's the case, its timeout even will have the same issu=
e. =20
> > > > Not generically, maybe.  In the PAPR code we effectively do, by mea=
ns
> > > > of the 'unplug_requested' boolean in the DRC structure.  Maybe that=
's
> > > > a mistake, but at the time I couldn't see how else to handle things=
=2E =20
> > >=20
> > > No, that's good.  x86 also tracks it in some registers that are acces=
sible
> > > from the ACPI firmware.  See "PCI slot removal notification" in
> > > docs/specs/acpi_pci_hotplug.txt.
> > >  =20
> > > > Currently we will resolve all "in flight" requests at machine reset
> > > > time, effectively completing those requests.  Does that differ from
> > > > x86 behaviour? =20
> > >=20
> > > IIRC on x86 the requests are instead cancelled, but I'm not 100%
> > > sure. =20
> >=20
> > Ah... we'd better check that and try to make ppc consistent with
> > whatever it does.
> >=20
>=20
> Sorry for being late to discussion, I can't say much for all possible way=
s to unplug
> PCI device (aside that it's a complicated mess), but hopefully I can shed=
 some light on
> state/behavior of ACPI based methods.

Thanks, this is quite useful.

> * x86 - ACPI based PCI hotplug
>  Its sole existence was dictated by Widows not supporting SHPC (conventio=
nal PCI),
>  and it looks like 'thanks' to Windows buggy drivers we would have to use=
 it for
>  PCI-E  as well (Julia works on it).

AIUI, Julia et al. are working on ACPI PCI hotplug, but it's not yet
merged.  Is that correct?

>  HW registers described in docs/specs/acpi_pci_hotplug.txt are our own in=
vention,
>  they help to raise standard ACPI 'device check' and 'eject request' even=
ts when
>  guest executes AML bytecode. Potentially there is possibility for guest =
to report
>  plug/unplug progress via ACPI _OST method (including failure/completion)=
 but given
>  my experience with how Windows PCI core worked so far that may be not us=
ed by it
>  (honestly I haven't tried to explore possibility, due to lack of interes=
t in it).
> =20
>  regarding unplug - on device_del QEMU raises SCI interrupt, after this t=
he process is
>  asynchronous. When ACPI interpreter gets SCI it sends a respective _EJ0 =
event to
>  devices mentioned in PCI_DOWN_BASE register. After getting the event, gu=
est OS may

Ok.  Is PCI_DOWN_BASE an actual emulated hardware register, or one of
the invented ones you mention above?

Either way, I'm assuming there must be a PCI_DOWN_BASE register for
each PCI bus, yes?  How is that implemented for PCI to PCI bridges?

>  decide to eject PCI device (which causes clearing of device's bit in PCI=
_DOWN_BASE)
>  or refuse to do it. There is no any progress tracking in QEMU for failur=
e and device's
>  bit in PCI_DOWN_BASE is kept set. On the next device_(add|del) (for any =
PCI device)
>  guest will see it again and will retry removal.

Ok.  Sounds like the bits in PCI_DOWN_BASE are roughly equivalent to
our 'unplug_requested' flag.  In our case it's not guest visible on a
continuing basis, though.  For PAPR hotplug, we have an explicit event
queue, and each event just pertains to a specific device (or cpu, or
memory block).

>  Also if guest reboots with any bits in PCI_DOWN_BASE set, respective dev=
ices will
>  be deleted on QEMU side.

Ok, that's the same as how we behave: on reset anything with
'unplug_requested' will be deleted.

>  There is no other way to cancel removal request in PCI_DOWN_BASE, aside =
of explicitly
>  ejecting device on guest request or implicitly on reboot.
>  IMHO:
>      Sticky nature of PCI_(UP|DOWN)_BASE is more trouble than help but it=
s there since
>      SeaBios times so it's ABI we are stuck with. If I were re-implementi=
ng it now,
>      I would use one shot event that's cleared once guest read it and if =
possible
>      implement _OST status reporting (if it works on Windows).
>  As it stands now, once device_del is issued one user can't know when PCI=
 device will be
>  removed. No timeout will help with it.

Ok.  What happens if you retry a device_del on the same device,
because the guest hasn't responded to the first one?

> * ACPI CPU/Memory hotplug
>  Events triggered by device_del are one shot, then guest may report progr=
ess to QEMU using
>  _OST method (qapi_event_send_acpi_device_ost) (I know that libvirt were =
aware of it,
>  but I don't recall what it does with it). So QEMU might send '_UNPLUG_ER=
ROR' event to
>  user if guest decides so. But instead of duplicating all possible events=
 from spec
>  QEMU will pass _OST arguments [1] as is for user to interpret as describ=
ed by standard.
>  Though I'd say _OST is not 100% reliable, depending used Windows or linu=
x kernel version
>  they might skip on reporting some events. But I don't recall exact state=
 at the time I've
>  been testing it. So I'd call status reporting support as 'best effort'.

Right.  That more or less has to be the case for anything guest
reported.  Even if our guest kernel is supposed to have support for
reporting back, it might fail to due to a bug or unrelated hard freeze.

>  Also it doesn't feature pending removal on reboot, that our ACPI PCI hot=
plug code has.

Oh, that's interesting.  On PAPR we do have pending removal on reboot
for all hotplug types.  I guess if the behaviour isn't even consistent
within x86 variants, it doesn't matter very much if PAPR is consistent
with x86.

>  So with well behaving guest user will get notified about failure or devi=
ce removal (when
>  guest is able to run its code), for broken guests I'm more inclined to s=
ay 'use fixed guest'
>  to get sane behavior.
>  Policy for user is to retry on failure (there is no bad side effects on =
retry).

Ok.  That's different for us - we will fail attempts to retry in qemu,
which I now strongly suspect is a mistake.  I think that shouldn't be
too complicated to change, though.

> I think that any kind of timeout here is inherently racy, in async hot[un=
]plug usecase,
> all user has to do is just sufficiently over-commit host (or run it
> nested).

Ah, I see your point.  No matter how highly the guest prioritizes
handling the unplug event, a slow-running host could mean that it
doesn't complete the handling in time.

Yeah, that's a pretty strong argument against any sort of timeout.

> So it's just a question of how long it will take for user to come back wi=
th a bug report.=20
>=20
> * As far as I'm aware mentioned 'pending_deleted_event' is there to make =
transparent
>   failover magic happen (CCing Jens, also Michael might know how it works)
>=20
> * SHCP & PCI-E has its own set of unplug quirks, which I know little abou=
t but Julia worked
>   with Michael on fixing PCI-E bugs (mostly related how Windows drivers h=
andle unplug,
>   some are not possible to fix, hence decision to add ACPI based hotplug =
to Q35 as workaround).
>   So they might know specifics.

Ok.  I know I've run into a bunch of complications with SHPC and
pciehp for unrelated work (Kata & SR-IOV).  Julia and/or Michael, if
you're able to answer for SHPC and pcieh these two questions, that
would be pretty useful:

   a) If you device_del, but the guest doesn't respond to the request
      at all, what happens?  If you reboot while in that state, does
      the unplug get completed, or cancelled?

   b) Can you safely retry a device_del which is "pending"
      (i.e. issued by qemu, but the guest hasn't responded yet)

> 1) ACPI spec: _OST (OSPM Status Indication)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mIHjn4UdoAEPudQT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBhZw4ACgkQbDjKyiDZ
s5KOdBAAlKycyl6Odv9hgumhggFYG4RTMbpqvy1HTIRyBzaYuJKchK79iX4CMkNm
u6NVQFynDvLjoDLCkXv0pTI/0O8x3tdEXFrvSceVbWh4Zw23vmGt/EztsBTDC0r6
xvJ4BklgAwc4/8nN5E8YMEaQ1eHB+MNKBMRBP4yt20dPmmW2QWbQNLmBSsrdUbqg
9IrrYH1xZHdGZC6LzYNbF7BjkVY1+Ei7an+hBn617bVih61iPiLCTLRLSQSs9rhw
YwAeo9pC/zRrhKAfYiOEwwffT1YjN4lBzeaPOLThw969wTbsTbPdYDExhvyhYWbX
V1THBxW9vrK76W0zOSmrptpLaJmRfwku8bvocbj2+1xqkoNx1WDkOKlEasKq1hzm
n39tv/gS0+TPnjcT/HPFpCyZx+UlZty0kXDMo4vc4NDpAfBbpg0+nIRCbVMWYff3
mNWYTvSu+t9wLAnx3kB6lGF5f/zAp5Z2spF0rSxxqY98ZCG5Bhy9Ep10tv8JkQC7
S+/tUiaDVey74edcjUFzPNo8gWPxxsrnUrtJKUBpbo2aF3Dr1NwZc6dCVqHz5454
+CtzeUEprvJNN5Y1EmjumK+kU0yqktwtzh5Tn6TnPhjXIRU0FCjFgmx033BVCCKi
9Z+s/8qLSo3P5C8IMYLJVQU1JANXw8piAp1qy+1vcvfAolDTAd0=
=SUjy
-----END PGP SIGNATURE-----

--mIHjn4UdoAEPudQT--

