Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1353260887
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 04:16:22 +0200 (CEST)
Received: from localhost ([::1]:34462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFTBF-0005mH-Cj
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 22:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFTAS-0005HT-SY; Mon, 07 Sep 2020 22:15:32 -0400
Received: from ozlabs.org ([203.11.71.1]:34703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFTAQ-0000NY-Gu; Mon, 07 Sep 2020 22:15:32 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Blpdm3fcRz9sTM; Tue,  8 Sep 2020 12:15:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599531324;
 bh=TxcNh61nTe3fY4NNmUg2LUNWuD9E76/h89dieXCwae4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NBVYv5ZZ0Zl48J7DfzUBVrZKu7Lz9Cw8OLJNvL+Qbz/TcYQskXd7AxGADdiZPmNOl
 krQ6yNHaofopbeSCnsybS1kQjji7DpW9TIuXvyHOlqmUadPlHz71L+O9GD4dzLgaWW
 qV5CN7iWh9NohtJdb9W6MDV7/tBjKWkB/B47+dEQ=
Date: Tue, 8 Sep 2020 11:52:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v6 0/3] pseries NUMA distance rework
Message-ID: <20200908015237.GM341806@yekko.fritz.box>
References: <20200904172422.617460-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="M2Pxvdb9QxnGd/3e"
Content-Disposition: inline
In-Reply-To: <20200904172422.617460-1-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 22:15:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--M2Pxvdb9QxnGd/3e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2020 at 02:24:19PM -0300, Daniel Henrique Barboza wrote:

> changes from v5, all suggested by Greg:
> - patch 2:
>     * changed g_malloc() to g_new()
>     * removed the unneeded g_assert()
> - all patches: added Greg's R-b

Applied to ppc-for-5.2.

>=20
> v5 link: https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg01978.h=
tml
>=20
> Daniel Henrique Barboza (3):
>   spapr: move h_home_node_associativity to spapr_numa.c
>   spapr_numa: create a vcpu associativity helper
>   spapr_numa: use spapr_numa_get_vcpu_assoc() in home_node hcall
>=20
>  hw/ppc/spapr_hcall.c   |  40 ----------------
>  hw/ppc/spapr_numa.c    | 101 +++++++++++++++++++++++++++++++++++------
>  include/hw/ppc/spapr.h |   7 ++-
>  3 files changed, 94 insertions(+), 54 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--M2Pxvdb9QxnGd/3e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9W4+UACgkQbDjKyiDZ
s5IY/g//emSow/I39tkindCZrH+1oyLsfyj7taBVRhtJ1/YOkH212LT046O9svbG
QadEDz9JpyMXLtEUAxBUQa3PIqI9l9Opqopng3K4IdFauh0WQlZC1ggNTAIXSw8r
JTS8m5mWm5CCAU/N1H4VbesNrtrx8Bqz6buPBWvuVk83uMU0G1dFs4xAt7+G2tKm
l47AtsnQhIMfyxnynZsxdBPE2qKv+yH5YIf0z9UQBK9RDsOrqdkaC1RMd5QWgKvw
B3ojJzTV7Ov+Jpat5I1BwEjmzzpwmJjU0USvQCbAfqCf9cxNG31vriC1X59SJYBj
Cj++sm5PhRHzv0Rv5DPFzbxrpmrB1Sqp9pVh9YnBumO7Sxb36q8DhIIgUj3ULsVh
gUyMzuw3/waXncYkxX1UeqgQIOyaKrpP97Mr7aqIAD2biwgmy/o/wQEJf2QCP+Lw
8AueBXJ4A5sWpcZnENiesPxSvRM0lmxqXqxXDikhRvFD+hSz//GQONmkEL7X2RDq
wR78nJFYV/1WWb/BLKj4W3ezWS9MPS6f7kUWvIMseJE7dF8w3KU2i+iDzikZydWF
ScSuAjEv7PqLQRF0zVrZOJUb3aS6QqQSHm5bRT11Ms6GiWPFST+ef/lduDASOaFU
p7p/AD02I4mMFMxm0TuJuYsAqUB2fVK8b8xQ7Q8z4YyVqH2W71Q=
=xfO2
-----END PGP SIGNATURE-----

--M2Pxvdb9QxnGd/3e--

