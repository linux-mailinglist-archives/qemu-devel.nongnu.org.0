Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C53343B12
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 08:59:19 +0100 (CET)
Received: from localhost ([::1]:48362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOFT4-0004v6-LR
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 03:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOFPl-0002RP-SC; Mon, 22 Mar 2021 03:55:55 -0400
Received: from ozlabs.org ([203.11.71.1]:53091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOFPh-0001rG-Hu; Mon, 22 Mar 2021 03:55:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3myQ5fL3z9sVt; Mon, 22 Mar 2021 18:55:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616399742;
 bh=WG10ZhXbOvnE76fzjTAgUpWn7wSQL5Ln2YBtwPQQxv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lmTzgWs8gAsx4aoBqz/9GgaixNzyPCJyoc1kgS6MAOcfx0DOMBYIMYXY8S9ZWs6sL
 esGyKjESa17Ules5JgSE6Q5CFSBLMiV+nCQDIyY/a3tIjtewmFPJq6rWhIvZFLieVm
 t7hk8eEIqYNsccOURi91IzG5yPzvxgoUaGuzumlQ=
Date: Mon, 22 Mar 2021 17:43:24 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Laine Stump <laine@redhat.com>
Subject: Re: [RFC] adding a generic QAPI event for failed device hotunplug
Message-ID: <YFg8jCvFBcRUOrWS@yekko.fritz.box>
References: <155911cc-8764-1a65-4bb3-2fc0628d52e5@gmail.com>
 <877dmkrcpl.fsf@dusky.pond.sub.org>
 <d9567bf3-8740-e8fe-b29b-a3b0ebdb5809@gmail.com>
 <87blbt60hc.fsf@dusky.pond.sub.org>
 <8b79c207-f653-9eec-77f1-ea46c7c75ad5@gmail.com>
 <YEbp4wKK/QY7uKYw@yekko.fritz.box>
 <87mtvczvzw.fsf@dusky.pond.sub.org>
 <98d44670-5a63-1feb-aad8-9dbc62cf2e7a@gmail.com>
 <YErBpf7w25xho1so@yekko.fritz.box>
 <70a596e0-102c-60ce-ccf7-6c961fa5eec3@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zbcUYz2Ih+hMrsEq"
Content-Disposition: inline
In-Reply-To: <70a596e0-102c-60ce-ccf7-6c961fa5eec3@redhat.com>
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, michael.roth@amd.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Julia Suvorova <jusual@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zbcUYz2Ih+hMrsEq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 08:38:47AM -0500, Laine Stump wrote:
> On 3/11/21 8:19 PM, David Gibson wrote:
> > On Thu, Mar 11, 2021 at 05:50:42PM -0300, Daniel Henrique Barboza wrote:
> > >=20
> > >=20
> > > On 3/9/21 3:22 AM, Markus Armbruster wrote:
> > > > Cc: Paolo and Julia in addition to Igor, because the thread is wand=
ering
> > > > towards DeviceState member pending_deleted_event.
> > > >=20
> > > > Cc: Laine for libvirt expertise.  Laine, if you're not the right pe=
rson,
> > > > please loop in the right person.
> > > >=20
> > > > David Gibson <david@gibson.dropbear.id.au> writes:
> > > >=20
> > > > > On Mon, Mar 08, 2021 at 03:01:53PM -0300, Daniel Henrique Barboza=
 wrote:
> > > > > >=20
> > > > > >=20
> > > > > > On 3/8/21 2:04 PM, Markus Armbruster wrote:
> > > > > > > Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> > > > > > >=20
> > > > > > > > On 3/6/21 3:57 AM, Markus Armbruster wrote:
> > > > [...]
> > > > > > > > > We should document the event's reliability.  Are there un=
plug operations
> > > > > > > > > where we can't detect failure?  Are there unplug operatio=
ns where we
> > > > > > > > > could, but haven't implemented the event?
> > > > > > > >=20
> > > > > > > > The current version of the PowerPC spec that the pseries ma=
chine implements
> > > > > > > > (LOPAR) does not predict a way for the virtual machine to r=
eport a hotunplug
> > > > > > > > error back to the hypervisor. If something fails, the hyper=
visor is left
> > > > > > > > in the dark.
> > > > > > > >=20
> > > > > > > > What happened in the 6.0.0 dev cycle is that we faced a rel=
iable way of
> > > > > > >=20
> > > > > > > Do you mean "unreliable way"?
> > > > > >=20
> > > > > > I guess a better word would be 'reproducible', as in we discove=
red a reproducible
> > > > > > way of getting the guest kernel to refuse the CPU hotunplug.
> > > > >=20
> > > > > Right.  It's worth noting here that in the PAPR model, there are =
no
> > > > > "forced" unplugs.  Unplugs always consist of a request to the gue=
st,
> > > > > which is then resposible for offlining the device and signalling =
back
> > > > > to the hypervisor that it's done with it.
> > > > >=20
> > > > > > > > making CPU hotunplug fail in the guest (trying to hotunplug=
 the last online
> > > > > > > > CPU) and the pseries machine was unprepared for dealing wit=
h it. We ended up
> > > > > > > > implementing a hotunplug timeout and, if the timeout kicks =
in, we're assuming
> > > > > > > > that the CPU hotunplug failed in the guest. This is the fir=
st scenario we have
> > > > > > > > today where we want to send a QAPI event informing the CPU =
hotunplug error,
> > > > > > > > but this event does not exist in QEMU ATM.
> > > > > > >=20
> > > > > > > When the timeout kicks in, how can you know the operation fai=
led?  You
> > > > > > > better be sure when you send an error event.  In other words:=
 what
> > > > > > > prevents the scenario where the operation is much slower than=
 you
> > > > > > > expect, the timeout expires, the error event is sent, and the=
n the
> > > > > > > operation completes successfully?
> > > > > >=20
> > > > > > A CPU hotunplug in a pseries guest takes no more than a couple =
of seconds, even
> > > > > > if the guest is under heavy load. The timeout is set to 15 seco=
nds.
> > > > >=20
> > > > > Right.  We're well aware that a timeout is an ugly hack, since it=
's
> > > > > not really possible to distinguish it from a guest that's just be=
ing
> > > > > really slow.
> > > >=20
> > > > As long as unplug failure cannot be detected reliably, we need a ti=
meout
> > > > *somewhere*.  I vaguely recall libvirt has one.  Laine?
> > >=20
> > > Yeah, Libvirt has a timeout for hotunplug operations. I agree that QE=
MU doing
> > > the timeout makes more sense since it has more information about the
> > > conditions/mechanics involved.
> >=20
> > Right.  In particular, I can't really see how libvirt can fully
> > implement that timeout.  AFAIK qemu has no way of listing or
> > cancelling "in flight" unplug requests, so it's entirely possible that
> > the unplug could still complete after libvirt's has "timed out".
>=20
> (I'm purposefully not trying to understand the full context of all of thi=
s,
> as I'm mostly unconnected right now, and only popped in at the mention of=
 my
> name and CC. So forgive me if I'm missing some of the details of the
> conversation - I'm only here to give context about libvirt's timeout duri=
ng
> unplug)
>=20
> I didn't remember there being any sort of timeout for unplugs in libvirt,=
 so
> I went back into the code and found that there *is* a timeout (I'd just
> forgotten that I'd ever seen it), but (for PCI devices, which is the only
> hotplug/unplug code I have any real familiarity with) it is just a short =
(10
> seconds for PPC, 5 seconds for other platforms) to see if the unplug can
> complete before the public API returns; if there is a "timeout" then we
> still return success (after logging a warning message) but the device sta=
ys
> in the domain's device list, and nothing else is changed unless/until we
> receive a DEVICE_DELETED event from qemu (completely asynchronous -
> libvirt's API has long ago returned success) - only then do we remove the
> device from libvirt's domain status. libvirt won't/can't ever go back and
> retroactively fail the API that's already completed successfully though :=
-)

Huh.  That seems... kinda bogus.  It really seems to me you need to
provide either a synchronous interface: wait indefinitely for
completion - or an asynchronous one: always return quickly and user
has to wait for the completion event.  Having this hybrid just seems
confusing.

> For VCPUs (which I guess is what you're exclusively talking about here) it
> looks like libvirt waits for the same 5-10 seconds (during the unplug API
> call) and if it hasn't received DEVICE_DELETED, then it returns an error:
>=20
>     if ((rc =3D qemuDomainWaitForDeviceRemoval(vm)) <=3D 0) {
>         if (rc =3D=3D 0)
>             virReportError(VIR_ERR_OPERATION_TIMEOUT, "%s",
>                            _("vcpu unplug request timed out. Unplug resul=
t "
>                              "must be manually inspected in the domain"));
>=20
>         goto cleanup;
>     }
>=20
> Here's what Peter says in the commit log when he replaced old-useless VCPU
> unplug code with new-working code in 2016:
>=20
>     As the new code is using device_del all the implications of using it
>     are present. Contrary to the device deletion code, the vcpu deletion
>     code fails if the unplug request is not executed in time.
>=20
> I have no clue why in the case of PCI devices libvirt is logging a warning
> and returning success, while in the case of VCPUs it is logging an error =
and
> returning failure. I think there may have originally been a stated/unstat=
ed
> assumption that the libvirt unplug APIs were synchronous, and both
> situations were just the result of later trying to cope with the reality
> that the operation is actually asynchronous.

That seems pretty plausible.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zbcUYz2Ih+hMrsEq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYPIwACgkQbDjKyiDZ
s5IoyA//Y0/nL+ImUPbHKYHfLkSYyHUb9iPUsNPC5WX4eeEcs+KFeVEaCxu2F/1o
gEzHSGlwL9F1B9ZIg2dwTdYm66GnFssgvSiM4eRsNyIum6qKsjAT2Yw5jiu5A2jI
S59J6v3uLa3LMDcRYWWsOymDUQJIhNONxvVuV4N1FKHPJ/2CwlrqPPn4DwSC8e1F
rQxA277sYc8D62T/wPZiqwmH4dadAH8VRtGvvcH0NZ7notXWPaXiQfqMEOkkkK4Z
9igLM164AiI1erYesgOTKfRBaDip8XX5C0fGm9KoAg/HsMMVrjhZkkFVATl8Ah1q
UpDrQ4M3zT19zWicSCwvod/P4Hnq+75WcXVrTUCb/qxrM9oDrEe6vVYyxhIehE9i
vy5joW7zoxS0HQKtsleooBD7zECRbn6lRnZkLbjQkxb4sMijnOyU1heRQm1jTPFs
ZD+YOsZz+Ed30rywavZDeCHZGFdoYTE3U668rdL1FYi4wEMyfDeagj/DfCdWD1w1
2ldoj6i+35jO+tT9o7swWpFBv9sfX1WkQADwYzxU4LD828Or5XkRIYHNjT/+MuVG
fU5dZA85xs1wpUdYkG00RTn+AfPbV7C+ehwtDt3dciMWkdV/5c55KQSftMyDcWe6
7jYa7+QrfC/O/0HSBGxr/z0E+MtTPLeAFtOULur1vADlUbkPwxM=
=ryPo
-----END PGP SIGNATURE-----

--zbcUYz2Ih+hMrsEq--

