Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7192364F5A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 02:12:58 +0200 (CEST)
Received: from localhost ([::1]:59802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYe0f-0001no-A3
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 20:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYdz6-0001FV-T1; Mon, 19 Apr 2021 20:11:21 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:55705 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYdz4-0004XD-Bv; Mon, 19 Apr 2021 20:11:20 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FPPH31gNgz9vDc; Tue, 20 Apr 2021 10:11:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618877471;
 bh=oAA0sgrm7jSx1Cxr/nlWM5dP+TKPCCIi8oIy2rAUf2Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nWwUjvTtJwQpJCKBxARtQRaessfCIkt8GXdjVqVs7CZa0oeo5skCW1AScGM4Rtl7a
 wIdO0EekayjcoFYVcyZM35ib55v4pXAVTjjnyUhfavDcbEa72thd/HsCf8d8DOXAOk
 CvFiDGuJj/+NlzjGjPSNZy2ooPHAITi/rjQJsDQ0=
Date: Tue, 20 Apr 2021 10:09:18 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Subject: Re: target/ppc: sPAPR invalid function calls when compiling without
 TCG
Message-ID: <YH4brgX7Qmo0Ak+8@yekko.fritz.box>
References: <RO1PR80MB5610B3195A7C36B3878E8C68CE499@RO1PR80MB5610.lamprd80.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="00llom3lU7/rY16i"
Content-Disposition: inline
In-Reply-To: <RO1PR80MB5610B3195A7C36B3878E8C68CE499@RO1PR80MB5610.lamprd80.prod.outlook.com>
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
Cc: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--00llom3lU7/rY16i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 07:04:34PM +0000, Lucas Mateus Martins Araujo e Cas=
tro wrote:
>=20
>=20
> >> spapr_hcall.c:
> >>     function h_enter call ppc_hash64_hpte_page_shift_noslb, ppc_hash64=
_map_hptes and ppc_hash64_unmap_hptes
> >>     function remove_hpte call ppc_hash64_map_hptes, ppc_hash64_unmap_h=
ptes and ppc_hash64_tlb_flush_hpte
> >>     function h_protect call ppc_hash64_map_hptes, ppc_hash64_unmap_hpt=
es and ppc_hash64_tlb_flush_hpte
> >>     function h_read call ppc_hash64_map_hptes and ppc_hash64_unmap_hpt=
es
> >>     function rehash_hpte call ppc_hash64_hpte_page_shift_noslb
> >>     function rehash_hpt call ppc_hash64_map_hptes and ppc_hash64_unmap=
_hptes
>=20
> >h_enter, remove_hpte, h_protect, h_read and rehash_hpte should never
> >be called for a KVM guest (KVM will intercept the relevant hcalls
> >before they reach qemu).  I think it would make sense to split of a
> >TCG only portion of spapr_hcall.c into a new file.  You'll then
> >probably need !TCG stubs for those hypercalls, which should trip a
> >fatal error (if KVM hasn't handled the calls, there's nothing we can
> >do that will salvage the situation).
>=20
> These functions are static, so I thought about turning them into non-stat=
ic functions and creating the prototype in
> internal.h and changing hw/ppc/meson.build to add the correct .c file but=
 hw/ppc/ doesn't have an internal.h
>=20
> What is the best way to handle this static functions?

They're static because their only direct use is passing to
spapr_register_hypercall() in hypercall_register_types().  You can put
your own register types function in the new KVM-only file, with those
calls, so everything will stay static.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--00llom3lU7/rY16i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB+G6wACgkQbDjKyiDZ
s5LbmA//SLYTqFdGvWL+pNrowX+nZQQgOGbR08p+tXQNGaCXaFreUD3ZnvE+8gv+
F5Vrd2rNV2hgKDah2ng/4v0+1V9kr/cBoV6tzTm9FTuyY8KNXiKQEac6ZtoNs/mA
9E0y18KGDSp163//od7HIyusB0pq2D2+H0t4DyfRNqgbRpxF8LGLUAiiQJVSA3/m
davMyEcRsD13PzHw0Vudu9I+C83ytt+5SLdP4gzTDxiGHxXlJj9UpHD4SIr0tTaK
7w17WlxQQM98kAL+oH7ZB0wYWJ1Q3qZHoeghQ4xI8qDdl8qtmBhoH3qN+J1/91yW
gL9L2JeRMF4BqLTbriAYYcxqUcbiTSoL4KTE3KJS3pN/usogv8eS4t+C00mnUL7h
5TUSHVTQy180bpFlHZ6UBH+j+CMUEvEPXvBYE2LaKPyZ7moiG4QGZS5Clb1gwcQp
FwS1U2DFzudXiGB/+HEC0pYUQQuOc+l1patJWyP23FgQHGj1m+BOoubyx+YFowPL
5v6/sZzFxAtjCRxrftYbxtXboyFXsBCT90njqjxNX1LV7e76sxXrTWsH9j7uh6Ej
hAgElmt1IypmsEwl99IdB+DHZpfhEcorJ5S77rpD+d9A9Z3hxri4XlI/E9pVpivj
QLjnDxWDCgAtemKGENfhJnutKCDrQEQ5owNNGbhk3y5vbp4Knvc=
=D8sR
-----END PGP SIGNATURE-----

--00llom3lU7/rY16i--

