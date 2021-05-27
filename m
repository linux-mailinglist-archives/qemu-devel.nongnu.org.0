Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6614C392710
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 08:03:09 +0200 (CEST)
Received: from localhost ([::1]:42802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm96p-0000bG-SA
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 02:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lm95w-0008Ax-Nn
 for qemu-devel@nongnu.org; Thu, 27 May 2021 02:02:12 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:26361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lm95u-00016Z-1B
 for qemu-devel@nongnu.org; Thu, 27 May 2021 02:02:12 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-_DPB1IfeMTOR13kxC3CEeg-1; Thu, 27 May 2021 02:02:02 -0400
X-MC-Unique: _DPB1IfeMTOR13kxC3CEeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5B22107ACC7;
 Thu, 27 May 2021 06:02:00 +0000 (UTC)
Received: from bahia.lan (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 108715D767;
 Thu, 27 May 2021 06:01:57 +0000 (UTC)
Date: Thu, 27 May 2021 08:01:56 +0200
From: Greg Kurz <groug@kaod.org>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 2/5] target/ppc: remove ppc_cpu_dump_statistics
Message-ID: <20210527080156.2b861a9b@bahia.lan>
In-Reply-To: <20210526202104.127910-3-bruno.larsen@eldorado.org.br>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-3-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
 luis.pires@eldorado.org.br, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 May 2021 17:21:01 -0300
"Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> wrote:

> This function requires surce code modification to be useful, which means

s/surce/source

> it probably is not used often, and the move to using decodetree means
> the statistics won't even be collected anymore.
>=20
> Also removed setting dump_statistics in ppc_cpu_realize, since it was

s/ppc_cpu_realize/ppc_cpu_class_init

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
> -                                    op1, op2, op3, op1, (op3 << 5) | op2=
,
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


