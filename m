Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58E5597EA5
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 08:32:23 +0200 (CEST)
Received: from localhost ([::1]:57628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOZ4o-00035a-DA
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 02:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oOYo1-0004tB-J9; Thu, 18 Aug 2022 02:15:03 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:51353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oOYnv-0007RF-TE; Thu, 18 Aug 2022 02:15:01 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M7ZNj61ddz4xTp; Thu, 18 Aug 2022 16:14:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1660803285;
 bh=nWak43p0Lbe6AmRZ19Ro3pd6UX5ZGRKHBBkqBMDNuoo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IwjFJ5xQKJwhlU2gR38WWRjeU5PmFTaw6rin2by5GSA6hbCbiuzW9VvZiBG1U3XYn
 zYHeULXB7AdV3PiZICmi0nrJiL/ZejqvXesz6DJWRniIm2JNGgzPsU5oLdrhymkoiA
 LhDk74ZxhpUQt57AxH5IiOvc0nf9XaUeJDJFrSuQ=
Date: Thu, 18 Aug 2022 12:18:01 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 danielhb413@gmail.com, groug@kaod.org, fbarrat@linux.ibm.com,
 alex.bennee@linaro.org
Subject: Re: [RFC PATCH 01/13] target/ppc: define PPC_INTERRUPT_* values
 directly
Message-ID: <Yv2hWTtmjUwqScQP@yekko>
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
 <20220815162020.2420093-2-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S8hmeElm5598G0JM"
Content-Disposition: inline
In-Reply-To: <20220815162020.2420093-2-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--S8hmeElm5598G0JM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2022 at 01:20:07PM -0300, Matheus Ferst wrote:
> This enum defines the bit positions in env->pending_interrupts for each
> interrupt. However, except for the comparison in kvmppc_set_interrupt,
> the values are always used as (1 << PPC_INTERRUPT_*). Define them
> directly like that to save some clutter. No functional change intended.
>=20
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Good idea.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/ppc.c             | 10 +++---
>  hw/ppc/trace-events      |  2 +-
>  target/ppc/cpu.h         | 40 +++++++++++-----------
>  target/ppc/cpu_init.c    | 56 +++++++++++++++---------------
>  target/ppc/excp_helper.c | 74 ++++++++++++++++++++--------------------
>  target/ppc/misc_helper.c |  6 ++--
>  6 files changed, 94 insertions(+), 94 deletions(-)
>=20
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index 690f448cb9..77e611e81c 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -40,7 +40,7 @@
>  static void cpu_ppc_tb_stop (CPUPPCState *env);
>  static void cpu_ppc_tb_start (CPUPPCState *env);
> =20
> -void ppc_set_irq(PowerPCCPU *cpu, int n_IRQ, int level)
> +void ppc_set_irq(PowerPCCPU *cpu, int irq, int level)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
> @@ -56,21 +56,21 @@ void ppc_set_irq(PowerPCCPU *cpu, int n_IRQ, int leve=
l)
>      old_pending =3D env->pending_interrupts;
> =20
>      if (level) {
> -        env->pending_interrupts |=3D 1 << n_IRQ;
> +        env->pending_interrupts |=3D irq;
>          cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>      } else {
> -        env->pending_interrupts &=3D ~(1 << n_IRQ);
> +        env->pending_interrupts &=3D ~irq;
>          if (env->pending_interrupts =3D=3D 0) {
>              cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
>          }
>      }
> =20
>      if (old_pending !=3D env->pending_interrupts) {
> -        kvmppc_set_interrupt(cpu, n_IRQ, level);
> +        kvmppc_set_interrupt(cpu, irq, level);
>      }
> =20
> =20
> -    trace_ppc_irq_set_exit(env, n_IRQ, level, env->pending_interrupts,
> +    trace_ppc_irq_set_exit(env, irq, level, env->pending_interrupts,
>                             CPU(cpu)->interrupt_request);
> =20
>      if (locked) {
> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
> index 5c0a215cad..c9ee1285b8 100644
> --- a/hw/ppc/trace-events
> +++ b/hw/ppc/trace-events
> @@ -116,7 +116,7 @@ ppc40x_set_tb_clk(uint32_t value) "new frequency %" P=
RIu32
>  ppc40x_timers_init(uint32_t value) "frequency %" PRIu32
> =20
>  ppc_irq_set(void *env, uint32_t pin, uint32_t level) "env [%p] pin %d le=
vel %d"
> -ppc_irq_set_exit(void *env, uint32_t n_IRQ, uint32_t level, uint32_t pen=
ding, uint32_t request) "env [%p] n_IRQ %d level %d =3D> pending 0x%08" PRI=
x32 " req 0x%08" PRIx32
> +ppc_irq_set_exit(void *env, uint32_t irq, uint32_t level, uint32_t pendi=
ng, uint32_t request) "env [%p] irq 0x%05" PRIx32 " level %d =3D> pending 0=
x%08" PRIx32 " req 0x%08" PRIx32
>  ppc_irq_set_state(const char *name, uint32_t level) "\"%s\" level %d"
>  ppc_irq_reset(const char *name) "%s"
>  ppc_irq_cpu(const char *action) "%s"
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index a4c893cfad..c7864bb3b1 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2418,27 +2418,27 @@ enum {
>  /* Hardware exceptions definitions */
>  enum {
>      /* External hardware exception sources */
> -    PPC_INTERRUPT_RESET     =3D 0,  /* Reset exception                  =
    */
> -    PPC_INTERRUPT_WAKEUP,         /* Wakeup exception                   =
  */
> -    PPC_INTERRUPT_MCK,            /* Machine check exception            =
  */
> -    PPC_INTERRUPT_EXT,            /* External interrupt                 =
  */
> -    PPC_INTERRUPT_SMI,            /* System management interrupt        =
  */
> -    PPC_INTERRUPT_CEXT,           /* Critical external interrupt        =
  */
> -    PPC_INTERRUPT_DEBUG,          /* External debug exception           =
  */
> -    PPC_INTERRUPT_THERM,          /* Thermal exception                  =
  */
> +    PPC_INTERRUPT_RESET     =3D 0x00001,  /* Reset exception            =
        */
> +    PPC_INTERRUPT_WAKEUP    =3D 0x00002,  /* Wakeup exception           =
        */
> +    PPC_INTERRUPT_MCK       =3D 0x00004,  /* Machine check exception    =
        */
> +    PPC_INTERRUPT_EXT       =3D 0x00008,  /* External interrupt         =
        */
> +    PPC_INTERRUPT_SMI       =3D 0x00010,  /* System management interrupt=
        */
> +    PPC_INTERRUPT_CEXT      =3D 0x00020,  /* Critical external interrupt=
        */
> +    PPC_INTERRUPT_DEBUG     =3D 0x00040,  /* External debug exception   =
        */
> +    PPC_INTERRUPT_THERM     =3D 0x00080,  /* Thermal exception          =
        */
>      /* Internal hardware exception sources */
> -    PPC_INTERRUPT_DECR,           /* Decrementer exception              =
  */
> -    PPC_INTERRUPT_HDECR,          /* Hypervisor decrementer exception   =
  */
> -    PPC_INTERRUPT_PIT,            /* Programmable interval timer interru=
pt */
> -    PPC_INTERRUPT_FIT,            /* Fixed interval timer interrupt     =
  */
> -    PPC_INTERRUPT_WDT,            /* Watchdog timer interrupt           =
  */
> -    PPC_INTERRUPT_CDOORBELL,      /* Critical doorbell interrupt        =
  */
> -    PPC_INTERRUPT_DOORBELL,       /* Doorbell interrupt                 =
  */
> -    PPC_INTERRUPT_PERFM,          /* Performance monitor interrupt      =
  */
> -    PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt   =
 */
> -    PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt      =
  */
> -    PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt=
  */
> -    PPC_INTERRUPT_EBB,            /* Event-based Branch exception       =
  */
> +    PPC_INTERRUPT_DECR      =3D 0x00100, /* Decrementer exception       =
        */
> +    PPC_INTERRUPT_HDECR     =3D 0x00200, /* Hypervisor decrementer excep=
tion    */
> +    PPC_INTERRUPT_PIT       =3D 0x00400, /* Programmable interval timer =
int.    */
> +    PPC_INTERRUPT_FIT       =3D 0x00800, /* Fixed interval timer interru=
pt      */
> +    PPC_INTERRUPT_WDT       =3D 0x01000, /* Watchdog timer interrupt    =
        */
> +    PPC_INTERRUPT_CDOORBELL =3D 0x02000, /* Critical doorbell interrupt =
        */
> +    PPC_INTERRUPT_DOORBELL  =3D 0x04000, /* Doorbell interrupt          =
        */
> +    PPC_INTERRUPT_PERFM     =3D 0x08000, /* Performance monitor interrup=
t       */
> +    PPC_INTERRUPT_HMI       =3D 0x10000, /* Hypervisor Maintenance inter=
rupt    */
> +    PPC_INTERRUPT_HDOORBELL =3D 0x20000, /* Hypervisor Doorbell interrup=
t       */
> +    PPC_INTERRUPT_HVIRT     =3D 0x40000, /* Hypervisor virtualization in=
terrupt */
> +    PPC_INTERRUPT_EBB       =3D 0x80000, /* Event-based Branch exception=
        */
>  };
> =20
>  /* Processor Compatibility mask (PCR) */
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index d1493a660c..850334545a 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -5932,23 +5932,23 @@ static bool cpu_has_work_POWER7(CPUState *cs)
>          if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
>              return false;
>          }
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
>              (env->spr[SPR_LPCR] & LPCR_P7_PECE0)) {
>              return true;
>          }
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DECR)) &&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
>              (env->spr[SPR_LPCR] & LPCR_P7_PECE1)) {
>              return true;
>          }
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_MCK)) &&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
>              (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
>              return true;
>          }
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HMI)) &&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
>              (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
>              return true;
>          }
> -        if (env->pending_interrupts & (1u << PPC_INTERRUPT_RESET)) {
> +        if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
>              return true;
>          }
>          return false;
> @@ -6096,31 +6096,31 @@ static bool cpu_has_work_POWER8(CPUState *cs)
>          if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
>              return false;
>          }
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
>              (env->spr[SPR_LPCR] & LPCR_P8_PECE2)) {
>              return true;
>          }
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DECR)) &&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
>              (env->spr[SPR_LPCR] & LPCR_P8_PECE3)) {
>              return true;
>          }
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_MCK)) &&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
>              (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
>              return true;
>          }
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HMI)) &&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
>              (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
>              return true;
>          }
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DOORBELL)) &&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
>              (env->spr[SPR_LPCR] & LPCR_P8_PECE0)) {
>              return true;
>          }
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HDOORBELL)) =
&&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
>              (env->spr[SPR_LPCR] & LPCR_P8_PECE1)) {
>              return true;
>          }
> -        if (env->pending_interrupts & (1u << PPC_INTERRUPT_RESET)) {
> +        if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
>              return true;
>          }
>          return false;
> @@ -6307,7 +6307,7 @@ static bool cpu_has_work_POWER9(CPUState *cs)
>              return true;
>          }
>          /* External Exception */
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
>              (env->spr[SPR_LPCR] & LPCR_EEE)) {
>              bool heic =3D !!(env->spr[SPR_LPCR] & LPCR_HEIC);
>              if (!heic || !FIELD_EX64_HV(env->msr) ||
> @@ -6316,31 +6316,31 @@ static bool cpu_has_work_POWER9(CPUState *cs)
>              }
>          }
>          /* Decrementer Exception */
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DECR)) &&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
>              (env->spr[SPR_LPCR] & LPCR_DEE)) {
>              return true;
>          }
>          /* Machine Check or Hypervisor Maintenance Exception */
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_MCK |
> -            1u << PPC_INTERRUPT_HMI)) && (env->spr[SPR_LPCR] & LPCR_OEE)=
) {
> +        if ((env->pending_interrupts & (PPC_INTERRUPT_MCK | PPC_INTERRUP=
T_HMI))
> +            && (env->spr[SPR_LPCR] & LPCR_OEE)) {
>              return true;
>          }
>          /* Privileged Doorbell Exception */
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DOORBELL)) &&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
>              (env->spr[SPR_LPCR] & LPCR_PDEE)) {
>              return true;
>          }
>          /* Hypervisor Doorbell Exception */
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HDOORBELL)) =
&&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
>              (env->spr[SPR_LPCR] & LPCR_HDEE)) {
>              return true;
>          }
>          /* Hypervisor virtualization exception */
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HVIRT)) &&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_HVIRT) &&
>              (env->spr[SPR_LPCR] & LPCR_HVEE)) {
>              return true;
>          }
> -        if (env->pending_interrupts & (1u << PPC_INTERRUPT_RESET)) {
> +        if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
>              return true;
>          }
>          return false;
> @@ -6524,7 +6524,7 @@ static bool cpu_has_work_POWER10(CPUState *cs)
>              return true;
>          }
>          /* External Exception */
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
>              (env->spr[SPR_LPCR] & LPCR_EEE)) {
>              bool heic =3D !!(env->spr[SPR_LPCR] & LPCR_HEIC);
>              if (!heic || !FIELD_EX64_HV(env->msr) ||
> @@ -6533,31 +6533,31 @@ static bool cpu_has_work_POWER10(CPUState *cs)
>              }
>          }
>          /* Decrementer Exception */
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DECR)) &&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
>              (env->spr[SPR_LPCR] & LPCR_DEE)) {
>              return true;
>          }
>          /* Machine Check or Hypervisor Maintenance Exception */
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_MCK |
> -            1u << PPC_INTERRUPT_HMI)) && (env->spr[SPR_LPCR] & LPCR_OEE)=
) {
> +        if ((env->pending_interrupts & (PPC_INTERRUPT_MCK | PPC_INTERRUP=
T_HMI))
> +            && (env->spr[SPR_LPCR] & LPCR_OEE)) {
>              return true;
>          }
>          /* Privileged Doorbell Exception */
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DOORBELL)) &&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
>              (env->spr[SPR_LPCR] & LPCR_PDEE)) {
>              return true;
>          }
>          /* Hypervisor Doorbell Exception */
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HDOORBELL)) =
&&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
>              (env->spr[SPR_LPCR] & LPCR_HDEE)) {
>              return true;
>          }
>          /* Hypervisor virtualization exception */
> -        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HVIRT)) &&
> +        if ((env->pending_interrupts & PPC_INTERRUPT_HVIRT) &&
>              (env->spr[SPR_LPCR] & LPCR_HVEE)) {
>              return true;
>          }
> -        if (env->pending_interrupts & (1u << PPC_INTERRUPT_RESET)) {
> +        if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
>              return true;
>          }
>          return false;
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 7550aafed6..b9476b5d03 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1683,21 +1683,21 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>      bool async_deliver;
> =20
>      /* External reset */
> -    if (env->pending_interrupts & (1 << PPC_INTERRUPT_RESET)) {
> -        env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_RESET);
> +    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
> +        env->pending_interrupts &=3D ~PPC_INTERRUPT_RESET;
>          powerpc_excp(cpu, POWERPC_EXCP_RESET);
>          return;
>      }
>      /* Machine check exception */
> -    if (env->pending_interrupts & (1 << PPC_INTERRUPT_MCK)) {
> -        env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_MCK);
> +    if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
> +        env->pending_interrupts &=3D ~PPC_INTERRUPT_MCK;
>          powerpc_excp(cpu, POWERPC_EXCP_MCHECK);
>          return;
>      }
>  #if 0 /* TODO */
>      /* External debug exception */
> -    if (env->pending_interrupts & (1 << PPC_INTERRUPT_DEBUG)) {
> -        env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_DEBUG);
> +    if (env->pending_interrupts & PPC_INTERRUPT_DEBUG) {
> +        env->pending_interrupts &=3D ~PPC_INTERRUPT_DEBUG;
>          powerpc_excp(cpu, POWERPC_EXCP_DEBUG);
>          return;
>      }
> @@ -1712,19 +1712,19 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>      async_deliver =3D FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sr=
eset;
> =20
>      /* Hypervisor decrementer exception */
> -    if (env->pending_interrupts & (1 << PPC_INTERRUPT_HDECR)) {
> +    if (env->pending_interrupts & PPC_INTERRUPT_HDECR) {
>          /* LPCR will be clear when not supported so this will work */
>          bool hdice =3D !!(env->spr[SPR_LPCR] & LPCR_HDICE);
>          if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hdice) {
>              /* HDEC clears on delivery */
> -            env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_HDECR);
> +            env->pending_interrupts &=3D ~PPC_INTERRUPT_HDECR;
>              powerpc_excp(cpu, POWERPC_EXCP_HDECR);
>              return;
>          }
>      }
> =20
>      /* Hypervisor virtualization interrupt */
> -    if (env->pending_interrupts & (1 << PPC_INTERRUPT_HVIRT)) {
> +    if (env->pending_interrupts & PPC_INTERRUPT_HVIRT) {
>          /* LPCR will be clear when not supported so this will work */
>          bool hvice =3D !!(env->spr[SPR_LPCR] & LPCR_HVICE);
>          if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hvice) {
> @@ -1734,7 +1734,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>      }
> =20
>      /* External interrupt can ignore MSR:EE under some circumstances */
> -    if (env->pending_interrupts & (1 << PPC_INTERRUPT_EXT)) {
> +    if (env->pending_interrupts & PPC_INTERRUPT_EXT) {
>          bool lpes0 =3D !!(env->spr[SPR_LPCR] & LPCR_LPES0);
>          bool heic =3D !!(env->spr[SPR_LPCR] & LPCR_HEIC);
>          /* HEIC blocks delivery to the hypervisor */
> @@ -1751,45 +1751,45 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>      }
>      if (FIELD_EX64(env->msr, MSR, CE)) {
>          /* External critical interrupt */
> -        if (env->pending_interrupts & (1 << PPC_INTERRUPT_CEXT)) {
> +        if (env->pending_interrupts & PPC_INTERRUPT_CEXT) {
>              powerpc_excp(cpu, POWERPC_EXCP_CRITICAL);
>              return;
>          }
>      }
>      if (async_deliver !=3D 0) {
>          /* Watchdog timer on embedded PowerPC */
> -        if (env->pending_interrupts & (1 << PPC_INTERRUPT_WDT)) {
> -            env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_WDT);
> +        if (env->pending_interrupts & PPC_INTERRUPT_WDT) {
> +            env->pending_interrupts &=3D ~PPC_INTERRUPT_WDT;
>              powerpc_excp(cpu, POWERPC_EXCP_WDT);
>              return;
>          }
> -        if (env->pending_interrupts & (1 << PPC_INTERRUPT_CDOORBELL)) {
> -            env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_CDOORBELL);
> +        if (env->pending_interrupts & PPC_INTERRUPT_CDOORBELL) {
> +            env->pending_interrupts &=3D ~PPC_INTERRUPT_CDOORBELL;
>              powerpc_excp(cpu, POWERPC_EXCP_DOORCI);
>              return;
>          }
>          /* Fixed interval timer on embedded PowerPC */
> -        if (env->pending_interrupts & (1 << PPC_INTERRUPT_FIT)) {
> -            env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_FIT);
> +        if (env->pending_interrupts & PPC_INTERRUPT_FIT) {
> +            env->pending_interrupts &=3D ~PPC_INTERRUPT_FIT;
>              powerpc_excp(cpu, POWERPC_EXCP_FIT);
>              return;
>          }
>          /* Programmable interval timer on embedded PowerPC */
> -        if (env->pending_interrupts & (1 << PPC_INTERRUPT_PIT)) {
> -            env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_PIT);
> +        if (env->pending_interrupts & PPC_INTERRUPT_PIT) {
> +            env->pending_interrupts &=3D ~PPC_INTERRUPT_PIT;
>              powerpc_excp(cpu, POWERPC_EXCP_PIT);
>              return;
>          }
>          /* Decrementer exception */
> -        if (env->pending_interrupts & (1 << PPC_INTERRUPT_DECR)) {
> +        if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
>              if (ppc_decr_clear_on_delivery(env)) {
> -                env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_DECR);
> +                env->pending_interrupts &=3D ~PPC_INTERRUPT_DECR;
>              }
>              powerpc_excp(cpu, POWERPC_EXCP_DECR);
>              return;
>          }
> -        if (env->pending_interrupts & (1 << PPC_INTERRUPT_DOORBELL)) {
> -            env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_DOORBELL);
> +        if (env->pending_interrupts & PPC_INTERRUPT_DOORBELL) {
> +            env->pending_interrupts &=3D ~PPC_INTERRUPT_DOORBELL;
>              if (is_book3s_arch2x(env)) {
>                  powerpc_excp(cpu, POWERPC_EXCP_SDOOR);
>              } else {
> @@ -1797,31 +1797,31 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>              }
>              return;
>          }
> -        if (env->pending_interrupts & (1 << PPC_INTERRUPT_HDOORBELL)) {
> -            env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_HDOORBELL);
> +        if (env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) {
> +            env->pending_interrupts &=3D ~PPC_INTERRUPT_HDOORBELL;
>              powerpc_excp(cpu, POWERPC_EXCP_SDOOR_HV);
>              return;
>          }
> -        if (env->pending_interrupts & (1 << PPC_INTERRUPT_PERFM)) {
> -            env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_PERFM);
> +        if (env->pending_interrupts & PPC_INTERRUPT_PERFM) {
> +            env->pending_interrupts &=3D ~PPC_INTERRUPT_PERFM;
>              powerpc_excp(cpu, POWERPC_EXCP_PERFM);
>              return;
>          }
>          /* Thermal interrupt */
> -        if (env->pending_interrupts & (1 << PPC_INTERRUPT_THERM)) {
> -            env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_THERM);
> +        if (env->pending_interrupts & PPC_INTERRUPT_THERM) {
> +            env->pending_interrupts &=3D ~PPC_INTERRUPT_THERM;
>              powerpc_excp(cpu, POWERPC_EXCP_THERM);
>              return;
>          }
>          /* EBB exception */
> -        if (env->pending_interrupts & (1 << PPC_INTERRUPT_EBB)) {
> +        if (env->pending_interrupts & PPC_INTERRUPT_EBB) {
>              /*
>               * EBB exception must be taken in problem state and
>               * with BESCR_GE set.
>               */
>              if (FIELD_EX64(env->msr, MSR, PR) &&
>                  (env->spr[SPR_BESCR] & BESCR_GE)) {
> -                env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_EBB);
> +                env->pending_interrupts &=3D ~PPC_INTERRUPT_EBB;
> =20
>                  if (env->spr[SPR_BESCR] & BESCR_PMEO) {
>                      powerpc_excp(cpu, POWERPC_EXCP_PERFM_EBB);
> @@ -2098,7 +2098,7 @@ static void do_ebb(CPUPPCState *env, int ebb_excp)
>      if (FIELD_EX64(env->msr, MSR, PR)) {
>          powerpc_excp(cpu, ebb_excp);
>      } else {
> -        env->pending_interrupts |=3D 1 << PPC_INTERRUPT_EBB;
> +        env->pending_interrupts |=3D PPC_INTERRUPT_EBB;
>          cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>      }
>  }
> @@ -2209,7 +2209,7 @@ void helper_msgclr(CPUPPCState *env, target_ulong r=
b)
>          return;
>      }
> =20
> -    env->pending_interrupts &=3D ~(1 << irq);
> +    env->pending_interrupts &=3D ~irq;
>  }
> =20
>  void helper_msgsnd(target_ulong rb)
> @@ -2228,7 +2228,7 @@ void helper_msgsnd(target_ulong rb)
>          CPUPPCState *cenv =3D &cpu->env;
> =20
>          if ((rb & DBELL_BRDCAST) || (cenv->spr[SPR_BOOKE_PIR] =3D=3D pir=
)) {
> -            cenv->pending_interrupts |=3D 1 << irq;
> +            cenv->pending_interrupts |=3D irq;
>              cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>          }
>      }
> @@ -2253,7 +2253,7 @@ void helper_book3s_msgclr(CPUPPCState *env, target_=
ulong rb)
>          return;
>      }
> =20
> -    env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_HDOORBELL);
> +    env->pending_interrupts &=3D ~PPC_INTERRUPT_HDOORBELL;
>  }
> =20
>  static void book3s_msgsnd_common(int pir, int irq)
> @@ -2267,7 +2267,7 @@ static void book3s_msgsnd_common(int pir, int irq)
> =20
>          /* TODO: broadcast message to all threads of the same  processor=
 */
>          if (cenv->spr_cb[SPR_PIR].default_value =3D=3D pir) {
> -            cenv->pending_interrupts |=3D 1 << irq;
> +            cenv->pending_interrupts |=3D irq;
>              cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>          }
>      }
> @@ -2294,7 +2294,7 @@ void helper_book3s_msgclrp(CPUPPCState *env, target=
_ulong rb)
>          return;
>      }
> =20
> -    env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_DOORBELL);
> +    env->pending_interrupts &=3D ~PPC_INTERRUPT_DOORBELL;
>  }
> =20
>  /*
> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
> index b0a5e7ce76..05e35572bc 100644
> --- a/target/ppc/misc_helper.c
> +++ b/target/ppc/misc_helper.c
> @@ -163,7 +163,7 @@ target_ulong helper_load_dpdes(CPUPPCState *env)
>      helper_hfscr_facility_check(env, HFSCR_MSGP, "load DPDES", HFSCR_IC_=
MSGP);
> =20
>      /* TODO: TCG supports only one thread */
> -    if (env->pending_interrupts & (1 << PPC_INTERRUPT_DOORBELL)) {
> +    if (env->pending_interrupts & PPC_INTERRUPT_DOORBELL) {
>          dpdes =3D 1;
>      }
> =20
> @@ -185,10 +185,10 @@ void helper_store_dpdes(CPUPPCState *env, target_ul=
ong val)
>      }
> =20
>      if (val & 0x1) {
> -        env->pending_interrupts |=3D 1 << PPC_INTERRUPT_DOORBELL;
> +        env->pending_interrupts |=3D PPC_INTERRUPT_DOORBELL;
>          cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>      } else {
> -        env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_DOORBELL);
> +        env->pending_interrupts &=3D ~PPC_INTERRUPT_DOORBELL;
>      }
>  }
>  #endif /* defined(TARGET_PPC64) */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--S8hmeElm5598G0JM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmL9oVMACgkQgypY4gEw
YSKhahAAxyrzZgIYTqknrDJA1zb26fRdmGGAEjYiLXrgpndhEBS2rukuJlF/wSFY
I7lDDPTfr0FmpoO47yT6T8YjxvTVRuDEF20p7ZAwGk49NdrRjyZn9NkXUE9boXWR
/fuj5Bu5uvTJ6MOV2jh3aqErhUdyVO0wJ4Jq9eW/TpcHnTx5X8oKU2lY1raHD5Wh
fhk0LGpDzboBb8v3mqHTp9IRdkFo88GxI1LwbEw2bU/LNl4d5f6EU8Xjk7OO5GmW
rGKr0NwEkimHxn5w+om+Mj/edxLK6wDZ2ChpGZwODRZ/HJPwvcZcNz1Jd5xS1+Z+
xVmeJHblOLSIwkw4if+hR3wSBmYLZ0Z+fA2XvSmH301k2ukRvUfBnc6V4MXWUtM2
dkS7DXYh3y8KMBXtI6nsy8QTvEldNqrDXroSZZj4rWKTY2FXk0DG+A48DT5Ploum
6dt8VoZeagOc8o53wg8UtZrWjFAgCzy2ZFRpxhkmRFU4icRzEkYXlZK8ue/zDxBo
4sZ8CqCWnRBbJ/Cw4Nx/60512HM2KauiCXKysEjYOF/w1PBdXqNGK4SwGRjl2ZYR
i5dQxwgt86Lv7ZbGJa1jS/SjiqD1PrYLiclzGQlIekRwdRQxKP0oriwMLn69/ZTL
yGamO4EYjvXFz/JBGuZchdqvep+Reko8pXMk6u7mNLZGFikL+UI=
=w7G3
-----END PGP SIGNATURE-----

--S8hmeElm5598G0JM--

