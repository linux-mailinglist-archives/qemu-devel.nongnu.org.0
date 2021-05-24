Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D10138DFF8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:53:04 +0200 (CEST)
Received: from localhost ([::1]:52812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll1eJ-00082B-DK
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll1Yx-0006R7-GG; Sun, 23 May 2021 23:47:31 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:36451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll1Yv-0003Df-A2; Sun, 23 May 2021 23:47:31 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpNSl4r9xz9sWB; Mon, 24 May 2021 13:47:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621828039;
 bh=z7EqkskrwBt6+DS2oGWH2Tzo2epbaqm8GUIpIFCWygE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fsWdODL/jOBVyWL1y5CZaMJyRsn/oyXlYKGoe4KUHsqunqbjz5JaUc5FCYdDBM9gr
 R9k57fKcZb+cUFBURVwsoTitZcEazYwS5KWhRca/pL7f0FPTpvc9+0tPTG0qYtQ4pY
 onkUcQiVlyXjuZVe5lCZhkzpE/dTl4P/BNHOewgk=
Date: Mon, 24 May 2021 13:26:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 00/24] target/ppc: Clean up mmu translation
Message-ID: <YKsczpMuwDn006S4@yekko>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <YKR9bZmPxOHKlnnP@yekko>
 <7a4c91d4-c813-2803-e5e7-4f8fe6d6f05d@linaro.org>
 <6bc68cda-a6aa-68c9-2c6f-f7c6ff95b7db@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OWf7ftDOOse6PGJF"
Content-Disposition: inline
In-Reply-To: <6bc68cda-a6aa-68c9-2c6f-f7c6ff95b7db@linaro.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OWf7ftDOOse6PGJF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 05:47:05PM -0500, Richard Henderson wrote:
> On 5/19/21 3:37 PM, Richard Henderson wrote:
> > On 5/18/21 9:52 PM, David Gibson wrote:
> > > I've applied 1..15, still looking at the rest.
> >=20
> > Please dequeue.=A0 I want to create a new mmu-internal.h, which affects
> > all the patches from #1.
>=20
> Alternately, don't.  I can move the function later, and it may be a while
> before I can get back to this.

Ok, I'll leave them in, since they're good cleanups even without the
rest of the series.

>=20
> Two outstanding bugs:
>=20
> (1) mmu-radix64.c vs hypervisors.  You'll not see these unless you run kvm
> inside of tcg.
>=20
> Basically, all usage of msr_{hv,pr,ir,dr} within ppc_*_xlate is incorrect.
> We should be pulling these from the 3 bits of mmu_idx, as outlined in the
> table in hreg_compute_hflags_value.

Ah, that's probably my fault.  I reworked those substantially from the
original code (closer to mmu_helper.c).  I guess I didn't (and I
suspect I still don't) really understand how the softmmu works.

> When you start propagating that around, you see that the second-level
> translation for loading the pte (2 of the 3 calls to
> ppc_radix64_partition_scoped_xlate) should not be using the mmu_idx relat=
ed
> to the user-mode guest access, but should be using the mmu_idx of the
> kernel/hypervisor that owns the page table.
>=20
> I can't see that mmu-radix64.c has the same problem.  I'm not really sure
> how the second-level translation for hypervisors works there.  Is it by t=
he
> hypervisor altering the hash table as it is loaded?

Uh.. you started by saying mmu-radix64.c then talked about the hash
table, so I'm not sure which model you're talking about.

For hash + hypervisor, then yes, there is no hardware 2-level
translation, it all works by paravirtualizing updates to the hash
table (this is the H_ENTER etc. code in hw/ppc/spapr_softmmu.c).

> (2) The direct-segment accesses for 6xx and hash32 use ACCESS_* to
> conditionally reject an mmu access.  This is flawed, because we only arri=
ve
> into these translation routines on the softtlb slow path.  If we have an
> ACCESS_INT and then an ACCESS_FLOAT, the first will load a tlb entry which
> the second will use to stay on the fast path.
>=20
> There are several possible solutions:
>=20
>  (A) Give tlb_set_page size =3D=3D 1 for direct-segment addresses.
>      This will cause cputlb.c to force all references to the page
>      back through the slow path and through tlb_fill.  At which
>      point env->access_type is correct for each access, and we
>      can reject on type.
>=20
>      This could be really slow.  But since these direct-segment
>      accesses are also uncached, I would expect the guest OS to
>      only be using them for i/o access.  Which is already slow,
>      so perhaps the extra trip through tlb_fill isn't noticeable.
>=20
>  (B) Use additional mmu_idx.  Not ideal, since we wouldn't be
>      sharing softtlb entries for ACCESS_INT and ACCESS_FLOAT
>      and ACCESS_RES for the normal case.  But the relevant
>      mmu_models do not have hypervisor support, so we could
>      still fit them in to 8 mmu_idx.  We'd probably want to
>      use special code for ACCESS_CACHE and ACCESS_EXT here.
>=20
>  (C) Ignore this special case entirely, dropping everything
>      related to env->access_type.  The section of code that
>      uses them is all for really old machine types with
>      comments like
>=20
>         /* Direct-store segment : absolutely *BUGGY* for now */
>=20
>      which is not encouraging.  And short of writing our own
>      test cases we're not likely to have any code to exercise
>      this.

Indeed.  Direct store segments are basically ancient history of the
POWER architecture which Linux never used, and I don't think much else
did either.  So I'm inclined to go with

  (D) Just rip out all the direct store segment code and replace with
      some LOG_UNIMPs.  Re-adding it working can be the job of the
      probably non-existent person who has an actual use case using
      them.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OWf7ftDOOse6PGJF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrHM4ACgkQbDjKyiDZ
s5JafhAAxOcSg17ImtGWuzqyTLG76InJGokuICfA1YE7ewrE6335iHCJGWOwqFOa
0O+XMHkCfeeZh/JcLVZ+id3x6jIO9QgVL8nxauuDQajZXobJIUxPk+I3cYrqROAU
V/zyLXSRKSDCsMPcUzA19p56mm+/iC8uw03H5fIHuDxQZZ+C4oI9H6WfjNRi+IF2
scnBUpAzftubva8uP27qROP/S646wJkTdf7vpp85OwVWe6IRSJ+t73e9ZvdlzTIf
oN0LMDCumzLlYdxuyNw3i7ceeVqQN5zxQMRvh2mKSf+A2S5+X2VpevigRMN3lKHX
zWISoqWbLinC2jki7w6K3HFF/X0AuYLA6Q9hz21PRke4JFruOmSBDX8cQ8JlKH2o
itWl7/AgsmfOHW4fbrGu5skExxLT9katafppkO4MuF5hXwILhJOlLJL2QujnzV/T
1pq/gP8zR783fgTAhr3WtU345rswIzLLt08XU0/a+2gQQY2qeJeYr3qnxEmUeF40
VhuBsIoGFJiBirdvV/kj6PpAMeR2jD0ZbWhVx1DDupa3BSvq/QQKCxrBY9BZJctw
YdpAiEADhuVDKQZOb4J5oETaILrk9raep1TMi3VMXNdcIPFBFYqAjo1SAOmewUg7
c+HLDhdSU+6ufQPJcYOEnXKskwNE87m4vNSwcK0pymSrmXNRBHc=
=rS28
-----END PGP SIGNATURE-----

--OWf7ftDOOse6PGJF--

