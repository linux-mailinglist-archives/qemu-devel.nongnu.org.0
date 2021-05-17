Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8118738234B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 06:14:04 +0200 (CEST)
Received: from localhost ([::1]:49460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liUdn-0001q6-K1
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 00:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liUa9-0004YB-Nj; Mon, 17 May 2021 00:10:17 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:51547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liUa6-000283-JL; Mon, 17 May 2021 00:10:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fk5JK1HNhz9sWQ; Mon, 17 May 2021 14:10:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621224609;
 bh=zWowO3Fdn47ZxOTTXZVNneU5D12f+uYf8Dkzv6uXFAg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TCvixKvb4+Q+7tDBUp3WJVbtmman6JkhxRUc0gYWa7Pkef8AiExR+YxoyB9HljgI6
 sDQI3deOElSCnyBr/k7gXzFC1y5UVgfMUPyZOhetZSZaCoq0MSlpevxNN4ahegXkXU
 07UoEfefeB+/Ir8U3jYzJNapIVhhmEXo9pJeqoyk=
Date: Mon, 17 May 2021 13:58:03 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 09/11] include/exec: added functions to the stubs in
 exec-all.h
Message-ID: <YKHpy53AwM8tTy3E@yekko>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-10-bruno.larsen@eldorado.org.br>
 <c4b7cba3-eb5f-ff65-9376-da9dc8edf45f@linaro.org>
 <f0fbb69b-76e9-c951-f18d-cfc4629f5f2a@eldorado.org.br>
 <aad60a0c-1f07-24ab-821a-193047e4ad2e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wA0XTanI4/SyQ0IM"
Content-Disposition: inline
In-Reply-To: <aad60a0c-1f07-24ab-821a-193047e4ad2e@linaro.org>
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wA0XTanI4/SyQ0IM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 06:44:01PM -0500, Richard Henderson wrote:
65;6401;1c> On 5/13/21 9:03 AM, Lucas Mateus Martins Araujo e Castro wrote:
> > tlb_set_page is called by many ppc_hash64_handle_mmu_fault,
> > ppc_radix64_handle_mmu_fault and ppc_hash32_handle_mmu_fault, all of
> > which from what I've seen are only used inside #if
> > defined(CONFIG_SOFTMMU).
>=20
> tlb_set_page should only be called from one place: ppc_cpu_tlb_fill.  The
> other functions should fill in data, much like get_physical_address.
>=20
>=20
> > So what is the best way to deal with these tlb_set_page calls? Should
> > these part of the _handle_mmu_fault functions never be reached or should
> > these functions never be called?
>=20
> There is some duplication between get_physical_address* and
> *handle_mmu_fault that should be fixed.
>=20
> What should be happening is that you have one function (per mmu type) that
> takes a virtual address and resolves a physical address. This bit of code
> should be written so that it is usable by both
> CPUClass.get_phys_page_attrs_debug and TCGCPUOps.tlb_fill.  It appears as=
 if
> ppc_radix64_xlate is the right interface for this.
>=20
> It appears that real mode handling is duplicated between hash64 and radix=
64,
> which could be unified.

Any common handling between the hash and radix MMUs should go in
mmu-book3s-v3.*  That covers common things across the v3 (POWER9 and
later) MMUs which includes both hash and radix mode.

> You should only call tlb_set_page from TCGCPUOps.tlb_fill, aka
> ppc_cpu_tlb_fill.  TCGCPUOps.tlb_fill is obviously TCG only.
>=20
> The version you are looking at here is system emulation specific (sysemu,
> !defined(CONFIG_USER_ONLY)).  There is a second version of this function,
> with the same signature, that is used for user emulation in the helpfully
> named user_only_helper.c.
>=20
>=20
> r~
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wA0XTanI4/SyQ0IM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCh6csACgkQbDjKyiDZ
s5ILYxAAozEE6E3UCeHIxElLbuW5o5r8WOOfUFzJ4jNdHUoVMnpk4WXxdZvvT0Q8
iiH4elOeE1EraR0ShEX2r9MFBecLPF0JVILpokg5/PBR8ZvD8i/9999mkuuskigi
iSjBfKVQYyIYNEfvWXvXYptQ8NnzFlFowssJwg0F9389u6hveOLTUH/9zQ8bcOaI
x8+olaadbGDduVSBVb60SrQgm4fxP6zrz7lxBJoyiiFb5hFRyaZ46LE3BBOFM/bC
sfT4VDR1LIVpBmnS0h2pCkUBBNtOFF6EX7okr8x0x2tj0bzAXvpYeBYedIgPyLXM
YTCk9c6lTJarLIGbFwUvrYbCQ451nebhRUF43N/NEimH9oLobZ55srSxvxWpkbak
2P9WzRBWHPFBlxM6SzXpY+hiV8fjfMFsVgqdGqz6KPvNyXay3GafypKng4zsfZL3
IMp7jI6AebLPWJpl6j8TGOubnzO9VWHDzVmQVMuvrwiAXQnsQ7Wdik2iQkMhxq7d
E/24G2YByTWHtGlCzDUAENt+JidKu4R0hnyw25LOzYhU7bQAPQOo8dgpq+9JNKhO
FmLj9y20lMp1b12WE5fz1hyFtMXwNH406ygTSl8yMqXQUVmfanHGMilPAVmnc2+p
gaNAe+32ZldDS3LbiTwRc8MJL37neiSm+wx+XYY+HyzQPLSIQSs=
=+Ug7
-----END PGP SIGNATURE-----

--wA0XTanI4/SyQ0IM--

