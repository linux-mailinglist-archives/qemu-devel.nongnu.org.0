Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E671392495
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 03:53:01 +0200 (CEST)
Received: from localhost ([::1]:58726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm5Cm-0005aj-Eu
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 21:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58R-0005xp-1S; Wed, 26 May 2021 21:48:31 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:59117 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58M-0001kM-4E; Wed, 26 May 2021 21:48:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fr9gz0KFpz9sWD; Thu, 27 May 2021 11:48:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622080095;
 bh=QpWOfNlIyQeJ4Ye34HonOITmFZrLiiGRdRfYsLlOHS4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OJS9EcpnIk8DS0llNEFlagQIAb4uLYR6UpHu8ARMn2QXDvcAquQXd2X6xSYxebvXK
 8O7eLDRc8L+7TiW3D8SnN0IGXrBhFOgnYqz9LG0+6dgwXTGktPMvuBZvVRXm2yWBCT
 xKtSaWzY6aXvdzbls87FskP/TaqNlJu3IiuiAYHE=
Date: Thu, 27 May 2021 11:20:01 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 2/5] target/ppc: remove ppc_cpu_dump_statistics
Message-ID: <YK7zwfSC7NGssEN5@yekko>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-3-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NsHKov4exzbZxzEu"
Content-Disposition: inline
In-Reply-To: <20210526202104.127910-3-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NsHKov4exzbZxzEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 05:21:01PM -0300, Bruno Larsen (billionai) wrote:
> This function requires surce code modification to be useful, which means
> it probably is not used often, and the move to using decodetree means
> the statistics won't even be collected anymore.
>=20
> Also removed setting dump_statistics in ppc_cpu_realize, since it was
> only useful when in conjunction with ppc_cpu_dump_statistics.
>=20
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/cpu.h       |  1 -
>  target/ppc/cpu_init.c  |  3 ---
>  target/ppc/translate.c | 51 ------------------------------------------
>  3 files changed, 55 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 203f07e48e..c3d1b492e4 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1256,7 +1256,6 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtu=
alHypervisorClass,
>  void ppc_cpu_do_interrupt(CPUState *cpu);
>  bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> -void ppc_cpu_dump_statistics(CPUState *cpu, int flags);
>  hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int ppc_cpu_gdb_read_register_apple(CPUState *cpu, GByteArray *buf, int =
reg);
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index f5ae2f150d..bd05f53fa4 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -9250,9 +9250,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, voi=
d *data)
>      cc->class_by_name =3D ppc_cpu_class_by_name;
>      cc->has_work =3D ppc_cpu_has_work;
>      cc->dump_state =3D ppc_cpu_dump_state;
> -#ifdef CONFIG_TCG
> -    cc->dump_statistics =3D ppc_cpu_dump_statistics;
> -#endif

This confuses me.  The ifdefs you're removing aren't present in my
tree, and AFAICT they never existed since your own patch created
cpu_init.c.

So.. please rebase and check that.

>      cc->set_pc =3D ppc_cpu_set_pc;
>      cc->gdb_read_register =3D ppc_cpu_gdb_read_register;
>      cc->gdb_write_register =3D ppc_cpu_gdb_write_register;
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 6c0f424d81..fc9fd790ca 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -8881,57 +8881,6 @@ int ppc_fixup_cpu(PowerPCCPU *cpu)
>      return 0;
>  }
> =20
> -
> -void ppc_cpu_dump_statistics(CPUState *cs, int flags)
> -{
> -#if defined(DO_PPC_STATISTICS)
> -    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -    opc_handler_t **t1, **t2, **t3, *handler;
> -    int op1, op2, op3;
> -
> -    t1 =3D cpu->env.opcodes;
> -    for (op1 =3D 0; op1 < 64; op1++) {
> -        handler =3D t1[op1];
> -        if (is_indirect_opcode(handler)) {
> -            t2 =3D ind_table(handler);
> -            for (op2 =3D 0; op2 < 32; op2++) {
> -                handler =3D t2[op2];
> -                if (is_indirect_opcode(handler)) {
> -                    t3 =3D ind_table(handler);
> -                    for (op3 =3D 0; op3 < 32; op3++) {
> -                        handler =3D t3[op3];
> -                        if (handler->count =3D=3D 0) {
> -                            continue;
> -                        }
> -                        qemu_printf("%02x %02x %02x (%02x %04d) %16s: "
> -                                    "%016" PRIx64 " %" PRId64 "\n",
> -                                    op1, op2, op3, op1, (op3 << 5) | op2,
> -                                    handler->oname,
> -                                    handler->count, handler->count);
> -                    }
> -                } else {
> -                    if (handler->count =3D=3D 0) {
> -                        continue;
> -                    }
> -                    qemu_printf("%02x %02x    (%02x %04d) %16s: "
> -                                "%016" PRIx64 " %" PRId64 "\n",
> -                                op1, op2, op1, op2, handler->oname,
> -                                handler->count, handler->count);
> -                }
> -            }
> -        } else {
> -            if (handler->count =3D=3D 0) {
> -                continue;
> -            }
> -            qemu_printf("%02x       (%02x     ) %16s: %016" PRIx64
> -                        " %" PRId64 "\n",
> -                        op1, op1, handler->oname,
> -                        handler->count, handler->count);
> -        }
> -    }
> -#endif
> -}
> -
>  static bool decode_legacy(PowerPCCPU *cpu, DisasContext *ctx, uint32_t i=
nsn)
>  {
>      opc_handler_t **table, *handler;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NsHKov4exzbZxzEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCu88EACgkQbDjKyiDZ
s5L8mQ/8DoMx6LC/9TDgHsgc3oKyp6LspPV44rYudVZ47d6vFf2nLi+r3PMunpE5
hmeMgVJDCAx/xda3MjMKfO6HgI2kNxJMBDVrM8z9gYosM9W0CzbbdNvmHeL28jWu
qVLowGLaSBqtoQ8N7BfDMScQC+KaBA0PooJVfUss8Nf1qAT4tWGIhJKkrE0ZTD91
RY5cZlknWyVynPGrNqxi8G1UCCxVa/p7KK+3AuPlNLrODizBW+Tc9LYuEdn8ByMT
uvUm/vugdG0KL/1y9Bix4C7BO9VFNhZCZEHG+60RTqdgyQgS+mWoqTQ3RssnOo+9
snPBTdiS9lRYxbXX18aQMJqe6OGdq1z/ucUXeoPgbcbZfkQ9VouNd2zCAdE7wS9r
B/WvAcsVCu/Pt9OM/88vGAt7y4Ho3h/NS3kVg2UWBvBsf7AO8LJEAJC2wF0o0Hy+
9/fxBuxnXuEB5Yd0EQfnP6DUpxPaMm1R1rSSpGXO1K8bxwj+mYPUvS/dMRyEiNd0
IzEuHPbTgKXwt6Ao3qzB95ARxVqXh0W/YmaiS402TbBraP6q9N7xIVZcFMDH0Rxj
VeHOy5TrNiV3DizDO/QvX6WJ2CiZX5Nv98Phx1NyHq+vWL1FI4rULbyLHYsbQkrf
xKUDHQH38H6RaxwtBADZ4GITjmsf7DyuR8kMyW4YovX1nkTOIQc=
=uLFY
-----END PGP SIGNATURE-----

--NsHKov4exzbZxzEu--

