Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EFA363B06
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 07:30:23 +0200 (CEST)
Received: from localhost ([::1]:34556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYMUI-0000KF-Dv
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 01:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYMSY-0007OV-9l; Mon, 19 Apr 2021 01:28:34 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:46673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYMSV-0008GA-4A; Mon, 19 Apr 2021 01:28:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNwMX1mmtz9vFP; Mon, 19 Apr 2021 15:28:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618810104;
 bh=1P04yjOubmpGPT2eARKDCF1Wi1iQCd2jfGHT19JlVYw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bUfcv+ct+Hw79j4XuvYiaDXCAt0ipcLFZ5XqjJTD68AidqPdR7AclE2uYHAhL3zEp
 1/mZRhJIIwlIN0wsqTXaby315Pf2p5SF8JvIB/9Lo2LSraUnnUJsWS5/d+U5sAGhX/
 E8f8ujSqUXsqQbITdNFyietoE92jWENW219VZrlo=
Date: Mon, 19 Apr 2021 15:21:19 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Message-ID: <YH0TT/muW78nWUWV@yekko.fritz.box>
References: <CP2PR80MB449996D26DEA4C27397EEF14C74F9@CP2PR80MB4499.lamprd80.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dou3HPF09FBMHZn1"
Content-Disposition: inline
In-Reply-To: <CP2PR80MB449996D26DEA4C27397EEF14C74F9@CP2PR80MB4499.lamprd80.prod.outlook.com>
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


--dou3HPF09FBMHZn1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 05:43:02PM +0000, Bruno Piazera Larsen wrote:
> > I'm actually not sure if we'll want translate_init.c for !tcg builds.
> > It's *primarily* for TCG, but we still need at least some of the cpu
> > state structure for KVM, and some of that is initialized in
> > translate_init.
> >
> > I think it will probably make more sense to leave it in for a first
> > cut.  Later refinement might end up removing it.
> >
> > The whole #include translate_init.c.inc thing might make for some
> > awkward fiddling in this, of course.
>=20
> I just checked, there is going to be some shuffling of functions
> around, as there are some static variables defined on translate.c,
> and used in translate_init.c.inc, some functions needed for KVM
> on translate.c and some TCG only functions in the
> translate_init.c.inc.
>=20
> The trivial path is to:
> * rename translate_init.c.inc to cpu_init.c (since it has to do with
> initial definitions for CPUs, and it's not related to translating
> anymore);
> * move gen_write_xer and gen_read_xer into cpu_init.c, as they're
> used for some sprs, and whatever needs to be moved with it

Hmm.. that doesn't seem right.  gen_*() functions are explicitly for
generating code, so it really seems like they belong in the
translation file.

> * move is_indirect_opcode and ind_table to translate.c, since they
> are used to translate ppc instructions, and the things defined for
> these functions
> * Figure out what needs to be added to the includes for both
> files to compile
> * move opcodes and invalid_handler into cpu_init.c, because they
> are only used by stuff in this file.
>=20
> I'm just not sure about this last point. The stuff that use opcodes
> create the callback tables for TCG, AFAICT. The better plan would
> be to move all of that to tanslate.c, but might be a lot.
>=20
> Can I follow the trivial plan for the first cut and leave a TODO in
> the code for a better solution in the future? Or is there a nuance
> about one of those functions that I have not understood?
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
>=20
> ________________________________
> De: David Gibson
> Enviadas: Ter=E7a-feira, 13 de Abril de 2021 03:40
> Para: Bruno Piazera Larsen
> Cc: Fabiano Rosas; Thomas Huth; qemu-devel@nongnu.org; Luis Fernando Fuji=
ta Pires; Andre Fernando da Silva; Lucas Mateus Martins Araujo e Castro; Fe=
rnando Eckhardt Valle; qemu-ppc@nongnu.org; lagarcia@br.ibm.com; Matheus Ko=
walczuk Ferst
> Assunto: Re: [PATCH 1/4] target/ppc: Code motion required to build disabl=
ing tcg
>=20
> On Mon, Apr 12, 2021 at 12:05:31PM +0000, Bruno Piazera Larsen wrote:
> > > A general advice for this whole series is: make sure you add in some
> > > words explaining why you decided to make a particular change. It will=
 be
> > > much easier to review if we know what were the logical steps leading =
to
> > > the change.
> >
> > Fair point, I should've thought about that.
> >
> > > > This commit does the necessary code motion from translate_init.c.inc
> > >
> > > For instance, I don't immediately see why these changes are necessary=
=2E I
> > > see that translate_init.c.inc already has some `#ifdef CONFIG_TCG`, so
> > > why do we need to move a bunch of code into cpu.c instead of just add=
ing
> > > more code under ifdef CONFIG_TCG? (I'm not saying it's wrong, just tr=
ying to
> > > understand the reasoning).
> >
> > There are 3 main reasons for this decision. The first is kind of silly,=
 but when I read translate.c my mind jumped to translating machine code to =
TCG, and the amount of TCGv variables at the start reinforced this notion.
> > The second was that both s390x and i386 removed it (translate.c) from c=
ompilation, so I had no good reason to doubt it.
> > The last (and arguably most important) is that translate.c is many thou=
sands of lines long (translate_init.c.inc alone was almost 11k). The whole =
point of disabling TCG is to speed up compilation and reduce the final file=
 size, so I think it makes sense to remove that big file.
> > And the final nail in the coffin is that at no point did it cross my mi=
nd to keep the init part of translation, but remove the rest
> >
> > Also, I'm not a fan of big ifdefs, because it's kinda hard to follow th=
em when viewing code in vim. Adding that to already having a cpu.c file, wh=
ere it makes sense (to me, at least) to add all CPU related functions, just=
 sounded like a good idea.
>=20
> I think those are all sound reasons; I think not compiling translate.c
> for !tcg builds is the right choice.  We might, however, need to
> "rescue" certain functions from there by moving them to another file
> so they can be used by KVM code as well.
>=20
> > > Is translate_init.c.inc intended to be TCG only? But then I see you
> > > moved TCG-only functions out of it (ppc_fixup_cpu) and left not TCG-o=
nly
> > > functions (gen_spr_generic).
> >
> > This is me misjudging what is TCG and what is not, mostly. I think that=
 actually moving everything to cpu.c and adding ifdefs, or creating a cpu_t=
cg.c.inc or similar, would be the most sensible code motion, but every func=
tion I removed from translate gave me 3 new errors, at some point I felt li=
ke I should leave something behind otherwise we're compiling everything fro=
m TCG again, just in different files, so I tried to guess what was TCG and =
what was not (also, I really wanted the RFC out by the weekend, I _may_ hav=
e rushed a few choices).
>=20
>=20
> > > > This moves all functions that start with gdb_* into target/ppc/gdbs=
tub.c
> > > > and creates a new function that calls those and is called by ppc_cp=
u_realize
> > >
> > > This looks like it makes sense regardless of disable-tcg, could we ha=
ve
> > > it in a standalone patch?
> >
> > Sure, I'll try and get it ready ASAP, and make sure I didn't miss one f=
unction before sending. Just a noob question... do I edit the patch manuall=
y to have it only contain the gdb code motion, or is there a way to move ba=
ck to before I actually made the commit without needing to re-do the change=
s?
> >
> > Thomas, I'm adding you to this discussion since it sort of answers your=
 message on the other one, about the functions used even in a KVM-only buil=
d.
> >
> > > IIRC you don't only have to exclude translate.c from the build, you a=
lso
> > > have to separate translate_init.c.inc from it, i.e. turn
> > > translate_init.c.inc into a proper .c file and get rid of the #include
> > > "translate_init.c.inc" statement in translate.c, since many functions=
 in the
> > > translate_init.c.inc file are still needed for the KVM-only builds, t=
oo. So
> > > maybe that's a good place to start as a first mini series.
> >
> > Now that I know that translate doesn't mean "translating to TCG", this =
idea makes more sense. My question is, is it a better option than the code =
motion I'm suggesting? From my quick check on the bits that I haven't touch=
ed it might, but at this point it's clear I'm very lost with what makes sen=
se hahaha.
> >
> >
> > Bruno Piazera Larsen
> >
> > Instituto de Pesquisas ELDORADO<http://clickemailmkt.eldorado.org.br/ls=
/click?upn=3DUPoxpeIcHnAcbUZyo7TTaswyiVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkK=
uKXZ7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk=
1uUipuK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrK=
OI1wj0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oDMp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n=
5iXWnW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFkjH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4=
IWDcVzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJY=
DYIvqmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2BmF0NnDET6jMLuIqtCcVIch>
> >
> > Departamento Computa=E7=E3o Embarcada
> >
> > Analista de Software Trainee
> >
> > Aviso Legal - Disclaimer<https://www.eldorado.org.br/disclaimer.html>
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dou3HPF09FBMHZn1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB9E08ACgkQbDjKyiDZ
s5Jeyg//d4wteBymbZ+yEV/5w9KWa82qcZXOkUjxzB4OqfS/i8bHhz1HgYcZRV/q
/q04tGwVEF/XiS5Gbf4NUULShzbms4wRZFEHUlwf+z9NMOvAc0XZ+xwFpgxdqzOL
33LQmUeZ1XcMjN9CAm+XaLnZ+FfDm7sbYmdZlI0u3J5rKlA3RkWOtskqSiPyDyoj
IQoRm9zes5Ou0cEY2nGgp2fA/h14x7u2zlFCGphIbHxftOCKD951CifwzzGqgC/8
QfMnwOF4XIu5ochVJICYSjayg49pfwk6tvAPmJzeEBv5dDg3L+ehTS9VM6FiNYmW
mPdJPCojry5ENvTvHsxC/LOjwj/H6WUqqsCGk5dfJEHd0HXYehU8LdT5O4xNKoYO
BqLnehaWxL6i0l5tPW/dnuV1JKupZ/58h9lc4ddO7syeafew/AI2qfvmVcwd3scO
tRYenHWtCu5YuY00TtjCYhGrGbgZFx2UbdfD07udkRqL5dgRxgJ2GIm/LPgF7cnZ
z9KweaMTQ10gk58HBzC4c++tKDC9cfOY1sH9hA1TNqvRoOo5I4KfIF1ws30kXtBg
dbVOMHtHD0a14kZrVfN/B3RoeWg6C4EgOUnTe4ceIT33was6mDLyHbsnt0xYb+Tc
B0CkKnkUBHchoxLWChPhhM73t46i+M2rDKqtTkd+pSSmY96BRn8=
=wlir
-----END PGP SIGNATURE-----

--dou3HPF09FBMHZn1--

