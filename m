Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 801FF2C0000
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 07:23:00 +0100 (CET)
Received: from localhost ([::1]:51600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh5Fb-0006gR-HC
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 01:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh58m-0008Db-4j; Mon, 23 Nov 2020 01:15:56 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40655 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh58k-0000Wa-3d; Mon, 23 Nov 2020 01:15:55 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfcN569VHz9sTL; Mon, 23 Nov 2020 17:15:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606112149;
 bh=VsPdQt83pT/zGUX0Zk00GkeDMmFQkbz8fZGnvhNfstg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=piDKe+YUbj7fkRAKxLeYwxsoTf3yYD9oVAmV/8lnX7Rq9S/8pZW6spVfPrc/QBr/J
 DwI4GUR3tfEX6ekQUPiNuIPlHETjg6g7+/FSx5Dzz74knhmldXTOslkg+gWioJaLvK
 326YXlWSnmETrUQJt11bCfru7BWlRBOAG/dJB5J0=
Date: Mon, 23 Nov 2020 17:13:42 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/2] ppc/translate: Implement lxvwsx opcode
Message-ID: <20201123061342.GV521467@yekko.fritz.box>
References: <d7d533e18c2bc10d924ee3e09907ff2b41fddb3a.1604912739.git.thatlemon@gmail.com>
 <a1c67758-7b2c-725c-67b6-e0c52a971d67@linaro.org>
 <9096a38b-0b6f-3531-b88b-e1be1d946831@gmail.com>
 <20201111062232.GC396466@yekko.fritz.box>
 <d106b7fd-6a76-ba91-d11a-3611b0f070c8@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GGxZz/e2pmGePzrA"
Content-Disposition: inline
In-Reply-To: <d106b7fd-6a76-ba91-d11a-3611b0f070c8@linaro.org>
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
Cc: LemonBoy <thatlemon@gmail.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GGxZz/e2pmGePzrA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2020 at 09:13:33AM -0800, Richard Henderson wrote:
> On 11/10/20 10:22 PM, David Gibson wrote:
> > On Tue, Nov 10, 2020 at 10:14:23AM +0100, LemonBoy wrote:
> >> Is there any chance for this patch series to be merged for 5.2?
> >=20
> > No.  We are now in hard freeze, and this is not a bugfix.
>=20
> Actually, patch 1/2 is a bugfix -- a missing instruction from an ISA that=
 we
> claim to implement.

Fair point.  I'm applying 1/2 to ppc-for-5.2 and 2/2 to ppc-for-6.0.

>=20
>=20
> r~
>=20
> >=20
> >>
> >> On 09/11/20 18:39, Richard Henderson wrote:
> >>> On 11/9/20 1:17 AM, LemonBoy wrote:
> >>>> Implement the "Load VSX Vector Word & Splat Indexed" opcode, introdu=
ced
> >>>> in Power ISA v3.0.
> >>>>
> >>>> Buglink: https://bugs.launchpad.net/qemu/+bug/1793608
> >>>> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> >>>> ---
> >>>>  target/ppc/translate/vsx-impl.c.inc | 30 ++++++++++++++++++++++++++=
+++
> >>>>  target/ppc/translate/vsx-ops.c.inc  |  1 +
> >>>>  2 files changed, 31 insertions(+)
> >>>
> >>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >>>
> >>> r~
> >>>
> >>
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GGxZz/e2pmGePzrA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7UxYACgkQbDjKyiDZ
s5InAxAApTvFIBRE3zGdO0RHhGu8MzrbCyTu7tA4WZWGfjDz04Ru1/G+mo1agUuE
jhskahDYr/qyILzCtYSAaOa0jgC65EBz4K6yJ+80jhUbhgViebc0hhdeDpOAdqRV
R4uLnY5UrvMMgIEe+gKhDkYPId/sEugYs8lbFYjw8IxnSw+dvR6+wgiQ7WJDlqmA
KF4BVrbWNQJM1Zy1PIUtcToIIklOvAmND6mc8bHzf/CpyJkz1HEMF1WGcRuE//2P
6vbKqgUkuvzqV5egDDJ4i3UTPu/TTMpdSnAi6Ky6SLeSMpFrNYgpX72fmGX72cN8
fSmpxWNs71e3v4yD/jUBDz3TFfLKcPBkdrT7a42/mtJYG9QAt8kPhuMjHfJisKfP
rxuTdv4I6XtVHqrG/tfKNterfsWNtFPMwNUnxGWcjGhHiFbm2x/ZUy7cF6rqI206
Qq/DhteEoBARLl7Mx2HDW8fI0n1VRyj8JITvMcrDPd4CnBuIB+Iy/LtEwB+bIjj+
lvTvfSzs2Vg/E05JhqUddjWohq6pnjIq9qQ5BVY1rTUPVRDLFr7m04vAsSCsZGyY
D31Pe02w7YMRmmj8IDovT1i4/ofe809kK0MS5k498q4E2WJaSyR8rpoUeGs3lZN2
5+aOD1puJSm9Vln484g/D7s0nQySNxCZVmZq4WDUy9fSXHy31v8=
=WdzB
-----END PGP SIGNATURE-----

--GGxZz/e2pmGePzrA--

