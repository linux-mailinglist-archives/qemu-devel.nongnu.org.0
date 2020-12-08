Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D08B2D2214
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 05:28:45 +0100 (CET)
Received: from localhost ([::1]:58472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmUcF-0004ip-TF
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 23:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kmUbA-00049Y-8L; Mon, 07 Dec 2020 23:27:36 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:39051 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kmUb6-0006MS-HL; Mon, 07 Dec 2020 23:27:36 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CqnFt04XTz9sWH; Tue,  8 Dec 2020 15:27:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607401634;
 bh=uLVhpwYG528GVhcRqrQTweFelo2TkxGiaGA/dKr/0bM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lqn+yBjIKUDr600AgLpAFD04mM9Wp3AaX+GvNEzqkQNFdEP1ODfrDvc6oU6jhI/a2
 QoMlC0oUdZZieNs3LTYq2WGyZIrit5TohVlUMFH8FKGs9ue9gtofhgHJoNk3RnexVv
 OGUIXq0B0wmrJAqV5jStuvp1fU78aLjXYUCMIEhI=
Date: Tue, 8 Dec 2020 13:54:27 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [for-6.0 v5 00/13] Generalize memory encryption models
Message-ID: <20201208025427.GC2555@yekko.fritz.box>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <f2419585-4e39-1f3d-9e38-9095e26a6410@de.ibm.com>
 <20201204140205.66e205da.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline
In-Reply-To: <20201204140205.66e205da.cohuck@redhat.com>
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, frankja@linux.ibm.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com, dgilbert@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, berrange@redhat.com, thuth@redhat.com,
 pbonzini@redhat.com, rth@twiddle.net, mdroth@linux.vnet.ibm.com,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2020 at 02:02:05PM +0100, Cornelia Huck wrote:
> On Fri, 4 Dec 2020 09:06:50 +0100
> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
>=20
> > On 04.12.20 06:44, David Gibson wrote:
> > > A number of hardware platforms are implementing mechanisms whereby the
> > > hypervisor does not have unfettered access to guest memory, in order
> > > to mitigate the security impact of a compromised hypervisor.
> > >=20
> > > AMD's SEV implements this with in-cpu memory encryption, and Intel has
> > > its own memory encryption mechanism.  POWER has an upcoming mechanism
> > > to accomplish this in a different way, using a new memory protection
> > > level plus a small trusted ultravisor.  s390 also has a protected
> > > execution environment.
> > >=20
> > > The current code (committed or draft) for these features has each
> > > platform's version configured entirely differently.  That doesn't seem
> > > ideal for users, or particularly for management layers.
> > >=20
> > > AMD SEV introduces a notionally generic machine option
> > > "machine-encryption", but it doesn't actually cover any cases other
> > > than SEV.
> > >=20
> > > This series is a proposal to at least partially unify configuration
> > > for these mechanisms, by renaming and generalizing AMD's
> > > "memory-encryption" property.  It is replaced by a
> > > "securable-guest-memory" property pointing to a platform specific =20
> >=20
> > Can we do "securable-guest" ?
> > s390x also protects registers and integrity. memory is only one piece
> > of the puzzle and what we protect might differ from platform to=20
> > platform.
>=20
> I agree. Even technologies that currently only do memory encryption may
> be enhanced with more protections later.

That's a good point.  I've focused on the memory aspect because that's
what's most immediately relevant to qemu - the fact that we can't
directly access guest memory is something we have to deal with, and
has some uniformity regardless of the details of the protection scheme.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/O6uEACgkQbDjKyiDZ
s5KbMA/9ExkApThx4hNRM3f5oA+BqZr/5jCNsCZA5xKa1UCEygo2d2muolidB2Wb
sZKL4AU4/Rj+9FHDw42/ljrS3kKJTR/k3mlOq/Isk2YTSt8Qu4TKeVhI9LZ08CPz
usFtJ8Yzs/W+qSc+MDl+TJqwx1k9JYentrUVOEfkuw+LDwniWyAwOe4UVwqI50e6
xPtbNSsSiRsIYml4vLVLBhKq5ikby+ChR5AaxrLAkPDW+YtuWuWNQEYIy+iPPZQJ
HF1luL0pD3ev1jgj0A5vWhB5aSxQPlwqcDbI8Xx86kI1YimQWvEMbCl6Dloi9UCi
rOfdmQXmD+grIB3aPft/oeSbsRWtMYGd9W0yYCIWTXz3SIaNe016GfqIaQ7g4JrJ
farxYjmGLUYjtuJMzRYNNBEo57GCPuSLkaWtyz/fBzx0WOhmNkmq3SWrkHzyh6U5
THu9huxqo6PNhH/oD7MIex3ImueAh7hkd4pvBpyO8fqbkSoqePghoRWpFhrfdb7/
r3jrDHIMwiJmUmzrTDPsDC6SZJTcFlfKIEMYRQDEOlJwwJAm29UNMaO95wX0vo/k
pI0PBYyAX3aJccwxEnsbpIMXKLDX/yFkJkXZSpswYAzDkHS4F9iM1pL0z9ftM8is
p49C77scmF4onkmWZuC89/cD3OzbMvIa7baJaPz+HusySs9A8lo=
=N0un
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--

