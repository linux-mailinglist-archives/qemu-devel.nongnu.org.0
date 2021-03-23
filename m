Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279B8345453
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 01:58:59 +0100 (CET)
Received: from localhost ([::1]:39612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOVNp-0000bn-Pq
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 20:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOVLT-0007SZ-8c; Mon, 22 Mar 2021 20:56:31 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:44429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOVLP-0002Su-F0; Mon, 22 Mar 2021 20:56:31 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4CbR6wLWz9sSC; Tue, 23 Mar 2021 11:55:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616460947;
 bh=5pNGnP27Y58nroIEAR+PfTHDh++gZAeyoqQykvpM9bE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FldffU87yFnnMtFX/rEgwAi7z6/5PyyqJxGMMHfGzSWFaR9xZu5j1FpjpFTtSBKkD
 X/CbWnyuRPh8LbKqFmHKhK7rWs5YQm3dg13E6nNUfjVN7CSiKuGy3+cdlnrWtSSPsw
 JVAvv4oHLbQ/ZzMT6tj52vYjELWNK4nxEtc8uHco=
Date: Tue, 23 Mar 2021 11:42:17 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v10 0/7] Pegasos2 emulation
Message-ID: <YFk5acXxW6Mdmr+2@yekko.fritz.box>
References: <cover.1615943871.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+CcFLfIBOU6Ue8EV"
Content-Disposition: inline
In-Reply-To: <cover.1615943871.git.balaton@eik.bme.hu>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+CcFLfIBOU6Ue8EV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 02:17:51AM +0100, BALATON Zoltan wrote:
> Hello,
>=20
> This is adding a new PPC board called pegasos2. More info on it can be
> found at:
>=20
> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
>=20
> Currently it needs a firmware ROM image that I cannot include due to
> original copyright holder (bPlan) did not release it under a free
> licence but I have plans to write a replacement in the future. With
> the original board firmware it can boot MorphOS now as:
>=20
> qemu-system-ppc -M pegasos2 -cdrom morphos.iso -device ati-vga,romfile=3D=
"" -serial stdio
>=20
> then enter "boot cd boot.img" at the firmware "ok" prompt as described
> in the MorphOS.readme. To boot Linux use same command line with e.g.
> -cdrom debian-8.11.0-powerpc-netinst.iso then enter
> "boot cd install/pegasos"
>=20
> The last patch adds the actual board code after previous patches
> adding VT8231 and MV64361 system controller chip emulation.

I've applied 1..5 to a new ppc-for-6.1 branch.  Sorry it didn't make
it for 6.0, I just didn't have time to look this over until too late.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+CcFLfIBOU6Ue8EV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZOWkACgkQbDjKyiDZ
s5L/Gw//eGNXH2CbhWhLOFhdC1eZF/D2ls34iqHWynNFTz2eiJ4ffavM8YdhZBJ2
fcZ7n78OBgcVmVONaUpQxEeT3tmn2yaeZnSBsuPutAqDrHl8tOI69IZqym2IExlw
ClNvhU4RR3U1AEiCGcIOExbkIK3Jadp6egEd8RKrIQzXqtCV7QCVri2uwKkwEMWF
6zZ+jI+g/QnU9VVO4bqHcjPLdsBFjzYNyqCveLXBKeQ0kf/7hwf8oog9RjC3ji8C
Wx1sT+IBawQ8DSQ6HiCJLInzEOjUR0rVzH7G0whhW0CPUGxy0b/uXhPNXginlqT3
8sny7gezqfm4H8Ah5w1ov3JzQHEzD8K0ZJiOFxnCUcSIZWubgBI8iCjOkL5+TuKz
OFmYx25Rb826WVaOhuiH2nXb7LjOkizunWzjXOTDvvtTk4p/AS73jOkaiFcweHMY
6fTR2u1tkaIzpwrfy+Fi690Tx5OUBQabaDBM3VgDG7bVtcOtHCdpHuhPZfXRYOMN
g6adK35Mq3b8D0VQo4a39Vsi6uw+y30NsC9ztgop8KZoBzrGnCGaXU0hAW0ANpX8
PErxcOavBxsO17bb6lICzCk1YTZFqU4Rk4UORFpu9UUDDVOuyEM9tDB5bD70MEnn
ADG+JCPXX20sLUcGckr42GTnSWYFfJzxWmQO3rIM5aSFHUQcxtk=
=j16O
-----END PGP SIGNATURE-----

--+CcFLfIBOU6Ue8EV--

