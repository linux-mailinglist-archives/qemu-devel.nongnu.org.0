Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2DE35D936
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 09:45:51 +0200 (CEST)
Received: from localhost ([::1]:42824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWDk6-0003wL-0p
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 03:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lWDhS-0002bD-Rx; Tue, 13 Apr 2021 03:43:06 -0400
Received: from ozlabs.org ([203.11.71.1]:59927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lWDhQ-0007rO-AN; Tue, 13 Apr 2021 03:43:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FKHdX0X1rz9sW1; Tue, 13 Apr 2021 17:42:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618299776;
 bh=dd+xEFEHt+j6D/ffUmszId9ZeF4lWn0KM2NJ6fTMqbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SD4yxPnzKjWxXbwEwrUC8GxkIowpTMc8Oh2F8L9t0fy35Z0xo/UourCZq7W+Qja+V
 8dKtZk7lCVcxzE9IMhfGMShcaO/4Z12qAiPwtpTsCEz4wvoKmSTaxzPgx0V0JJ0Uyh
 RbBs6COAVFTDogOf7Rg5hJwKudP2WNsEBODPfaaQ=
Date: Tue, 13 Apr 2021 16:40:27 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Message-ID: <YHU82/SArAWirXIm@yekko.fritz.box>
References: <CP2PR80MB44994CEF7BA3C917016749B0C7709@CP2PR80MB4499.lamprd80.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4gVkxjpqR7DqjxWc"
Content-Disposition: inline
In-Reply-To: <CP2PR80MB44994CEF7BA3C917016749B0C7709@CP2PR80MB4499.lamprd80.prod.outlook.com>
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
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4gVkxjpqR7DqjxWc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2021 at 12:05:31PM +0000, Bruno Piazera Larsen wrote:
> > A general advice for this whole series is: make sure you add in some
> > words explaining why you decided to make a particular change. It will be
> > much easier to review if we know what were the logical steps leading to
> > the change.
>=20
> Fair point, I should've thought about that.
>=20
> > > This commit does the necessary code motion from translate_init.c.inc
> >
> > For instance, I don't immediately see why these changes are necessary. I
> > see that translate_init.c.inc already has some `#ifdef CONFIG_TCG`, so
> > why do we need to move a bunch of code into cpu.c instead of just adding
> > more code under ifdef CONFIG_TCG? (I'm not saying it's wrong, just tryi=
ng to
> > understand the reasoning).
>=20
> There are 3 main reasons for this decision. The first is kind of silly, b=
ut when I read translate.c my mind jumped to translating machine code to TC=
G, and the amount of TCGv variables at the start reinforced this notion.
> The second was that both s390x and i386 removed it (translate.c) from com=
pilation, so I had no good reason to doubt it.
> The last (and arguably most important) is that translate.c is many thousa=
nds of lines long (translate_init.c.inc alone was almost 11k). The whole po=
int of disabling TCG is to speed up compilation and reduce the final file s=
ize, so I think it makes sense to remove that big file.
> And the final nail in the coffin is that at no point did it cross my mind=
 to keep the init part of translation, but remove the rest
>=20
> Also, I'm not a fan of big ifdefs, because it's kinda hard to follow them=
 when viewing code in vim. Adding that to already having a cpu.c file, wher=
e it makes sense (to me, at least) to add all CPU related functions, just s=
ounded like a good idea.

I think those are all sound reasons; I think not compiling translate.c
for !tcg builds is the right choice.  We might, however, need to
"rescue" certain functions from there by moving them to another file
so they can be used by KVM code as well.

> > Is translate_init.c.inc intended to be TCG only? But then I see you
> > moved TCG-only functions out of it (ppc_fixup_cpu) and left not TCG-only
> > functions (gen_spr_generic).
>=20
> This is me misjudging what is TCG and what is not, mostly. I think that a=
ctually moving everything to cpu.c and adding ifdefs, or creating a cpu_tcg=
=2Ec.inc or similar, would be the most sensible code motion, but every func=
tion I removed from translate gave me 3 new errors, at some point I felt li=
ke I should leave something behind otherwise we're compiling everything fro=
m TCG again, just in different files, so I tried to guess what was TCG and =
what was not (also, I really wanted the RFC out by the weekend, I _may_ hav=
e rushed a few choices).

I'm actually not sure if we'll want translate_init.c for !tcg builds.
It's *primarily* for TCG, but we still need at least some of the cpu
state structure for KVM, and some of that is initialized in
translate_init.

I think it will probably make more sense to leave it in for a first
cut.  Later refinement might end up removing it.

The whole #include translate_init.c.inc thing might make for some
awkward fiddling in this, of course.

> > > This moves all functions that start with gdb_* into target/ppc/gdbstu=
b.c
> > > and creates a new function that calls those and is called by ppc_cpu_=
realize
> >
> > This looks like it makes sense regardless of disable-tcg, could we have
> > it in a standalone patch?
>=20
> Sure, I'll try and get it ready ASAP, and make sure I didn't miss one fun=
ction before sending. Just a noob question... do I edit the patch manually =
to have it only contain the gdb code motion, or is there a way to move back=
 to before I actually made the commit without needing to re-do the changes?
>=20
> Thomas, I'm adding you to this discussion since it sort of answers your m=
essage on the other one, about the functions used even in a KVM-only build.
>=20
> > IIRC you don't only have to exclude translate.c from the build, you also
> > have to separate translate_init.c.inc from it, i.e. turn
> > translate_init.c.inc into a proper .c file and get rid of the #include
> > "translate_init.c.inc" statement in translate.c, since many functions i=
n the
> > translate_init.c.inc file are still needed for the KVM-only builds, too=
=2E So
> > maybe that's a good place to start as a first mini series.
>=20
> Now that I know that translate doesn't mean "translating to TCG", this id=
ea makes more sense. My question is, is it a better option than the code mo=
tion I'm suggesting? From my quick check on the bits that I haven't touched=
 it might, but at this point it's clear I'm very lost with what makes sense=
 hahaha.
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

--4gVkxjpqR7DqjxWc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB1PNkACgkQbDjKyiDZ
s5I9ZA/9EZyAgnuJ5Yx1M4wtYouX9TtKu6m5crnW1lSBWPzgaCqxtAdHokv8AsDU
O7A2YEAIikKPLPweU1N2KdQ2pj9avBaNvSJOTA+aGi5Kq9tlKhI/PS8vz30eBzhw
ZAmmAAhSx1GZnRbFiMKVqvYPUHFi37clDyTyXoOCLgvu4s5kyWVOMnEjz3GdKjTu
C2w/9hWhcMpiUdUX0q43QK9qKU/xYLh65MJAw7IhVdOzMtP096/IFR93ay79BH5N
ZJw0lNEr8PyXiMVQPdMktBl5zs4M4zUT0CKGFZSRoKuSMGSXx5TMu009JxIxKzUw
m0ec6K2lpz/GaaPhfoKgf0N1paompNuTw/31bvjHRB0Qovs3skcZX7TKTiDdwfQe
padIbDBbNVR/R+QWc4JtPBUvhARaOb+G7teKTjnMLpwece0OShMPm5DkMndhAABJ
p7v7j0zLyO/8y3B2NIQNFeRx1w1Z3ZneewkrC+XpkEejHHCdXXdZc2qxVxNDLVo5
rMgC0zEmq+o0575rf9pE0yrFpKg3H8U5t/1jew6ObzRQf+e7uFfknBJ+10mu7Nn+
umPAc6haqNR2a0KbtreavUm2CKvfZTjEiu/pQrHOxdWxPGmahfeeWvigIFIUlI+W
Frm+qPyR+KfpPR6ak3gYqud7FntvCwZfcvStyPGpiRHBzDcKoOQ=
=85/K
-----END PGP SIGNATURE-----

--4gVkxjpqR7DqjxWc--

