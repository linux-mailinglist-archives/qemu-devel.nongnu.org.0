Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8576A2DCC6D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 07:23:28 +0100 (CET)
Received: from localhost ([::1]:43216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpmhD-0000Xh-2U
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 01:23:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kpmfQ-0008L4-25; Thu, 17 Dec 2020 01:21:36 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:53289 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kpmfM-0007wY-MM; Thu, 17 Dec 2020 01:21:35 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CxMMT2yg5z9sW4; Thu, 17 Dec 2020 17:21:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1608186085;
 bh=YdCuD3Vy9G1qMy5stSqn/dM/yhe8CwLet1I0HgO67Rw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iBbMpNbC3XPPzWAhHsMoBhBreH3Kbth7scDIaAZMhmxLv1i2o4/nd9PPeSgKbAJcy
 OVKpptPfSrTTnXgRvY2fEEAgN3Ls4cy36Y0KvIJm9O4KyoljhW2Ytla8cazRS+DgDA
 xGVEhZejg7koVC2Ph1pj5gVDlabbCTDU/A0XHy9U=
Date: Thu, 17 Dec 2020 17:21:16 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [for-6.0 v5 00/13] Generalize memory encryption models
Message-ID: <20201217062116.GK310465@yekko.fritz.box>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <f2419585-4e39-1f3d-9e38-9095e26a6410@de.ibm.com>
 <20201204140205.66e205da.cohuck@redhat.com>
 <20201204130727.GD2883@work-vm>
 <20201204141229.688b11e4.cohuck@redhat.com>
 <20201208025728.GD2555@yekko.fritz.box>
 <20201208134308.2afa0e3e.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mGCtrYeZ202LI9ZG"
Content-Disposition: inline
In-Reply-To: <20201208134308.2afa0e3e.cohuck@redhat.com>
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, frankja@linux.ibm.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, berrange@redhat.com,
 thuth@redhat.com, pbonzini@redhat.com, rth@twiddle.net,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mGCtrYeZ202LI9ZG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 08, 2020 at 01:43:08PM +0100, Cornelia Huck wrote:
> On Tue, 8 Dec 2020 13:57:28 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Fri, Dec 04, 2020 at 02:12:29PM +0100, Cornelia Huck wrote:
> > > On Fri, 4 Dec 2020 13:07:27 +0000
> > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > >  =20
> > > > * Cornelia Huck (cohuck@redhat.com) wrote: =20
> > > > > On Fri, 4 Dec 2020 09:06:50 +0100
> > > > > Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> > > > >    =20
> > > > > > On 04.12.20 06:44, David Gibson wrote:   =20
> > > > > > > A number of hardware platforms are implementing mechanisms wh=
ereby the
> > > > > > > hypervisor does not have unfettered access to guest memory, i=
n order
> > > > > > > to mitigate the security impact of a compromised hypervisor.
> > > > > > >=20
> > > > > > > AMD's SEV implements this with in-cpu memory encryption, and =
Intel has
> > > > > > > its own memory encryption mechanism.  POWER has an upcoming m=
echanism
> > > > > > > to accomplish this in a different way, using a new memory pro=
tection
> > > > > > > level plus a small trusted ultravisor.  s390 also has a prote=
cted
> > > > > > > execution environment.
> > > > > > >=20
> > > > > > > The current code (committed or draft) for these features has =
each
> > > > > > > platform's version configured entirely differently.  That doe=
sn't seem
> > > > > > > ideal for users, or particularly for management layers.
> > > > > > >=20
> > > > > > > AMD SEV introduces a notionally generic machine option
> > > > > > > "machine-encryption", but it doesn't actually cover any cases=
 other
> > > > > > > than SEV.
> > > > > > >=20
> > > > > > > This series is a proposal to at least partially unify configu=
ration
> > > > > > > for these mechanisms, by renaming and generalizing AMD's
> > > > > > > "memory-encryption" property.  It is replaced by a
> > > > > > > "securable-guest-memory" property pointing to a platform spec=
ific     =20
> > > > > >=20
> > > > > > Can we do "securable-guest" ?
> > > > > > s390x also protects registers and integrity. memory is only one=
 piece
> > > > > > of the puzzle and what we protect might differ from platform to=
=20
> > > > > > platform.
> > > > > >    =20
> > > > >=20
> > > > > I agree. Even technologies that currently only do memory encrypti=
on may
> > > > > be enhanced with more protections later.   =20
> > > >=20
> > > > There's already SEV-ES patches onlist for this on the SEV side.
> > > >=20
> > > > <sigh on haggling over the name>
> > > >=20
> > > > Perhaps 'confidential guest' is actually what we need, since the
> > > > marketing folks seem to have started labelling this whole idea
> > > > 'confidential computing'. =20
> >=20
> > That's not a bad idea, much as I usually hate marketing terms.  But it
> > does seem to be becoming a general term for this style of thing, and
> > it doesn't overlap too badly with other terms ("secure" and
> > "protected" are also used for hypervisor-from-guest and
> > guest-from-guest protection).
> >=20
> > > It's more like a 'possibly confidential guest', though. =20
> >=20
> > Hmm.  What about "Confidential Guest Facility" or "Confidential Guest
> > Mechanism"?  The implication being that the facility is there, whether
> > or not the guest actually uses it.
> >=20
>=20
> "Confidential Guest Enablement"? The others generally sound fine to me
> as well, though; not sure if "Facility" might be a bit confusing, as
> that term is already a bit overloaded.

Well, "facility" is a bit overloaded, but IMO "enablement" is even
more so.  I think I'll go with "confidential guest support" in the
next spin.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mGCtrYeZ202LI9ZG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/a+NkACgkQbDjKyiDZ
s5LepRAAvDUtft5znuifkMn2ShJlgnkETHq9L4+yDdDH8eke4VQ+qo9rNcFua2ZC
JJXp0JtkHbffpncC6ELcedewIf+iLlccfNvnkdK1weRbzZJfLPL2PTVbmmNbbqVw
Ms2yLpF/5wRHBbYaEAs3iEs8T/0R00Z7R959/UlHhQjtQ/AdJJA1Sy006v7GCxXN
ui44bSpNVrJYkEZ5mNb+nSXXF2Y3U9c8imSidp5AJhkOoH0H0RfmJuwU/Yjtu0dv
QP+ELz1gga4gOmZoHx6GbY2jWF1FgD51O2HgWn7q7Pj0PE1myNRQWa4xvLazScwa
9uqhrYrs8VKVxQUMG2t+rEz/JoP4sK86lCr7GCWzJG2DS5yDnhBznDKmwTklldPH
ovdA8ExYp1AE9XXDcLe+hNv2UbjL61FFz5Ot3wYKEL6LOKZhsTydW/YR5z4Txg/j
MEY3dIGMT5GAVdnPvpKzIcuHMSpRqGbYY6NYuJzFy9Lul0ZQEodEnkwtLkvJ5COH
mHBuiwwUQrflTCx64oDQsF4dgzRfTqese6lrTZOOzSLTd1XSuMgvjhfrWP/6FPk/
eb8E5lFmsKA7G+GOkfC9SqwjgIEUvUQhyzLUXHCtSt9JM/m9cW2sdNBSUkBJ5mV0
8Gt21ST1FmgptBZDUZsdADzd0G0sAw6KFWTPHCnGPypcxggZBKg=
=Vq8q
-----END PGP SIGNATURE-----

--mGCtrYeZ202LI9ZG--

