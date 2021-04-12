Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ABB35B9CB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 07:27:47 +0200 (CEST)
Received: from localhost ([::1]:52598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVp6v-0002Op-R7
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 01:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lVp4L-0000q2-Rw; Mon, 12 Apr 2021 01:25:05 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40195 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lVp4J-0000ma-Jn; Mon, 12 Apr 2021 01:25:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FJccj3pQcz9sWk; Mon, 12 Apr 2021 15:24:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618205093;
 bh=fhXj7CrspZAcyo2/vfEYlppdpBZVMQ1gVc8PpGaEMcI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZQurH1MWFfGxfftKqlR1zPb7+43Im68Sy8cXrVGqh2bEulOmX6MMiGKGcTKVHb+B8
 0R4ZkDdg3gFxo9E2qu2gvdlcQgM5oXLmMh4hfF9H3OM8NCjo5GHPhkffe5fui41Dim
 bLVUiVDJ+r5EJVx7Forpz30zTnqNCxpMAECn/rfM=
Date: Mon, 12 Apr 2021 14:34:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Message-ID: <YHPNwtCDtq7XGP/A@yekko.fritz.box>
References: <20210409151916.97326-1-bruno.larsen@eldorado.org.br>
 <20210409151916.97326-2-bruno.larsen@eldorado.org.br>
 <87h7kf5jdy.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DZvB9rdIsL2HccBK"
Content-Disposition: inline
In-Reply-To: <87h7kf5jdy.fsf@linux.ibm.com>
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
Cc: lucas.araujo@eldorado.org.br, qemu-devel@nongnu.org, lagarcia@br.ibm.com,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, andre.silva@eldorado.org.br,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DZvB9rdIsL2HccBK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 09, 2021 at 04:48:41PM -0300, Fabiano Rosas wrote:
> "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> writes:
>=20
> A general advice for this whole series is: make sure you add in some
> words explaining why you decided to make a particular change. It will be
> much easier to review if we know what were the logical steps leading to
> the change.
>=20
> > This commit does the necessary code motion from translate_init.c.inc
>=20
> For instance, I don't immediately see why these changes are necessary. I
> see that translate_init.c.inc already has some `#ifdef CONFIG_TCG`, so
> why do we need to move a bunch of code into cpu.c instead of just adding
> more code under ifdef CONFIG_TCG? (I'm not saying it's wrong, just trying=
 to
> understand the reasoning).
>=20
> Is translate_init.c.inc intended to be TCG only? But then I see you
> moved TCG-only functions out of it (ppc_fixup_cpu) and left not TCG-only
> functions (gen_spr_generic).
>=20
> > This moves all functions that start with gdb_* into target/ppc/gdbstub.c
> > and creates a new function that calls those and is called by ppc_cpu_re=
alize
>=20
> This looks like it makes sense regardless of disable-tcg, could we have
> it in a standalone patch?
>=20
> > All functions related to realizing the cpu have been moved to cpu.c, wh=
ich
> > may call functions from gdbstub or translate_init
>=20
> Again, I don't disagree with this, but at first sight it doesn't seem
> entirely related to disabling TCG.

Fabioano's points seconded.  This isn't necessarily a bad idea, but a
rationale would really help.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DZvB9rdIsL2HccBK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBzzcIACgkQbDjKyiDZ
s5JMmxAAvEfrjrFywNKwVx1jEZHyGCOFKqTQjCToiOyt52cFe1lWkClGt51xfbim
rgTH3lCDLvMFinKoUPdsMKWlPLFqb4f4JnIh+cGkCnXAG/4cEzxHzdTXHmjdOXTP
YUQlzVhRcRA82sxTzQlgBk/gF7sjelasK0VnkvQzyaoZkjFKYGiJwMliriM9ZAV6
yU/4sGKWXnXFvQoyVeDUk/IxEdxCkVBxkAJbI7EURn/qT1bvBb9IQgnny+v5MSyp
wx4Btwhn0ggXyHS9wWCT8Ab07Ez1yUlFgLfY5Uu0+HZpOvbMIszl6B5R1uBI9y0L
KfPFST/m28xqk499bmCVGNEmC/QI0ymRJwqVHc/tk/6j0xVkfw+PHHuC5hA89lDh
PJrGW23n9QDK0zZHTG9zwqv09O31ELeizy4twhcDUOipGdUZwHi2Wc+70j/1Ykkf
q7CQkQhfCFba7C4mQxOCTfJVPkIIgMJ+sC2qaFLjRvm6E50cJ7hyt/CF9tIMYKcp
corUSzkeUPBZqDw0KcwiX5ZFvipjV9tb5oqrOhCPIE2ytOUaCKFwWu9Wm46UuI+I
0njUGG2qrHW6MGEdD9BEphlOJVTCxv0ZMMggUdlzyAkTrdUMMNjjgzhKsHjnKDeH
2RyMmZ3SIRXA7NwtCJIqbguN7Zv3ygWda2FUG7tJH/AeKK8u0mE=
=NrbG
-----END PGP SIGNATURE-----

--DZvB9rdIsL2HccBK--

