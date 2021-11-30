Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456F44644BF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 03:07:37 +0100 (CET)
Received: from localhost ([::1]:34434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msF1z-00055E-IS
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 21:07:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1msEw3-0000vL-Dt; Tue, 30 Nov 2021 21:01:27 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=48171
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1msEvz-0004vr-C0; Tue, 30 Nov 2021 21:01:27 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J3j4C1fsBz4xYy; Wed,  1 Dec 2021 13:01:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1638324075;
 bh=O1SA/NnlU9vodEIiKdHRObd7MmQsxIcqHriOl+nbB10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UQUC3JwiMkBrMSLihAG5wjDymLUPTnuEywwzcAVqANGSkbo8rbKZF8Rjq21K2DKal
 ChovqPMqUmmP42Q0Hg64eDUR3bMpyi2xawlq63LNd6A+Q2dTsKJNDJcBn9jDT1sIfX
 5s2yCpFfepiE/WLY2pKnQbmgOKRVM41GP9+OhOe4=
Date: Wed, 1 Dec 2021 10:42:08 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v4] target/ppc: fix Hash64 MMU update of PTE bit R
Message-ID: <Yaa20FBX6F7xagx9@yekko>
References: <20211129185751.25355-1-leandro.lupori@eldorado.org.br>
 <YaVwvAyhyhlIYhV5@yekko>
 <62188dd4-c6ea-4c3e-b444-585319818b4f@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3f5+YZ6gbFyeHpje"
Content-Disposition: inline
In-Reply-To: <62188dd4-c6ea-4c3e-b444-585319818b4f@kaod.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com,
 Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3f5+YZ6gbFyeHpje
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 09:44:58AM +0100, C=E9dric le Goater wrote:
> On 11/30/21 01:30, David Gibson wrote:
> > On Mon, Nov 29, 2021 at 03:57:51PM -0300, Leandro Lupori wrote:
> > > When updating the R bit of a PTE, the Hash64 MMU was using a wrong by=
te
> > > offset, causing the first byte of the adjacent PTE to be corrupted.
> > > This caused a panic when booting FreeBSD, using the Hash MMU.
> > >=20
> > > Fixes: a2dd4e83e76b ("ppc/hash64: Rework R and C bit updates")
> > > Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> >=20
> > Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>=20
> Sorry, I didn't wait for your Rb because the patch was a good candidate
> for -rc3. It is merged now.

No worries.

>=20
> > Thanks for your patience with our nitpicking :).
>=20
> Yes,
>=20
> Here is another QEMU bug found by FreeBSD :
> https://lore.kernel.org/qemu-devel/427ef2ee-6871-0d27-f485-90ad142f6266@k=
aod.org/
>=20
> It would be interesting to boot directly the PowerNV machine from a
> FreeBSB kernel and a minimum inirtd without using the skiroot images
> and an iso. Are images available ?
>=20
> Thanks.
>=20
> C.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3f5+YZ6gbFyeHpje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGmttAACgkQbDjKyiDZ
s5JlgQ/+MEKtmWoIbhshMM985c2Z09Al9pJa8cuKYTiX6POzizSsOGZqSVUxXums
GHDDuEpAoylL1191x8tyG9BUM8B6zQzSJ7Id1NjPAlztEb7Wi/DWtu/pz1+NGVWZ
AsIIic7V3kXkB5CK4zbG8KArRE92QnBo5xEdMI2ojs6SS/8C8rRES4BTDbBdGYZb
rzDT5DRWl3w+jvU2RnUlPU6cT5cbdEz84Jp/Mr/XT0/ifF5MxIkJLxtFeD2dJbX0
MqVit+hMoI9nSnEUQ2B6WgeReKDrnWyf5nD2FH+GjVEwtKoWcx5eWCFKhY3m72VO
aorSnGfMuQ58DEkv69hQG/TbLyzo1ArPSrcJ1i9AUqxYm2tq+azl+7vebStSseMM
1pZvgC+2Zmj6YptpZClVRrjnQHcMZrikhRhobv7bEz2O5bHT2OG8d26rCIK4VyRz
y39Oqb+IZ4fI1J66CupsTxdkkrHvVYGrBtGuku2CHYADzb8vuJU8/FmGXuOLK/Hg
o7y9rHprigNwaQEOWxevlFUzOczQuboeCC5iEHE99dVHeyyf59TReTCO/XPU8WDD
b5gBS8wgZo5dTo6HXFyCLPQEsdz2P4Sl0OGLy7hrenDcYGpS6TpP3T8sd2kfstan
f7Nolt0iIO6gIG/bn+hKCI36YlJx9FzQxmXcgG4XPrNzSIegplM=
=E1GS
-----END PGP SIGNATURE-----

--3f5+YZ6gbFyeHpje--

