Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC973295C6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 04:46:03 +0100 (CET)
Received: from localhost ([::1]:42516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGvz0-0005W9-FS
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 22:46:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGvx1-0004FA-TE; Mon, 01 Mar 2021 22:43:59 -0500
Received: from ozlabs.org ([203.11.71.1]:59983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGvx0-00079t-2U; Mon, 01 Mar 2021 22:43:59 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DqNK52trRz9rx6; Tue,  2 Mar 2021 14:43:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614656633;
 bh=KvaeH0QkoV4C8EUHQqUzCRTb/Y2F/iN/57MGoX12754=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YJcXpdCEtBJ0Jp4loUoUCblclDc1ShFWWCaw7PDtXNISkrMPr0p5oCrfvOfRHYqUW
 87HqKcb5FfARoXa/X6p2Cv6WGF/Hfmdu1XErFByNMT+9BmvCp2RU6en2nCSlj+pxNV
 IzU816I60x2NqbIOAepZ9KG1e2VW/noBdVwLj7f8=
Date: Tue, 2 Mar 2021 14:43:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v4 0/6] Pegasos2 emulation
Message-ID: <YD20dOLddY7Nx+Ko@yekko.fritz.box>
References: <cover.1614282456.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oCVtWCpJu2uandwm"
Content-Disposition: inline
In-Reply-To: <cover.1614282456.git.balaton@eik.bme.hu>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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


--oCVtWCpJu2uandwm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 08:47:36PM +0100, BALATON Zoltan wrote:
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
> adding VT8231 and MV64361 system controller chip emulation. The
> mv643xx.h header file is taken from Linux and produces a bunch of
> checkpatch warnings due to different formatting rules it follows, I'm
> not sure we want to adopt it and change formatting or keep it as it is.
>=20
> Regards,
> BALATON Zoltan

The ppc specific parts (patches 5 & 6) look generally sane to me.  I
haven't looked in great depth, since the threshold for entirely new
devices is pretty low.

I'd be happy to queue this in the ppc tree, but I'll need acks from
the relevant maintainers for the changes to the existing VIA bridge
devices.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oCVtWCpJu2uandwm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA9tHMACgkQbDjKyiDZ
s5JodRAA5kEFJ+hTcY1Icb06gCqRIHUoUOy2epsaGzieXj5igZLMIPHGGkHBTsTr
hI9BG4IM1Skjy/ErUiEYTQBuuMf5rACs6kDqpYvFTxzcPrkJtaBGYziRk7huZkuO
qnBTYlMxTimV4rTwxE8XMjohyfx7tf4dhRbvy+2aKsJmAzvjM7I6zrF17dVKkVHJ
HRmSnqhAk/wt/JSKJetC4Xe/6DFIbrhphz0hw7jJ6OeZamKDzDJwlRVRzx7eAYhR
gqSGpsE1qLVUcP51zDA+GFE7iDv/ChL7JVr/wBQ2OCb6pHSbm2HAfpisCC19OzaP
d/xL2WLRsHUXTwI3NAPg0w2rt/eMHm15pJxTf8AXdUAxFojf7XsjoGJOJwbTBCig
fYpdGOFIkhHB3zwSvOzBC+7MjqhjpSxBqXSGZRE0Qh3II0GZFWBRQrzoPVNy7/5M
lGtRzJWn44V8MGVElR+I+yGUz1YrxDu5Z5W9xa2LyFnhAkDqLwiM4Qcx+uEyikXE
RS3FQM1y+9Gd1JNAaaGYjnzcSMIvPB3Ibn9TeK1UqZ0Rt3FGjKW58tPqctaqcgb2
D4T/dhFlDIVudYghgx92Ec02PikWAr8xXUR0enCfMI6iwenqUP2RCSSZaTbud11G
f9qCBDFWocQ4Xhm1CDZhySyIFwlgcPhK9KWAgdeyC/H4q684M+k=
=hqs9
-----END PGP SIGNATURE-----

--oCVtWCpJu2uandwm--

