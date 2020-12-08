Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CAD2D221A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 05:30:52 +0100 (CET)
Received: from localhost ([::1]:33718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmUeJ-0006Bw-UZ
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 23:30:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kmUbE-0004Be-Gn; Mon, 07 Dec 2020 23:27:40 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:40113 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kmUb6-0006MT-RW; Mon, 07 Dec 2020 23:27:40 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CqnFt0gnCz9sW0; Tue,  8 Dec 2020 15:27:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607401634;
 bh=mLyOVhZ4oR5+tNvzHEh2SyeDztIphEHMovVY51ggypE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=otGoUEr3F0jJHjzIxwnmjcR/tXCYQC2ipuLDclv8VzbiVgvpfU5F5eRLIYtg3mdaR
 RM3hjKME3yJn/yUcBMAL1ZeV26OnYJYCEf2TFfQBdvYBp1uEsslbMMYjsOSb7meJsV
 eceQkRMNUelGTQi0VrNCFDbimXn86KdQKWr1S+MM=
Date: Tue, 8 Dec 2020 13:57:28 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [for-6.0 v5 00/13] Generalize memory encryption models
Message-ID: <20201208025728.GD2555@yekko.fritz.box>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <f2419585-4e39-1f3d-9e38-9095e26a6410@de.ibm.com>
 <20201204140205.66e205da.cohuck@redhat.com>
 <20201204130727.GD2883@work-vm>
 <20201204141229.688b11e4.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ylS2wUBXLOxYXZFQ"
Content-Disposition: inline
In-Reply-To: <20201204141229.688b11e4.cohuck@redhat.com>
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


--ylS2wUBXLOxYXZFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2020 at 02:12:29PM +0100, Cornelia Huck wrote:
> On Fri, 4 Dec 2020 13:07:27 +0000
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>=20
> > * Cornelia Huck (cohuck@redhat.com) wrote:
> > > On Fri, 4 Dec 2020 09:06:50 +0100
> > > Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> > >  =20
> > > > On 04.12.20 06:44, David Gibson wrote: =20
> > > > > A number of hardware platforms are implementing mechanisms whereb=
y the
> > > > > hypervisor does not have unfettered access to guest memory, in or=
der
> > > > > to mitigate the security impact of a compromised hypervisor.
> > > > >=20
> > > > > AMD's SEV implements this with in-cpu memory encryption, and Inte=
l has
> > > > > its own memory encryption mechanism.  POWER has an upcoming mecha=
nism
> > > > > to accomplish this in a different way, using a new memory protect=
ion
> > > > > level plus a small trusted ultravisor.  s390 also has a protected
> > > > > execution environment.
> > > > >=20
> > > > > The current code (committed or draft) for these features has each
> > > > > platform's version configured entirely differently.  That doesn't=
 seem
> > > > > ideal for users, or particularly for management layers.
> > > > >=20
> > > > > AMD SEV introduces a notionally generic machine option
> > > > > "machine-encryption", but it doesn't actually cover any cases oth=
er
> > > > > than SEV.
> > > > >=20
> > > > > This series is a proposal to at least partially unify configurati=
on
> > > > > for these mechanisms, by renaming and generalizing AMD's
> > > > > "memory-encryption" property.  It is replaced by a
> > > > > "securable-guest-memory" property pointing to a platform specific=
   =20
> > > >=20
> > > > Can we do "securable-guest" ?
> > > > s390x also protects registers and integrity. memory is only one pie=
ce
> > > > of the puzzle and what we protect might differ from platform to=20
> > > > platform.
> > > >  =20
> > >=20
> > > I agree. Even technologies that currently only do memory encryption m=
ay
> > > be enhanced with more protections later. =20
> >=20
> > There's already SEV-ES patches onlist for this on the SEV side.
> >=20
> > <sigh on haggling over the name>
> >=20
> > Perhaps 'confidential guest' is actually what we need, since the
> > marketing folks seem to have started labelling this whole idea
> > 'confidential computing'.

That's not a bad idea, much as I usually hate marketing terms.  But it
does seem to be becoming a general term for this style of thing, and
it doesn't overlap too badly with other terms ("secure" and
"protected" are also used for hypervisor-from-guest and
guest-from-guest protection).

> It's more like a 'possibly confidential guest', though.

Hmm.  What about "Confidential Guest Facility" or "Confidential Guest
Mechanism"?  The implication being that the facility is there, whether
or not the guest actually uses it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ylS2wUBXLOxYXZFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/O65gACgkQbDjKyiDZ
s5K/UA/+IsN6RwpL+fkyBxLWOZDGgN+J2SzXhKj69pySp0MURKke9NxwOk+eGLA0
kzp7GMc4DMKivbwu7WIWbE0J/sAGpBURt8EJUegobAdWAGqaaAsjBADsgpSXRqK2
qP2GXt0SzNowq3oE3oHDsWKC2URhiyk28pWYqWQ1UwTqJFQOi2+7+jK1KqFMGadP
u3B1IM01wpa6WFxhZe8U1VQP2Xe5xvMwK95f0HFsaXlWSP4iOHArJbTXgNPkCJPR
WAbS1cIVsns7g5qs+4kIxSkVeHzstx5wnd5IB1AfCkrSrJIbsxw1KErZkTPnWvqc
bTm09YN0H2pNwUTKxjnpbdxMdrI5oh3BDW5ZozIc7Q7c/wgxg5yQygDhTln2egiU
I63P/yXLC1vWQGOwQ9ajf73xxzV8CkJmiL/f7tqAXYq6YyilDYh0yZkd1z1s4Jop
DRtoQnFImaH7AI0T15ss188NCAkicODrBTO7Xziuv9BQLGEx1kFMatsk3CwE0dfU
Fyr/w2wpEWze42MHfO35yrR8YAdC0RhcHs3WOdc/w3XVoGjPS8zOj16NTSQnRgHj
2Ul+EcqqUhIiNGlN4pZTsLV6i/IA1W4lOjsmwkczN7VRxDVf/HYtMjVzgAgJaElY
vLnLkH94h5xcWW9BFdixZUGq0KYFIAsoGzP+46TZr3gup6mUdYE=
=WW47
-----END PGP SIGNATURE-----

--ylS2wUBXLOxYXZFQ--

