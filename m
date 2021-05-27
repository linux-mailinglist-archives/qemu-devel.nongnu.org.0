Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68D4392850
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:15:09 +0200 (CEST)
Received: from localhost ([::1]:46610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAEW-00013c-An
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:15:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmABy-0006lO-Sx; Thu, 27 May 2021 03:12:30 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:38165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmABw-0004eq-KU; Thu, 27 May 2021 03:12:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FrJsx1pV9z9sWD; Thu, 27 May 2021 17:12:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622099541;
 bh=OZ3pm4aplL8hC8EPz8UMGI4t09y7D+bdDTFMC6y+XNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=deddRsr/iRoR+0arj37xUZoUb482FIdhtpyX4tCIAaf40iMStyrPJvBc//Dv5pk4I
 2B6A9BDE2ziRHvQt4pDlNh7EQtWlQirVRWLuyhBbuJ9zoII4CFv4rYjfgobG8NR5Zi
 BleL7kHZGla5pUillSW/yTvcTMHHsJ1ZDPslmDQA=
Date: Thu, 27 May 2021 14:35:26 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 2/5] target/ppc: remove ppc_cpu_dump_statistics
Message-ID: <YK8hjhgPNK8yVfgm@yekko>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-3-bruno.larsen@eldorado.org.br>
 <YK7zwfSC7NGssEN5@yekko>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DTkmSXQfgM9Bo4Kh"
Content-Disposition: inline
In-Reply-To: <YK7zwfSC7NGssEN5@yekko>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DTkmSXQfgM9Bo4Kh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 11:20:01AM +1000, David Gibson wrote:
> On Wed, May 26, 2021 at 05:21:01PM -0300, Bruno Larsen (billionai) wrote:
> > This function requires surce code modification to be useful, which means
> > it probably is not used often, and the move to using decodetree means
> > the statistics won't even be collected anymore.
> >=20
> > Also removed setting dump_statistics in ppc_cpu_realize, since it was
> > only useful when in conjunction with ppc_cpu_dump_statistics.
> >=20
> > Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> > Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> > ---
> >  target/ppc/cpu.h       |  1 -
> >  target/ppc/cpu_init.c  |  3 ---
> >  target/ppc/translate.c | 51 ------------------------------------------
> >  3 files changed, 55 deletions(-)
> >=20
> > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > index 203f07e48e..c3d1b492e4 100644
> > --- a/target/ppc/cpu.h
> > +++ b/target/ppc/cpu.h
> > @@ -1256,7 +1256,6 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVir=
tualHypervisorClass,
> >  void ppc_cpu_do_interrupt(CPUState *cpu);
> >  bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
> >  void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> > -void ppc_cpu_dump_statistics(CPUState *cpu, int flags);
> >  hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> >  int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
> >  int ppc_cpu_gdb_read_register_apple(CPUState *cpu, GByteArray *buf, in=
t reg);
> > diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> > index f5ae2f150d..bd05f53fa4 100644
> > --- a/target/ppc/cpu_init.c
> > +++ b/target/ppc/cpu_init.c
> > @@ -9250,9 +9250,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, v=
oid *data)
> >      cc->class_by_name =3D ppc_cpu_class_by_name;
> >      cc->has_work =3D ppc_cpu_has_work;
> >      cc->dump_state =3D ppc_cpu_dump_state;
> > -#ifdef CONFIG_TCG
> > -    cc->dump_statistics =3D ppc_cpu_dump_statistics;
> > -#endif
>=20
> This confuses me.  The ifdefs you're removing aren't present in my
> tree, and AFAICT they never existed since your own patch created
> cpu_init.c.
>=20
> So.. please rebase and check that.

Duh, sorry, I looked at this set out of order with your latest !tcg
patches.  Now that I've applied those, I've applied those one as well.

>=20
> >      cc->set_pc =3D ppc_cpu_set_pc;
> >      cc->gdb_read_register =3D ppc_cpu_gdb_read_register;
> >      cc->gdb_write_register =3D ppc_cpu_gdb_write_register;
> > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > index 6c0f424d81..fc9fd790ca 100644
> > --- a/target/ppc/translate.c
> > +++ b/target/ppc/translate.c
> > @@ -8881,57 +8881,6 @@ int ppc_fixup_cpu(PowerPCCPU *cpu)
> >      return 0;
> >  }
> > =20
> > -
> > -void ppc_cpu_dump_statistics(CPUState *cs, int flags)
> > -{
> > -#if defined(DO_PPC_STATISTICS)
> > -    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> > -    opc_handler_t **t1, **t2, **t3, *handler;
> > -    int op1, op2, op3;
> > -
> > -    t1 =3D cpu->env.opcodes;
> > -    for (op1 =3D 0; op1 < 64; op1++) {
> > -        handler =3D t1[op1];
> > -        if (is_indirect_opcode(handler)) {
> > -            t2 =3D ind_table(handler);
> > -            for (op2 =3D 0; op2 < 32; op2++) {
> > -                handler =3D t2[op2];
> > -                if (is_indirect_opcode(handler)) {
> > -                    t3 =3D ind_table(handler);
> > -                    for (op3 =3D 0; op3 < 32; op3++) {
> > -                        handler =3D t3[op3];
> > -                        if (handler->count =3D=3D 0) {
> > -                            continue;
> > -                        }
> > -                        qemu_printf("%02x %02x %02x (%02x %04d) %16s: "
> > -                                    "%016" PRIx64 " %" PRId64 "\n",
> > -                                    op1, op2, op3, op1, (op3 << 5) | o=
p2,
> > -                                    handler->oname,
> > -                                    handler->count, handler->count);
> > -                    }
> > -                } else {
> > -                    if (handler->count =3D=3D 0) {
> > -                        continue;
> > -                    }
> > -                    qemu_printf("%02x %02x    (%02x %04d) %16s: "
> > -                                "%016" PRIx64 " %" PRId64 "\n",
> > -                                op1, op2, op1, op2, handler->oname,
> > -                                handler->count, handler->count);
> > -                }
> > -            }
> > -        } else {
> > -            if (handler->count =3D=3D 0) {
> > -                continue;
> > -            }
> > -            qemu_printf("%02x       (%02x     ) %16s: %016" PRIx64
> > -                        " %" PRId64 "\n",
> > -                        op1, op1, handler->oname,
> > -                        handler->count, handler->count);
> > -        }
> > -    }
> > -#endif
> > -}
> > -
> >  static bool decode_legacy(PowerPCCPU *cpu, DisasContext *ctx, uint32_t=
 insn)
> >  {
> >      opc_handler_t **table, *handler;
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DTkmSXQfgM9Bo4Kh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCvIY0ACgkQbDjKyiDZ
s5Iq6g/8D6/B3iLAckReh9nsb6kMkN0dBhde1mClrhaSfSfQ8StUp+sAjaEXFdgL
hvgdo/LOGA8CDQ9HW8wf3l1S/3Bag9Lv6RWpoP0KvFtkHhQp0sLPwHKtlFWDshZv
KW7+p9cpsYbKECxuo19p8WlfxCBLy02ujw74ozs9txvZzRG+QQ9AmIbJ5jfz3QjL
poX1SbKMdV4miWs9PEU+WlJmXL0vnfyJVUDI8Fizg79cmhbJPjyOSVzrngGGMRHO
4HELrQysaTghBcqZyCLissMwnOBhCsVtKLUy8tUD5l1JVTbF7fEUou3Z6q+fLbid
VILAgZzQl0RWHJnNmjODeWsdrdIRgF3EFexs+lKD9CPnkZYCRtLrZ1Xhed4oa5o1
rthEWOB3FbIAFL8YhusPOsxPM396P4nkq5QLwbxsQEi+nmUMFGlQWZrY9S5R+tfl
VjaziQiQ3maVtDSWflK6SGd3Kp6DULKeZQbALO0yR+/P+UPPOy0bXyAuegS50zm+
hx4tZtzP6QL1DeyPSVH3OH9VftijC7UchwGB5uMr6E8tNczbJ/D8B9BcSnmRHW0G
2zgPFv07kj/6gzIU2+zdZlKQXFqiiXXu8gf2IT3dtLH8VnMQdqvJ4PtZH8N4CLOl
6RoHMnYIeoDrVMzCjxw8YopqSPoXxSgFTIPMe4xhH0UDiqUUO18=
=pgDv
-----END PGP SIGNATURE-----

--DTkmSXQfgM9Bo4Kh--

