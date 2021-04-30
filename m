Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B91F36F66D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 09:32:11 +0200 (CEST)
Received: from localhost ([::1]:51182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcNd8-0003b9-HM
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 03:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lcNaD-0001fR-Qz; Fri, 30 Apr 2021 03:29:05 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:47179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lcNa9-0001U6-QO; Fri, 30 Apr 2021 03:29:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FWkWQ4zvZz9sX1; Fri, 30 Apr 2021 17:28:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619767730;
 bh=D9CcfTATNVDLVenRa5gpGLR1VDIub1evqbVo6ywg0tI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VDW26wuTcvO053opKd039hP3tW49BwvFWtr9/NnyuM+V2A9ueuxi4T9vuHZaGaSfk
 2oWS9KJwFAfpilFZcuonsCKAakna3E/ggVxDMaK7Ru0YktLuNXczECN0Sak+WUo25G
 Oed6FO1Ptl3a6s+Q9XfX2RZMLVGBv7T/WpBxJP0E=
Date: Fri, 30 Apr 2021 14:18:22 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v2 1/7] target/ppc: move opcode table logic to translate.c
Message-ID: <YIuFDrA8H02bGEuk@yekko>
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
 <20210429162130.2412-2-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="As/lDc+CbpoPjair"
Content-Disposition: inline
In-Reply-To: <20210429162130.2412-2-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--As/lDc+CbpoPjair
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 01:21:24PM -0300, Bruno Larsen (billionai) wrote:
65;6203;1c> code motion to remove opcode callback table from
> translate_init.c.inc to translate.c in preparation to remove
> the #include <translate_init.c.inc> from translate.c. Also created
> destroy_ppc_opcodes and removed that logic from ppc_cpu_unrealize
>=20
> Signed-off-by: Bruno Larsen (billionai)
> <bruno.larsen@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/internal.h           |   8 +
>  target/ppc/translate.c          | 394 ++++++++++++++++++++++++++++++++
>  target/ppc/translate_init.c.inc | 391 +------------------------------
>  3 files changed, 403 insertions(+), 390 deletions(-)
>=20
> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index c401658e8d..184ba6d6b3 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -216,6 +216,14 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr=
 addr,
>                                   MMUAccessType access_type,
>                                   int mmu_idx, uintptr_t retaddr);
> =20
> +/* translate.c */
> +
> +/* #define PPC_DUMP_CPU */
> +
> +int ppc_fixup_cpu(PowerPCCPU *cpu);
> +void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp);
> +void destroy_ppc_opcodes(PowerPCCPU *cpu);
> +
>  /* gdbstub.c */
>  void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
>  gchar *ppc_gdb_arch_name(CPUState *cs);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 0984ce637b..b319d409c6 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7825,6 +7825,400 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, in=
t flags)
>  #undef RFPL
>  }
> =20
> +/***********************************************************************=
******/
> +/* Opcode types */
> +enum {
> +    PPC_DIRECT   =3D 0, /* Opcode routine        */
> +    PPC_INDIRECT =3D 1, /* Indirect opcode table */
> +};
> +
> +#define PPC_OPCODE_MASK 0x3
> +
> +static inline int is_indirect_opcode(void *handler)
> +{
> +    return ((uintptr_t)handler & PPC_OPCODE_MASK) =3D=3D PPC_INDIRECT;
> +}
> +
> +static inline opc_handler_t **ind_table(void *handler)
> +{
> +    return (opc_handler_t **)((uintptr_t)handler & ~PPC_OPCODE_MASK);
> +}
> +
> +/* Instruction table creation */
> +/* Opcodes tables creation */
> +static void fill_new_table(opc_handler_t **table, int len)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < len; i++) {
> +        table[i] =3D &invalid_handler;
> +    }
> +}
> +
> +static int create_new_table(opc_handler_t **table, unsigned char idx)
> +{
> +    opc_handler_t **tmp;
> +
> +    tmp =3D g_new(opc_handler_t *, PPC_CPU_INDIRECT_OPCODES_LEN);
> +    fill_new_table(tmp, PPC_CPU_INDIRECT_OPCODES_LEN);
> +    table[idx] =3D (opc_handler_t *)((uintptr_t)tmp | PPC_INDIRECT);
> +
> +    return 0;
> +}
> +
> +static int insert_in_table(opc_handler_t **table, unsigned char idx,
> +                            opc_handler_t *handler)
> +{
> +    if (table[idx] !=3D &invalid_handler) {
> +        return -1;
> +    }
> +    table[idx] =3D handler;
> +
> +    return 0;
> +}
> +
> +static int register_direct_insn(opc_handler_t **ppc_opcodes,
> +                                unsigned char idx, opc_handler_t *handle=
r)
> +{
> +    if (insert_in_table(ppc_opcodes, idx, handler) < 0) {
> +        printf("*** ERROR: opcode %02x already assigned in main "
> +               "opcode table\n", idx);
> +#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
> +        printf("           Registered handler '%s' - new handler '%s'\n",
> +               ppc_opcodes[idx]->oname, handler->oname);
> +#endif
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +static int register_ind_in_table(opc_handler_t **table,
> +                                 unsigned char idx1, unsigned char idx2,
> +                                 opc_handler_t *handler)
> +{
> +    if (table[idx1] =3D=3D &invalid_handler) {
> +        if (create_new_table(table, idx1) < 0) {
> +            printf("*** ERROR: unable to create indirect table "
> +                   "idx=3D%02x\n", idx1);
> +            return -1;
> +        }
> +    } else {
> +        if (!is_indirect_opcode(table[idx1])) {
> +            printf("*** ERROR: idx %02x already assigned to a direct "
> +                   "opcode\n", idx1);
> +#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
> +            printf("           Registered handler '%s' - new handler '%s=
'\n",
> +                   ind_table(table[idx1])[idx2]->oname, handler->oname);
> +#endif
> +            return -1;
> +        }
> +    }
> +    if (handler !=3D NULL &&
> +        insert_in_table(ind_table(table[idx1]), idx2, handler) < 0) {
> +        printf("*** ERROR: opcode %02x already assigned in "
> +               "opcode table %02x\n", idx2, idx1);
> +#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
> +        printf("           Registered handler '%s' - new handler '%s'\n",
> +               ind_table(table[idx1])[idx2]->oname, handler->oname);
> +#endif
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +static int register_ind_insn(opc_handler_t **ppc_opcodes,
> +                             unsigned char idx1, unsigned char idx2,
> +                             opc_handler_t *handler)
> +{
> +    return register_ind_in_table(ppc_opcodes, idx1, idx2, handler);
> +}
> +
> +static int register_dblind_insn(opc_handler_t **ppc_opcodes,
> +                                unsigned char idx1, unsigned char idx2,
> +                                unsigned char idx3, opc_handler_t *handl=
er)
> +{
> +    if (register_ind_in_table(ppc_opcodes, idx1, idx2, NULL) < 0) {
> +        printf("*** ERROR: unable to join indirect table idx "
> +               "[%02x-%02x]\n", idx1, idx2);
> +        return -1;
> +    }
> +    if (register_ind_in_table(ind_table(ppc_opcodes[idx1]), idx2, idx3,
> +                              handler) < 0) {
> +        printf("*** ERROR: unable to insert opcode "
> +               "[%02x-%02x-%02x]\n", idx1, idx2, idx3);
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +static int register_trplind_insn(opc_handler_t **ppc_opcodes,
> +                                 unsigned char idx1, unsigned char idx2,
> +                                 unsigned char idx3, unsigned char idx4,
> +                                 opc_handler_t *handler)
> +{
> +    opc_handler_t **table;
> +
> +    if (register_ind_in_table(ppc_opcodes, idx1, idx2, NULL) < 0) {
> +        printf("*** ERROR: unable to join indirect table idx "
> +               "[%02x-%02x]\n", idx1, idx2);
> +        return -1;
> +    }
> +    table =3D ind_table(ppc_opcodes[idx1]);
> +    if (register_ind_in_table(table, idx2, idx3, NULL) < 0) {
> +        printf("*** ERROR: unable to join 2nd-level indirect table idx "
> +               "[%02x-%02x-%02x]\n", idx1, idx2, idx3);
> +        return -1;
> +    }
> +    table =3D ind_table(table[idx2]);
> +    if (register_ind_in_table(table, idx3, idx4, handler) < 0) {
> +        printf("*** ERROR: unable to insert opcode "
> +               "[%02x-%02x-%02x-%02x]\n", idx1, idx2, idx3, idx4);
> +        return -1;
> +    }
> +    return 0;
> +}
> +static int register_insn(opc_handler_t **ppc_opcodes, opcode_t *insn)
> +{
> +    if (insn->opc2 !=3D 0xFF) {
> +        if (insn->opc3 !=3D 0xFF) {
> +            if (insn->opc4 !=3D 0xFF) {
> +                if (register_trplind_insn(ppc_opcodes, insn->opc1, insn-=
>opc2,
> +                                          insn->opc3, insn->opc4,
> +                                          &insn->handler) < 0) {
> +                    return -1;
> +                }
> +            } else {
> +                if (register_dblind_insn(ppc_opcodes, insn->opc1, insn->=
opc2,
> +                                         insn->opc3, &insn->handler) < 0=
) {
> +                    return -1;
> +                }
> +            }
> +        } else {
> +            if (register_ind_insn(ppc_opcodes, insn->opc1,
> +                                  insn->opc2, &insn->handler) < 0) {
> +                return -1;
> +            }
> +        }
> +    } else {
> +        if (register_direct_insn(ppc_opcodes, insn->opc1, &insn->handler=
) < 0) {
> +            return -1;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static int test_opcode_table(opc_handler_t **table, int len)
> +{
> +    int i, count, tmp;
> +
> +    for (i =3D 0, count =3D 0; i < len; i++) {
> +        /* Consistency fixup */
> +        if (table[i] =3D=3D NULL) {
> +            table[i] =3D &invalid_handler;
> +        }
> +        if (table[i] !=3D &invalid_handler) {
> +            if (is_indirect_opcode(table[i])) {
> +                tmp =3D test_opcode_table(ind_table(table[i]),
> +                    PPC_CPU_INDIRECT_OPCODES_LEN);
> +                if (tmp =3D=3D 0) {
> +                    free(table[i]);
> +                    table[i] =3D &invalid_handler;
> +                } else {
> +                    count++;
> +                }
> +            } else {
> +                count++;
> +            }
> +        }
> +    }
> +
> +    return count;
> +}
> +
> +static void fix_opcode_tables(opc_handler_t **ppc_opcodes)
> +{
> +    if (test_opcode_table(ppc_opcodes, PPC_CPU_OPCODES_LEN) =3D=3D 0) {
> +        printf("*** WARNING: no opcode defined !\n");
> +    }
> +}
> +
> +/***********************************************************************=
******/
> +void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp)
> +{
> +    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> +    opcode_t *opc;
> +
> +    fill_new_table(cpu->opcodes, PPC_CPU_OPCODES_LEN);
> +    for (opc =3D opcodes; opc < &opcodes[ARRAY_SIZE(opcodes)]; opc++) {
> +        if (((opc->handler.type & pcc->insns_flags) !=3D 0) ||
> +            ((opc->handler.type2 & pcc->insns_flags2) !=3D 0)) {
> +            if (register_insn(cpu->opcodes, opc) < 0) {
> +                error_setg(errp, "ERROR initializing PowerPC instruction=
 "
> +                           "0x%02x 0x%02x 0x%02x", opc->opc1, opc->opc2,
> +                           opc->opc3);
> +                return;
> +            }
> +        }
> +    }
> +    fix_opcode_tables(cpu->opcodes);
> +    fflush(stdout);
> +    fflush(stderr);
> +}
> +
> +void destroy_ppc_opcodes(PowerPCCPU *cpu)
> +{
> +    opc_handler_t **table, **table_2;
> +    int i, j, k;
> +
> +    for (i =3D 0; i < PPC_CPU_OPCODES_LEN; i++) {
> +        if (cpu->opcodes[i] =3D=3D &invalid_handler) {
> +            continue;
> +        }
> +        if (is_indirect_opcode(cpu->opcodes[i])) {
> +            table =3D ind_table(cpu->opcodes[i]);
> +            for (j =3D 0; j < PPC_CPU_INDIRECT_OPCODES_LEN; j++) {
> +                if (table[j] =3D=3D &invalid_handler) {
> +                    continue;
> +                }
> +                if (is_indirect_opcode(table[j])) {
> +                    table_2 =3D ind_table(table[j]);
> +                    for (k =3D 0; k < PPC_CPU_INDIRECT_OPCODES_LEN; k++)=
 {
> +                        if (table_2[k] !=3D &invalid_handler &&
> +                            is_indirect_opcode(table_2[k])) {
> +                            g_free((opc_handler_t *)((uintptr_t)table_2[=
k] &
> +                                                     ~PPC_INDIRECT));
> +                        }
> +                    }
> +                    g_free((opc_handler_t *)((uintptr_t)table[j] &
> +                                             ~PPC_INDIRECT));
> +                }
> +            }
> +            g_free((opc_handler_t *)((uintptr_t)cpu->opcodes[i] &
> +                ~PPC_INDIRECT));
> +        }
> +    }
> +}
> +
> +#if defined(PPC_DUMP_CPU)
> +static void dump_ppc_insns(CPUPPCState *env)
> +{
> +    opc_handler_t **table, *handler;
> +    const char *p, *q;
> +    uint8_t opc1, opc2, opc3, opc4;
> +
> +    printf("Instructions set:\n");
> +    /* opc1 is 6 bits long */
> +    for (opc1 =3D 0x00; opc1 < PPC_CPU_OPCODES_LEN; opc1++) {
> +        table =3D env->opcodes;
> +        handler =3D table[opc1];
> +        if (is_indirect_opcode(handler)) {
> +            /* opc2 is 5 bits long */
> +            for (opc2 =3D 0; opc2 < PPC_CPU_INDIRECT_OPCODES_LEN; opc2++=
) {
> +                table =3D env->opcodes;
> +                handler =3D env->opcodes[opc1];
> +                table =3D ind_table(handler);
> +                handler =3D table[opc2];
> +                if (is_indirect_opcode(handler)) {
> +                    table =3D ind_table(handler);
> +                    /* opc3 is 5 bits long */
> +                    for (opc3 =3D 0; opc3 < PPC_CPU_INDIRECT_OPCODES_LEN;
> +                            opc3++) {
> +                        handler =3D table[opc3];
> +                        if (is_indirect_opcode(handler)) {
> +                            table =3D ind_table(handler);
> +                            /* opc4 is 5 bits long */
> +                            for (opc4 =3D 0; opc4 < PPC_CPU_INDIRECT_OPC=
ODES_LEN;
> +                                 opc4++) {
> +                                handler =3D table[opc4];
> +                                if (handler->handler !=3D &gen_invalid) {
> +                                    printf("INSN: %02x %02x %02x %02x --=
 "
> +                                           "(%02d %04d %02d) : %s\n",
> +                                           opc1, opc2, opc3, opc4,
> +                                           opc1, (opc3 << 5) | opc2, opc=
4,
> +                                           handler->oname);
> +                                }
> +                            }
> +                        } else {
> +                            if (handler->handler !=3D &gen_invalid) {
> +                                /* Special hack to properly dump SPE ins=
ns */
> +                                p =3D strchr(handler->oname, '_');
> +                                if (p =3D=3D NULL) {
> +                                    printf("INSN: %02x %02x %02x (%02d %=
04d) : "
> +                                           "%s\n",
> +                                           opc1, opc2, opc3, opc1,
> +                                           (opc3 << 5) | opc2,
> +                                           handler->oname);
> +                                } else {
> +                                    q =3D "speundef";
> +                                    if ((p - handler->oname) !=3D strlen=
(q)
> +                                        || (memcmp(handler->oname, q, st=
rlen(q))
> +                                            !=3D 0)) {
> +                                        /* First instruction */
> +                                        printf("INSN: %02x %02x %02x"
> +                                               "(%02d %04d) : %.*s\n",
> +                                               opc1, opc2 << 1, opc3, op=
c1,
> +                                               (opc3 << 6) | (opc2 << 1),
> +                                               (int)(p - handler->oname),
> +                                               handler->oname);
> +                                    }
> +                                    if (strcmp(p + 1, q) !=3D 0) {
> +                                        /* Second instruction */
> +                                        printf("INSN: %02x %02x %02x "
> +                                               "(%02d %04d) : %s\n", opc=
1,
> +                                               (opc2 << 1) | 1, opc3, op=
c1,
> +                                               (opc3 << 6) | (opc2 << 1)=
 | 1,
> +                                               p + 1);
> +                                    }
> +                                }
> +                            }
> +                        }
> +                    }
> +                } else {
> +                    if (handler->handler !=3D &gen_invalid) {
> +                        printf("INSN: %02x %02x -- (%02d %04d) : %s\n",
> +                               opc1, opc2, opc1, opc2, handler->oname);
> +                    }
> +                }
> +            }
> +        } else {
> +            if (handler->handler !=3D &gen_invalid) {
> +                printf("INSN: %02x -- -- (%02d ----) : %s\n",
> +                       opc1, opc1, handler->oname);
> +            }
> +        }
> +    }
> +}
> +#endif
> +int ppc_fixup_cpu(PowerPCCPU *cpu)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    /*
> +     * TCG doesn't (yet) emulate some groups of instructions that are
> +     * implemented on some otherwise supported CPUs (e.g. VSX and
> +     * decimal floating point instructions on POWER7).  We remove
> +     * unsupported instruction groups from the cpu state's instruction
> +     * masks and hope the guest can cope.  For at least the pseries
> +     * machine, the unavailability of these instructions can be
> +     * advertised to the guest via the device tree.
> +     */
> +    if ((env->insns_flags & ~PPC_TCG_INSNS)
> +        || (env->insns_flags2 & ~PPC_TCG_INSNS2)) {
> +        warn_report("Disabling some instructions which are not "
> +                    "emulated by TCG (0x%" PRIx64 ", 0x%" PRIx64 ")",
> +                    env->insns_flags & ~PPC_TCG_INSNS,
> +                    env->insns_flags2 & ~PPC_TCG_INSNS2);
> +    }
> +    env->insns_flags &=3D PPC_TCG_INSNS;
> +    env->insns_flags2 &=3D PPC_TCG_INSNS2;
> +    return 0;
> +}
> +
> +
>  void ppc_cpu_dump_statistics(CPUState *cs, int flags)
>  {
>  #if defined(DO_PPC_STATISTICS)
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
> index 80fef0b90d..6235eb7536 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -42,7 +42,6 @@
>  #include "fpu/softfloat.h"
>  #include "qapi/qapi-commands-machine-target.h"
> =20
> -/* #define PPC_DUMP_CPU */
>  /* #define PPC_DEBUG_SPR */
>  /* #define PPC_DUMP_SPR_ACCESSES */
>  /* #define USE_APPLE_GDB */
> @@ -9560,366 +9559,6 @@ static void dump_ppc_sprs(CPUPPCState *env)
>  }
>  #endif
> =20
> -/***********************************************************************=
******/
> -
> -/* Opcode types */
> -enum {
> -    PPC_DIRECT   =3D 0, /* Opcode routine        */
> -    PPC_INDIRECT =3D 1, /* Indirect opcode table */
> -};
> -
> -#define PPC_OPCODE_MASK 0x3
> -
> -static inline int is_indirect_opcode(void *handler)
> -{
> -    return ((uintptr_t)handler & PPC_OPCODE_MASK) =3D=3D PPC_INDIRECT;
> -}
> -
> -static inline opc_handler_t **ind_table(void *handler)
> -{
> -    return (opc_handler_t **)((uintptr_t)handler & ~PPC_OPCODE_MASK);
> -}
> -
> -/* Instruction table creation */
> -/* Opcodes tables creation */
> -static void fill_new_table(opc_handler_t **table, int len)
> -{
> -    int i;
> -
> -    for (i =3D 0; i < len; i++) {
> -        table[i] =3D &invalid_handler;
> -    }
> -}
> -
> -static int create_new_table(opc_handler_t **table, unsigned char idx)
> -{
> -    opc_handler_t **tmp;
> -
> -    tmp =3D g_new(opc_handler_t *, PPC_CPU_INDIRECT_OPCODES_LEN);
> -    fill_new_table(tmp, PPC_CPU_INDIRECT_OPCODES_LEN);
> -    table[idx] =3D (opc_handler_t *)((uintptr_t)tmp | PPC_INDIRECT);
> -
> -    return 0;
> -}
> -
> -static int insert_in_table(opc_handler_t **table, unsigned char idx,
> -                            opc_handler_t *handler)
> -{
> -    if (table[idx] !=3D &invalid_handler) {
> -        return -1;
> -    }
> -    table[idx] =3D handler;
> -
> -    return 0;
> -}
> -
> -static int register_direct_insn(opc_handler_t **ppc_opcodes,
> -                                unsigned char idx, opc_handler_t *handle=
r)
> -{
> -    if (insert_in_table(ppc_opcodes, idx, handler) < 0) {
> -        printf("*** ERROR: opcode %02x already assigned in main "
> -               "opcode table\n", idx);
> -#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
> -        printf("           Registered handler '%s' - new handler '%s'\n",
> -               ppc_opcodes[idx]->oname, handler->oname);
> -#endif
> -        return -1;
> -    }
> -
> -    return 0;
> -}
> -
> -static int register_ind_in_table(opc_handler_t **table,
> -                                 unsigned char idx1, unsigned char idx2,
> -                                 opc_handler_t *handler)
> -{
> -    if (table[idx1] =3D=3D &invalid_handler) {
> -        if (create_new_table(table, idx1) < 0) {
> -            printf("*** ERROR: unable to create indirect table "
> -                   "idx=3D%02x\n", idx1);
> -            return -1;
> -        }
> -    } else {
> -        if (!is_indirect_opcode(table[idx1])) {
> -            printf("*** ERROR: idx %02x already assigned to a direct "
> -                   "opcode\n", idx1);
> -#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
> -            printf("           Registered handler '%s' - new handler '%s=
'\n",
> -                   ind_table(table[idx1])[idx2]->oname, handler->oname);
> -#endif
> -            return -1;
> -        }
> -    }
> -    if (handler !=3D NULL &&
> -        insert_in_table(ind_table(table[idx1]), idx2, handler) < 0) {
> -        printf("*** ERROR: opcode %02x already assigned in "
> -               "opcode table %02x\n", idx2, idx1);
> -#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
> -        printf("           Registered handler '%s' - new handler '%s'\n",
> -               ind_table(table[idx1])[idx2]->oname, handler->oname);
> -#endif
> -        return -1;
> -    }
> -
> -    return 0;
> -}
> -
> -static int register_ind_insn(opc_handler_t **ppc_opcodes,
> -                             unsigned char idx1, unsigned char idx2,
> -                             opc_handler_t *handler)
> -{
> -    return register_ind_in_table(ppc_opcodes, idx1, idx2, handler);
> -}
> -
> -static int register_dblind_insn(opc_handler_t **ppc_opcodes,
> -                                unsigned char idx1, unsigned char idx2,
> -                                unsigned char idx3, opc_handler_t *handl=
er)
> -{
> -    if (register_ind_in_table(ppc_opcodes, idx1, idx2, NULL) < 0) {
> -        printf("*** ERROR: unable to join indirect table idx "
> -               "[%02x-%02x]\n", idx1, idx2);
> -        return -1;
> -    }
> -    if (register_ind_in_table(ind_table(ppc_opcodes[idx1]), idx2, idx3,
> -                              handler) < 0) {
> -        printf("*** ERROR: unable to insert opcode "
> -               "[%02x-%02x-%02x]\n", idx1, idx2, idx3);
> -        return -1;
> -    }
> -
> -    return 0;
> -}
> -
> -static int register_trplind_insn(opc_handler_t **ppc_opcodes,
> -                                 unsigned char idx1, unsigned char idx2,
> -                                 unsigned char idx3, unsigned char idx4,
> -                                 opc_handler_t *handler)
> -{
> -    opc_handler_t **table;
> -
> -    if (register_ind_in_table(ppc_opcodes, idx1, idx2, NULL) < 0) {
> -        printf("*** ERROR: unable to join indirect table idx "
> -               "[%02x-%02x]\n", idx1, idx2);
> -        return -1;
> -    }
> -    table =3D ind_table(ppc_opcodes[idx1]);
> -    if (register_ind_in_table(table, idx2, idx3, NULL) < 0) {
> -        printf("*** ERROR: unable to join 2nd-level indirect table idx "
> -               "[%02x-%02x-%02x]\n", idx1, idx2, idx3);
> -        return -1;
> -    }
> -    table =3D ind_table(table[idx2]);
> -    if (register_ind_in_table(table, idx3, idx4, handler) < 0) {
> -        printf("*** ERROR: unable to insert opcode "
> -               "[%02x-%02x-%02x-%02x]\n", idx1, idx2, idx3, idx4);
> -        return -1;
> -    }
> -    return 0;
> -}
> -static int register_insn(opc_handler_t **ppc_opcodes, opcode_t *insn)
> -{
> -    if (insn->opc2 !=3D 0xFF) {
> -        if (insn->opc3 !=3D 0xFF) {
> -            if (insn->opc4 !=3D 0xFF) {
> -                if (register_trplind_insn(ppc_opcodes, insn->opc1, insn-=
>opc2,
> -                                          insn->opc3, insn->opc4,
> -                                          &insn->handler) < 0) {
> -                    return -1;
> -                }
> -            } else {
> -                if (register_dblind_insn(ppc_opcodes, insn->opc1, insn->=
opc2,
> -                                         insn->opc3, &insn->handler) < 0=
) {
> -                    return -1;
> -                }
> -            }
> -        } else {
> -            if (register_ind_insn(ppc_opcodes, insn->opc1,
> -                                  insn->opc2, &insn->handler) < 0) {
> -                return -1;
> -            }
> -        }
> -    } else {
> -        if (register_direct_insn(ppc_opcodes, insn->opc1, &insn->handler=
) < 0) {
> -            return -1;
> -        }
> -    }
> -
> -    return 0;
> -}
> -
> -static int test_opcode_table(opc_handler_t **table, int len)
> -{
> -    int i, count, tmp;
> -
> -    for (i =3D 0, count =3D 0; i < len; i++) {
> -        /* Consistency fixup */
> -        if (table[i] =3D=3D NULL) {
> -            table[i] =3D &invalid_handler;
> -        }
> -        if (table[i] !=3D &invalid_handler) {
> -            if (is_indirect_opcode(table[i])) {
> -                tmp =3D test_opcode_table(ind_table(table[i]),
> -                    PPC_CPU_INDIRECT_OPCODES_LEN);
> -                if (tmp =3D=3D 0) {
> -                    free(table[i]);
> -                    table[i] =3D &invalid_handler;
> -                } else {
> -                    count++;
> -                }
> -            } else {
> -                count++;
> -            }
> -        }
> -    }
> -
> -    return count;
> -}
> -
> -static void fix_opcode_tables(opc_handler_t **ppc_opcodes)
> -{
> -    if (test_opcode_table(ppc_opcodes, PPC_CPU_OPCODES_LEN) =3D=3D 0) {
> -        printf("*** WARNING: no opcode defined !\n");
> -    }
> -}
> -
> -/***********************************************************************=
******/
> -static void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp)
> -{
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> -    opcode_t *opc;
> -
> -    fill_new_table(cpu->opcodes, PPC_CPU_OPCODES_LEN);
> -    for (opc =3D opcodes; opc < &opcodes[ARRAY_SIZE(opcodes)]; opc++) {
> -        if (((opc->handler.type & pcc->insns_flags) !=3D 0) ||
> -            ((opc->handler.type2 & pcc->insns_flags2) !=3D 0)) {
> -            if (register_insn(cpu->opcodes, opc) < 0) {
> -                error_setg(errp, "ERROR initializing PowerPC instruction=
 "
> -                           "0x%02x 0x%02x 0x%02x", opc->opc1, opc->opc2,
> -                           opc->opc3);
> -                return;
> -            }
> -        }
> -    }
> -    fix_opcode_tables(cpu->opcodes);
> -    fflush(stdout);
> -    fflush(stderr);
> -}
> -
> -#if defined(PPC_DUMP_CPU)
> -static void dump_ppc_insns(CPUPPCState *env)
> -{
> -    opc_handler_t **table, *handler;
> -    const char *p, *q;
> -    uint8_t opc1, opc2, opc3, opc4;
> -
> -    printf("Instructions set:\n");
> -    /* opc1 is 6 bits long */
> -    for (opc1 =3D 0x00; opc1 < PPC_CPU_OPCODES_LEN; opc1++) {
> -        table =3D env->opcodes;
> -        handler =3D table[opc1];
> -        if (is_indirect_opcode(handler)) {
> -            /* opc2 is 5 bits long */
> -            for (opc2 =3D 0; opc2 < PPC_CPU_INDIRECT_OPCODES_LEN; opc2++=
) {
> -                table =3D env->opcodes;
> -                handler =3D env->opcodes[opc1];
> -                table =3D ind_table(handler);
> -                handler =3D table[opc2];
> -                if (is_indirect_opcode(handler)) {
> -                    table =3D ind_table(handler);
> -                    /* opc3 is 5 bits long */
> -                    for (opc3 =3D 0; opc3 < PPC_CPU_INDIRECT_OPCODES_LEN;
> -                            opc3++) {
> -                        handler =3D table[opc3];
> -                        if (is_indirect_opcode(handler)) {
> -                            table =3D ind_table(handler);
> -                            /* opc4 is 5 bits long */
> -                            for (opc4 =3D 0; opc4 < PPC_CPU_INDIRECT_OPC=
ODES_LEN;
> -                                 opc4++) {
> -                                handler =3D table[opc4];
> -                                if (handler->handler !=3D &gen_invalid) {
> -                                    printf("INSN: %02x %02x %02x %02x --=
 "
> -                                           "(%02d %04d %02d) : %s\n",
> -                                           opc1, opc2, opc3, opc4,
> -                                           opc1, (opc3 << 5) | opc2, opc=
4,
> -                                           handler->oname);
> -                                }
> -                            }
> -                        } else {
> -                            if (handler->handler !=3D &gen_invalid) {
> -                                /* Special hack to properly dump SPE ins=
ns */
> -                                p =3D strchr(handler->oname, '_');
> -                                if (p =3D=3D NULL) {
> -                                    printf("INSN: %02x %02x %02x (%02d %=
04d) : "
> -                                           "%s\n",
> -                                           opc1, opc2, opc3, opc1,
> -                                           (opc3 << 5) | opc2,
> -                                           handler->oname);
> -                                } else {
> -                                    q =3D "speundef";
> -                                    if ((p - handler->oname) !=3D strlen=
(q)
> -                                        || (memcmp(handler->oname, q, st=
rlen(q))
> -                                            !=3D 0)) {
> -                                        /* First instruction */
> -                                        printf("INSN: %02x %02x %02x"
> -                                               "(%02d %04d) : %.*s\n",
> -                                               opc1, opc2 << 1, opc3, op=
c1,
> -                                               (opc3 << 6) | (opc2 << 1),
> -                                               (int)(p - handler->oname),
> -                                               handler->oname);
> -                                    }
> -                                    if (strcmp(p + 1, q) !=3D 0) {
> -                                        /* Second instruction */
> -                                        printf("INSN: %02x %02x %02x "
> -                                               "(%02d %04d) : %s\n", opc=
1,
> -                                               (opc2 << 1) | 1, opc3, op=
c1,
> -                                               (opc3 << 6) | (opc2 << 1)=
 | 1,
> -                                               p + 1);
> -                                    }
> -                                }
> -                            }
> -                        }
> -                    }
> -                } else {
> -                    if (handler->handler !=3D &gen_invalid) {
> -                        printf("INSN: %02x %02x -- (%02d %04d) : %s\n",
> -                               opc1, opc2, opc1, opc2, handler->oname);
> -                    }
> -                }
> -            }
> -        } else {
> -            if (handler->handler !=3D &gen_invalid) {
> -                printf("INSN: %02x -- -- (%02d ----) : %s\n",
> -                       opc1, opc1, handler->oname);
> -            }
> -        }
> -    }
> -}
> -#endif
> -static int ppc_fixup_cpu(PowerPCCPU *cpu)
> -{
> -    CPUPPCState *env =3D &cpu->env;
> -
> -    /*
> -     * TCG doesn't (yet) emulate some groups of instructions that are
> -     * implemented on some otherwise supported CPUs (e.g. VSX and
> -     * decimal floating point instructions on POWER7).  We remove
> -     * unsupported instruction groups from the cpu state's instruction
> -     * masks and hope the guest can cope.  For at least the pseries
> -     * machine, the unavailability of these instructions can be
> -     * advertised to the guest via the device tree.
> -     */
> -    if ((env->insns_flags & ~PPC_TCG_INSNS)
> -        || (env->insns_flags2 & ~PPC_TCG_INSNS2)) {
> -        warn_report("Disabling some instructions which are not "
> -                    "emulated by TCG (0x%" PRIx64 ", 0x%" PRIx64 ")",
> -                    env->insns_flags & ~PPC_TCG_INSNS,
> -                    env->insns_flags2 & ~PPC_TCG_INSNS2);
> -    }
> -    env->insns_flags &=3D PPC_TCG_INSNS;
> -    env->insns_flags2 &=3D PPC_TCG_INSNS2;
> -    return 0;
> -}
> -
>  static void ppc_cpu_realize(DeviceState *dev, Error **errp)
>  {
>      CPUState *cs =3D CPU(dev);
> @@ -10131,40 +9770,12 @@ static void ppc_cpu_unrealize(DeviceState *dev)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(dev);
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> -    opc_handler_t **table, **table_2;
> -    int i, j, k;
> =20
>      pcc->parent_unrealize(dev);
> =20
>      cpu_remove_sync(CPU(cpu));
> =20
> -    for (i =3D 0; i < PPC_CPU_OPCODES_LEN; i++) {
> -        if (cpu->opcodes[i] =3D=3D &invalid_handler) {
> -            continue;
> -        }
> -        if (is_indirect_opcode(cpu->opcodes[i])) {
> -            table =3D ind_table(cpu->opcodes[i]);
> -            for (j =3D 0; j < PPC_CPU_INDIRECT_OPCODES_LEN; j++) {
> -                if (table[j] =3D=3D &invalid_handler) {
> -                    continue;
> -                }
> -                if (is_indirect_opcode(table[j])) {
> -                    table_2 =3D ind_table(table[j]);
> -                    for (k =3D 0; k < PPC_CPU_INDIRECT_OPCODES_LEN; k++)=
 {
> -                        if (table_2[k] !=3D &invalid_handler &&
> -                            is_indirect_opcode(table_2[k])) {
> -                            g_free((opc_handler_t *)((uintptr_t)table_2[=
k] &
> -                                                     ~PPC_INDIRECT));
> -                        }
> -                    }
> -                    g_free((opc_handler_t *)((uintptr_t)table[j] &
> -                                             ~PPC_INDIRECT));
> -                }
> -            }
> -            g_free((opc_handler_t *)((uintptr_t)cpu->opcodes[i] &
> -                ~PPC_INDIRECT));
> -        }
> -    }
> +    destroy_ppc_opcodes(cpu);
>  }
> =20
>  static gint ppc_cpu_compare_class_pvr(gconstpointer a, gconstpointer b)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--As/lDc+CbpoPjair
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCLhQwACgkQbDjKyiDZ
s5JC0RAAuYHpA1m+kU8BkoTkNZW7ldRkgV35BCrNgauiIPdQOgUKFU8IZ7eooiXp
p+1sJFBSMiBSriB/jmpaWxILQ6HtjLeH5bJDzGfPEYwfh/8rvMpzo/x67OmlYaNh
GQgvLF0nu86OwePm/6/t9ikjsq8llxnVMf/GR15QFuNO9HLT1erpReSVx5cJvq8c
+hlnaIN2ZTtUqHN4vU4J3FnbMvUz8uKqU2a+0VW2e3muxKxw2HIehvoMSqiZiJuz
LISP7YdIwwcte/OzZUgQsRaAwqQJgbSuefMDdXBITtpRn9shHnt/+RMNN+F4yFWD
6KTAkCM6LVAHwB29VlRmDS2Je2a+X4EoiB3Ax0ccWpI+ndwkw65A7+0hznWw7Afo
r/VsO3sPs3S3xnQ2VqxsTetLF79nytLhcbm2SFksGShP8jlKkNkFXxedbarjuyu5
XqTFq4o+TKlXct2t7dN0DevIXtirBxHOyW7zojdhdvuFu523JQ0SbYwTHHcRhaIl
fcgBX4fKO2XkTIElsDtZf5zpyEReFFdr5LYyyDVrfwuU2RyqG7zLBj82ITedozHX
gUrUT6XeKJM2876jJbggWu1/FrY37Vf7xa04res8N+ZLq2yFy2lsy3Jk9PdxTth/
7i3EXNuqvAZimrbM47flnVGCyt4SeL8XudvWUiIFuRUnkRakfvw=
=s9Vb
-----END PGP SIGNATURE-----

--As/lDc+CbpoPjair--

