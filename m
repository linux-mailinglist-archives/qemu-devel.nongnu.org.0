Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4083394AAF
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 08:01:57 +0200 (CEST)
Received: from localhost ([::1]:53716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lms2m-0004Et-N0
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 02:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lms15-00028O-Ts; Sat, 29 May 2021 02:00:11 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39191 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lms12-0006fa-PN; Sat, 29 May 2021 02:00:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FsW9T0sGbz9sSn; Sat, 29 May 2021 15:59:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622267997;
 bh=ZKtUwcI5vBLOTsap95ZW4DfbwzlsLZ//ntGl9+PT2W8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gHhjsRNvc3lsrNUkxMPFRomgUSgTfpjT8KmF3UMsgDKPWOFGQnz1vNHIseV+hka41
 r2VJsWff9MMfbazN1nO9e0GvZ2b7YqwVQTAagzCNTHSCHnJqaVCmFykeqfZRarkXmo
 zGWH4gnzEjBF0aWP7dbIVtb8ueDaXDSbE9ObWJ34=
Date: Sat, 29 May 2021 15:47:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 2/5] target/ppc: remove ppc_cpu_dump_statistics
Message-ID: <YLHVZeGAna8Y91Qm@yekko>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-3-bruno.larsen@eldorado.org.br>
 <20210527080156.2b861a9b@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VHOideGMwUb0nd+/"
Content-Disposition: inline
In-Reply-To: <20210527080156.2b861a9b@bahia.lan>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 lucas.araujo@eldorado.org.br, qemu-devel@nongnu.org,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VHOideGMwUb0nd+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 08:01:56AM +0200, Greg Kurz wrote:
> On Wed, 26 May 2021 17:21:01 -0300
> "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> wrote:
>=20
> > This function requires surce code modification to be useful, which means
>=20
> s/surce/source
>=20
> > it probably is not used often, and the move to using decodetree means
> > the statistics won't even be collected anymore.
> >=20
> > Also removed setting dump_statistics in ppc_cpu_realize, since it was
>=20
> s/ppc_cpu_realize/ppc_cpu_class_init

A rebase on main has triggered a conflict with this patch, so I've
removed it from my tree again.

>=20
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

--VHOideGMwUb0nd+/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCx1WUACgkQbDjKyiDZ
s5ImuRAAucGb1jSNJoqv+3QF9dvmuwaC1uGulhLS9ODT6ssvFdPkuEgoZzwDWVSV
Z+bfDwYOLiIOzazuykkDagCtKIw1iNC7d1CwJg8OjDVjB+hXHFiIaZIGlsE1p9mu
zgl5mkqsiVERt+AfOQn08DIonbuP/G893J2TLo5BidnkjtILGrT3YTahwcdWZx5h
Y60MB3QTgAaxvchwvrSbs9jtUH2Ju74QlU+0Tkmd5w4bXl7vT8/vaOUUKVMFpAbB
Kh3JnLYmWqkH6KGyWp94slU5kk9UPS/hq6vrcotLqcy7B6eJVjooo7HgU1YpLPom
QMkeyzbwlQXUIH9zXUzKpG0EvPi8RFa2Q4KWCrvX0GEILTikwRnUnr0Hfyt82bws
En9BwQVuJIK0H578ohsNHEvKQ/4kDYb6VeUNu6hLGNQPkRyq7TddHLEzKjGq6TTN
Bvw5iSgqJbtLnnIoqEKTuCPzGofAFaE/MlRd12nfXdb6xOclH4hV5Pxe2sODSYvY
btoAqNs5SPTRnhsn6GjqENo1HHGKi/VG2GcgvhkR+sASzqdF/bWVW3OLBdrtRomH
Ae5BtYH0f8VxJr5d5H62p7mUUD1HtTkp0YamNniuQIYEYJUbbSryY4HazdLMKOvj
WEYhnqLm12qJ0rdY3NZO3SFDzM4V4VwtG8IqWSNs3DpzRry1n3E=
=UldV
-----END PGP SIGNATURE-----

--VHOideGMwUb0nd+/--

