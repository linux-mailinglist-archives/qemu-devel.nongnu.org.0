Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B7F3664E9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 07:38:01 +0200 (CEST)
Received: from localhost ([::1]:43960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ5Ym-0002cY-76
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 01:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lZ5X9-0001dp-M3; Wed, 21 Apr 2021 01:36:19 -0400
Received: from ozlabs.org ([203.11.71.1]:42465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lZ5X7-0004QA-Ag; Wed, 21 Apr 2021 01:36:19 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FQ8Rb6Js1z9t1L; Wed, 21 Apr 2021 15:36:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618983371;
 bh=CpGg+N12r2+IO/lPzwdU0+fDVrPodV+cMLaXAmT8SRo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zps/m2+LpWZ001kIwOnyEnZyTlhbbcXbYoravfcYXqkbmKWgzo72qpq351J+aGkVS
 ZZDVbfUX/VSApzaEt5xfbqidzMp8NLQ9zsAeAkqkU8l+ZNlMnZbz2QXsroEX5xWusx
 PntC/OgAjO/NWGOZ1UffMEc5R5zjb98ef5rW4yqo=
Date: Wed, 21 Apr 2021 15:13:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Message-ID: <YH+0gM3jc9Sq+ox9@yekko.fritz.box>
References: <CP2PR80MB4499C22B7C564141EB06812EC7489@CP2PR80MB4499.lamprd80.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7yXeMbtUsg/3/u2e"
Content-Disposition: inline
In-Reply-To: <CP2PR80MB4499C22B7C564141EB06812EC7489@CP2PR80MB4499.lamprd80.prod.outlook.com>
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
Cc: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--7yXeMbtUsg/3/u2e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 20, 2021 at 07:02:36PM +0000, Bruno Piazera Larsen wrote:
> > > What I was doing was to only register the spr once, and use the
> > > accel-specific functions to set the relevant attributes, so spr_common
> > > wouldn't need to where (and if) spr_read_* exists or not.
> > > Would this work?
> > >
> > > Just ignoring the read and write functions means we still need
> > > to compile them, or at least stub them, otherwise we'd get linker
> > > problems.
> >
> > Not if you use a macro which will simply elide the references in the
> > !TCG case.  Actually I think even an inline wrapper will do it, I'm
> > pretty sure the compiler is smart enough to optimize the references
> > out in that case.
>=20
> You are correct! I've just tweaked the code that defines spr_register and
> it should be working now. I'm still working in splitting the SPR functions
> from translate_init, since I think it would make it easier to prepare the
> !TCG case and for adding new architectures in the future, and I found a
> few more problems:

Actually looking at the stuff below, I suspect that separating our
"spr" logic specifically might be a bad idea.  At least some of the
SPRs control pretty fundamental things about how the processor
operates, and I suspect separating it from the main translation logic
may be more trouble than it's worth.

> 1. Global variables being defined in translate.c and used both there and
> in spr functions. The variables in question are: cpu_gpr, cpu_so, cpu_ov,
> cpu_ca, cpu_ov32, cpu_ca32, cpu_xer, cpu_lr and cpu_ctr. The easy way
> out is to have global "getters" and "setters" for those, but I'm not sure
> it's a good solution.

Yeah, that seems really messy, plus those are special variables used
by TCG generated code whose operation I don't really understand.

> 2. Static functions defined in translate.c, used there and TCG-related
> spr functions. They are: gen_load_spr, gen_store_spr, gen_stop_exception,
> gen_inval_exception. The easy solution is adding a prototype to internal.h
> and removing the static, but again, not sure it's a good solution

I think gen_*() functions should stay in translate.c, since they are,
explicitly, about translation ("gen" for "generating code").

> 3. gen_read_xer (currently in spr_common) calls is_isa300, defined in
> include/disas/disas.h, which is a macro that dereferences DisasContext.
> However, the struct is defined in translate.c. This one is pretty easy, I=
 think,
> it's just turning the macro into a function, but since I'm already e-mail=
ing,
> I figured I might as weel ask.
>=20
> Finally, since most read and write functions are static, I added them to
> spr_tcg.c.inc to be included only with TCG, as a quick fix, but I would r=
eally
> prefer some other solution if there is anything better. Any thoughts on t=
his?
>=20
> IIRC, this is the last thing holding me back from an RFC with this motion
> patch
>=20
>=20
> Bruno Piazera Larsen
>=20
> Instituto de Pesquisas ELDORADO<http://clickemailmkt.eldorado.org.br/ls/c=
lick?upn=3DUPoxpeIcHnAcbUZyo7TTaswyiVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuK=
XZ7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1u=
UipuK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI=
1wj0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oDMp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5i=
XWnW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFkjH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IW=
DcVzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDY=
IvqmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2BmF0NnDET6jMLuIqtCcVIch>
>=20
> Departamento Computa=E7=E3o Embarcada
>=20
> Analista de Software Trainee
>=20
> Aviso Legal - Disclaimer<https://www.eldorado.org.br/disclaimer.html>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7yXeMbtUsg/3/u2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB/tH4ACgkQbDjKyiDZ
s5Jhww/+JOQdp/+AdY0goo6XWfvpAf46XXzZ1GN0iYoIiAM+VJGvmF15Q8GAFGql
Pb+CqR/4ZORfDtn7IjfNVUMKRg4zZ73rkvVPOvlu32M1JCWntQuaDB/MMxET0iYv
eBTGdg2JF0vV2DV9m3rleZYxBvIhko9N/hL+mtmFLzuhVekz9QRG8D7b6zcV19FV
zh3WUcRaRwIG6DQ+ey2PetHVL9sVIoQBNHuvhzsYvDTUCBy+pddD0gGDqepwSqoH
p37ls+R76bJKgphqji746Iv4P4M7Jk+KiQrq11xOuzmxXTzv93OddvaQvXQxSUjs
sxVwKuyAzCSEwurhLNbj17D+ZaK7Z0wFJiZd059p7hvxETzu4p4nOufBykn2zXoF
IrDA+b9OAnYoLgiH3t1QdDK3+7wv6Jl13i7SP6SnX/dKdQhIGVt60S/q9NZ6KLn9
Lm+jm+pNWZ9oHkbKepOs7xdIZHuTdWOPm3ryMwqW417esmSyq+ZiG0g68rZGRsqc
eQ0/K7BALJmFDRho8VIkWz/94yLwvIpLhkiddtVSSI8/dpKsNeOrrKTpbndSepwN
VDLoD47o0JggI5jw5NYr41Xl7cgFn4Htn9eIzOvptVj5HEtXWSUVJu9bSbt/8oVT
eprsId/ixdL5t9Kr5fdN7V+sqNFHejGdgCv6g9NNV6NvAL9P2Zk=
=TeW+
-----END PGP SIGNATURE-----

--7yXeMbtUsg/3/u2e--

