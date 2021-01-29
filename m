Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFA03084DA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 06:10:22 +0100 (CET)
Received: from localhost ([::1]:57124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5M34-000626-0G
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 00:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5M1S-0004QC-IQ; Fri, 29 Jan 2021 00:08:42 -0500
Received: from ozlabs.org ([203.11.71.1]:36447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5M1P-0004KK-St; Fri, 29 Jan 2021 00:08:42 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DRljR5jdZz9sW0; Fri, 29 Jan 2021 16:08:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611896907;
 bh=ecrGEu4SVBXZGERHxeftb3q2l9rSohBTiQPV1z2yOGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kdoNZLglcO6FZb+uStqcLmDVdFH96iNnRD/5yHaVqYgQypGQ+ZfyL75AvecyuciHg
 wk6LQXg0bPobyNywyZavb+3ijbzIEKv/9ZMDYjnFnbWs0ptQxpFQQ8MWy1mgtZgMqb
 qNibVRSe0CzDX5pguBuEe3zHBB1OaBFtKzDfYe5Y=
Date: Fri, 29 Jan 2021 13:32:09 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v7 02/13] confidential guest support: Introduce new
 confidential guest support class
Message-ID: <20210129023209.GH6951@yekko.fritz.box>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-3-david@gibson.dropbear.id.au>
 <20210118185124.GG9899@work-vm>
 <20210121010643.GG5174@yekko.fritz.box>
 <20210121090807.GA3072@work-vm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="U3BNvdZEnlJXqmh+"
Content-Disposition: inline
In-Reply-To: <20210121090807.GA3072@work-vm>
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
Cc: pair@us.ibm.com, cohuck@redhat.com, brijesh.singh@amd.com,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, pragyansri.pathi@intel.com,
 mst@redhat.com, mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, andi.kleen@intel.com, thuth@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, jun.nakajima@intel.com, berrange@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--U3BNvdZEnlJXqmh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 09:08:07AM +0000, Dr. David Alan Gilbert wrote:
> * David Gibson (david@gibson.dropbear.id.au) wrote:
> > On Mon, Jan 18, 2021 at 06:51:24PM +0000, Dr. David Alan Gilbert wrote:
> > > * David Gibson (david@gibson.dropbear.id.au) wrote:
> > > > Several architectures have mechanisms which are designed to protect=
 guest
> > > > memory from interference or eavesdropping by a compromised hypervis=
or.  AMD
> > > > SEV does this with in-chip memory encryption and Intel's MKTME can =
do
> > >                                                            ^^^^^
> > > (and below) My understanding is that it's Intel TDX that's the VM
> > > equivalent.
> >=20
> > I thought MKTME could already do memory encryption and TDX extended
> > that to... more?  I'll adjust the comment to say TDX anyway, since
> > that seems to be the newer name.
>=20
> My understanding was MKTME does the memory encryption, but doesn't
> explicitly wire that into VMs or attestation of VMs or anything like
> that.  TDX wires that encryption to VMs and provides all the other glue
> that goes with attestation and the like.

Ok.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--U3BNvdZEnlJXqmh+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmATc6kACgkQbDjKyiDZ
s5K9Mg//WMoGmMP8WJ3naEJtzNNsXe1jRRVTFp54CK0UyqFcHiOiPxu79vD0SnS6
zqdtGq+DcgT9Rdd08RrVElNT5tox6E020Yav0gzxA1r6Pv7fNCQeXJqMi+mN77V+
2lONuEOrN9bQsI2DsDIayi2xF7iXvjtXkqeSCW9qWbXXwoW2p0Zz/yo4kRm/6JN5
tHngK47T5OrtUPCdYLB2DUNPWonxpoQVs09G+WZmcWC3g3T8mvcHFjILS/FDrSs7
czvVfwKsuIMnUxxES00hON+ErpIYZwE6hs7woo8EZbRmN2uSTNW+foJOTvuy7bEk
c2JBGwKkZdKwfBqx06QaSsrTd4y3I6+hLT3ggc6J5s3wjzTbh8nXbQBIM8YOsN+S
fwJLfNpfoL8xg9DSX7pZOvNsuyBbNrIvnosg+EEUFYtBq2wo6ORMkBgRYASP5OZI
B1vMLHhuVM4ciARgS0jgT0nxg7rDoNv/1gDGjHmdfA62B4LS118DLYutzouaEbvE
MQlLm2E2Gi7/eW3b8Pz1uXgp22dQxysJ0kADamvnSS7eD0G199XTLvJIfb4yaN2b
shgsjJPtgvl+oBOAz1ZPOrijN6+7pIZPZZ82vjyPg6bZfcnjDJjQn/+eLHoPAj+p
yQJhKYBa9+Om1GgPUXur+lEg8ZJxxYOjztxewlWnXvwYH300CT0=
=NVEn
-----END PGP SIGNATURE-----

--U3BNvdZEnlJXqmh+--

