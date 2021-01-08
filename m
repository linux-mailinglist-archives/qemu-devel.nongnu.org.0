Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B882EECD8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 06:22:03 +0100 (CET)
Received: from localhost ([::1]:39172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxkDq-00021k-U4
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 00:22:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kxkBc-0000bC-QF; Fri, 08 Jan 2021 00:19:44 -0500
Received: from ozlabs.org ([203.11.71.1]:49421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kxkBZ-00030z-BJ; Fri, 08 Jan 2021 00:19:44 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DBrxq326Mz9sWm; Fri,  8 Jan 2021 16:19:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610083167;
 bh=yM+GSG4Blu08wIh9l4eOZ3YDwhjhMK9nufRyv7Kfvgs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=liZ9gk5HASA02GcL6ulAiQ+LEY5MFhBoA8niYeQtoi54jGblXFYwZzWKg4Skl2s8F
 o6c6L/XuNLP8SMkRf2Ip4QkzgMcPZDbEoYeqleougcuJCzumNxxa6yCyw55hmpSnh3
 pGa6DWFfDz8kgZ+JQ/9b+Qzov7IEDwCf3T+LxtNo=
Date: Fri, 8 Jan 2021 15:03:03 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [for-6.0 v5 03/13] securable guest memory: Handle memory
 encryption via interface
Message-ID: <20210108040303.GH3209@yekko.fritz.box>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-4-david@gibson.dropbear.id.au>
 <20201204141005.07bf61dd.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aF3LVLvitz/VQU3c"
Content-Disposition: inline
In-Reply-To: <20201204141005.07bf61dd.cohuck@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, berrange@redhat.com,
 thuth@redhat.com, pbonzini@redhat.com, rth@twiddle.net,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--aF3LVLvitz/VQU3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2020 at 02:10:05PM +0100, Cornelia Huck wrote:
> On Fri,  4 Dec 2020 16:44:05 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > At the moment AMD SEV sets a special function pointer, plus an opaque
> > handle in KVMState to let things know how to encrypt guest memory.
> >=20
> > Now that we have a QOM interface for handling things related to securab=
le
> > guest memory, use a QOM method on that interface, rather than a bare
> > function pointer for this.
> >=20
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  accel/kvm/kvm-all.c                   |  36 +++++---
> >  accel/kvm/sev-stub.c                  |   9 +-
> >  include/exec/securable-guest-memory.h |   2 +
> >  include/sysemu/sev.h                  |   5 +-
> >  target/i386/monitor.c                 |   1 -
> >  target/i386/sev.c                     | 116 ++++++++++----------------
> >  6 files changed, 77 insertions(+), 92 deletions(-)
> >=20
>=20
> > @@ -224,7 +224,7 @@ int kvm_get_max_memslots(void)
> > =20
> >  bool kvm_memcrypt_enabled(void)
> >  {
> > -    if (kvm_state && kvm_state->memcrypt_handle) {
> > +    if (kvm_state && kvm_state->sgm) {
>=20
> If we want to generalize the concept, maybe check for encrypt_data in
> sgm here? There's probably room for different callbacks in the sgm
> structure.

I don't think it's worth changing here.  This gets changed again in
patch 6, I'll adjust to clarify a bit what's going on there.

>=20
> >          return true;
> >      }
> > =20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--aF3LVLvitz/VQU3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/32XQACgkQbDjKyiDZ
s5I3Hw//eRYOBsJ2TurIh7rwuauV/QflkcKoHjCC3SbHxSNrIRsiXD/KxU15OTyR
TVyCCZIQnyD2mORKhwpNPtSTdPbeds/sTsxGC2mUwAkcudy7s1f5GpQccf9jL7j5
jJjsBAo9Tkn0VJKoQZMPYSEY4ru33Zbqk5zArqR8PvrUsXhw60K3/xXi2mVZ5cUN
m82v5dSxl9pIgF5fDm7a2VHeE5YiB5/ZCpdbGFpuX59LvV5y/UmFdx9vbam5e8Ie
ekoIjFsv5yJ2eECeZ7jzmBmdJ/KoNWZ5rzX0ID39o8buS5ZZO2KxC9F4Rt/iIt0I
RX0YNmD32wX/s3CJzB/KytTTE38jjzdEnU7arlGHEDz5CibGBpDoA/BP2tFIoTll
o7ina6lu0s+T4UrNEKS+DagFY5qJGNA+1p7JcuNBGj2ns7QIY8zNXh04K0toyrb5
LFUHd9DT+AciTDaQ5e/I7/ONaFLBh2EAc4AbcUo6r1iXyPQ+df446qaIljA2ljGn
oQX0CjYDxWRo+Wn2wBc1yLiL7GD4vu19m5JdTPpom8LdjCDGDtCuGi6Vr56c1NRS
DMYbbnOBxtnR49B9umPfqR8VS+lKFeilixsohid8+Yohe940BkyIcgFCVyth+RG0
044z8YFmtRnuZL5HaPXD+YzAG93+OeFSA0MAyxakNE8hrl/EQt4=
=e/zG
-----END PGP SIGNATURE-----

--aF3LVLvitz/VQU3c--

