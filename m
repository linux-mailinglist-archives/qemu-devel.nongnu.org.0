Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFA645DD5D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:25:50 +0100 (CET)
Received: from localhost ([::1]:53486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGdB-0005ge-Ax
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:25:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1mqGPB-0008E4-76
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:11:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1mqGP6-0002fl-94
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:11:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637853075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LlEKFOQ+zcmtJJV4XvTMB+gr73ZYviRDU5Vwbtf8heU=;
 b=TVJq+FA82jBRqzzc4gbgeAGqQnY7ZcxGK9m7ZXaSqLVk+DAU0PFQMp10tWNVFyVv1jSO/K
 lnWXqs8jx9E/eq31+dLazuRCeB5X1DvQ6vl914lzx89hT+oxCO8CTFLix2soNAHPaxtvUb
 4N412PKDptC8JGfq+G0sMUS61Ffhp8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-lL28lePLOxOcYf-lq9v4QQ-1; Thu, 25 Nov 2021 10:11:10 -0500
X-MC-Unique: lL28lePLOxOcYf-lq9v4QQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9A191006AA0;
 Thu, 25 Nov 2021 15:11:08 +0000 (UTC)
Received: from localhost (unknown [10.33.36.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 802C25D9C0;
 Thu, 25 Nov 2021 15:11:20 +0000 (UTC)
Date: Thu, 25 Nov 2021 16:11:07 +0100
From: Sergio Lopez <slp@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: SEV guest attestation
Message-ID: <20211125151107.nhh7jfofk7qhkujd@mhamilton>
References: <YZ58+T04uVXaO2Ab@redhat.com> <YZ6Ec0yG82nhbN+B@work-vm>
 <20211125071428.dpnavgxd3w4bzktr@mhamilton>
 <53dc2a76-a6bb-dc8d-1a47-faf7577e59e8@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <53dc2a76-a6bb-dc8d-1a47-faf7577e59e8@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7pr5rnj6flnk36lh"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 afrosi@redhat.com, James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Hubertus Franke <frankeh@us.ibm.com>, Tyler Fanelli <tfanelli@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 dinechin@redhat.com, John Ferlan <jferlan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7pr5rnj6flnk36lh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 02:44:51PM +0200, Dov Murik wrote:
> [+cc jejb, tobin, jim, hubertus]
>=20
>=20
> On 25/11/2021 9:14, Sergio Lopez wrote:
> > On Wed, Nov 24, 2021 at 06:29:07PM +0000, Dr. David Alan Gilbert wrote:
> >> * Daniel P. Berrang=E9 (berrange@redhat.com) wrote:
> >>> On Wed, Nov 24, 2021 at 11:34:16AM -0500, Tyler Fanelli wrote:
> >>>> Hi,
> >>>>
> >>>> We recently discussed a way for remote SEV guest attestation through=
 QEMU.
> >>>> My initial approach was to get data needed for attestation through d=
ifferent
> >>>> QMP commands (all of which are already available, so no changes requ=
ired
> >>>> there), deriving hashes and certificate data; and collecting all of =
this
> >>>> into a new QMP struct (SevLaunchStart, which would include the VM's =
policy,
> >>>> secret, and GPA) which would need to be upstreamed into QEMU. Once t=
his is
> >>>> provided, QEMU would then need to have support for attestation befor=
e a VM
> >>>> is started. Upon speaking to Dave about this proposal, he mentioned =
that
> >>>> this may not be the best approach, as some situations would render t=
he
> >>>> attestation unavailable, such as the instance where a VM is running =
in a
> >>>> cloud, and a guest owner would like to perform attestation via QMP (=
a likely
> >>>> scenario), yet a cloud provider cannot simply let anyone pass arbitr=
ary QMP
> >>>> commands, as this could be an issue.
> >>>
> >>> As a general point, QMP is a low level QEMU implementation detail,
> >>> which is generally expected to be consumed exclusively on the host
> >>> by a privileged mgmt layer, which will in turn expose its own higher
> >>> level APIs to users or other apps. I would not expect to see QMP
> >>> exposed to anything outside of the privileged host layer.
> >>>
> >>> We also use the QAPI protocol for QEMU guest agent commmunication,
> >>> however, that is a distinct service from QMP on the host. It shares
> >>> most infra with QMP but has a completely diffent command set. On the
> >>> host it is not consumed inside QEMU, but instead consumed by a
> >>> mgmt app like libvirt.=20
> >>>
> >>>> So I ask, does anyone involved in QEMU's SEV implementation have any=
 input
> >>>> on a quality way to perform guest attestation? If so, I'd be interes=
ted.
> >>>
> >>> I think what's missing is some clearer illustrations of how this
> >>> feature is expected to be consumed in some real world application
> >>> and the use cases we're trying to solve.
> >>>
> >>> I'd like to understand how it should fit in with common libvirt
> >>> applications across the different virtualization management
> >>> scenarios - eg virsh (command line),  virt-manger (local desktop
> >>> GUI), cockpit (single host web mgmt), OpenStack (cloud mgmt), etc.
> >>> And of course any non-traditional virt use cases that might be
> >>> relevant such as Kata.
> >>
> >> That's still not that clear; I know Alice and Sergio have some ideas
> >> (cc'd).
> >> There's also some standardisation efforts (e.g. https://www.potaroo.ne=
t/ietf/html/ids-wg-rats.html=20
> >> and https://www.ietf.org/archive/id/draft-ietf-rats-architecture-00.ht=
ml
> >> ) - that I can't claim to fully understand.
> >> However, there are some themes that are emerging:
> >>
> >>   a) One use is to only allow a VM to access some private data once we
> >> prove it's the VM we expect running in a secure/confidential system
> >>   b) (a) normally involves requesting some proof from the VM and then
> >> providing it some confidential data/a key if it's OK
> >>   c) RATs splits the problem up:
> >>     https://www.ietf.org/archive/id/draft-ietf-rats-architecture-00.ht=
ml#name-architectural-overview
> >>     I don't fully understand the split yet, but in principal there are
> >> at least a few different things:
> >>
> >>   d) The comms layer
> >>   e) Something that validates the attestation message (i.e. the
> >> signatures are valid, the hashes all add up etc)
> >>   f) Something that knows what hashes to expect (i.e. oh that's a RHEL
> >> 8.4 kernel, or that's a valid kernel command line)
> >>   g) Something that holds some secrets that can be handed out if e & f
> >> are happy.
> >>
> >>   There have also been proposals (e.g. Intel HTTPA) for an attestable
> >> connection after a VM is running; that's probably quite different from
> >> (g) but still involves (e) & (f).
> >>
> >> In the simpler setups d,e,f,g probably live in one place; but it's not
> >> clear where they live - for example one scenario says that your cloud
> >> management layer holds some of them, another says you don't trust your
> >> cloud management layer and you keep them separate.
> >>
> >> So I think all we're actually interested in at the moment, is (d) and
> >> (e) and the way for (g) to get the secret back to the guest.
> >>
> >> Unfortunately the comms and the contents of them varies heavily with
> >> technology; in some you're talking to the qemu/hypervisor (SEV/SEV-ES)
> >> while in some you're talking to the guest after boot (SEV-SNP/TDX mayb=
e
> >> SEV-ES in some cases).
>=20
> SEV-ES has pre-launch measurement and secret injection, just like SEV
> (except that the measurement includes the initial states of all vcpus,
> that is, their VMSAs.  BTW that means that in order to calculate the
> measurement the Attestation Server must know exactly how many vcpus are
> in the VM).

You need the number of vCPUs and an idea of what their initial state
is going to be, to be able to reproduce the same VMSA struct in the
Attestation Server.

This may tie the Attestation Server with a particular version of both
QEMU and KVM. I haven't checked if configuration changes in QEMU may
also have an impact on it.

Sergio.

--7pr5rnj6flnk36lh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmGfp4oACgkQ9GknjS8M
AjUqVw/+NYgMamkY+47EuyoDgcYykHj2oBBw+y0Yma81h0vXjE5EFPo4OKCI20RU
+kHaw/Kgk7b+OU1MCfPtei/Z7tJvhwkBtGDKgn8PgKwye830QpExW/n+mbHsaR0i
lNZdyhGkySBcK0bDlWlMcrwOmxorsmN7A5x7bTL2c4+aqq8Sk90JJExedFhEfVtv
mEOf4MLAhIy6x9phhvNasBV4bcZzJT8vHZxUD+bvSMcsDE7tgjvzG77Ptoz3cbim
d849AlPlz+Pi21q41eQ5fcaA9Ah5uFO5fcfS93R3zz3rXSyAFKufy5PJ3LM4gjae
qSNNAih7fNyhGEyl6aYMEYgrEHjIuJ42iHNs7N6OSlX8+vrpOR7XCDwpEXHChBsk
/W1RoEOMyS9vBDxFCmNzzYcIf4EyyA98Nv5eZ2apGJqeaNfAJstDJT/NiCTXW1yY
52Gklouhebq0I6sgU/q45Yh0X3ljXhPXpvDnaxQdzd+zyyyh9hhMZhu+eIwUxZt3
NUunX2kALfyq2jaGqVsymdn4q3FuamzOkHjTxTtKLZCliHunb/5+lEuDxP8V1DYP
0TNbOFjEf0ZmvJdaXnV3hjVdN8HZXo+tCuryat1LGZFeW28I7eOoMXdt3HqQAk+g
Zea4HtT05d0VA6m+IVwH/9dnK5PLpYcGMlU1Fyh+ZbXmQhgoDNY=
=2FFb
-----END PGP SIGNATURE-----

--7pr5rnj6flnk36lh--


