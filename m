Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A62363B04
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 07:30:18 +0200 (CEST)
Received: from localhost ([::1]:34494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYMUD-0000IQ-QB
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 01:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYMSX-0007NM-5i; Mon, 19 Apr 2021 01:28:33 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34653 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYMSV-0008G8-4D; Mon, 19 Apr 2021 01:28:32 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNwMX31Fbz9vFF; Mon, 19 Apr 2021 15:28:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618810104;
 bh=3TNUfWc44uW//2M6D1OfRA73MBszn8C5ZLc+Ok+lwvs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oNTeO9slESjI2908BpnoQz1F2xkLu3dIGGwCMc+Rqvh58w8I9/h9hp6aSBHGCf3zk
 4DcQXGwXZB7OEJS8HFnJNrdrdYoN7I4Lt0VGAm8DKTjJcW3sSqPuTxvTxn+3bnpSS4
 649iRTv2FqtJlFUgL5Wa+UCSGJLeKCoBM5+QkJEI=
Date: Mon, 19 Apr 2021 15:23:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Message-ID: <YH0TxV7NhxXqfBGV@yekko.fritz.box>
References: <CP2PR80MB449996D26DEA4C27397EEF14C74F9@CP2PR80MB4499.lamprd80.prod.outlook.com>
 <87o8eh50ge.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R8UUNt+JGazxVYka"
Content-Disposition: inline
In-Reply-To: <87o8eh50ge.fsf@linux.ibm.com>
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
Cc: Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--R8UUNt+JGazxVYka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 06:38:57PM -0300, Fabiano Rosas wrote:
> Bruno Piazera Larsen <bruno.larsen@eldorado.org.br> writes:
>=20
> >> I'm actually not sure if we'll want translate_init.c for !tcg builds.
> >> It's *primarily* for TCG, but we still need at least some of the cpu
> >> state structure for KVM, and some of that is initialized in
> >> translate_init.
> >>
> >> I think it will probably make more sense to leave it in for a first
> >> cut.  Later refinement might end up removing it.
> >>
> >> The whole #include translate_init.c.inc thing might make for some
> >> awkward fiddling in this, of course.
> >
> > I just checked, there is going to be some shuffling of functions
> > around, as there are some static variables defined on translate.c,
> > and used in translate_init.c.inc, some functions needed for KVM
> > on translate.c and some TCG only functions in the
> > translate_init.c.inc.
> >
> > The trivial path is to:
> > * rename translate_init.c.inc to cpu_init.c (since it has to do with
> > initial definitions for CPUs, and it's not related to translating
> > anymore);
>=20
> Below I'm assuming we have one place for TCG stuff and other for KVM
> stuff, whatever this particular discussion ends up producing.
>=20
> > * move gen_write_xer and gen_read_xer into cpu_init.c, as they're
> > used for some sprs, and whatever needs to be moved with it
>=20
> I'd leave them where they are currently. Instead what I think we should
> do is to find a way to not need the uea/oea/hea|read/write callbacks
> with KVM.
>=20
> Maybe extract a function from _spr_register that sets what is common for
> both tcg and kvm (num, name, initial_value, AFAICT). Then alter the
> gen_spr* functions to first create all registers and then call both
> configs to supplement:
>=20
> //tcg.c
> static void tcg_gen_spr_generic(CPUPPCState *env)
> {
>     // these only set the callbacks       =20
>     spr_register(env, SPR_FOO,
>                  SPR_NOACCESS, SPR_NOACCESS,
>                  &spr_read_foo, &spr_write_foo);
>     spr_register(env, SPR_BAR,
>                  SPR_NOACCESS, SPR_NOACCESS,
>                  &spr_read_bar, &spr_write_bar);
> }
>=20
> //kvm.c
> static void kvm_gen_spr_generic(CPUPPCState *env)
> {
>     // these only set one_reg_id
>     spr_register_kvm(env, SPR_FOO, KVM_REG_PPC_FOO);
>     spr_register_kvm(env, SPR_BAR, KVM_REG_PPC_BAR);
> }

I really dislike the idea above - it'd be way too easy for KVM and TCG
to get out of sync.  Instead make spr_register() itself a macro if
necessary, so it just ignores the access functions in the !TCG case.

> //common.c
> static void gen_spr_generic(CPUPPCState *env)
> {
>     // these only set name, num, initial value
>     spr_register(env, SPR_FOO, "FOO", 0xf00);
>     spr_register(env, SPR_BAR, "BAR", 0xb4d);
>     ...
>=20
>     // have these stubbed if not chosen via config
>     tcg_gen_spr_generic(env);
>     kvm_gen_spr_generic(env);
> }
>=20
> init_ppc_proc()
> {
>         ...
>         gen_spr_generic(env);
>         ...
> }
>=20
> Can anyone see a better way? That would be much easier if we could
> afford to say that TCG and KVM are mutually exclusive for a given build,
> but I don't think they are.
>=20
> > * move is_indirect_opcode and ind_table to translate.c, since they
> > are used to translate ppc instructions, and the things defined for
> > these functions
>=20
> Makes sense. This and the other part below about callback tables would
> be mostly about moving code so it's a candidate for coming soon.
>=20
> > * Figure out what needs to be added to the includes for both
> > files to compile
> > * move opcodes and invalid_handler into cpu_init.c, because they
> > are only used by stuff in this file.
> >
> > I'm just not sure about this last point. The stuff that use opcodes
> > create the callback tables for TCG, AFAICT. The better plan would
> > be to move all of that to tanslate.c, but might be a lot.
>=20
> translate.c seems like a better place indeed.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--R8UUNt+JGazxVYka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB9E8QACgkQbDjKyiDZ
s5IvkxAApT1Gy4iWr7s5i/zcvkk8UtGB+KlTgHuk/ZwHUfffbdx/+0Gvjfc10gC2
78nXn+rPAr/DeBHTLgkbU+4IG0rCp9GcFIEfxyP+bYoDt79JMLZ0xWZPwHG1jnIw
zK+Wg6an1tTLshUtrapsjw4t9J+PMyA5iZ/6JBLx2T8uP7D4VTfJYt2hdl+ctyEh
0dQ8r/M0TLCPGlc1e3xj8Lc3TqX5CD/m3EOTpnOnNLInwLh0kw1AXxi/R/0q4y9v
y+I2k/3zGrE5zIq6opq1vmdEQtVXr2r40+a4/V9VRMRG/CInHPclSmDDHnX/Nji/
8okUiH8tuh5+KmsrJVugYLJVrm6yca2yi8IzCcuJP014YD8TP3PX5pXMd/CHdppV
t04ApBDVbkvPRu3rhUTRUJey3u3MjSUnMef6ToPvU6vJeu4BVAjXG61wOqfUFGCH
bRRbKIzL1H7ZepUNZGXwX4rqqcQNmS3mnh3aRGQUamzVd9onMfkbWdCVYQUiQtXu
Wj+2ToFFYx5WUWRfyaF5iCOL26y3ZcCtbBpt5frW6oMrJ6vu1/oz4++t6D+4J436
jJgGJgPeCubjNJUjG7xuP9dN84Ub/iJ48BICwxIfJImEGIQFziO7CV9GwuRRIfvA
Ew5JKnsCjTB3QfklJx168MHmj9DBmK36lQ7n6l/ti3UZ6kDHJfY=
=dR6N
-----END PGP SIGNATURE-----

--R8UUNt+JGazxVYka--

