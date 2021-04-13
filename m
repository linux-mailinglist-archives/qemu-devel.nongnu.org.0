Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4738235D93B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 09:46:03 +0200 (CEST)
Received: from localhost ([::1]:43542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWDkI-0004Dz-85
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 03:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lWDhS-0002ar-Lp; Tue, 13 Apr 2021 03:43:06 -0400
Received: from ozlabs.org ([203.11.71.1]:37509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lWDhQ-0007rP-AE; Tue, 13 Apr 2021 03:43:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FKHdX10vFz9sVv; Tue, 13 Apr 2021 17:42:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618299776;
 bh=6imbApBbnoU37MP7z7eiOy0pDcw/QYH7WzR88yrKlp4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jjifVQYFvNDCGPv4dpp0P+mHTkZHXxM/oG5t9wkU+mE++cHRSwRfxKq/s2FhnrT3S
 TfDnWW2PFrwSqwP/CxzA5INZhvi73p9qtnRWfJKa75BKrqU7c0OaYQkhMbbq/zlfLo
 nPlrXBWH+eL5eTFDru7quoVsJ6D6q1pGIpJ4xXgA=
Date: Tue, 13 Apr 2021 16:42:13 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/4] target/ppc: added solutions for building with
 disable-tcg
Message-ID: <YHU9Rez8KNZ1FKZi@yekko.fritz.box>
References: <20210409151916.97326-1-bruno.larsen@eldorado.org.br>
 <20210409151916.97326-3-bruno.larsen@eldorado.org.br>
 <YHPV19l06sgXCNEj@yekko.fritz.box>
 <26d5b8e4-693d-f747-3b7f-d984a43f0209@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oZw7gLQAITkNJFQA"
Content-Disposition: inline
In-Reply-To: <26d5b8e4-693d-f747-3b7f-d984a43f0209@linaro.org>
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
Cc: qemu-devel@nongnu.org, lagarcia@br.ibm.com, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 andre.silva@eldorado.org.br,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--oZw7gLQAITkNJFQA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2021 at 08:40:47AM -0700, Richard Henderson wrote:
> On 4/11/21 10:08 PM, David Gibson wrote:
> > Not directly related to what you're trying to accomplish here, but the
> > whole vscr_sat thing looks really weird.  I have no idea why we're
> > splitting out the storage of VSCR[SAT] for the TCG case at all.  If
> > you wanted to clean that up as a preliminary, I'd be grateful.
>=20
> That's about efficiently implementing the vector saturation instructions =
in
> TCG.  See GEN_VXFORM_SAT in translate/vmx-impl.c.inc.
>=20
> The SAT bit is represented as a vector that e.g. compares the result of
> addition with the result of saturating addition.  We don't need to resolve
> that to a single bit until the VSCR register is read.

Aha, thanks for the input.

Long term, that might benefit from KVM specific code paths that don't
bother with this then.  However, for the first cut, it's simpler to
just keep the current representation, even though it's pretty odd for
KVM.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oZw7gLQAITkNJFQA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB1PUUACgkQbDjKyiDZ
s5JBug//dEEb2zhQ/ZrJ0EqUCf7WDF38V8/QlDpaN5a1QXDEsHJmDRC4NWCCsYCB
ghe28qZSmO8Jcoz+1TSLhREWzCS9WMQwvvdYNd/Eug4Dn9wy7LHKpoAJ+WsQQ6JP
jA8oAIm/o9+D39x5GMrah5K1mR1KpZ5a/hMejpXCBC3BP5gg0VDKWEajomwYtzNU
HXX4jIlIab6BkzR3929f5EAYn5X0aQoq7gpW4SVaUv3yFXt6PrYDXwghIO7n0bRL
S8gVwLusEzKESq8/dygvP2qLTbf6vWybGL2pDUzRwGOWfGvVUSbLIebptC1hEhxV
29oM2rpqHchH5OsqTbSwt5/KWHzar35/HsN5Qz6IpeQHyBomrOurwOXAVUkUW7Y6
8D0QwlG0sKs/i0iZkFeuh/U9zdYIJV9erDASCIaCyxnkIezB4I8zYXJG1R4tKQYc
MhNl4smFtJKA4fq1tpNxXlXRn7HalH74pH+4s3uEAqJpFK34ec1v5IXpO8Z08kH3
FI4evuKG9mVXZEZqqa9XKq+sxY1zNAZDDKImIdQ9SA4kNiXFeUXwRqGQq9Vtl1uv
hUBCPkCkMOQc3CpJubUlBOKF+S2ASAgvlaBBGVr2+i8MKR1Yr6spa30QC9Z2aP6y
LW4FGaoZ/A6jwpNknBaPG/WSR5PyzU/gEyD3C1aJ8X0JIH3GG5o=
=vBTz
-----END PGP SIGNATURE-----

--oZw7gLQAITkNJFQA--

