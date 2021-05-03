Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B003710FC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 06:39:30 +0200 (CEST)
Received: from localhost ([::1]:55788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldQMj-0004Zc-Gq
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 00:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQJM-0007ZK-Db; Mon, 03 May 2021 00:36:00 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:35409 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQJI-0002BV-92; Mon, 03 May 2021 00:36:00 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FYVXR0T6Tz9sW6; Mon,  3 May 2021 14:35:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620016551;
 bh=i4/G8parSkImY0+u2qhh2nA0CcEFYXWjsu9Fy+g16Lk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lSGehoTZftYhDuiCoA2jU7ModgFL1ONmTPFWPpX9DiO9UvAY+E+IBCrGBtdlQVhfi
 4lMnI0c2mPLdLbjeNDOV7fYtlFx0caWfOFcaDAmX3ztRUle+XFqqNeG4KA5AHAagEB
 dtBIwc3FPPedXbNbs2/hIHkm1gY4yPuLx4E5CX+g=
Date: Mon, 3 May 2021 13:54:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v2 3/7] target/ppc: Isolated SPR read/write callbacks
Message-ID: <YI9z9c6P9HGNfY5i@yekko>
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
 <20210429162130.2412-4-bruno.larsen@eldorado.org.br>
 <YIuFrMWyU/g80qfo@yekko>
 <b863a05d-cb2b-c511-42dd-7f1d028b9968@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="z+7nLXxRIcKUtLc9"
Content-Disposition: inline
In-Reply-To: <b863a05d-cb2b-c511-42dd-7f1d028b9968@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--z+7nLXxRIcKUtLc9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 10:02:16AM -0300, Bruno Piazera Larsen wrote:
> On 30/04/2021 01:21, David Gibson wrote:
> > On Thu, Apr 29, 2021 at 01:21:26PM -0300, Bruno Larsen (billionai) wrot=
e:
> > > Moved all SPR read/write callback, and some related functions, to a
> > > new file specific for it. These callbacks are TCG only, so separating
> > > them is required to support the flag disable-tcg.
> > >=20
> > > Making the spr_noaccess function not static, and moving the define to
> > > internal.h is required, as spr_tcg.c.inc has to be included after
> > > SPR_NOACCESS has been used.
> > >=20
> > > Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> > > ---
> > >   target/ppc/internal.h           |    3 +
> > >   target/ppc/spr_tcg.c.inc        | 1033 ++++++++++++++++++++++++++++=
+++
> > >   target/ppc/translate.c          |   49 +-
> > >   target/ppc/translate_init.c.inc |  981 -----------------------------
> > >   4 files changed, 1039 insertions(+), 1027 deletions(-)
> > >   create mode 100644 target/ppc/spr_tcg.c.inc
> > >=20
> > > diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> > > index 184ba6d6b3..1de15acfbd 100644
> > > --- a/target/ppc/internal.h
> > > +++ b/target/ppc/internal.h
> > > @@ -228,4 +228,7 @@ void destroy_ppc_opcodes(PowerPCCPU *cpu);
> > >   void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
> > >   gchar *ppc_gdb_arch_name(CPUState *cs);
> > > +void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
> > > +#define SPR_NOACCESS (&spr_noaccess)
> > > +
> > >   #endif /* PPC_INTERNAL_H */
> > > diff --git a/target/ppc/spr_tcg.c.inc b/target/ppc/spr_tcg.c.inc
> > > new file mode 100644
> > > index 0000000000..48274dd52b
> > > --- /dev/null
> > > +++ b/target/ppc/spr_tcg.c.inc
> > I'm confused.  You create the new file as a .inc.c, but I don't see
> > anything #including the new file.
> <snip>
> > > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > > index b319d409c6..a6e677fa6d 100644
> > > --- a/target/ppc/translate.c
> > > +++ b/target/ppc/translate.c
> > > @@ -36,6 +36,7 @@
> > >   #include "exec/translator.h"
> > >   #include "exec/log.h"
> > >   #include "qemu/atomic128.h"
> > > +#include "internal.h"
> > >   #define CPU_SINGLE_STEP 0x1
> > > @@ -4175,43 +4176,6 @@ static void gen_tdi(DisasContext *ctx)
> > >   /***                          Processor control                    =
        ***/
> > > -static void gen_read_xer(DisasContext *ctx, TCGv dst)
> > > -{
> > > -    TCGv t0 =3D tcg_temp_new();
> > > -    TCGv t1 =3D tcg_temp_new();
> > > -    TCGv t2 =3D tcg_temp_new();
> > > -    tcg_gen_mov_tl(dst, cpu_xer);
> > > -    tcg_gen_shli_tl(t0, cpu_so, XER_SO);
> > > -    tcg_gen_shli_tl(t1, cpu_ov, XER_OV);
> > > -    tcg_gen_shli_tl(t2, cpu_ca, XER_CA);
> > > -    tcg_gen_or_tl(t0, t0, t1);
> > > -    tcg_gen_or_tl(dst, dst, t2);
> > > -    tcg_gen_or_tl(dst, dst, t0);
> > > -    if (is_isa300(ctx)) {
> > > -        tcg_gen_shli_tl(t0, cpu_ov32, XER_OV32);
> > > -        tcg_gen_or_tl(dst, dst, t0);
> > > -        tcg_gen_shli_tl(t0, cpu_ca32, XER_CA32);
> > > -        tcg_gen_or_tl(dst, dst, t0);
> > > -    }
> > > -    tcg_temp_free(t0);
> > > -    tcg_temp_free(t1);
> > > -    tcg_temp_free(t2);
> > > -}
> > > -
> > > -static void gen_write_xer(TCGv src)
> > > -{
> > > -    /* Write all flags, while reading back check for isa300 */
> > > -    tcg_gen_andi_tl(cpu_xer, src,
> > > -                    ~((1u << XER_SO) |
> > > -                      (1u << XER_OV) | (1u << XER_OV32) |
> > > -                      (1u << XER_CA) | (1u << XER_CA32)));
> > > -    tcg_gen_extract_tl(cpu_ov32, src, XER_OV32, 1);
> > > -    tcg_gen_extract_tl(cpu_ca32, src, XER_CA32, 1);
> > > -    tcg_gen_extract_tl(cpu_so, src, XER_SO, 1);
> > > -    tcg_gen_extract_tl(cpu_ov, src, XER_OV, 1);
> > > -    tcg_gen_extract_tl(cpu_ca, src, XER_CA, 1);
> > > -}
> > > -
> > >   /* mcrxr */
> > >   static void gen_mcrxr(DisasContext *ctx)
> > >   {
> > > @@ -4299,15 +4263,6 @@ static void gen_mfmsr(DisasContext *ctx)
> > >       tcg_gen_mov_tl(cpu_gpr[rD(ctx->opcode)], cpu_msr);
> > >   }
> > > -static void spr_noaccess(DisasContext *ctx, int gprn, int sprn)
> > > -{
> > > -#if 0
> > > -    sprn =3D ((sprn >> 5) & 0x1F) | ((sprn & 0x1F) << 5);
> > > -    printf("ERROR: try to access SPR %d !\n", sprn);
> > > -#endif
> > > -}
> > > -#define SPR_NOACCESS (&spr_noaccess)
> > > -
> > >   /* mfspr */
> > >   static inline void gen_op_mfspr(DisasContext *ctx)
> > >   {
> > > @@ -7639,6 +7594,7 @@ GEN_HANDLER2_E(trechkpt, "trechkpt", 0x1F, 0x0E=
, 0x1F, 0x03FFF800, \
> > >   };
> > >   #include "helper_regs.h"
> > > +#include "spr_tcg.c.inc"
> > >   #include "translate_init.c.inc"
>=20
> You probably just missed it here. Buried a bit in all the code motion,
> unfortunately...

Oops, sorry.  Thought I'd grepped for it.


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--z+7nLXxRIcKUtLc9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCPc/UACgkQbDjKyiDZ
s5JhUQ//Xfv93ycYK/34HbutiPXO2MYPjYQ0t5TUW1SHfTPONvU1GBgfmmxmu1nc
zLBUF4igRSda78Hkq3uzWugpF0US1aSJazMur8owd/PQ8zLneARGAkj/5+Y/0YFS
eFnzREK6UQfoaJm6szfkntqdF15c5IoB5HsW16Nb7Hy5ZJUAg733PdS9aYdfCi+0
s9Jo6zqE/NfjSphj9qoO9GXCebPSgkNvh5IerFPMvbtbElKNDyubcqZz6gZ30ZJF
JykzFHuHdCfySTzbZibx8cPznAC2199wu6FuSgpyYaatLOAd00UAtRT0Ol3HQYUC
2sG+4y7D6wA3j6XEtAQxlmelldUmvE5c7pnzR7sQkRr77uu+bm4YsF8tIPKzSDPX
IGG3/wR84+1radfiDoM80mi4B9zeOAwUyCqHHRDeObTUPOXNIm8Pc6U1MFsBDvJ6
zl+kxjVzqIYVKqWpDMU9lSmpw36A+oq2K688Zm0B3YUGrSeaAAhOjiDZejUs5y5G
7+pj12HGWpJwq6rmwOU2VZ806wxPZdqS+MUHYi/9UIUeVMWTz0CTBnPf3lyd+oFt
EOxL2hOwuMRep1l9jGRL/pQgD7Jt+UsDTa/09Tmd0WjMjYHQsZXe6OCBudwd9y2g
iuNKo7mYWPP68OTT8WkFOEet7EZUxDUlw0DM2Q8N7O/Pk7hIwcg=
=MwMZ
-----END PGP SIGNATURE-----

--z+7nLXxRIcKUtLc9--

