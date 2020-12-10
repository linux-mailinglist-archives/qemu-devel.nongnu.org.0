Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE7E2D518B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 04:41:44 +0100 (CET)
Received: from localhost ([::1]:43358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knCpq-0000A4-Ka
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 22:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knCmA-0006nv-6r; Wed, 09 Dec 2020 22:37:54 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58377 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knCm5-0003U2-AY; Wed, 09 Dec 2020 22:37:51 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cs03n53w1z9sWR; Thu, 10 Dec 2020 14:37:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607571461;
 bh=osS3KDSNpJf1pMK8lmKQy55/oSoDtINaRPPOjRc7N4E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BgKYtKQ/g54n8ulUhqp/FnSoBOxMyrdsiENJ6bl04FXdjdQTFpJ29hUmS7R1Grvqf
 l7amrMi2Y6I5lZ8D/x7mQEKhg8RzyAAEgxt38hkc/5ubg1LCVxQ7gl5yY8vF+K93oV
 xtKqpqk+Z8ZPITzFIzYIHBX7TrBoJmoz4peqyVy0=
Date: Thu, 10 Dec 2020 14:24:08 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 0/2] target/ppc: Fix detection of 64-bit MMU models
Message-ID: <20201210032408.GG2555@yekko.fritz.box>
References: <20201209173536.1437351-1-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FwyhczKCDPOVeYh6"
Content-Disposition: inline
In-Reply-To: <20201209173536.1437351-1-groug@kaod.org>
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
Cc: Stephane Duverger <stephane.duverger@free.fr>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--FwyhczKCDPOVeYh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2020 at 06:35:34PM +0100, Greg Kurz wrote:
> Stephane Duverger posted a patch to fix a miscomputation of the
> 'need_access_type' flag in ppc_tr_init_disas_context(), which can
> cause QEMU to abort with 32-bit CPUs.
>=20
> This series contains an extended version of Stephane's patch and
> introduce an mmu_is_64bit() helper to avoid a similar confusion
> in the future.

Applied to ppc-for-6.0, thanks.

Really that whole mmu_model thing is a mess.  A mix of flags and an
enum, for something that should probably be class callbacks in most
cases.  But your patches certainly improve things.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FwyhczKCDPOVeYh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/RlNYACgkQbDjKyiDZ
s5JE6Q/7Bgv46tSdkdpmTGqxQJ+4LIgvT3J3zomrm0fAhJB5fT9Um/PepZLrb/0W
7/U/ZSbSEvjaMCANM0dWHH/CxPI/cQDsT0p5DWhlEv8jfLHPrTK4eVUGKrcXbTXK
KLu4MSbetH7yhzZMmJV5+HiqbXnjDyV89qKwsqLGLi9rg14h4eQ3QnM6Lp28FqTD
bofcV2qp1qSkX2yYfQldpGN2vQXDfsF2EHPTy3ka+rfoYqWKm5uQVQ7vjHJ0wmsg
+Fxra3Kcyg4gsc42oKyZZdo3VqB2m4sdIw/tR1iBNxSvfZ9+O6G3U2TJyFZA59gT
IxYCUi7YLyFtK/YQYcJ08Jw7por17+Jxxn3VEEJ4g1PmbIj+wmEnAwLfOto5Zehy
pLKzgFgOIllyHVG4ZeGNpvNJiYGCGrMogKtzux5et7xQhkdOxX8OhssXkRRkLNtL
lJlW1KS0WaLkd7nZtChcjzrMXx1IRi1GFIrr2iBP2tGy5dfMJpg11ZdljNH1wF+i
9bDZIXAit3zfBGhBh/k4jUdUVI/MwORyBEU/sAwGkcIClwdfwX4AzW44buJIeaVp
tNUDrBGizargrZ6RRan2zTBh4CETiK+UvlX+gGm54JKk33YZ75lafS26T69ySV7P
9hM4stwcxee6S4vaLlw4GXHHBq7SrXS2E61nd5QSPNyUUkSbrp0=
=Ik6k
-----END PGP SIGNATURE-----

--FwyhczKCDPOVeYh6--

