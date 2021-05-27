Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CE439287A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:25:10 +0200 (CEST)
Received: from localhost ([::1]:39638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAOD-0007Dc-Hr
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmAC5-00073J-HX; Thu, 27 May 2021 03:12:37 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54631 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmAC1-0004jM-Ej; Thu, 27 May 2021 03:12:37 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FrJsx29GTz9sWT; Thu, 27 May 2021 17:12:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622099541;
 bh=LTI0sDZfSY2X6DuZI6AlCxt46uyCBA7ltSXNtXgCmPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C7ybuFlj0LqSQXJ0v8HAXHvih01kVreT1OYVHwDy50x681aDTQsyVO0Doco2UbWcO
 x2AUG8oNsJk32X/f9L2wnJxZxmrUTsHkrSGCBOI2udOPUpg59Dae/rzhWrgY9LJoyh
 w7k0LJU6bYlLIj3XVfzrIxiDd4+UMMoZ59TYJdZ4=
Date: Thu, 27 May 2021 14:37:26 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 3/5] target/ppc: removed mentions to DO_PPC_STATISTICS
Message-ID: <YK8iBlcGHrpKJxfm@yekko>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-4-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qz4ngLlJ1P9JcEo6"
Content-Disposition: inline
In-Reply-To: <20210526202104.127910-4-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qz4ngLlJ1P9JcEo6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 05:21:02PM -0300, Bruno Larsen (billionai) wrote:
> Removed the commented out definition and all ifdefs relating to
> PPC_DUMP_STATISTICS, as it's hardly ever used.
>=20
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai)
> <bruno.larsen@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index fc9fd790ca..0525e1939f 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -47,7 +47,6 @@
> =20
>  /* Include definitions for instructions classes and implementations flag=
s */
>  /* #define PPC_DEBUG_DISAS */
> -/* #define DO_PPC_STATISTICS */
> =20
>  #ifdef PPC_DEBUG_DISAS
>  #  define LOG_DISAS(...) qemu_log_mask(CPU_LOG_TB_IN_ASM, ## __VA_ARGS__)
> @@ -217,12 +216,9 @@ struct opc_handler_t {
>      uint64_t type2;
>      /* handler */
>      void (*handler)(DisasContext *ctx);
> -#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
> +#if defined(PPC_DUMP_CPU)
>      const char *oname;
>  #endif
> -#if defined(DO_PPC_STATISTICS)
> -    uint64_t count;
> -#endif
>  };
> =20
>  /* SPR load/store helpers */
> @@ -8546,7 +8542,7 @@ static int register_direct_insn(opc_handler_t **ppc=
_opcodes,
>      if (insert_in_table(ppc_opcodes, idx, handler) < 0) {
>          printf("*** ERROR: opcode %02x already assigned in main "
>                 "opcode table\n", idx);
> -#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
> +#if defined(PPC_DUMP_CPU)
>          printf("           Registered handler '%s' - new handler '%s'\n",
>                 ppc_opcodes[idx]->oname, handler->oname);
>  #endif
> @@ -8570,7 +8566,7 @@ static int register_ind_in_table(opc_handler_t **ta=
ble,
>          if (!is_indirect_opcode(table[idx1])) {
>              printf("*** ERROR: idx %02x already assigned to a direct "
>                     "opcode\n", idx1);
> -#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
> +#if defined(PPC_DUMP_CPU)
>              printf("           Registered handler '%s' - new handler '%s=
'\n",
>                     ind_table(table[idx1])[idx2]->oname, handler->oname);
>  #endif
> @@ -8581,7 +8577,7 @@ static int register_ind_in_table(opc_handler_t **ta=
ble,
>          insert_in_table(ind_table(table[idx1]), idx2, handler) < 0) {
>          printf("*** ERROR: opcode %02x already assigned in "
>                 "opcode table %02x\n", idx2, idx1);
> -#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
> +#if defined(PPC_DUMP_CPU)
>          printf("           Registered handler '%s' - new handler '%s'\n",
>                 ind_table(table[idx1])[idx2]->oname, handler->oname);
>  #endif
> @@ -9036,10 +9032,6 @@ static void ppc_tr_translate_insn(DisasContextBase=
 *dcbase, CPUState *cs)
>          gen_invalid(ctx);
>      }
> =20
> -#if defined(DO_PPC_STATISTICS)
> -    handler->count++;
> -#endif
> -
>      translator_loop_temp_check(&ctx->base);
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qz4ngLlJ1P9JcEo6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCvIgYACgkQbDjKyiDZ
s5JYrhAArv7zUE7HG5VOhlHJZqMMO1YbgDeER/vgBKuGCxfvm84fIfNcMcfmI7sc
dPMgPhhvKycrJrLTkmYXwTKymIfUipXeALqDqiNEw6Y7uCMVBr9/7J6wnrylmqCf
Xl91x6p/K94mjTrzwkRrTorveGUTinMlQCTwFpozf3sT9RLgEa+7xR+afx2LvpAE
dWqVqY9xCm+qezYQmux22pe8irooGFQPuR9tNLc6GX1T5mXfsMHyAHrxUGCQjjgo
S7lwxsY7Wr8pHRc4eJ8yTZM5ZE0doHxZE7tJtBMOJ5cu+O97oBoGIHg6wgdbrMkC
4rQiPe3tRHtRUUi645jMCJtVN1aVDVbdAN47nQ01+EDe3MpUsj5Q+B+B5RCmF4F4
1VtXeYiXKRN1ZzuIa5vxT6M8CDEFoAVhd8e28tWUEWgDSnhglGr/bs2A46eFRwpY
FQmERFh8RP+kFk7Q6BcoRO++/NfeJibF8kn+IRFu7iNGnGEtctbT3m7XLNjG6FNR
b9Uy/ZlqLuHb+1j7aDWzavbn86XS5kAU1XjyGmb1OaC37GZVdEj05IDMd/Je5oic
kOtZ5fuIbeuDqh7JlAkpXduvBD/j7uCSamHlNoOLb0I8+yznvnlf9AGifIkQ+2Z9
fPJT8f43nidjWZTxMB7eXUD346lPj0gaXpEDGcas0dg3I4RmIBw=
=T4Za
-----END PGP SIGNATURE-----

--qz4ngLlJ1P9JcEo6--

