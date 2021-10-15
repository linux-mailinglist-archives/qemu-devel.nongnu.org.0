Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC08342E9EB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:20:15 +0200 (CEST)
Received: from localhost ([::1]:46642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbHVn-0005gL-0K
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbHHV-0004em-Ez; Fri, 15 Oct 2021 03:05:29 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:49949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbHHT-0000j7-7l; Fri, 15 Oct 2021 03:05:29 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HVy2N3kDPz4xqS; Fri, 15 Oct 2021 18:05:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634281500;
 bh=CH66o6F9oyYPZWG4dQVh1A66Lu5FWPcnNN4P6+Lpsho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J/eD08VN/o3k94z10EX6ruzpA3I4BNybHzwfa3XVhGO+SBxJgzWPUj8hxVcAuQHQw
 t5oXBFTxCa6m4/YW35J++adQ8mywmG/F7rbJ2Vw49SVfo4meoIfb2D4T0fanjxTASR
 nPKXcdVldIo3JqQ7WUDo48YtwSqrYWJxMDBuYxkM=
Date: Fri, 15 Oct 2021 14:20:33 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 0/6] Misc pegasos2 patches
Message-ID: <YWjzgU8pGtqykYji@yekko>
References: <cover.1634241019.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tJgu9YvvDv4Ycg7r"
Content-Disposition: inline
In-Reply-To: <cover.1634241019.git.balaton@eik.bme.hu>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--tJgu9YvvDv4Ycg7r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 09:50:19PM +0200, BALATON Zoltan wrote:
> Some small clean ups and improvements for the pegasos2 machine.
>=20
> BALATON Zoltan (6):
>   ppc/pegasos2: Restrict memory to 2 gigabytes
>   ppc/pegasos2: Warn when using VOF but no kernel is specified
>   ppc/pegasos2: Implement get-time-of-day RTAS function with VOF
>   ppc/pegasos2: Access MV64361 registers via their memory region
>   ppc/pegasos2: Add constants for PCI config addresses
>   ppc/pegasos2: Implement power-off RTAS function with VOF

Do you use git send-email to send out your patches, or something else?

For some reason your patchsets, unlike most people's end up with the
order completely jumbled in my inbox, which makes applying them a bit
annoying.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tJgu9YvvDv4Ycg7r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFo84AACgkQbDjKyiDZ
s5IThRAAqMiGk+TWvaL+IN+J8RLn6htopu+pg/6xOhS7g+TbHSmVX8C8A4hyFkOQ
yUwwDt0K438aXJokTrXm/zTJ1BiHtK6lVltbY3pfiGL6M86vf00yMJlsAM8YYP5G
SgT1YXRelpGXPlvFYgySnrSOB39E7AzEgfDqSrIQ48eqxcljHPVKO/8c5P0njdJU
3oiYiA3zs00cOAM40yXfwJwEvibIGKEDGAEp+dMZ4nJReIJk3ZivF+AeeWVa24xl
/LMYnDCWH1AbxU8nCv/F6YI/Tms+kHOaO+CG3ncMA88ybQ2+7G2q/ySeLObbJ9+y
fTRYI4vmeRd5g7gEVGoj9q2K+FHPa9t+GshZD3cIphzybAUCus9zJMan1cE8SbrC
ZFIPjB67zBtft4D2BakQRqp5djf+y/wspmVyZSDrFZ4vgBoKrgCbg0aIIRBGCtUE
+aO4X5PBaz12uXbdE/JDk8iLDsWqhqKj3n+BTwyh2m0neAOryYanFU7ahCe3vIuw
r6tGgoSxzi/invf+FGJVdbNb0xBM2/4aZkfoNZ7jF4LYvOvl5v0kw/cAmdxZo3gH
rIjjWIeJmcmUXarJ9j/KVcUnIHgR0rODlUCdlS5INDXbTgPDQDeiLP/CUlo91ntT
XMp2iDnEchpDNyaOQrkYVMeSgreWx7ddXFlIZjVHhmJZJooSgYE=
=b5vn
-----END PGP SIGNATURE-----

--tJgu9YvvDv4Ycg7r--

