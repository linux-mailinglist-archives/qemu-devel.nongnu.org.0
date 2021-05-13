Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F03137F247
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:34:27 +0200 (CEST)
Received: from localhost ([::1]:44614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh33K-00013y-83
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sY-0007Hp-Do; Thu, 13 May 2021 00:23:18 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:37751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sT-0004ZE-8K; Thu, 13 May 2021 00:23:15 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdms4mhvz9t0J; Thu, 13 May 2021 14:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879773;
 bh=N0SUHp0RaLEZ0Jrve8kF2eF6QV38MNS9r65aFKmvQBs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mn1g2DeOpZXQ3Y8nJvwjiSdlmNaYuV3gZ35KeXxIQpOEOpu2N7JnkfhYMO5Aeb9Uz
 MlcyqDQ2e8q5GiQgPWEME+q6mknI3T/TH1zkVJXqxXsTzTknlL38gjLITaByYVqZq+
 V7p/yzVkvqKjW4aSfVFYXrWGeqL/bKCJY1vb1MO0=
Date: Thu, 13 May 2021 14:03:48 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v4 02/31] target/ppc: Split out decode_legacy
Message-ID: <YJylJHMKdbXbbfzE@yekko>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-3-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="siuCQLZCqTzQh/R5"
Content-Disposition: inline
In-Reply-To: <20210512185441.3619828-3-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--siuCQLZCqTzQh/R5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 03:54:12PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1.

> ---
>  target/ppc/translate.c | 115 +++++++++++++++++++++++------------------
>  1 file changed, 64 insertions(+), 51 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 9abe03222d..3ad4c7163d 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -9253,6 +9253,62 @@ void ppc_cpu_dump_statistics(CPUState *cs, int fla=
gs)
>  #endif
>  }
> =20
> +static bool decode_legacy(PowerPCCPU *cpu, DisasContext *ctx, uint32_t i=
nsn)
> +{
> +    opc_handler_t **table, *handler;
> +    uint32_t inval;
> +
> +    ctx->opcode =3D insn;
> +
> +    LOG_DISAS("translate opcode %08x (%02x %02x %02x %02x) (%s)\n",
> +              insn, opc1(insn), opc2(insn), opc3(insn), opc4(insn),
> +              ctx->le_mode ? "little" : "big");
> +
> +    table =3D cpu->opcodes;
> +    handler =3D table[opc1(insn)];
> +    if (is_indirect_opcode(handler)) {
> +        table =3D ind_table(handler);
> +        handler =3D table[opc2(insn)];
> +        if (is_indirect_opcode(handler)) {
> +            table =3D ind_table(handler);
> +            handler =3D table[opc3(insn)];
> +            if (is_indirect_opcode(handler)) {
> +                table =3D ind_table(handler);
> +                handler =3D table[opc4(insn)];
> +            }
> +        }
> +    }
> +
> +    /* Is opcode *REALLY* valid ? */
> +    if (unlikely(handler->handler =3D=3D &gen_invalid)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "invalid/unsupported opcode: "
> +                      "%02x - %02x - %02x - %02x (%08x) "
> +                      TARGET_FMT_lx "\n",
> +                      opc1(insn), opc2(insn), opc3(insn), opc4(insn),
> +                      insn, ctx->cia);
> +        return false;
> +    }
> +
> +    if (unlikely(handler->type & (PPC_SPE | PPC_SPE_SINGLE | PPC_SPE_DOU=
BLE)
> +                 && Rc(insn))) {
> +        inval =3D handler->inval2;
> +    } else {
> +        inval =3D handler->inval1;
> +    }
> +
> +    if (unlikely((insn & inval) !=3D 0)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "invalid bits: %08x for opcode: "
> +                      "%02x - %02x - %02x - %02x (%08x) "
> +                      TARGET_FMT_lx "\n", insn & inval,
> +                      opc1(insn), opc2(insn), opc3(insn), opc4(insn),
> +                      insn, ctx->cia);
> +        return false;
> +    }
> +
> +    handler->handler(ctx);
> +    return true;
> +}
> +
>  static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState=
 *cs)
>  {
>      DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
> @@ -9334,66 +9390,23 @@ static void ppc_tr_translate_insn(DisasContextBas=
e *dcbase, CPUState *cs)
>      DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
>      CPUPPCState *env =3D cs->env_ptr;
> -    opc_handler_t **table, *handler;
> +    uint32_t insn;
> +    bool ok;
> =20
>      LOG_DISAS("----------------\n");
>      LOG_DISAS("nip=3D" TARGET_FMT_lx " super=3D%d ir=3D%d\n",
>                ctx->base.pc_next, ctx->mem_idx, (int)msr_ir);
> =20
>      ctx->cia =3D ctx->base.pc_next;
> -    ctx->opcode =3D translator_ldl_swap(env, ctx->base.pc_next,
> -                                      need_byteswap(ctx));
> -
> -    LOG_DISAS("translate opcode %08x (%02x %02x %02x %02x) (%s)\n",
> -              ctx->opcode, opc1(ctx->opcode), opc2(ctx->opcode),
> -              opc3(ctx->opcode), opc4(ctx->opcode),
> -              ctx->le_mode ? "little" : "big");
> +    insn =3D translator_ldl_swap(env, ctx->base.pc_next, need_byteswap(c=
tx));
>      ctx->base.pc_next +=3D 4;
> -    table =3D cpu->opcodes;
> -    handler =3D table[opc1(ctx->opcode)];
> -    if (is_indirect_opcode(handler)) {
> -        table =3D ind_table(handler);
> -        handler =3D table[opc2(ctx->opcode)];
> -        if (is_indirect_opcode(handler)) {
> -            table =3D ind_table(handler);
> -            handler =3D table[opc3(ctx->opcode)];
> -            if (is_indirect_opcode(handler)) {
> -                table =3D ind_table(handler);
> -                handler =3D table[opc4(ctx->opcode)];
> -            }
> -        }
> -    }
> -    /* Is opcode *REALLY* valid ? */
> -    if (unlikely(handler->handler =3D=3D &gen_invalid)) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "invalid/unsupported opcode: "
> -                      "%02x - %02x - %02x - %02x (%08x) "
> -                      TARGET_FMT_lx " %d\n",
> -                      opc1(ctx->opcode), opc2(ctx->opcode),
> -                      opc3(ctx->opcode), opc4(ctx->opcode),
> -                      ctx->opcode, ctx->cia, (int)msr_ir);
> -    } else {
> -        uint32_t inval;
> =20
> -        if (unlikely(handler->type & (PPC_SPE | PPC_SPE_SINGLE | PPC_SPE=
_DOUBLE)
> -                     && Rc(ctx->opcode))) {
> -            inval =3D handler->inval2;
> -        } else {
> -            inval =3D handler->inval1;
> -        }
> -
> -        if (unlikely((ctx->opcode & inval) !=3D 0)) {
> -            qemu_log_mask(LOG_GUEST_ERROR, "invalid bits: %08x for opcod=
e: "
> -                          "%02x - %02x - %02x - %02x (%08x) "
> -                          TARGET_FMT_lx "\n", ctx->opcode & inval,
> -                          opc1(ctx->opcode), opc2(ctx->opcode),
> -                          opc3(ctx->opcode), opc4(ctx->opcode),
> -                          ctx->opcode, ctx->cia);
> -            gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
> -            ctx->base.is_jmp =3D DISAS_NORETURN;
> -            return;
> -        }
> +    ok =3D decode_legacy(cpu, ctx, insn);
> +    if (!ok) {
> +        gen_invalid(ctx);
> +        ctx->base.is_jmp =3D DISAS_NORETURN;
>      }
> -    (*(handler->handler))(ctx);
> +
>  #if defined(DO_PPC_STATISTICS)
>      handler->count++;
>  #endif

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--siuCQLZCqTzQh/R5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcpSQACgkQbDjKyiDZ
s5K8+A//eHpwNyyWPa2z1cimnNLgFVYa4DYIQndMeAhDd0hQbTEvctH2od/+kvZ8
02a/R6bE39Q82cgcVwrWmRurjRc1TR4d6iUkP1jU6AOflCyLYtPD2MjDslE0vssR
HmC9kK/FLMVhpwaYp7yfiEIomFp7L+/jQ7xXrdhiFnjkwPI9IJQIJ1FqeDgd4UKL
U5wFs/UgGwfd6jwM0dzBrfj7vk/o0gCtrW+46FQaLGwHdCzDvrZ5pOr84vNouLvO
3XzxeTqiJEVh2XyVZLLqkR+80k1a4qUJGPghcH094hHmiZbha3JxC7fstAqPggej
0tAzXh6qBJ0DoO05O+LqTNmcklX8BMitOnkJ5bYSSgdY4jgpok5AZ8pHjwuPicSH
XQ2lHvEJ076keQLzv7rDuIMOfsQaY/fy1LShjyKwMUNoynaX/E1OB5OK51tfxACW
2M7MKJQeKtPpDWGcduin+S0dpPaIEVFDJOO4eTA24yv5ipqzKTsZuoPE6IKTyvhH
2tiRaOGMn87InJLPJC1JGx9H+473rYc1Y8HNcM0TNeGf5hH47nh+YiSTSBNLhaE8
DpOnZzM0L6uYqNI9MriZAAhSEaDtqRytqI+eAxzoWrRYJIysSyG+QqTY+WqUyEIZ
fhWHXAhBUZ5i4oOKgJAy6iJdFSoQMWZzYNuMI6ZTm8412ZHWJFM=
=gu9q
-----END PGP SIGNATURE-----

--siuCQLZCqTzQh/R5--

