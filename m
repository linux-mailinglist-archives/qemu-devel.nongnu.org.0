Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B465364FDC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 03:32:26 +0200 (CEST)
Received: from localhost ([::1]:36422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYfFY-0002vq-M8
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 21:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYfDi-00026u-FR; Mon, 19 Apr 2021 21:30:30 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36867 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYfDf-0005sO-OB; Mon, 19 Apr 2021 21:30:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FPR2G0KL7z9vDx; Tue, 20 Apr 2021 11:30:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618882214;
 bh=kXyNe1W1PcFc4O1agQyYeHmvsJ4U7ZuOgIcWazZ1pBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XLb7u+pT+AdlvUICLubW2TY2K7ASQ6JcmgbgTIJuFZMBN5WGkFcsf38nHCCDfK3yJ
 uhzl49aAvaQFiHmtB8n8L/B0cBfKjK/3x7yRxLXYeqrcNTUdAPXl/bnDHZPxh8LFAb
 qKQdDSnh6TY151HBuuhwxcpXyw9r99MmYK3hBrhk=
Date: Tue, 20 Apr 2021 11:20:58 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Message-ID: <YH4setA2kDoCyHBj@yekko.fritz.box>
References: <CP2PR80MB44998EBF7704B13C79081093C7499@CP2PR80MB4499.lamprd80.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lRuDA9+H5UDq8pJI"
Content-Disposition: inline
In-Reply-To: <CP2PR80MB44998EBF7704B13C79081093C7499@CP2PR80MB4499.lamprd80.prod.outlook.com>
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


--lRuDA9+H5UDq8pJI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 02:40:35PM +0000, Bruno Piazera Larsen wrote:
> > > > * move gen_write_xer and gen_read_xer into cpu_init.c, as they're
> > > > used for some sprs, and whatever needs to be moved with it
> > >
> > > I'd leave them where they are currently. Instead what I think we shou=
ld
> > > do is to find a way to not need the uea/oea/hea|read/write callbacks
> > > with KVM.
> > >
> > > Maybe extract a function from _spr_register that sets what is common =
for
> > > both tcg and kvm (num, name, initial_value, AFAICT). Then alter the
> > > gen_spr* functions to first create all registers and then call both
> > > configs to supplement:
> > >
> > > //tcg.c
> > > static void tcg_gen_spr_generic(CPUPPCState *env)
> > > {
> > >     // these only set the callbacks
> > >     spr_register(env, SPR_FOO,
> > >                  SPR_NOACCESS, SPR_NOACCESS,
> > >                  &spr_read_foo, &spr_write_foo);
> > >     spr_register(env, SPR_BAR,
> > >                  SPR_NOACCESS, SPR_NOACCESS,
> > >                  &spr_read_bar, &spr_write_bar);
> > > }
> > >
> > > //kvm.c
> > > static void kvm_gen_spr_generic(CPUPPCState *env)
> > > {
> > >     // these only set one_reg_id
> > >     spr_register_kvm(env, SPR_FOO, KVM_REG_PPC_FOO);
> > >     spr_register_kvm(env, SPR_BAR, KVM_REG_PPC_BAR);
> > > }
> >
> > I really dislike the idea above - it'd be way too easy for KVM and TCG
> > to get out of sync.  Instead make spr_register() itself a macro if
> > necessary, so it just ignores the access functions in the !TCG case.
>=20
> What I was doing was to only register the spr once, and use the
> accel-specific functions to set the relevant attributes, so spr_common
> wouldn't need to where (and if) spr_read_* exists or not.
> Would this work?
>=20
> Just ignoring the read and write functions means we still need
> to compile them, or at least stub them, otherwise we'd get linker
> problems.

Not if you use a macro which will simply elide the references in the
!TCG case.  Actually I think even an inline wrapper will do it, I'm
pretty sure the compiler is smart enough to optimize the references
out in that case.

> And ifdef'ing them out of the calls would be quite a
> pain to understand the code later on.
>=20
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

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lRuDA9+H5UDq8pJI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB+LHgACgkQbDjKyiDZ
s5LahRAA2wHvAuiBuVJxiZP11DMXs0MkjRJwdjmlh/EQ82VuFvynUR+gtD7wobaf
2aXqMoviBTUhGXPLKi8xSG4DxDuYnOv2Kk2xOI40KBFvmFNapVg5/3ckF2Y4Ur1Q
VJOEhmZLa2kWEVTB/vcpF31/CtvZ/KBYbTQML++drvprQcP5uPHECyRdF6JIchaN
Jb78gsq86G6ijcZwVPs1qTZONXatn0cXNNHbebQdL3kdRV2vDy8r7WLDnzJqvTFv
/MQmip+uAM++Hpyh98izThCp4oNZLaCV8PGjgMgRKEKtb4I16mL1ftmMW6IIzkFC
yXrSku6SbjoSE3cEsVI7g92oDkAsm6RXpMiv7e+iQ1aj3BfBjIM7GRFQXgu0GHYP
aIhtc7e4s+AAxevlJpDQwLXR67bp2ghWHqlwZ517i/SfvGzeumjlrWJ+Cz06Q94L
wMubSgR7hbxiRmotyMzuAiZaghXaXdjzoa+wVoLv5s1klPlwrof94nQwbNmNZPNg
LJLUbvdvCWcoK4cNYs1n2Or6fti3iNGWSqD6j9hvu3lbKkmUpjCKoJTVZXHVU6hx
Ys/4bdQVuRoJ9exmGAXDSKNkX4LYqCoHLETcRK1nxgz4HS6QkiyvVCwG7tZ0GaW3
qi90sZSK0JrMLj0vNPapVi2i/l7cFn0VwM7lUg3+CcAPjFkNTQc=
=BrkR
-----END PGP SIGNATURE-----

--lRuDA9+H5UDq8pJI--

