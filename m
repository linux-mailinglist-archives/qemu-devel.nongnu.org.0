Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20806396BC9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 05:17:30 +0200 (CEST)
Received: from localhost ([::1]:36050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnuuH-0000P5-78
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 23:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lnut8-0006ut-9z; Mon, 31 May 2021 23:16:18 -0400
Received: from ozlabs.org ([203.11.71.1]:46237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lnut2-00014G-KG; Mon, 31 May 2021 23:16:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FvHNx36qBz9sSs; Tue,  1 Jun 2021 13:16:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622517361;
 bh=usM57kv9dr//uaApxAu/bH6hxwQW5KR/7AVmwFjwpsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lSnrCud46wxBIAnrDop37EJUuy8AMXn8Z8+auatRGhonEYdmTx26kE73jD7UEZhlL
 qy6CYfHxoqTJfxR/ruUPyDyaq1hUrW6ac9kRnLKIriiApmFaBzIPdcFsW3VrgTWmxC
 kNiqPeq+tLddHGLu58OiogeJWB/sTecPAVh9IAOs=
Date: Tue, 1 Jun 2021 12:47:37 +1000
From: "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Subject: Re: [PATCH v3 4/4] target/ppc: removed all mentions to PPC_DUMP_CPU
Message-ID: <YLWfybO+un4b+PQK@yekko>
References: <20210531145629.21300-1-bruno.larsen@eldorado.org.br>
 <20210531145629.21300-5-bruno.larsen@eldorado.org.br>
 <CP2PR80MB3668B881BB8849805BB576A7DA3F9@CP2PR80MB3668.lamprd80.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yBahZdVT0gnhLCS4"
Content-Disposition: inline
In-Reply-To: <CP2PR80MB3668B881BB8849805BB576A7DA3F9@CP2PR80MB3668.lamprd80.prod.outlook.com>
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
Cc: "farosas@linux.ibm.com" <farosas@linux.ibm.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--yBahZdVT0gnhLCS4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 31, 2021 at 05:46:07PM +0000, Luis Fernando Fujita Pires wrote:
> From: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> > This feature will no longer be useful as ppc moves to using decotree fo=
r TCG.
> > And building with it enabled is no longer possible, due to changes in
> > opc_handler_t. Since the last commit that mentions it happened in 2014,=
 I think
> > it is safe to remove it.
> >=20
> > Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> > ---
> >  target/ppc/cpu_init.c  | 205 -----------------------------------------
> >  target/ppc/internal.h  |   2 -
> >  target/ppc/translate.c | 105 ---------------------
> >  3 files changed, 312 deletions(-)
>=20
> I believe you lost Richard's review for this one. In addition to approvin=
g it, he also noted the a typo in the commit message ("decotree" -> "decode=
tree").

I folded in the typo fix and Richard's R-b for this patch and the
previous one.

> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yBahZdVT0gnhLCS4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC1n8cACgkQbDjKyiDZ
s5IXvQ//fsX8lBQcl3Vzj+MWQQn+cn+yBWryRKosxZAs9SmZkEYpmCK11MX0wsXM
Y1RoguNndACdXHxRw4wIKVr3velHJLijF0+HiDIhIpckQT/x1d3c5cGGTGjhZfGE
qNBpFuwlQgX9HlbmvHDYT4UrUt6RY8f/kmstXMOXK3CiErqwdopcf/QNEaD0DHEV
hq2PrvfIWZqjRWZtCoEPeMs1ahT3Uow5P7mG/7Y9tM+sWCt+WQ446Q2QJZ/ZK8UK
WxLheWAYWp9+LpZZ9Jd1hfV48ScBwPEa+IDUk2/WUGe+857KnCluaMNR64T1Jhlh
WpwoQD2tKave/adxePV4wxKdQg+55Fy4ivTZuxKAWEx/HEAWAwdSmgDbjY9yw2Kb
kZFJBdNOQAKGjjRxG1DuCGrqknGEbhfoM3NohwYXJ6SKEVIMbAQ3S4877FIG8fM5
wjxMPCyMh3nrc3FPRrN+y9iJrIlvUppZFAI6xd+NDhhHwQn+MSxufTAHu0L34iYq
2nHbRGhywKEdVGyxsr6og21nbB8b8DuFlqhtlH5NBPoSA6v5H62mVfuoXizurauc
SBKJcAUTLvwwe+94CNERX4PA5mUIr2jiNUEDAjdsXQbvuF1Pkpzm/jYRbAv+QE/x
TYHd5f813d4WmpTw5MjIun8Q9vyW3ol8P8O8SyAdMMAVLiaX4JE=
=/v8r
-----END PGP SIGNATURE-----

--yBahZdVT0gnhLCS4--

