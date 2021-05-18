Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DAF38718F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:01:12 +0200 (CEST)
Received: from localhost ([::1]:38508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisn0-0004aF-TU
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lisLG-0000nN-1P; Tue, 18 May 2021 01:32:30 -0400
Received: from ozlabs.org ([203.11.71.1]:43513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lisLD-0007Kz-6v; Tue, 18 May 2021 01:32:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkl4X5dS0z9sWP; Tue, 18 May 2021 15:32:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621315932;
 bh=+KgMXavug8vBNe+WdMx1RD+0V8OY1BDxH9EGKWSpRos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cWN/qUgCiYsKiVuJzA1D7FkwYcfMuTX+P2dWK6BdU06kI2fYVw53Lr31y0cSaKiUc
 QwDyamOao0QpHv5r8yHtuKLnttO9JG8r+4KEM7qzvjEGGRTR1EtaYViYMzQZuiWybJ
 cMFleC9+WI76AEw6JkBkC2QnjOarOwDKJn0pwoUU=
Date: Tue, 18 May 2021 13:58:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 00/23] Base for adding PowerPC 64-bit instructions
Message-ID: <YKM7bOv8UHzfoHfW@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PWFqSj/2WHrsXP69"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PWFqSj/2WHrsXP69
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:02PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> This series provides the basic infrastructure for adding the new 32/64-bit
> instructions in Power ISA 3.1 to target/ppc.

Well, I had applied them all, but I've now pulled patch 10 and onwards
out again, because it broke compile (there is no variable 'pc' in the
place that you use it).

Please make sure you do an (all targets) compile check at the *very
minimum* before posting in future.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PWFqSj/2WHrsXP69
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjO2oACgkQbDjKyiDZ
s5JSuxAA4Bn/Nd2+gijgKFnwC9F6pxt63ESEeHSqkLBAXHuHYS1k33Tvzo36jySZ
Fy83Vo260NCetotnByMF8ms3nyyGI1ymkODxvayTcR7D0lYgYS5O2nbd/eBWRl23
qhHcHBNCbR6Hi7bA69NX5eJwJ12s2mDuPZcDkqr/n+1LdR9qXQKbbmVldCVafe2u
+ZPzF4uOukKl9ZOVV2bhqbodlGOQLz9M+uCWpxLfsmMma7Dmolu98TT/MJ+h6NMd
hh0bvoQZlZLFDnCKS7AnAyTcLfwBUKceuHahXexxE3VxSK1+9jImqpXqqNKyg6P2
LcxiJ1pM/xq8qDRE+nLamoZxAbY+yLVjKZeh1HIHDasDUdtc5sdAKL5cOBcgEHcI
bD7O31rO4wegJrAjOkuKNbVlv/KtAXTS9KSrmV/JUOjiqojktuvG5boXNcGnk2Px
XjzHDr+IPFBPZFcNC1wYGc/a5fN29zvNwf8BdtL6W3S9fmUski/S0f+li6rdhaeP
xbghosYWDaEq0UWbMMruqB0Uj+qTasu8B1baY37BN76CEVPurpHfSyvwSatPCIdV
IgA9xyVhdy8yUFFprgdeQPIijqTUJ87cBpCfw49RFwhtIqM53iFqPqRdl0oLkCqQ
XJKOG+QYe1yg9+qf9fY+v9Q06xIqoZ5vwO+kzGPrlL01bQxVFno=
=TFGl
-----END PGP SIGNATURE-----

--PWFqSj/2WHrsXP69--

