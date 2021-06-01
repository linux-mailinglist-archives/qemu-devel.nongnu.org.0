Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE0D396BCB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 05:19:22 +0200 (CEST)
Received: from localhost ([::1]:41054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnuw5-0003jj-H3
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 23:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lnut8-0006us-9A; Mon, 31 May 2021 23:16:18 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:35007 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lnut2-00014h-Ep; Mon, 31 May 2021 23:16:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FvHNx3fjjz9sWF; Tue,  1 Jun 2021 13:16:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622517361;
 bh=IOT3Xb0vAocodSSquVJlvSWZGVs9e+W9d1OSKvHGrJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YxL3wuANBZLZRACv0WFdG5hR8ZHG5Vnnou+BaDyBSvJCaSxJlB57IpXvFQN72tu5g
 eA2hiDnoWIU3EJa3dpxyIthZwCiVuR+Fa+GkBB1BF4IsbjCWaz1B6gmNSNb3X7n3FK
 Fe/0Pva3ZfKUnXwnw3IpT7k8aS8fBe3l5Zu5Ayxc=
Date: Tue, 1 Jun 2021 12:47:50 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v3 0/4] target/ppc: Remove DO_PPC_STATISTICS and
 PPC_DUMP_CPU
Message-ID: <YLWf1ixKG/6rxoiR@yekko>
References: <20210531145629.21300-1-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UKQH8hMr7Wob6vJo"
Content-Disposition: inline
In-Reply-To: <20210531145629.21300-1-bruno.larsen@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UKQH8hMr7Wob6vJo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 31, 2021 at 11:56:25AM -0300, Bruno Larsen (billionai) wrote:
> These 2 defines are being obsoleted as we move to decodetree, so they
> were removed.
>=20
> Also, upon further inspection, qemu already doesn't build with them
> enabled, and probably hasn't for a while, and no one complained, so I
> don't think they were actually being used.
>=20
> Based-on: dgibson's ppc-for-6.1 tree

Applied to ppc-for-6.1, thanks.

>=20
> Changelog for v3:
>  * Re-added patch that removed cpu_dump_statistics from hw/core/cpu
>  * added HMP documentation patch to this series
>=20
> Changelog for v2:
>  * removed patches that were already applied
>  * also removed PPC_DUMP_CPU functinality
>=20
> Bruno Larsen (billionai) (4):
>   hw/core/cpu: removed cpu_dump_statistics function
>   HMP: added info cpustats to removed_features.rst
>   target/ppc: removed GEN_OPCODE decision tree
>   target/ppc: removed all mentions to PPC_DUMP_CPU
>=20
>  docs/system/removed-features.rst |   5 +
>  hw/core/cpu-common.c             |   9 --
>  include/hw/core/cpu.h            |  12 --
>  target/ppc/cpu_init.c            | 205 -------------------------------
>  target/ppc/internal.h            |   2 -
>  target/ppc/translate.c           | 184 ---------------------------
>  6 files changed, 5 insertions(+), 412 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--UKQH8hMr7Wob6vJo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC1n9YACgkQbDjKyiDZ
s5JT6g//Xw4g/XGIRsLgowYr04A5je/WBPe2T1m/IdpdrSVDxkCjRyHo3Y+LujmL
FsUX+fEzmU9sk0T2VntZrpySuNhoPXGZXGULW72hhhhYCKr4n1NrUPq6WKugB4te
tQiotnxs0u7txpMuoAH8L4SOn8qQ/nT8xE3Zvkd93M5PK0B0Tmc9hKd6E40v/YsY
kJ2tk/QJ8Kep8riMGLLcM+ri6fn+j4desF2CHkRS2FPkDgdtoVf6xG1VNBpdGXA3
O2IJviOGmqtIv0XMs8TDv5AwwLw8hVlG2sTsAAeGrH7C611ppKYLcb9/8EhBdZJL
NMSgwTN+Qf3Bp8hEZT035p5UN5G/lkDiWHve6Ost8qC5JBh6GxzFF9ecTWdMLgbP
TG9GLfjn3hKW5s03UZDl/I+/WXjsEgojDUuWIHqhJd5J5ASEDyIZ0iKA90UR0mEJ
lapQ+MYuU//Ip6XtanSrrjElrT9LN5uWb/z0yYSusV5zEqtOkPIK9PxI8IivnRJZ
jQ5Ug7HAJ/iGVjGPIiSEI3XiIsg4TifiVOs2byKlat5dc3ZDJ7wHCiSH9tWuTCpq
PFvOkp44x2LaziLZK0y7u5dZnvKheOeSBYCVhNvWS8lnnw7yUyymusYP8ndHuURX
5LAT4mNut0Y48Q0fxNC62gIGZ7yfOZjaggwMOaIbbPvHetpkYqs=
=2yxe
-----END PGP SIGNATURE-----

--UKQH8hMr7Wob6vJo--

