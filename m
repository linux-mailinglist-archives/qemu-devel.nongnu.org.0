Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949FB30B558
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 03:41:04 +0100 (CET)
Received: from localhost ([::1]:43228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6lcl-0002LW-3X
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 21:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l6lag-0001lG-9z; Mon, 01 Feb 2021 21:38:55 -0500
Received: from ozlabs.org ([203.11.71.1]:43589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l6lab-0001Uz-Lv; Mon, 01 Feb 2021 21:38:52 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DV8Bp20vvz9tk1; Tue,  2 Feb 2021 13:38:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612233522;
 bh=VXgvdWMjRdzFgeGR7K2WnC88ggaAzrgpmO2vsSLO/VY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bNK7emVyG+ZfmX+8e7APUMwZc8pY34AolqiThi3zak88l53jlqwlShnW+ykJc2inZ
 WBVuLklVO+rO4l6MTssY39e5tofsWUA/9pZkiv/qugN7vNgNngKqPvQoBDt3bZ7mjO
 ZirAOzqUHVWBMC9dK1yS16x+JT25uGZ1XpifCJ4o=
Date: Tue, 2 Feb 2021 12:41:16 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v7 07/13] confidential guest support: Introduce cgs
 "ready" flag
Message-ID: <20210202014116.GC2251@yekko.fritz.box>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-8-david@gibson.dropbear.id.au>
 <20210118194730.GH9899@work-vm>
 <20210119091608.34fff5dc.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Content-Disposition: inline
In-Reply-To: <20210119091608.34fff5dc.cohuck@redhat.com>
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 frankja@linux.ibm.com, pragyansri.pathi@intel.com, mst@redhat.com,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 andi.kleen@intel.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, jun.nakajima@intel.com, berrange@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 09:16:08AM +0100, Cornelia Huck wrote:
> On Mon, 18 Jan 2021 19:47:30 +0000
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>=20
> > * David Gibson (david@gibson.dropbear.id.au) wrote:
> > > The platform specific details of mechanisms for implementing
> > > confidential guest support may require setup at various points during
> > > initialization.  Thus, it's not really feasible to have a single cgs
> > > initialization hook, but instead each mechanism needs its own
> > > initialization calls in arch or machine specific code.
> > >=20
> > > However, to make it harder to have a bug where a mechanism isn't
> > > properly initialized under some circumstances, we want to have a
> > > common place, relatively late in boot, where we verify that cgs has
> > > been initialized if it was requested.
> > >=20
> > > This patch introduces a ready flag to the ConfidentialGuestSupport
> > > base type to accomplish this, which we verify just before the machine
> > > specific initialization function. =20
> >=20
> > You may find you need to define 'ready' and the answer might be a bit
> > variable; for example, on SEV there's a setup bit and then you may end
> > up doing an attestation and receiving some data before you actaully let
> > the guest execute code.   Is it ready before it's received the
> > attestation response or only when it can run code?
> > Is a Power or 390 machine 'ready' before it's executed the magic
> > instruction to enter the confidential mode?
>=20
> I would consider those machines where the guest makes the transition
> itself "ready" as soon as everything is set up so that the guest can
> actually initiate the transition. Otherwise, those machines would never
> be "ready" if the guest does not transition.
>=20
> Maybe we can define "ready" as "the guest can start to execute in
> secure mode", where "guest" includes the bootloader and everything that
> runs in a guest context, and "start to execute" implies that some setup
> may be done only after the guest has kicked it off?

That was pretty much my intention.  I've put a big comment on the
field definition and tweaked things around a bit in the hopes of
making that clearer for the next spin.


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAYrboACgkQbDjKyiDZ
s5JsQQ/+KC1HdiParXeiUT8dURc/dB2Vtfg+xLj6xIJTdGjHycSyEDCKZFqZk/6X
eL8lzPkdrQRgwVSQ/ZlfiNUuxElO8v2G3exgcZVB0reEQjoViLpIGlosA4J31uLK
IV/3Jqjrcqpria693CW68Qrw/gSvLuVwRgnsFUk4bQJGX9JmugvK28jm8rAoS/NS
Z1nMOvdxEuTIOsfZiCKY/YNAhy1oPdLcMn2kLgBM3RRPsONfJ58D3FPEUfqla7so
9PPBvhkIDhM3gn1z6fl1r54EhqvBkFUWqE9fuCvBJBlBeWJJkVggGxNgTsIrw/Ow
Q1evkmZb8mx20GS0AcGArDc6XgUQioHnCwet91jTmrPmLqo6NdDhrONAbN/o6Yss
9R6jsgo6KD9e/VyPf15b+MR+TySHxYvlU8yF5YaGxtw/PkA67iaJJKciiGh5MWrg
P4Rp3K1bIjK0dYxow5QHa7h72WZsL/GLVbdP47if5nwaak+FxEWrVXaKU6gNh70H
/pIOxwUTZKxfYAnajz3iIoe3UWZt0YwiEj3uZ485ff04CmJvkwnRgObEsrxpoGeC
qhBr72RHM8Is0LH/307qOxbrhYozQx0TkSItX+QiU9RnoMFcOxMm4DWwh56edkjo
UakZwUywBwb04+eEU5rG2aBP55mh0TZQB7Muw3pVGpnEcoxXTrM=
=2yc6
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--

