Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2422CE485
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 01:39:08 +0100 (CET)
Received: from localhost ([::1]:58826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkz7q-0007WO-Lv
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 19:39:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kkz6W-0006yU-Ss; Thu, 03 Dec 2020 19:37:45 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45615 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kkz6T-00035V-No; Thu, 03 Dec 2020 19:37:44 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CnDLm3dfYz9sT5; Fri,  4 Dec 2020 11:37:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607042256;
 bh=smcrF2S9Yse2HpLNr1Yaku6BeaOgRisMTdcjJeFVXWY=;
 h=Date:From:To:Cc:Subject:From;
 b=pcR+akyotNe7wlrQCjnVruEGWMtc8HLmK3pYHZ5r4u3wihtXtNTn7R/odjNyN5SDl
 DwFEO2whjBnzDZHh7UkHvKdPlxSHS3dIPyxRAIVqlMahThnbHvcaOc7IoGlOoJlRo4
 ji8ppzkLbAtyBNZbiAEpOvTWkdaTjokv4Sm5YSno=
Date: Fri, 4 Dec 2020 11:36:01 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org
Subject: ANNOUNCEMENT: New co-maintainer and tree move for qemu ppc target
Message-ID: <20201204003601.GA268585@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline
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
Cc: qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi folks,

Here are a couple of procedural announcements about the qemu ppc
target.

First, I'm pleased to introduce Greg Kurz as co-maintainer, he's been
a contributor and common reviewed for the ppc target code in qemu for
some time.  With him as co-maintainer we should have a bit more
redundancy to handle things like urgent bugs while I'm away.  A patch
adding him to the MAINTAINERS file is in my ppc-for-6.0 tree, so will
be merged into mainline soon after qemu-5.2 releases.

Second, I'm moving the main location of my ppc-for-XX branch from
github[0] to gitlab[1].  This is mostly for my convenience, making it
easier to access the gitlab CI facilities which are already used in
mainline.  I might be updating the existing github tree from time to
time, but don't count on it.

[0] https://github.com/dgibson/qemu.git
[1] https://gitlab.com/dgibson/qemu.git

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/JhG8ACgkQbDjKyiDZ
s5LNyBAA5ib1T5vuM6u3gEygF0bkkyweTPmWLE255YCBGJ1jQRtZpgo6efPyLTSh
G3b/cZyRMEuNSsvqS9U1qZ0bF67QBc1Rq/hy3HNWxlCczcifodxs4s3R4VCHLXXD
SkacrfF9rTJY8zd5s+ngcmRPbJumUXvMlybNhrY9p9gSDT8MLSQjqRjzH98MV3Ph
hfUM0dsldRKsW5qVeJR36D70/zIhrAhGoQ/SHhuSGlgVfHo3XS98DA9D4Dsbo/Op
jNoRUtCZGwIKhFwL6AcwwByw+X54FFD//j111kndqmJlvtEA82XH5L0/La6gV/Wb
alg1mH9EzPLdx1GW/cb4m1jXCsyautm8CBZTQ36AbiY8T1C6SBxVYJ5EYsfcyyuL
Qj7onVGSJ6VRQQZADLKPJskbE3Wy7FD7ZKBoYAM4me1hevsVxGZZI2MNYUYwtrR6
Bhpo1eDp8OxoLzt/rrn+iBeBGfw784Etve31aWjooxPvctv5c908cL7moci6Rw7V
Xddv9BsLvg/54UAxfidenv7J8WBeah/z43hWtBz8vzKUAet1b7EjLiiqlyvIvjO6
mPG9hF34oWHdmpvbxxOsZZs8nl3rITaYr7ArP2av+523Ac6U33E+M6L8Y6wYvErp
uINliQjbreik8LncDOSulyLvyOv8RvglO6rZAEkMj9LXWXB7YOE=
=qTM+
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--

