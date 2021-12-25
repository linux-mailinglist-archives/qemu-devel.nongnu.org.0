Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5EF47F27F
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Dec 2021 08:19:16 +0100 (CET)
Received: from localhost ([::1]:42654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n11Kk-0003Ve-Ge
	for lists+qemu-devel@lfdr.de; Sat, 25 Dec 2021 02:19:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n110m-00046i-J7; Sat, 25 Dec 2021 01:58:38 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=54241
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n110i-0006jk-Jv; Sat, 25 Dec 2021 01:58:36 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JLZWx4JxNz4xhj; Sat, 25 Dec 2021 17:58:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1640415501;
 bh=TiRtkumT5FbSOSmvGt9LxHFXlHbSnhbH0kKcWi+HF5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WMP/cJkoKxo836/ZdMsj8MMZ07TC/BOnSnzBCtsiCFV8o1eOewsAJuRWs7CIv6i/o
 tKajtpqPCiR9oSAR+sdnz7kTz8l+Wu9gilUqJbC08BL4ZyQg7mUYFRlHMg39PryXKP
 mn0OsUoyumGQbjhZTAQL/MttkQkYHHdMCAVCzy9Q=
Date: Sat, 25 Dec 2021 17:35:18 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC v2 05/12] target/ppc: powerpc_excp: Standardize arguments
 to interrupt code
Message-ID: <Yca7ptuQbgonc6e8@yekko>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
 <20211220181903.3456898-6-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2O+7BD95UB/bZ7Ki"
Content-Disposition: inline
In-Reply-To: <20211220181903.3456898-6-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--2O+7BD95UB/bZ7Ki
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 20, 2021 at 03:18:56PM -0300, Fabiano Rosas wrote:
> In preparation to moving the interrupt code into separate functions,
> create a PPCIntrArgs structure to serve as a consistent API.

The patch doesn't seem to match this description - I see no new
structure here.

>=20
> No functional change intended.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  target/ppc/excp_helper.c | 213 +++++++++++++++++++++------------------
>  1 file changed, 113 insertions(+), 100 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 45641f6d1d..f478ff8a87 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -164,7 +164,7 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPCS=
tate *env, int excp,
>  static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, i=
nt excp,
>                                        target_ulong msr,
>                                        target_ulong *new_msr,
> -                                      target_ulong *vector)
> +                                      target_ulong *new_nip)
>  {
>  #if defined(TARGET_PPC64)
>      CPUPPCState *env =3D &cpu->env;
> @@ -241,9 +241,9 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu=
, int excp_model, int excp,
> =20
>      if (excp !=3D POWERPC_EXCP_SYSCALL_VECTORED) {
>          if (ail =3D=3D 2) {
> -            *vector |=3D 0x0000000000018000ull;
> +            *new_nip |=3D 0x0000000000018000ull;
>          } else if (ail =3D=3D 3) {
> -            *vector |=3D 0xc000000000004000ull;
> +            *new_nip |=3D 0xc000000000004000ull;
>          }
>      } else {
>          /*
> @@ -251,15 +251,15 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *c=
pu, int excp_model, int excp,
>           * only the MSR. AIL=3D3 replaces the 0x17000 base with 0xc...30=
00.
>           */
>          if (ail =3D=3D 3) {
> -            *vector &=3D ~0x0000000000017000ull; /* Un-apply the base of=
fset */
> -            *vector |=3D 0xc000000000003000ull; /* Apply scv's AIL=3D3 o=
ffset */
> +            *new_nip &=3D ~0x0000000000017000ull; /* Un-apply the base o=
ffset */
> +            *new_nip |=3D 0xc000000000003000ull; /* Apply scv's AIL=3D3 =
offset */
>          }
>      }
>  #endif
>  }
> =20
> -static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
> -                                          target_ulong vector, target_ul=
ong msr)
> +static inline void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong =
new_nip,
> +                                          target_ulong new_msr)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
> @@ -272,9 +272,9 @@ static inline void powerpc_set_excp_state(PowerPCCPU =
*cpu,
>       * will prevent setting of the HV bit which some exceptions might ne=
ed
>       * to do.
>       */
> -    env->msr =3D msr & env->msr_mask;
> +    env->msr =3D new_msr & env->msr_mask;
>      hreg_compute_hflags(env);
> -    env->nip =3D vector;
> +    env->nip =3D new_nip;
>      /* Reset exception state */
>      cs->exception_index =3D POWERPC_EXCP_NONE;
>      env->error_code =3D 0;
> @@ -289,6 +289,15 @@ static inline void powerpc_set_excp_state(PowerPCCPU=
 *cpu,
>      check_tlb_flush(env, false);
>  }
> =20
> +typedef struct PPCIntrArgs {
> +    target_ulong nip;
> +    target_ulong msr;
> +    target_ulong new_nip;
> +    target_ulong new_msr;
> +    int sprn_srr0;
> +    int sprn_srr1;
> +} PPCIntrArgs;
> +
>  /*
>   * Note that this function should be greatly optimized when called
>   * with a constant excp, from ppc_hw_interrupt
> @@ -298,35 +307,35 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp)
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
>      int excp_model =3D env->excp_model;
> -    target_ulong msr, new_msr, vector;
> -    int srr0, srr1, lev =3D -1;
> +    PPCIntrArgs regs;
> +    int lev =3D -1;
> =20
>      qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
>                    " =3D> %08x (%02x)\n", env->nip, excp, env->error_code=
);
> =20
>      /* new srr1 value excluding must-be-zero bits */
>      if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
> -        msr =3D env->msr;
> +        regs.msr =3D env->msr;
>      } else {
> -        msr =3D env->msr & ~0x783f0000ULL;
> +        regs.msr =3D env->msr & ~0x783f0000ULL;
>      }
> +    regs.nip =3D env->nip;
> =20
>      /*
>       * new interrupt handler msr preserves existing HV and ME unless
>       * explicitly overriden
>       */
> -    new_msr =3D env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
> +    regs.new_msr =3D env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
> =20
> -    /* target registers */
> -    srr0 =3D SPR_SRR0;
> -    srr1 =3D SPR_SRR1;
> +    regs.sprn_srr0 =3D SPR_SRR0;
> +    regs.sprn_srr1 =3D SPR_SRR1;
> =20
>      /*
>       * check for special resume at 0x100 from doze/nap/sleep/winkle on
>       * P7/P8/P9
>       */
>      if (env->resume_as_sreset) {
> -        excp =3D powerpc_reset_wakeup(cs, env, excp, &msr);
> +        excp =3D powerpc_reset_wakeup(cs, env, excp, &regs.msr);
>      }
> =20
>      /*
> @@ -353,13 +362,13 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp)
>      }
>  #endif
> =20
> -    vector =3D env->excp_vectors[excp];
> -    if (vector =3D=3D (target_ulong)-1ULL) {
> +    regs.new_nip =3D env->excp_vectors[excp];
> +    if (regs.new_nip =3D=3D (target_ulong)-1ULL) {
>          cpu_abort(cs, "Raised an exception without defined vector %d\n",
>                    excp);
>      }
> =20
> -    vector |=3D env->excp_prefix;
> +    regs.new_nip |=3D env->excp_prefix;
> =20
>      switch (excp) {
>      case POWERPC_EXCP_NONE:
> @@ -368,12 +377,12 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp)
>      case POWERPC_EXCP_CRITICAL:    /* Critical input                    =
     */
>          switch (excp_model) {
>          case POWERPC_EXCP_40x:
> -            srr0 =3D SPR_40x_SRR2;
> -            srr1 =3D SPR_40x_SRR3;
> +            regs.sprn_srr0 =3D SPR_40x_SRR2;
> +            regs.sprn_srr1 =3D SPR_40x_SRR3;
>              break;
>          case POWERPC_EXCP_BOOKE:
> -            srr0 =3D SPR_BOOKE_CSRR0;
> -            srr1 =3D SPR_BOOKE_CSRR1;
> +            regs.sprn_srr0 =3D SPR_BOOKE_CSRR0;
> +            regs.sprn_srr1 =3D SPR_BOOKE_CSRR1;
>              break;
>          case POWERPC_EXCP_G2:
>              break;
> @@ -401,25 +410,25 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp)
>               * ISA specifies HV, but can be delivered to guest with HV
>               * clear (e.g., see FWNMI in PAPR).
>               */
> -            new_msr |=3D (target_ulong)MSR_HVB;
> +            regs.new_msr |=3D (target_ulong)MSR_HVB;
>          }
> =20
>          /* machine check exceptions don't have ME set */
> -        new_msr &=3D ~((target_ulong)1 << MSR_ME);
> +        regs.new_msr &=3D ~((target_ulong)1 << MSR_ME);
> =20
>          /* XXX: should also have something loaded in DAR / DSISR */
>          switch (excp_model) {
>          case POWERPC_EXCP_40x:
> -            srr0 =3D SPR_40x_SRR2;
> -            srr1 =3D SPR_40x_SRR3;
> +            regs.sprn_srr0 =3D SPR_40x_SRR2;
> +            regs.sprn_srr1 =3D SPR_40x_SRR3;
>              break;
>          case POWERPC_EXCP_BOOKE:
>              /* FIXME: choose one or the other based on CPU type */
> -            srr0 =3D SPR_BOOKE_MCSRR0;
> -            srr1 =3D SPR_BOOKE_MCSRR1;
> +            regs.sprn_srr0 =3D SPR_BOOKE_MCSRR0;
> +            regs.sprn_srr1 =3D SPR_BOOKE_MCSRR1;
> =20
> -            env->spr[SPR_BOOKE_CSRR0] =3D env->nip;
> -            env->spr[SPR_BOOKE_CSRR1] =3D msr;
> +            env->spr[SPR_BOOKE_CSRR0] =3D regs.nip;
> +            env->spr[SPR_BOOKE_CSRR1] =3D regs.msr;
>              break;
>          default:
>              break;
> @@ -429,8 +438,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp)
>          trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
>          break;
>      case POWERPC_EXCP_ISI:       /* Instruction storage exception       =
     */
> -        trace_ppc_excp_isi(msr, env->nip);
> -        msr |=3D env->error_code;
> +        trace_ppc_excp_isi(regs.msr, regs.nip);
> +        regs.msr |=3D env->error_code;
>          break;
>      case POWERPC_EXCP_EXTERNAL:  /* External input                      =
     */
>      {
> @@ -460,10 +469,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp)
>          }
> =20
>          if (!lpes0) {
> -            new_msr |=3D (target_ulong)MSR_HVB;
> -            new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> -            srr0 =3D SPR_HSRR0;
> -            srr1 =3D SPR_HSRR1;
> +            regs.new_msr |=3D (target_ulong)MSR_HVB;
> +            regs.new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> +            regs.sprn_srr0 =3D SPR_HSRR0;
> +            regs.sprn_srr1 =3D SPR_HSRR1;
>          }
>          if (env->mpic_proxy) {
>              /* IACK the IRQ on delivery */
> @@ -495,20 +504,20 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp)
>               * instruction, so always use store_next and claim we are
>               * precise in the MSR.
>               */
> -            msr |=3D 0x00100000;
> +            regs.msr |=3D 0x00100000;
>              env->spr[SPR_BOOKE_ESR] =3D ESR_FP;
>              break;
>          case POWERPC_EXCP_INVAL:
> -            trace_ppc_excp_inval(env->nip);
> -            msr |=3D 0x00080000;
> +            trace_ppc_excp_inval(regs.nip);
> +            regs.msr |=3D 0x00080000;
>              env->spr[SPR_BOOKE_ESR] =3D ESR_PIL;
>              break;
>          case POWERPC_EXCP_PRIV:
> -            msr |=3D 0x00040000;
> +            regs.msr |=3D 0x00040000;
>              env->spr[SPR_BOOKE_ESR] =3D ESR_PPR;
>              break;
>          case POWERPC_EXCP_TRAP:
> -            msr |=3D 0x00020000;
> +            regs.msr |=3D 0x00020000;
>              env->spr[SPR_BOOKE_ESR] =3D ESR_PTR;
>              break;
>          default:
> @@ -529,9 +538,12 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp)
> =20
>          /*
>           * We need to correct the NIP which in this case is supposed
> -         * to point to the next instruction
> +         * to point to the next instruction. We also set env->nip here
> +         * because the modification needs to be accessible by the
> +         * virtual hypervisor code below.
>           */
> -        env->nip +=3D 4;
> +        regs.nip +=3D 4;
> +        env->nip =3D regs.nip;
> =20
>          /* "PAPR mode" built-in hypercall emulation */
>          if ((lev =3D=3D 1) && cpu->vhyp) {
> @@ -540,21 +552,22 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp)
>              vhc->hypercall(cpu->vhyp, cpu);
>              return;
>          }
> +
>          if (lev =3D=3D 1) {
> -            new_msr |=3D (target_ulong)MSR_HVB;
> +            regs.new_msr |=3D (target_ulong)MSR_HVB;
>          }
>          break;
>      case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                =
     */
>          lev =3D env->error_code;
>          dump_syscall(env);
> -        env->nip +=3D 4;
> -        new_msr |=3D env->msr & ((target_ulong)1 << MSR_EE);
> -        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> +        regs.nip +=3D 4;
> +        regs.new_msr |=3D env->msr & ((target_ulong)1 << MSR_EE);
> +        regs.new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> =20
> -        vector +=3D lev * 0x20;
> +        regs.new_nip +=3D lev * 0x20;
> =20
> -        env->lr =3D env->nip;
> -        env->ctr =3D msr;
> +        env->lr =3D regs.nip;
> +        env->ctr =3D regs.msr;
>          break;
>      case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception=
     */
>      case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable     =
     */
> @@ -568,8 +581,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp)
>          trace_ppc_excp_print("WDT");
>          switch (excp_model) {
>          case POWERPC_EXCP_BOOKE:
> -            srr0 =3D SPR_BOOKE_CSRR0;
> -            srr1 =3D SPR_BOOKE_CSRR1;
> +            regs.sprn_srr0 =3D SPR_BOOKE_CSRR0;
> +            regs.sprn_srr1 =3D SPR_BOOKE_CSRR1;
>              break;
>          default:
>              break;
> @@ -581,12 +594,11 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp)
>      case POWERPC_EXCP_DEBUG:     /* Debug interrupt                     =
     */
>          if (env->flags & POWERPC_FLAG_DE) {
>              /* FIXME: choose one or the other based on CPU type */
> -            srr0 =3D SPR_BOOKE_DSRR0;
> -            srr1 =3D SPR_BOOKE_DSRR1;
> -
> -            env->spr[SPR_BOOKE_CSRR0] =3D env->nip;
> -            env->spr[SPR_BOOKE_CSRR1] =3D msr;
> +            regs.sprn_srr0 =3D SPR_BOOKE_DSRR0;
> +            regs.sprn_srr1 =3D SPR_BOOKE_DSRR1;
> =20
> +            env->spr[SPR_BOOKE_CSRR0] =3D regs.nip;
> +            env->spr[SPR_BOOKE_CSRR1] =3D regs.msr;
>              /* DBSR already modified by caller */
>          } else {
>              cpu_abort(cs, "Debug exception triggered on unsupported mode=
l\n");
> @@ -615,22 +627,22 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp)
>      case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt         =
     */
>          break;
>      case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt=
     */
> -        srr0 =3D SPR_BOOKE_CSRR0;
> -        srr1 =3D SPR_BOOKE_CSRR1;
> +        regs.sprn_srr0 =3D SPR_BOOKE_CSRR0;
> +        regs.sprn_srr1 =3D SPR_BOOKE_CSRR1;
>          break;
>      case POWERPC_EXCP_RESET:     /* System reset exception              =
     */
>          /* A power-saving exception sets ME, otherwise it is unchanged */
>          if (msr_pow) {
>              /* indicate that we resumed from power save mode */
> -            msr |=3D 0x10000;
> -            new_msr |=3D ((target_ulong)1 << MSR_ME);
> +            regs.msr |=3D 0x10000;
> +            regs.new_msr |=3D ((target_ulong)1 << MSR_ME);
>          }
>          if (env->msr_mask & MSR_HVB) {
>              /*
>               * ISA specifies HV, but can be delivered to guest with HV
>               * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
>               */
> -            new_msr |=3D (target_ulong)MSR_HVB;
> +            regs.new_msr |=3D (target_ulong)MSR_HVB;
>          } else {
>              if (msr_pow) {
>                  cpu_abort(cs, "Trying to deliver power-saving system res=
et "
> @@ -643,7 +655,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp)
>      case POWERPC_EXCP_TRACE:     /* Trace exception                     =
     */
>          break;
>      case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage excep=
tion */
> -        msr |=3D env->error_code;
> +        regs.msr |=3D env->error_code;
>          /* fall through */
>      case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception    =
     */
>      case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception   =
     */
> @@ -652,10 +664,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp)
>      case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt       =
     */
>      case POWERPC_EXCP_HV_EMU:
>      case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization           =
     */
> -        srr0 =3D SPR_HSRR0;
> -        srr1 =3D SPR_HSRR1;
> -        new_msr |=3D (target_ulong)MSR_HVB;
> -        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> +        regs.sprn_srr0 =3D SPR_HSRR0;
> +        regs.sprn_srr1 =3D SPR_HSRR1;
> +        regs.new_msr |=3D (target_ulong)MSR_HVB;
> +        regs.new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
>          break;
>      case POWERPC_EXCP_VPU:       /* Vector unavailable exception        =
     */
>      case POWERPC_EXCP_VSXU:       /* VSX unavailable exception          =
     */
> @@ -667,10 +679,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp)
>      case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exce=
ption */
>  #ifdef TARGET_PPC64
>          env->spr[SPR_HFSCR] |=3D ((target_ulong)env->error_code << FSCR_=
IC_POS);
> -        srr0 =3D SPR_HSRR0;
> -        srr1 =3D SPR_HSRR1;
> -        new_msr |=3D (target_ulong)MSR_HVB;
> -        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> +        regs.sprn_srr0 =3D SPR_HSRR0;
> +        regs.sprn_srr1 =3D SPR_HSRR1;
> +        regs.new_msr |=3D (target_ulong)MSR_HVB;
> +        regs.new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
>  #endif
>          break;
>      case POWERPC_EXCP_PIT:       /* Programmable interval timer interrup=
t    */
> @@ -697,8 +709,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp)
>          case POWERPC_EXCP_603:
>          case POWERPC_EXCP_G2:
>              /* Swap temporary saved registers with GPRs */
> -            if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
> -                new_msr |=3D (target_ulong)1 << MSR_TGPR;
> +            if (!(regs.new_msr & ((target_ulong)1 << MSR_TGPR))) {
> +                regs.new_msr |=3D (target_ulong)1 << MSR_TGPR;
>                  hreg_swap_gpr_tgpr(env);
>              }
>              /* fall through */
> @@ -731,10 +743,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp)
>                           env->error_code);
>              }
>  #endif
> -            msr |=3D env->crf[0] << 28;
> -            msr |=3D env->error_code; /* key, D/I, S/L bits */
> +            regs.msr |=3D env->crf[0] << 28;
> +            regs.msr |=3D env->error_code; /* key, D/I, S/L bits */
>              /* Set way using a LRU mechanism */
> -            msr |=3D ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
> +            regs.msr |=3D ((env->last_way + 1) & (env->nb_ways - 1)) << =
17;
>              break;
>          default:
>              cpu_abort(cs, "Invalid TLB miss exception\n");
> @@ -800,11 +812,11 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp)
> =20
>      /* Sanity check */
>      if (!(env->msr_mask & MSR_HVB)) {
> -        if (new_msr & MSR_HVB) {
> +        if (regs.new_msr & MSR_HVB) {
>              cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
>                        "no HV support\n", excp);
>          }
> -        if (srr0 =3D=3D SPR_HSRR0) {
> +        if (regs.sprn_srr0 =3D=3D SPR_HSRR0) {
>              cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with=
 "
>                        "no HV support\n", excp);
>          }
> @@ -816,32 +828,32 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp)
>       */
>  #ifdef TARGET_PPC64
>      if (excp_model =3D=3D POWERPC_EXCP_POWER7) {
> -        if (!(new_msr & MSR_HVB) && (env->spr[SPR_LPCR] & LPCR_ILE)) {
> -            new_msr |=3D (target_ulong)1 << MSR_LE;
> +        if (!(regs.new_msr & MSR_HVB) && (env->spr[SPR_LPCR] & LPCR_ILE)=
) {
> +            regs.new_msr |=3D (target_ulong)1 << MSR_LE;
>          }
>      } else if (excp_model =3D=3D POWERPC_EXCP_POWER8) {
> -        if (new_msr & MSR_HVB) {
> +        if (regs.new_msr & MSR_HVB) {
>              if (env->spr[SPR_HID0] & HID0_HILE) {
> -                new_msr |=3D (target_ulong)1 << MSR_LE;
> +                regs.new_msr |=3D (target_ulong)1 << MSR_LE;
>              }
>          } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
> -            new_msr |=3D (target_ulong)1 << MSR_LE;
> +            regs.new_msr |=3D (target_ulong)1 << MSR_LE;
>          }
>      } else if (excp_model =3D=3D POWERPC_EXCP_POWER9 ||
>                 excp_model =3D=3D POWERPC_EXCP_POWER10) {
> -        if (new_msr & MSR_HVB) {
> +        if (regs.new_msr & MSR_HVB) {
>              if (env->spr[SPR_HID0] & HID0_POWER9_HILE) {
> -                new_msr |=3D (target_ulong)1 << MSR_LE;
> +                regs.new_msr |=3D (target_ulong)1 << MSR_LE;
>              }
>          } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
> -            new_msr |=3D (target_ulong)1 << MSR_LE;
> +            regs.new_msr |=3D (target_ulong)1 << MSR_LE;
>          }
>      } else if (msr_ile) {
> -        new_msr |=3D (target_ulong)1 << MSR_LE;
> +        regs.new_msr |=3D (target_ulong)1 << MSR_LE;
>      }
>  #else
>      if (msr_ile) {
> -        new_msr |=3D (target_ulong)1 << MSR_LE;
> +        regs.new_msr |=3D (target_ulong)1 << MSR_LE;
>      }
>  #endif
> =20
> @@ -849,31 +861,32 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp)
>      if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
>          if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
>              /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
> -            new_msr |=3D (target_ulong)1 << MSR_CM;
> +            regs.new_msr |=3D (target_ulong)1 << MSR_CM;
>          } else {
> -            vector =3D (uint32_t)vector;
> +            regs.new_nip =3D (uint32_t)regs.new_nip;
>          }
>      } else {
>          if (!msr_isf && !mmu_is_64bit(env->mmu_model)) {
> -            vector =3D (uint32_t)vector;
> +            regs.new_nip =3D (uint32_t)regs.new_nip;
>          } else {
> -            new_msr |=3D (target_ulong)1 << MSR_SF;
> +            regs.new_msr |=3D (target_ulong)1 << MSR_SF;
>          }
>      }
>  #endif
> =20
>      if (excp !=3D POWERPC_EXCP_SYSCALL_VECTORED) {
>          /* Save PC */
> -        env->spr[srr0] =3D env->nip;
> +        env->spr[regs.sprn_srr0] =3D regs.nip;
> =20
>          /* Save MSR */
> -        env->spr[srr1] =3D msr;
> +        env->spr[regs.sprn_srr1] =3D regs.msr;
>      }
> =20
> -    /* This can update new_msr and vector if AIL applies */
> -    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
> +    /* This can update regs.new_msr and regs.new_nip if AIL applies */
> +    ppc_excp_apply_ail(cpu, excp_model, excp, regs.msr, &regs.new_msr,
> +                       &regs.new_nip);
> =20
> -    powerpc_set_excp_state(cpu, vector, new_msr);
> +    powerpc_set_excp_state(cpu, regs.new_nip, regs.new_msr);
>  }
> =20
>  void ppc_cpu_do_interrupt(CPUState *cs)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2O+7BD95UB/bZ7Ki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHGu6YACgkQbDjKyiDZ
s5LkyRAAwVB7BmoAEXXcDuOmI884LQTBKmEFmf/DFk0z1tnMoUy2/1+YqmvqWrAL
gNHV+neGLAcJW4cBBPJugaR/JMC9rsVBZRlUqDk7vKJ+0rzghK2GloUU3sGbtYAe
HT7Ote2AWSizmF1v0CpY2Xnz2yuUyAl1MnAm/VUN0eTYYg76KIqFkn9uWPj2CvHu
5gQrVXdEELMXTvzr564JjgrP/IEhR/HxQH7NU7bZ87qFbWtuCe5z5YivcCMOYb7U
ucNlwou8MkHi6rOqQYCPv3HNxJIujjItV6YLsEJAxt6siemDRpQFqWoX2/jRz76C
lLsuDN0xOEtjSBSvi1aOxN7TnALfCD5svAnQoSAOjhROLuuj49afzHR/20zgKs+1
S83eOMfem0+fX8P3BEMh9gB0eggbwwhZYrOlLOYM18L9mKjDdR4TYvVSA3BRqRUI
VysbGX2mcaLCiSifYsXtVkPqp60a5DW9IlfEFxmviFbKjhslIwoU3drlre1fCI6G
oM0WcgGzcaT+OwXY6rmwSs0+FYZXeDMzkeOmz05V/mN9+MfcJjFiqXCFHFNDBdUZ
hg1ysC5P9TYtxFu44j85ze4nb6RQ7AMMlOWlklHN3dy2YksTJo4Ea7qPVgNzFVMt
Y30YdNu7Rd1eEFGpQrmTjpAYvLHOXclr3iiHEEfhCSYk5dxM0sE=
=RbO4
-----END PGP SIGNATURE-----

--2O+7BD95UB/bZ7Ki--

