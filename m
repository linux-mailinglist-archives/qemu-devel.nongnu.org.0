Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C5938DFF0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:49:28 +0200 (CEST)
Received: from localhost ([::1]:41686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll1ao-0000YH-DB
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll1Ys-0006GN-JI; Sun, 23 May 2021 23:47:26 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:51909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll1Yq-00039s-4o; Sun, 23 May 2021 23:47:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpNSl3SX9z9sW4; Mon, 24 May 2021 13:47:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621828039;
 bh=OMHZ1INSAuIosfb2rn4W5OjJ/41FUTNMyj8Pu02wYBE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ctimIC0ZjuyqKXrdIlU3Oe4QJI3uUcsO1jy0Al5HagYtz1FOxvuOjDezuLHUbenRD
 M1TUCDVxzWrGWUtrPUzn21JaSrEQ1KL6yJL9AXyo5sORWzBMk5D7f1NPdklVsv/c0v
 26TACIpLq9t/zru4GJoXj8YTLihKZnc9rbUns6/M=
Date: Mon, 24 May 2021 13:18:13 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH 09/11] include/exec: added functions to the stubs in
 exec-all.h
Message-ID: <YKsa9X7/cafkj9qc@yekko>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-10-bruno.larsen@eldorado.org.br>
 <c4b7cba3-eb5f-ff65-9376-da9dc8edf45f@linaro.org>
 <f0fbb69b-76e9-c951-f18d-cfc4629f5f2a@eldorado.org.br>
 <aad60a0c-1f07-24ab-821a-193047e4ad2e@linaro.org>
 <YKHpy53AwM8tTy3E@yekko>
 <06d4250b-4d4a-42a6-47fa-f5b75ea6c499@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EQOTPmt/EC2dvpzu"
Content-Disposition: inline
In-Reply-To: <06d4250b-4d4a-42a6-47fa-f5b75ea6c499@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--EQOTPmt/EC2dvpzu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 01:59:35PM -0300, Lucas Mateus Martins Araujo e Cas=
tro wrote:
>=20
> On 17/05/2021 00:58, David Gibson wrote:
> > On Thu, May 13, 2021 at 06:44:01PM -0500, Richard Henderson wrote:
> > 65;6401;1c> On 5/13/21 9:03 AM, Lucas Mateus Martins Araujo e Castro wr=
ote:
> > > > tlb_set_page is called by many ppc_hash64_handle_mmu_fault,
> > > > ppc_radix64_handle_mmu_fault and ppc_hash32_handle_mmu_fault, all of
> > > > which from what I've seen are only used inside #if
> > > > defined(CONFIG_SOFTMMU).
> > > tlb_set_page should only be called from one place: ppc_cpu_tlb_fill. =
 The
> > > other functions should fill in data, much like get_physical_address.
> > >=20
> > >=20
> > > > So what is the best way to deal with these tlb_set_page calls? Shou=
ld
> > > > these part of the _handle_mmu_fault functions never be reached or s=
hould
> > > > these functions never be called?
> > > There is some duplication between get_physical_address* and
> > > *handle_mmu_fault that should be fixed.
> > >=20
> > > What should be happening is that you have one function (per mmu type)=
 that
> > > takes a virtual address and resolves a physical address. This bit of =
code
> > > should be written so that it is usable by both
> > > CPUClass.get_phys_page_attrs_debug and TCGCPUOps.tlb_fill.  It appear=
s as if
> > > ppc_radix64_xlate is the right interface for this.
> > >=20
> > > It appears that real mode handling is duplicated between hash64 and r=
adix64,
> > > which could be unified.
> > Any common handling between the hash and radix MMUs should go in
> > mmu-book3s-v3.*  That covers common things across the v3 (POWER9 and
> > later) MMUs which includes both hash and radix mode.
>=20
> I'm not completely sure how this should be handled, there's a
> get_physical_address in mmu_helper.c but it's a static function and divid=
ed
> by processor families instead of MMU types, so get_physical_address_* sho=
uld
> be a new function?

Sorry, I wasn't clear.  mmu-v3 is only for things specifically common
to the hash64 model (as implemented in mmu-hash64.c) and the radix
model (as implemented in mmu-radix64.c).  Which basically means things
related to the POWER9 MMU which can switch between those modes.

Things common to *more* MMU models (hash32, 4xx, 8xx, BookE, etc.)
which includes most of what's in mmu-helper.c go elsewhere.

> The new get_physical_address_* function would be a mmu-hash(32|64) that do
> something like ppc_radix64_xlate and add a function to mmu-book3s-v3 that
> call either the radix64 or the hash64 function and also handle real mode
> access.
>=20
> Also should the tlb_set_page calls in *_handle_mmu_fault be changed to
> ppc_cpu_tlb_fill or the function should themselves fill it?
>=20
> >=20
> > > You should only call tlb_set_page from TCGCPUOps.tlb_fill, aka
> > > ppc_cpu_tlb_fill.  TCGCPUOps.tlb_fill is obviously TCG only.
> > >=20
> > > The version you are looking at here is system emulation specific (sys=
emu,
> > > !defined(CONFIG_USER_ONLY)).  There is a second version of this funct=
ion,
> > > with the same signature, that is used for user emulation in the helpf=
ully
> > > named user_only_helper.c.
> > >=20
> > >=20
> > > r~
> > >=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EQOTPmt/EC2dvpzu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrGvUACgkQbDjKyiDZ
s5IpMw/+OiShJh/pyWWqx/mwKWO9XRWHgzbvO3gaUIqRFsgEqxpT7gn8+ZEYU4U7
ZU/SOT+gfrv3RlonioBVnVjfo+uNbj0gu/wy+wvwjXEj6J902dBV4H8pCdorLsXU
VmTRT0v8GrQMZ1zTAIcleC5+N3mLhOtYNEfwv5fFkTZqxAgBlvo1IFB5RD/fhCFq
PH6z8cj59MdzYb2RMRp822v1fziTpwduB3SfAnXWvZDV8w+o9/AKWHkFwuS5sjdc
DoERZ2yeykgFzHHzBGEPw3VVb+LhjcWX9RKAJ+p9ptePvn6Q/pfr+v+NzGPjX8Z+
J8Wn9dOyu9MWXQ2LuShj2AOHJu4Srjc6H/4toL3Pgx446PABpcVC8GnCvgn+h7q8
A7sB+XANqQ7OFq7f61huDRzEAWeKPv1WS4jFWZMFKQ1SbHvaUpgIKkk0q79Ml+ET
GtoiuJBTMUx/ceiVYJEL/ZrC8fOkDoQ6jitFhW65LV+LkMd+Tqvht84uoO/KjDSa
xSIgXmC4Wz7Dx84JSKAjXgH5+aB9dKwAtBobJQbmFRp5XuCqrCSE6iIbmZPRojyH
sOUQQTuuoZQm8TmwlDBacmCfDg1dQe4QJnYpMp+1utWaw/SfoydYwzwpU1nEzRQo
Zt1Xx3O7yPuG+kh3yHY+2F7ZWl58+eoGYK8vvaOo6DHeFrshgBQ=
=po4y
-----END PGP SIGNATURE-----

--EQOTPmt/EC2dvpzu--

