Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDB6343B0E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 08:58:51 +0100 (CET)
Received: from localhost ([::1]:46654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOFSc-0004BO-4r
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 03:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOFPl-0002RQ-Sn; Mon, 22 Mar 2021 03:55:55 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:53677 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOFPi-0001qd-8O; Mon, 22 Mar 2021 03:55:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3myQ0mYYz9sW1; Mon, 22 Mar 2021 18:55:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616399742;
 bh=7hDdYBG9LfxKuBOpETKXmEOYswK+VU2aXqKK9dWhzd4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IMXBKkNxkK9spEiVDdgN/Kjdt9zo2JPuD38O7VJs9jBKg0MRzntzoXb1iZwJjaPxv
 a+auk/yZGFT1q2lgoepfeu5bLdLN0M8T2ZvwNcCb31idHF5rP13nZhfhE1lxCXeOUd
 b2YqD/lKjRLU5De0zD/ftrgRaOFEB7pGMND/zhW8=
Date: Mon, 22 Mar 2021 17:39:37 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC] adding a generic QAPI event for failed device hotunplug
Message-ID: <YFg7qYYBqGZuKSO+@yekko.fritz.box>
References: <155911cc-8764-1a65-4bb3-2fc0628d52e5@gmail.com>
 <877dmkrcpl.fsf@dusky.pond.sub.org>
 <d9567bf3-8740-e8fe-b29b-a3b0ebdb5809@gmail.com>
 <87blbt60hc.fsf@dusky.pond.sub.org>
 <8b79c207-f653-9eec-77f1-ea46c7c75ad5@gmail.com>
 <YEbp4wKK/QY7uKYw@yekko.fritz.box>
 <87mtvczvzw.fsf@dusky.pond.sub.org>
 <98d44670-5a63-1feb-aad8-9dbc62cf2e7a@gmail.com>
 <YErBpf7w25xho1so@yekko.fritz.box>
 <875z1w7ptm.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/xi21Mu/wqRO5Qgz"
Content-Disposition: inline
In-Reply-To: <875z1w7ptm.fsf@dusky.pond.sub.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, michael.roth@amd.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Julia Suvorova <jusual@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Laine Stump <laine@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/xi21Mu/wqRO5Qgz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 09:12:53AM +0100, Markus Armbruster wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Thu, Mar 11, 2021 at 05:50:42PM -0300, Daniel Henrique Barboza wrote:
> >>=20
> >>=20
> >> On 3/9/21 3:22 AM, Markus Armbruster wrote:
> >> > Cc: Paolo and Julia in addition to Igor, because the thread is wande=
ring
> >> > towards DeviceState member pending_deleted_event.
> >> >=20
> >> > Cc: Laine for libvirt expertise.  Laine, if you're not the right per=
son,
> >> > please loop in the right person.
> >> >=20
> >> > David Gibson <david@gibson.dropbear.id.au> writes:
> >> >=20
> >> > > On Mon, Mar 08, 2021 at 03:01:53PM -0300, Daniel Henrique Barboza =
wrote:
> >> > > >=20
> >> > > >=20
> >> > > > On 3/8/21 2:04 PM, Markus Armbruster wrote:
> >> > > > > Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> >> > > > >=20
> >> > > > > > On 3/6/21 3:57 AM, Markus Armbruster wrote:
> >> > [...]
> >> > > > > > > We should document the event's reliability.  Are there unp=
lug operations
> >> > > > > > > where we can't detect failure?  Are there unplug operation=
s where we
> >> > > > > > > could, but haven't implemented the event?
> >> > > > > >=20
> >> > > > > > The current version of the PowerPC spec that the pseries mac=
hine implements
> >> > > > > > (LOPAR) does not predict a way for the virtual machine to re=
port a hotunplug
> >> > > > > > error back to the hypervisor. If something fails, the hyperv=
isor is left
> >> > > > > > in the dark.
> >> > > > > >=20
> >> > > > > > What happened in the 6.0.0 dev cycle is that we faced a reli=
able way of
> >> > > > >=20
> >> > > > > Do you mean "unreliable way"?
> >> > > >=20
> >> > > > I guess a better word would be 'reproducible', as in we discover=
ed a reproducible
> >> > > > way of getting the guest kernel to refuse the CPU hotunplug.
> >> > >=20
> >> > > Right.  It's worth noting here that in the PAPR model, there are no
> >> > > "forced" unplugs.  Unplugs always consist of a request to the gues=
t,
> >> > > which is then resposible for offlining the device and signalling b=
ack
> >> > > to the hypervisor that it's done with it.
> >> > >=20
> >> > > > > > making CPU hotunplug fail in the guest (trying to hotunplug =
the last online
> >> > > > > > CPU) and the pseries machine was unprepared for dealing with=
 it. We ended up
> >> > > > > > implementing a hotunplug timeout and, if the timeout kicks i=
n, we're assuming
> >> > > > > > that the CPU hotunplug failed in the guest. This is the firs=
t scenario we have
> >> > > > > > today where we want to send a QAPI event informing the CPU h=
otunplug error,
> >> > > > > > but this event does not exist in QEMU ATM.
> >> > > > >=20
> >> > > > > When the timeout kicks in, how can you know the operation fail=
ed?  You
> >> > > > > better be sure when you send an error event.  In other words: =
what
> >> > > > > prevents the scenario where the operation is much slower than =
you
> >> > > > > expect, the timeout expires, the error event is sent, and then=
 the
> >> > > > > operation completes successfully?
> >> > > >=20
> >> > > > A CPU hotunplug in a pseries guest takes no more than a couple o=
f seconds, even
> >> > > > if the guest is under heavy load. The timeout is set to 15 secon=
ds.
> >> > >=20
> >> > > Right.  We're well aware that a timeout is an ugly hack, since it's
> >> > > not really possible to distinguish it from a guest that's just bei=
ng
> >> > > really slow.
> >> >=20
> >> > As long as unplug failure cannot be detected reliably, we need a tim=
eout
> >> > *somewhere*.  I vaguely recall libvirt has one.  Laine?
> >>=20
> >> Yeah, Libvirt has a timeout for hotunplug operations. I agree that QEM=
U doing
> >> the timeout makes more sense since it has more information about the
> >> conditions/mechanics involved.
> >
> > Right.  In particular, I can't really see how libvirt can fully
> > implement that timeout.  AFAIK qemu has no way of listing or
> > cancelling "in flight" unplug requests, so it's entirely possible that
> > the unplug could still complete after libvirt's has "timed out".
>=20
> QEMU doesn't really keep track of "in flight" unplug requests, and as
> long as that's the case, its timeout even will have the same issue.

Not generically, maybe.  In the PAPR code we effectively do, by means
of the 'unplug_requested' boolean in the DRC structure.  Maybe that's
a mistake, but at the time I couldn't see how else to handle things.

Currently we will resolve all "in flight" requests at machine reset
time, effectively completing those requests.  Does that differ from
x86 behaviour?

Now that the timeout has been added, we do clear the unplug_requested
flag if we hit it, which effectively "cancels" the unplug request - I
believe if the guest attempts to complete the unplug later, we'll fail
it because that flag is no longer set.

> >> At this moment, the only case I know of hotunplug operations timing ou=
t in
> >> QEMU is what we did with CPU hotunplug in pseries though. I can't tell=
 if
> >> unplug timeout is desirable mechanism for other machines/device types.
>=20
> I think we first need to nail down what the even means.  It could mean
> "hot unplug definitely failed" or "hot unplug did not complete in time".
>=20
> Any operation that is not instantaneous goes through a state where it
> neither succeeded nor failed.
>=20
> When the duration of that state is unbounded, no timeout can get us out
> of it.  When exiting the state requires guest cooperation, its duration
> is unbounded.  "Definitely failed" semantics is unattainable.
>=20
> It is attainable if we can somehow cancel the unplug, because that
> forces transition to "failed".

Right, we effectively can and do do this in the PAPR model.  When we
clear the unplug_requested flag on timeout, operations that the guest
would perform to implement the unplug will now fail.

> I suspect we have at least three kinds of unplugs: effectively
> instantaneous (command completes the job, e.g. USB), unbounded and not
> cancelable, unbounded and cancelable.
>=20
> When we onlw know "did not complete in time", the management application
> needs a way to retry the unplug regardless of actual state.  If the
> unplug succeeded meanwhile (sending DEVICE_DELETED), the retry should
> fail.  If it failed meanwhile, start over.  If it's still in progress,
> do nothing.
>=20
> We can choose to leave cancelling to the management application.  Ditch
> "definitely failed", report "did not complete in time".  The management
> application can then either cancel or retry.  The former succeeds if it
> canceled the unplug, fails if the unplug completed meanwhile, which also
> sent DEVICE_DELETED).
>=20
> I think before we can continue reworking the code, we need consensus on
> a hot unplug state machine that works for all known cases, or at least
> the cases we have in QEMU.

Right..

> >> > Putting the timeout in QEMU might be better.  QEMU might be in a bet=
ter
> >> > position to pick a suitable timeout.
> >> >=20
> >> > > It was the best thing we could come up with in the short term thou=
gh.
> >> > > Without the changes we're suggesting here, the guest can positively
> >> > > assert the unplug is complete, but it has no way to signal failure.
> >> > > So, without a timeout qemu is stuck waiting indefinitely (or at le=
ast
> >> > > until the next machine reset) on the guest for an unplug that might
> >> > > never complete.
> >> > >=20
> >> > > It's particularly nasty if the guest does really fail the hotplug
> >> > > internally, but then conditions change so that the same unplug cou=
ld
> >> > > now succeed.  The unplug request is just a message - there's no gu=
est
> >> > > visible persistent state saying we want the device unplugged, so if
> >> > > conditions change the guest won't then re-attempt the unplug.
> >> > > Meanwhile the user can't re-attempt the device_del, because on the
> >> > > qemu side it's still stuck in a pending unplug waiting on the gues=
t.
> >> >=20
> >> > "Can't re-attempt" feels like a bug.  Let me explain.
> >
> > You may be right.  Perhaps we should just send another unplug message
> > if we get a device_del on something that's already pending deletion.
> > AFAICT repeated unplug messages for the same device should be
> > harmless.
>=20
> Consider physical PCI hot unplug.  You press a button next to the slot,
> wait for the (figuratively) green light, then pull out the card.  You
> can press the button as many times as you want.

Urgh... actually there's a whole other can of worms there.  With my
Kata hat on, I'm hitting horrible problems with PCI hotplug where
virtually pressing that button can race with the kernel's normal
device probing, with the end result that the kernel misinterprets the
button push as an unplug request instead of inplug.

But.. actually, I don't think you can push the button as many times as
you want, at least with SHPC.  From looking at this code, I believe
pressing the button when in the transitional state *cancels* the
unplug request (and there's a 5s pause built into the spec, AFAICT
precisely to make such a cancel humanly possible).

> >> So, what David mentioned above is related to pseries internals I belie=
ve.
> >>=20
> >> Up to 5.2.0 the pseries machine were silently ignoring all 'device_del'
> >> issued for devices that were in the middle of the unplug process, with=
 the
> >> exception of DIMMs where we bothered to throw an error message back to=
 the
> >> user.
> >>=20
> >> In 6.0.0 the code was reworked, and now we're always letting the user =
know
> >> when the 'device_del' was ignored due to an ongoing hotunplug of the d=
evice.
> >> And for CPUs we also tell the timeout remaining. We're still not sendi=
ng
> >> multiple hotunplug IRQ pulses to the guest, but at least the user is n=
ow
> >> informed about it.
>=20
> This is possible because you know unplug is in progress.  I'm not sure
> we can know for all devices.
>=20
> >> As for the commit mentioned below:
> >>=20
> >> >=20
> >> > Depending on the device, device_del can complete the unplug, or mere=
ly
> >> > initiate it.  Documentation:
> >> >=20
> >> > # Notes: When this command completes, the device may not be removed =
=66rom the
> >> > #        guest.  Hot removal is an operation that requires guest coo=
peration.
> >> > #        This command merely requests that the guest begin the hot r=
emoval
> >> > #        process.  Completion of the device removal process is signa=
led with a
> >> > #        DEVICE_DELETED event. Guest reset will automatically comple=
te removal
> >> > #        for all devices.
> >> >=20
> >> > This is not as accurate as it could be.  Behavior depends on the dev=
ice.
> >> >=20
> >> > For some kinds of devices, the command completes the unplug before it
> >> > sends its reply.  Example: USB devices.  Fine print: the DEVICE_DELE=
TED
> >> > event gets send with a slight delay because device cleanup uses RCU.
> >> >=20
> >> > For others, notably PCI devices, the command only pokes the guest to=
 do
> >> > its bit.  QEMU reacts to the guest's actions, which eventually leads=
 to
> >> > the actual unplug.  DEVICE_DELETED gets sent then.  If the guest doe=
sn't
> >> > play ball to the end, the event doesn't get send.
> >> >=20
> >> > The "can't retry unplug" behavior is new.  Another device_del used to
> >> > simply poke the guest again.
> >
> > Maybe on x86.  I think a repeated device_del was at best a no-op on
> > PAPR.
>=20
> There's certainly more than one way to skin this cat.  When QEMU knows
> the guest is still working on the unplug, poking the guest again is
> useless at best.

Right, but we don't know that the guest is still working on the
unplug.  We just know we notified it and it hasn't responded.  It
might still be working on it, it might have tried and failed (because
it has no way to report that), or it might have just lost the request
completely.

> >> > I think this regressed in commit
> >> > cce8944cc9 "qdev-monitor: Forbid repeated device_del", 2020-02-25.
> >> > Feels like a must-fix for 6.0.
> >>=20
> >>=20
> >> This doesn't directly affect pseries code because we're not using
> >> dev->pending_deleted_event to track the pending unplug status. We're
> >
> > Huh... I didn't know about pending_deleted_event.  Maybe we *should*
> > be using that.  Handling the migration will be painful, of course.
>=20
> Paolo and I believe the code around @pending_deleted_event has become
> wrong.
>=20
> @pending_deleted_event was created to get DEVICE_DELETED right for
> recursively deleted devices (commit 352e8da74).  It did *not* "track the
> pending unplug status".
>=20
> It was later appropriated for other purposes (commit c000a9bd0,
> 9711cd0df, cce8944cc).  Paolo and I believe these are wrong.
>=20
> >> using an internal flag that is related to the DRC (the 'hotplug state'
> >> of the device).
> >>=20
> >> The commit seems a bit odd because it is making a change in the common=
 code
> >> inside qmp_device_del() based on a PCI-e specific behavior. In the end=
 this
> >> doesn't impact any other device but PCI-e (it is the only device that =
uses
> >> dev->pending_deleted_event to mark the start and finish of the unplug =
process),
> >> but it's not something that I might expect in that function.
>=20
> Concur.
>=20
> >> IMO this verification should be removed from qmp_device_del and moved =
to
> >> pcie_cap_slot_unplug_request_cb(). This would fix the problem for PCIe=
 devices
> >> without making assumptions about everything else.
>=20
> A subset of {Igor, Julia, Juan} intends to look into this in time for 6.0.
>=20
> >> > > As we're discussing we think we have a better way, but it relies on
> >> > > guest changes, so we can't assume we already have that on the qemu
> >> > > side.
> >> > >=20
> >> > > > I'm aware that there's always that special use case, that we hav=
en't seen yet,
> >> > > > where this assumption is no longer valid. The plan is to change =
the spec and the
> >> > > > guest kernel to signal the CPU hotunplug error back to QEMU befo=
re the dragon
> >> > > > lands. For now, timing out the CPU hotunplug process when we're =
almost certain
> >> > > > (but not 100%) that it failed in the guest is the best can do.
> >> > > >=20
> >> > > > For both cases I want to use DEVICE_UNPLUG_ERROR right from the =
start, avoiding
> >> > > > guest visible changes when we change how we're detecting the unp=
lug errors.
> >> > > >=20
> >> > > > > > The second scenario is a memory hotunplug error. I found out=
 that the pseries
> >> > > > > > guest kernel does a reconfiguration step when re-attaching t=
he DIMM right
> >> > > > > > after refusing the hotunplug, and this reconfiguration is vi=
sible to QEMU.
> >> > > > > > I proceeded to make the pseries machine detect this error ca=
se, rollback the
> >> > > > > > unplug operation and fire up the MEM_UNPLUG_ERROR. This case=
 is already covered
> >> > > > > > by QAPI, but if we add a DEVICE_UNPLUG_ERROR event I would u=
se it in this case as
> >> > > > > > well instead of the MEM specific one.
> >> > > > > >=20
> >> > > > > > This investigation and work in the mem hotunplug error path =
triggered a
> >> > > > > > discussion in qemu-ppc, where we're considering whether we s=
hould do the same
> >> > > > > > signalling the kernel does for the DIMM hotunplug error for =
all other device
> >> > > > > > hotunplug errors, given that the reconfiguration per se is n=
ot forbidden by LOPAR
> >> > > > > > and it's currently a no-op. We would make a LOPAR spec chang=
e to make this an
> >> > > > > > official hotunplug error report mechanism, and all pseries h=
otunplug operations,
> >> > > > > > for all devices, would report DEVICE_UNPLUG_ERROR QAPI event=
s in the error path.
> >> > > > > >=20
> >> > > > > > Granted, the spec change + Kernel change is not something th=
at we will be able
> >> > > > > > to nail down in the 6.0.0 cycle, but having the DEVICE_UNPLU=
G_ERROR QAPI event
> >> > > > > > already in place would make it easier for the future as well.
> >> > > > > >=20
> >> > > > > >=20
> >> > > > > > I have a doc draft of these changes/infos that I forgot to p=
ost. I would post
> >> > > > > > it as docs/system/ppc-spapr-hotunplug-notes.rst. I can add t=
he QAPI events
> >> > > > > > information there as well. Does that work for you as far as =
documentation
> >> > > > > > goes?
> >> > > > >=20
> >> > > > > A DEVICE_UNPLUG_ERROR event makes perfect sense regardless of =
machine
> >> > > > > and device.
> >> > >=20
> >> > > Ack.  Fwiw, I don't think this can ever be more than a "best effor=
t"
> >> > > notification.  Even with a machine and OS that should support it, a
> >> > > guest bug or hang could mean that it never acks *or* nacks an unpl=
ug
> >> > > request.
> >> >=20
> >> > Since the success event is named DEVICE_DELETED, I'd name the
> >> > probably-failed event DEVICE_NOT_DELETED.  Bonus: can read it as a
> >> > statement of fact "still not deleted" instead of an error (that just
> >> > might not be one).
> >>=20
> >>=20
> >> "DEVICE_NOT_DELETED" sounds way better for what we want to express in =
the
> >> pseries case when we can't be 100% sure of a guest side error. However,
> >> there is at least one case where I'm sure of a guest side error (where=
 I'm
> >> using MEM_UNPLUG_ERROR), so DEVICE_UNPLUG_ERROR seems fitting in that =
case.
> >>=20
> >>=20
> >> Should we add both DEVICE_NOT_DELETED and DEVICE_UNPLUG_ERROR then? I =
can use
> >> both in pseries-6.0.0.
>=20
> Separate QMP events are advisable when their meaning is different enough
> for a management application to want to tell them apart.
>=20
> [...]
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/xi21Mu/wqRO5Qgz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYO6YACgkQbDjKyiDZ
s5LIRw//UR64FugnqgFphVkNxW5dzUE5ryMYk4eI5fCDhWkJMUSz7M9r5SMB9s7T
vB+1Dhl3Qx+3m4PBtSYjtp/vJrBsA8Amm4wAM9nVXHLhjDawZcw9xGPG6ty5mBKt
oxutSQJEmdUJ9xXJJ6AJ0gSAfSnsKb9CuX2rnSsSIDyiAn0VjSZufDa+BEc9wFic
Q4BccFCsF9lHtnQ2DkPJL/FgXseJC9Z6xwwMaQx5QmmSFztuV+yYg4Yehank66u2
yfgF9jIWp3TR7JZ8oQBVdNuszS/C7iLs/RzbWbBXM4z9MnhSaAp1sT8SouUrmyl0
JnG74RL7nfxRBF71giKNFGhXpSvHGCpzzG3mBa+K3VGfuwn32p5p/9XX7/95hRGU
yxwwPgbcJbWvIf7GLTLid8vS4JrKoA5ChPC0j+Q7QHIAM6NK66rsWE9ePoRPRLAW
kvVhVbPKwkuzIKsqFFjqqRZ2SdMLr8+AGREEFN7bItz1CqpSMk4ofyuiDbkgYduU
91PhI0Q0Sxn7FCba/AbVrZYZ1RKnz9vqSrYDVnD3ZRfDiJOLLrbdaNz8FnTJZ+16
gPgK+FS0JLm7FYWBjKzyBlVzaUAn8IewTn6lzXnsbzPxCdgkoyfUqKrbO3ZjNblq
u3gm3IuzPXdjciETPifMWrrwNjlbp5wmQWQfxYCOj3WLn+HuK28=
=5TMT
-----END PGP SIGNATURE-----

--/xi21Mu/wqRO5Qgz--

