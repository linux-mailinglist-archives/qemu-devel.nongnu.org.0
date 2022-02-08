Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DD24ACEF5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 03:38:24 +0100 (CET)
Received: from localhost ([::1]:47890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHGOc-0000RE-Qa
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 21:38:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nHGIW-0007qb-Ez; Mon, 07 Feb 2022 21:32:04 -0500
Received: from [2404:9400:2221:ea00::3] (port=45479 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nHGIR-00009b-K6; Mon, 07 Feb 2022 21:32:04 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jt6Tf1fGwz4xdG; Tue,  8 Feb 2022 13:31:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644287510;
 bh=CGo9prbs4JAnyEvfMqX7bA+Y57iGkMxJ8Hz5Lx1KUds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GDq3yKV2CNuIi2fwFnYE/e2L9LbEJH0aSM2IaO/qGgh9YTShRLhidke8GIzX4edth
 2TAw4koldn1A43UWY7GxP6VpDDaHB8oZRip3dZjpxcB2Y6qzvJLILpW+jQGQntcXTD
 8iuuD2yJRQ5EfNwXRa1NfxFNFW61/svOUQGJ2zC4=
Date: Tue, 8 Feb 2022 13:28:42 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 1/4] target/ppc: Remove powerpc_excp_legacy
Message-ID: <YgHVWucE88mdM3zY@yekko>
References: <20220207183036.1507882-1-farosas@linux.ibm.com>
 <20220207183036.1507882-2-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jBwh0DuK0GZ7p+/X"
Content-Disposition: inline
In-Reply-To: <20220207183036.1507882-2-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001, TVD_SUBJ_WIPE_DEBT=1.004,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jBwh0DuK0GZ7p+/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 07, 2022 at 03:30:33PM -0300, Fabiano Rosas wrote:
> Now that all CPU families have their own separate exception
> dispatching code we can remove powerpc_excp_legacy.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  target/ppc/excp_helper.c | 477 +--------------------------------------
>  1 file changed, 3 insertions(+), 474 deletions(-)

Nice!

>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 0050c8447f..c6646503aa 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -163,7 +163,7 @@ static void ppc_excp_debug_sw_tlb(CPUPPCState *env, i=
nt excp)
>               env->error_code);
>  }
> =20
> -
> +#if defined(TARGET_PPC64)
>  static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
>                                  target_ulong *msr)
>  {
> @@ -267,7 +267,6 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int e=
xcp_model, int excp,
>                                        target_ulong *new_msr,
>                                        target_ulong *vector)
>  {
> -#if defined(TARGET_PPC64)
>      CPUPPCState *env =3D &cpu->env;
>      bool mmu_all_on =3D ((msr >> MSR_IR) & 1) && ((msr >> MSR_DR) & 1);
>      bool hv_escalation =3D !(msr & MSR_HVB) && (*new_msr & MSR_HVB);
> @@ -356,8 +355,8 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int e=
xcp_model, int excp,
>              *vector |=3D 0xc000000000003000ull; /* Apply scv's AIL=3D3 o=
ffset */
>          }
>      }
> -#endif
>  }
> +#endif
> =20
>  static void powerpc_set_excp_state(PowerPCCPU *cpu,
>                                            target_ulong vector, target_ul=
ong msr)
> @@ -1641,476 +1640,6 @@ static inline void powerpc_excp_books(PowerPCCPU =
*cpu, int excp)
>  }
>  #endif
> =20
> -/*
> - * Note that this function should be greatly optimized when called
> - * with a constant excp, from ppc_hw_interrupt
> - */
> -static inline void powerpc_excp_legacy(PowerPCCPU *cpu, int excp)
> -{
> -    CPUState *cs =3D CPU(cpu);
> -    CPUPPCState *env =3D &cpu->env;
> -    int excp_model =3D env->excp_model;
> -    target_ulong msr, new_msr, vector;
> -    int srr0, srr1, lev =3D -1;
> -
> -    if (excp <=3D POWERPC_EXCP_NONE || excp >=3D POWERPC_EXCP_NB) {
> -        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> -    }
> -
> -    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
> -                  " =3D> %s (%d) error=3D%02x\n", env->nip, powerpc_excp=
_name(excp),
> -                  excp, env->error_code);
> -
> -    /* new srr1 value excluding must-be-zero bits */
> -    if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
> -        msr =3D env->msr;
> -    } else {
> -        msr =3D env->msr & ~0x783f0000ULL;
> -    }
> -
> -    /*
> -     * new interrupt handler msr preserves existing HV and ME unless
> -     * explicitly overriden
> -     */
> -    new_msr =3D env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
> -
> -    /* target registers */
> -    srr0 =3D SPR_SRR0;
> -    srr1 =3D SPR_SRR1;
> -
> -    /*
> -     * check for special resume at 0x100 from doze/nap/sleep/winkle on
> -     * P7/P8/P9
> -     */
> -    if (env->resume_as_sreset) {
> -        excp =3D powerpc_reset_wakeup(cs, env, excp, &msr);
> -    }
> -
> -    /*
> -     * Hypervisor emulation assistance interrupt only exists on server
> -     * arch 2.05 server or later. We also don't want to generate it if
> -     * we don't have HVB in msr_mask (PAPR mode).
> -     */
> -    if (excp =3D=3D POWERPC_EXCP_HV_EMU
> -#if defined(TARGET_PPC64)
> -        && !(mmu_is_64bit(env->mmu_model) && (env->msr_mask & MSR_HVB))
> -#endif /* defined(TARGET_PPC64) */
> -
> -    ) {
> -        excp =3D POWERPC_EXCP_PROGRAM;
> -    }
> -
> -#ifdef TARGET_PPC64
> -    /*
> -     * SPEU and VPU share the same IVOR but they exist in different
> -     * processors. SPEU is e500v1/2 only and VPU is e6500 only.
> -     */
> -    if (excp_model =3D=3D POWERPC_EXCP_BOOKE && excp =3D=3D POWERPC_EXCP=
_VPU) {
> -        excp =3D POWERPC_EXCP_SPEU;
> -    }
> -#endif
> -
> -    vector =3D env->excp_vectors[excp];
> -    if (vector =3D=3D (target_ulong)-1ULL) {
> -        cpu_abort(cs, "Raised an exception without defined vector %d\n",
> -                  excp);
> -    }
> -
> -    vector |=3D env->excp_prefix;
> -
> -    switch (excp) {
> -    case POWERPC_EXCP_CRITICAL:    /* Critical input                    =
     */
> -        switch (excp_model) {
> -        case POWERPC_EXCP_40x:
> -            srr0 =3D SPR_40x_SRR2;
> -            srr1 =3D SPR_40x_SRR3;
> -            break;
> -        case POWERPC_EXCP_BOOKE:
> -            srr0 =3D SPR_BOOKE_CSRR0;
> -            srr1 =3D SPR_BOOKE_CSRR1;
> -            break;
> -        case POWERPC_EXCP_6xx:
> -            break;
> -        default:
> -            goto excp_invalid;
> -        }
> -        break;
> -    case POWERPC_EXCP_MCHECK:    /* Machine check exception             =
     */
> -        if (msr_me =3D=3D 0) {
> -            /*
> -             * Machine check exception is not enabled.  Enter
> -             * checkstop state.
> -             */
> -            fprintf(stderr, "Machine check while not allowed. "
> -                    "Entering checkstop state\n");
> -            if (qemu_log_separate()) {
> -                qemu_log("Machine check while not allowed. "
> -                        "Entering checkstop state\n");
> -            }
> -            cs->halted =3D 1;
> -            cpu_interrupt_exittb(cs);
> -        }
> -        if (env->msr_mask & MSR_HVB) {
> -            /*
> -             * ISA specifies HV, but can be delivered to guest with HV
> -             * clear (e.g., see FWNMI in PAPR).
> -             */
> -            new_msr |=3D (target_ulong)MSR_HVB;
> -        }
> -
> -        /* machine check exceptions don't have ME set */
> -        new_msr &=3D ~((target_ulong)1 << MSR_ME);
> -
> -        /* XXX: should also have something loaded in DAR / DSISR */
> -        switch (excp_model) {
> -        case POWERPC_EXCP_40x:
> -            srr0 =3D SPR_40x_SRR2;
> -            srr1 =3D SPR_40x_SRR3;
> -            break;
> -        case POWERPC_EXCP_BOOKE:
> -            /* FIXME: choose one or the other based on CPU type */
> -            srr0 =3D SPR_BOOKE_MCSRR0;
> -            srr1 =3D SPR_BOOKE_MCSRR1;
> -
> -            env->spr[SPR_BOOKE_CSRR0] =3D env->nip;
> -            env->spr[SPR_BOOKE_CSRR1] =3D msr;
> -            break;
> -        default:
> -            break;
> -        }
> -        break;
> -    case POWERPC_EXCP_DSI:       /* Data storage exception              =
     */
> -        trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
> -        break;
> -    case POWERPC_EXCP_ISI:       /* Instruction storage exception       =
     */
> -        trace_ppc_excp_isi(msr, env->nip);
> -        msr |=3D env->error_code;
> -        break;
> -    case POWERPC_EXCP_EXTERNAL:  /* External input                      =
     */
> -    {
> -        bool lpes0;
> -
> -        cs =3D CPU(cpu);
> -
> -        /*
> -         * Exception targeting modifiers
> -         *
> -         * LPES0 is supported on POWER7/8/9
> -         * LPES1 is not supported (old iSeries mode)
> -         *
> -         * On anything else, we behave as if LPES0 is 1
> -         * (externals don't alter MSR:HV)
> -         */
> -#if defined(TARGET_PPC64)
> -        if (excp_model =3D=3D POWERPC_EXCP_POWER7 ||
> -            excp_model =3D=3D POWERPC_EXCP_POWER8 ||
> -            excp_model =3D=3D POWERPC_EXCP_POWER9 ||
> -            excp_model =3D=3D POWERPC_EXCP_POWER10) {
> -            lpes0 =3D !!(env->spr[SPR_LPCR] & LPCR_LPES0);
> -        } else
> -#endif /* defined(TARGET_PPC64) */
> -        {
> -            lpes0 =3D true;
> -        }
> -
> -        if (!lpes0) {
> -            new_msr |=3D (target_ulong)MSR_HVB;
> -            new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> -            srr0 =3D SPR_HSRR0;
> -            srr1 =3D SPR_HSRR1;
> -        }
> -        if (env->mpic_proxy) {
> -            /* IACK the IRQ on delivery */
> -            env->spr[SPR_BOOKE_EPR] =3D ldl_phys(cs->as, env->mpic_iack);
> -        }
> -        break;
> -    }
> -    case POWERPC_EXCP_ALIGN:     /* Alignment exception                 =
     */
> -        /* Get rS/rD and rA from faulting opcode */
> -        /*
> -         * Note: the opcode fields will not be set properly for a
> -         * direct store load/store, but nobody cares as nobody
> -         * actually uses direct store segments.
> -         */
> -        env->spr[SPR_DSISR] |=3D (env->error_code & 0x03FF0000) >> 16;
> -        break;
> -    case POWERPC_EXCP_PROGRAM:   /* Program exception                   =
     */
> -        switch (env->error_code & ~0xF) {
> -        case POWERPC_EXCP_FP:
> -            if ((msr_fe0 =3D=3D 0 && msr_fe1 =3D=3D 0) || msr_fp =3D=3D =
0) {
> -                trace_ppc_excp_fp_ignore();
> -                cs->exception_index =3D POWERPC_EXCP_NONE;
> -                env->error_code =3D 0;
> -                return;
> -            }
> -
> -            /*
> -             * FP exceptions always have NIP pointing to the faulting
> -             * instruction, so always use store_next and claim we are
> -             * precise in the MSR.
> -             */
> -            msr |=3D 0x00100000;
> -            env->spr[SPR_BOOKE_ESR] =3D ESR_FP;
> -            break;
> -        case POWERPC_EXCP_INVAL:
> -            trace_ppc_excp_inval(env->nip);
> -            msr |=3D 0x00080000;
> -            env->spr[SPR_BOOKE_ESR] =3D ESR_PIL;
> -            break;
> -        case POWERPC_EXCP_PRIV:
> -            msr |=3D 0x00040000;
> -            env->spr[SPR_BOOKE_ESR] =3D ESR_PPR;
> -            break;
> -        case POWERPC_EXCP_TRAP:
> -            msr |=3D 0x00020000;
> -            env->spr[SPR_BOOKE_ESR] =3D ESR_PTR;
> -            break;
> -        default:
> -            /* Should never occur */
> -            cpu_abort(cs, "Invalid program exception %d. Aborting\n",
> -                      env->error_code);
> -            break;
> -        }
> -        break;
> -    case POWERPC_EXCP_SYSCALL:   /* System call exception               =
     */
> -        lev =3D env->error_code;
> -
> -        if ((lev =3D=3D 1) && cpu->vhyp) {
> -            dump_hcall(env);
> -        } else {
> -            dump_syscall(env);
> -        }
> -
> -        /*
> -         * We need to correct the NIP which in this case is supposed
> -         * to point to the next instruction
> -         */
> -        env->nip +=3D 4;
> -
> -        /* "PAPR mode" built-in hypercall emulation */
> -        if ((lev =3D=3D 1) && cpu->vhyp) {
> -            PPCVirtualHypervisorClass *vhc =3D
> -                PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
> -            vhc->hypercall(cpu->vhyp, cpu);
> -            return;
> -        }
> -        if (lev =3D=3D 1) {
> -            new_msr |=3D (target_ulong)MSR_HVB;
> -        }
> -        break;
> -    case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                =
     */
> -        lev =3D env->error_code;
> -        dump_syscall(env);
> -        env->nip +=3D 4;
> -        new_msr |=3D env->msr & ((target_ulong)1 << MSR_EE);
> -        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> -
> -        vector +=3D lev * 0x20;
> -
> -        env->lr =3D env->nip;
> -        env->ctr =3D msr;
> -        break;
> -    case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception=
     */
> -    case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable     =
     */
> -    case POWERPC_EXCP_DECR:      /* Decrementer exception               =
     */
> -        break;
> -    case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt      =
     */
> -        /* FIT on 4xx */
> -        trace_ppc_excp_print("FIT");
> -        break;
> -    case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt            =
     */
> -        trace_ppc_excp_print("WDT");
> -        switch (excp_model) {
> -        case POWERPC_EXCP_BOOKE:
> -            srr0 =3D SPR_BOOKE_CSRR0;
> -            srr1 =3D SPR_BOOKE_CSRR1;
> -            break;
> -        default:
> -            break;
> -        }
> -        break;
> -    case POWERPC_EXCP_DTLB:      /* Data TLB error                      =
     */
> -    case POWERPC_EXCP_ITLB:      /* Instruction TLB error               =
     */
> -        break;
> -    case POWERPC_EXCP_DEBUG:     /* Debug interrupt                     =
     */
> -        if (env->flags & POWERPC_FLAG_DE) {
> -            /* FIXME: choose one or the other based on CPU type */
> -            srr0 =3D SPR_BOOKE_DSRR0;
> -            srr1 =3D SPR_BOOKE_DSRR1;
> -
> -            env->spr[SPR_BOOKE_CSRR0] =3D env->nip;
> -            env->spr[SPR_BOOKE_CSRR1] =3D msr;
> -
> -            /* DBSR already modified by caller */
> -        } else {
> -            cpu_abort(cs, "Debug exception triggered on unsupported mode=
l\n");
> -        }
> -        break;
> -    case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable=
/VPU  */
> -        env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
> -        break;
> -    case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt         =
     */
> -        break;
> -    case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt=
     */
> -        srr0 =3D SPR_BOOKE_CSRR0;
> -        srr1 =3D SPR_BOOKE_CSRR1;
> -        break;
> -    case POWERPC_EXCP_RESET:     /* System reset exception              =
     */
> -        /* A power-saving exception sets ME, otherwise it is unchanged */
> -        if (msr_pow) {
> -            /* indicate that we resumed from power save mode */
> -            msr |=3D 0x10000;
> -            new_msr |=3D ((target_ulong)1 << MSR_ME);
> -        }
> -        if (env->msr_mask & MSR_HVB) {
> -            /*
> -             * ISA specifies HV, but can be delivered to guest with HV
> -             * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
> -             */
> -            new_msr |=3D (target_ulong)MSR_HVB;
> -        } else {
> -            if (msr_pow) {
> -                cpu_abort(cs, "Trying to deliver power-saving system res=
et "
> -                          "exception %d with no HV support\n", excp);
> -            }
> -        }
> -        break;
> -    case POWERPC_EXCP_DSEG:      /* Data segment exception              =
     */
> -    case POWERPC_EXCP_ISEG:      /* Instruction segment exception       =
     */
> -    case POWERPC_EXCP_TRACE:     /* Trace exception                     =
     */
> -        break;
> -    case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage excep=
tion */
> -        msr |=3D env->error_code;
> -        /* fall through */
> -    case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception    =
     */
> -    case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception   =
     */
> -    case POWERPC_EXCP_HDSEG:     /* Hypervisor data segment exception   =
     */
> -    case POWERPC_EXCP_HISEG:     /* Hypervisor instruction segment excep=
tion */
> -    case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt       =
     */
> -    case POWERPC_EXCP_HV_EMU:
> -    case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization           =
     */
> -        srr0 =3D SPR_HSRR0;
> -        srr1 =3D SPR_HSRR1;
> -        new_msr |=3D (target_ulong)MSR_HVB;
> -        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> -        break;
> -    case POWERPC_EXCP_VPU:       /* Vector unavailable exception        =
     */
> -    case POWERPC_EXCP_VSXU:       /* VSX unavailable exception          =
     */
> -    case POWERPC_EXCP_FU:         /* Facility unavailable exception     =
     */
> -#ifdef TARGET_PPC64
> -        env->spr[SPR_FSCR] |=3D ((target_ulong)env->error_code << 56);
> -#endif
> -        break;
> -    case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exce=
ption */
> -#ifdef TARGET_PPC64
> -        env->spr[SPR_HFSCR] |=3D ((target_ulong)env->error_code << FSCR_=
IC_POS);
> -        srr0 =3D SPR_HSRR0;
> -        srr1 =3D SPR_HSRR1;
> -        new_msr |=3D (target_ulong)MSR_HVB;
> -        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> -#endif
> -        break;
> -    case POWERPC_EXCP_PIT:       /* Programmable interval timer interrup=
t    */
> -        trace_ppc_excp_print("PIT");
> -        break;
> -    case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error         =
     */
> -    case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                  =
     */
> -    case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                 =
     */
> -        switch (excp_model) {
> -        case POWERPC_EXCP_6xx:
> -            /* Swap temporary saved registers with GPRs */
> -            if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
> -                new_msr |=3D (target_ulong)1 << MSR_TGPR;
> -                hreg_swap_gpr_tgpr(env);
> -            }
> -            /* fall through */
> -        case POWERPC_EXCP_7xx:
> -            ppc_excp_debug_sw_tlb(env, excp);
> -
> -            msr |=3D env->crf[0] << 28;
> -            msr |=3D env->error_code; /* key, D/I, S/L bits */
> -            /* Set way using a LRU mechanism */
> -            msr |=3D ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
> -            break;
> -        default:
> -            cpu_abort(cs, "Invalid TLB miss exception\n");
> -            break;
> -        }
> -        break;
> -    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interru=
pt   */
> -    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interr=
upt  */
> -    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interru=
pt   */
> -    case POWERPC_EXCP_FPA:       /* Floating-point assist exception     =
     */
> -    case POWERPC_EXCP_DABR:      /* Data address breakpoint             =
     */
> -    case POWERPC_EXCP_IABR:      /* Instruction address breakpoint      =
     */
> -    case POWERPC_EXCP_SMI:       /* System management interrupt         =
     */
> -    case POWERPC_EXCP_THERM:     /* Thermal interrupt                   =
     */
> -    case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interru=
pt   */
> -    case POWERPC_EXCP_VPUA:      /* Vector assist exception             =
     */
> -    case POWERPC_EXCP_SOFTP:     /* Soft patch exception                =
     */
> -    case POWERPC_EXCP_MAINT:     /* Maintenance exception               =
     */
> -    case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint        =
     */
> -    case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint    =
     */
> -        cpu_abort(cs, "%s exception not implemented\n",
> -                  powerpc_excp_name(excp));
> -        break;
> -    default:
> -    excp_invalid:
> -        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> -        break;
> -    }
> -
> -    /* Sanity check */
> -    if (!(env->msr_mask & MSR_HVB)) {
> -        if (new_msr & MSR_HVB) {
> -            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
> -                      "no HV support\n", excp);
> -        }
> -        if (srr0 =3D=3D SPR_HSRR0) {
> -            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with=
 "
> -                      "no HV support\n", excp);
> -        }
> -    }
> -
> -    /*
> -     * Sort out endianness of interrupt, this differs depending on the
> -     * CPU, the HV mode, etc...
> -     */
> -    if (ppc_interrupts_little_endian(cpu, !!(new_msr & MSR_HVB))) {
> -        new_msr |=3D (target_ulong)1 << MSR_LE;
> -    }
> -
> -#if defined(TARGET_PPC64)
> -    if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
> -        if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
> -            /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
> -            new_msr |=3D (target_ulong)1 << MSR_CM;
> -        } else {
> -            vector =3D (uint32_t)vector;
> -        }
> -    } else {
> -        if (!msr_isf && !mmu_is_64bit(env->mmu_model)) {
> -            vector =3D (uint32_t)vector;
> -        } else {
> -            new_msr |=3D (target_ulong)1 << MSR_SF;
> -        }
> -    }
> -#endif
> -
> -    if (excp !=3D POWERPC_EXCP_SYSCALL_VECTORED) {
> -        /* Save PC */
> -        env->spr[srr0] =3D env->nip;
> -
> -        /* Save MSR */
> -        env->spr[srr1] =3D msr;
> -    }
> -
> -    /* This can update new_msr and vector if AIL applies */
> -    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
> -
> -    powerpc_set_excp_state(cpu, vector, new_msr);
> -}
> -
>  static void powerpc_excp(PowerPCCPU *cpu, int excp)
>  {
>      CPUPPCState *env =3D &cpu->env;
> @@ -2139,7 +1668,7 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
>          powerpc_excp_books(cpu, excp);
>          break;
>      default:
> -        powerpc_excp_legacy(cpu, excp);
> +        g_assert_not_reached();
>      }
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jBwh0DuK0GZ7p+/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIB1VEACgkQgypY4gEw
YSLo3xAAl/+cHlzIv+UroGvZa74N/4J7rISGixlkkoYhqIo/RFPLWQamQ5A+SmuU
jEsYK71j9UyBC/n5qR90VED+E9Nua/qZKGF3/l3lFgiCFZKktzem/j2TdutRKjnu
92HrFwUJHZYBFMSmseLUYELKjZI+4CK73p2J/hhEOjNFEU5EQF6q93YeKCGRFjCg
5WEY9QRY20ipVV5xRaIOfX3fv4P2Xb2oF9ihLV9veimQkkjE8BuFlxy0l5EU63Xp
0Y1R4iD9/VTJidHr06hRi9MtlWpylelQlE3svgaYVHAFpGCjnqPrqhYs/yHz504X
eOUNIwE4jhu7oFLAO3RLcjQgJW/B5VcEmULCld+NdOC9vtB2tQZNehWbPBi984hq
f0DINOGjRbdGDtWG6sSgqeAlZG76g0lS59beY1EAFBXjjPVYHmpHLd5yj3zsLrDo
derkpVGUz1xc3+ewdyRNCo7i6gIVwpI+XRlJttp+XI3huk4W8z98Qfl7hnoFklOj
5ItDLi/IvPchIKNf1L/07meCRYcouitTwXfdfoIY/24+BxHr4VR/oktxsmiN+RjB
ncg2TXKf39+6r8TJJ3Z9NYzWcK9Ij1hA0Zyz1E9n1efacqZI8WSVU7HUHbSHSUP4
XHBrM2sqDmxWVRV9pqt7Nq+3mJ2qUb2Cc2NVvWQhvkXeQ4QBOmg=
=Y/38
-----END PGP SIGNATURE-----

--jBwh0DuK0GZ7p+/X--

