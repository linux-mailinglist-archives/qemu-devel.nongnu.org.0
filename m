Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE3A47F27B
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Dec 2021 08:07:56 +0100 (CET)
Received: from localhost ([::1]:37056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n119m-0007TI-GQ
	for lists+qemu-devel@lfdr.de; Sat, 25 Dec 2021 02:07:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n110m-00046g-CM; Sat, 25 Dec 2021 01:58:37 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=35187
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n110i-0006jj-Jb; Sat, 25 Dec 2021 01:58:36 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JLZWx4CXYz4xmy; Sat, 25 Dec 2021 17:58:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1640415501;
 bh=QFs8kRm/BZONWMR3FTfoJPWQGJmQHHIQePwemQw/va8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BM/9va77EtCk5PukwWyWaN9xiweHvYS6wuBHtX1FvylZRAXhTYr4LJedFNs4NoVs+
 OK4uQpZh9oy7NUkvxPnHY09sI9vuAINHEtZixyGcIQs52ozakOhA8qKgJdGZZ5U1MJ
 IhoCdhgf7B9KAqqE50lCd0y4VBm0QZE3dG+D1D50=
Date: Sat, 25 Dec 2021 17:33:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC v2 04/12] target/ppc: powerpc_excp: Stop passing excp_model
 around
Message-ID: <Yca7U2CK8jcbz4HE@yekko>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
 <20211220181903.3456898-5-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gwvH7ChH0PZjPWLI"
Content-Disposition: inline
In-Reply-To: <20211220181903.3456898-5-farosas@linux.ibm.com>
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


--gwvH7ChH0PZjPWLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 20, 2021 at 03:18:55PM -0300, Fabiano Rosas wrote:
> We can just access it directly in powerpc_excp.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/excp_helper.c | 43 ++++++++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 22 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 7bdc1e8410..45641f6d1d 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -293,10 +293,11 @@ static inline void powerpc_set_excp_state(PowerPCCP=
U *cpu,
>   * Note that this function should be greatly optimized when called
>   * with a constant excp, from ppc_hw_interrupt
>   */
> -static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int exc=
p)
> +static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
> +    int excp_model =3D env->excp_model;
>      target_ulong msr, new_msr, vector;
>      int srr0, srr1, lev =3D -1;
> =20
> @@ -878,9 +879,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>  void ppc_cpu_do_interrupt(CPUState *cs)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -    CPUPPCState *env =3D &cpu->env;
> =20
> -    powerpc_excp(cpu, env->excp_model, cs->exception_index);
> +    powerpc_excp(cpu, cs->exception_index);
>  }
> =20
>  static void ppc_hw_interrupt(CPUPPCState *env)
> @@ -891,20 +891,20 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>      /* External reset */
>      if (env->pending_interrupts & (1 << PPC_INTERRUPT_RESET)) {
>          env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_RESET);
> -        powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_RESET);
> +        powerpc_excp(cpu, POWERPC_EXCP_RESET);
>          return;
>      }
>      /* Machine check exception */
>      if (env->pending_interrupts & (1 << PPC_INTERRUPT_MCK)) {
>          env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_MCK);
> -        powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_MCHECK);
> +        powerpc_excp(cpu, POWERPC_EXCP_MCHECK);
>          return;
>      }
>  #if 0 /* TODO */
>      /* External debug exception */
>      if (env->pending_interrupts & (1 << PPC_INTERRUPT_DEBUG)) {
>          env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_DEBUG);
> -        powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_DEBUG);
> +        powerpc_excp(cpu, POWERPC_EXCP_DEBUG);
>          return;
>      }
>  #endif
> @@ -924,7 +924,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>          if ((async_deliver || msr_hv =3D=3D 0) && hdice) {
>              /* HDEC clears on delivery */
>              env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_HDECR);
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_HDECR);
> +            powerpc_excp(cpu, POWERPC_EXCP_HDECR);
>              return;
>          }
>      }
> @@ -934,7 +934,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>          /* LPCR will be clear when not supported so this will work */
>          bool hvice =3D !!(env->spr[SPR_LPCR] & LPCR_HVICE);
>          if ((async_deliver || msr_hv =3D=3D 0) && hvice) {
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_HVIRT);
> +            powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
>              return;
>          }
>      }
> @@ -946,14 +946,14 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>          /* HEIC blocks delivery to the hypervisor */
>          if ((async_deliver && !(heic && msr_hv && !msr_pr)) ||
>              (env->has_hv_mode && msr_hv =3D=3D 0 && !lpes0)) {
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_EXTERNAL);
> +            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
>              return;
>          }
>      }
>      if (msr_ce !=3D 0) {
>          /* External critical interrupt */
>          if (env->pending_interrupts & (1 << PPC_INTERRUPT_CEXT)) {
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_CRITICAL);
> +            powerpc_excp(cpu, POWERPC_EXCP_CRITICAL);
>              return;
>          }
>      }
> @@ -961,24 +961,24 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>          /* Watchdog timer on embedded PowerPC */
>          if (env->pending_interrupts & (1 << PPC_INTERRUPT_WDT)) {
>              env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_WDT);
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_WDT);
> +            powerpc_excp(cpu, POWERPC_EXCP_WDT);
>              return;
>          }
>          if (env->pending_interrupts & (1 << PPC_INTERRUPT_CDOORBELL)) {
>              env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_CDOORBELL);
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_DOORCI);
> +            powerpc_excp(cpu, POWERPC_EXCP_DOORCI);
>              return;
>          }
>          /* Fixed interval timer on embedded PowerPC */
>          if (env->pending_interrupts & (1 << PPC_INTERRUPT_FIT)) {
>              env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_FIT);
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_FIT);
> +            powerpc_excp(cpu, POWERPC_EXCP_FIT);
>              return;
>          }
>          /* Programmable interval timer on embedded PowerPC */
>          if (env->pending_interrupts & (1 << PPC_INTERRUPT_PIT)) {
>              env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_PIT);
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_PIT);
> +            powerpc_excp(cpu, POWERPC_EXCP_PIT);
>              return;
>          }
>          /* Decrementer exception */
> @@ -986,32 +986,32 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>              if (ppc_decr_clear_on_delivery(env)) {
>                  env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_DECR);
>              }
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_DECR);
> +            powerpc_excp(cpu, POWERPC_EXCP_DECR);
>              return;
>          }
>          if (env->pending_interrupts & (1 << PPC_INTERRUPT_DOORBELL)) {
>              env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_DOORBELL);
>              if (is_book3s_arch2x(env)) {
> -                powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_SDOOR);
> +                powerpc_excp(cpu, POWERPC_EXCP_SDOOR);
>              } else {
> -                powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_DOORI);
> +                powerpc_excp(cpu, POWERPC_EXCP_DOORI);
>              }
>              return;
>          }
>          if (env->pending_interrupts & (1 << PPC_INTERRUPT_HDOORBELL)) {
>              env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_HDOORBELL);
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_SDOOR_HV);
> +            powerpc_excp(cpu, POWERPC_EXCP_SDOOR_HV);
>              return;
>          }
>          if (env->pending_interrupts & (1 << PPC_INTERRUPT_PERFM)) {
>              env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_PERFM);
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_PERFM);
> +            powerpc_excp(cpu, POWERPC_EXCP_PERFM);
>              return;
>          }
>          /* Thermal interrupt */
>          if (env->pending_interrupts & (1 << PPC_INTERRUPT_THERM)) {
>              env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_THERM);
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_THERM);
> +            powerpc_excp(cpu, POWERPC_EXCP_THERM);
>              return;
>          }
>      }
> @@ -1036,9 +1036,8 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>  void ppc_cpu_do_system_reset(CPUState *cs)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -    CPUPPCState *env =3D &cpu->env;
> =20
> -    powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_RESET);
> +    powerpc_excp(cpu, POWERPC_EXCP_RESET);
>  }
> =20
>  void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gwvH7ChH0PZjPWLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHGu1MACgkQbDjKyiDZ
s5IRpw//Vfm+iuZahhBdwmHMx3NSPo62eEkUDSZr08NMs+bXgYNwWJWc4SDq/gRj
zdOu8aIBsJNrOZu5Lu8sV25tyPASXkg8nK+DdAMz1S+zJvzB2nsEvqz/YBpYPCcm
UQtHV2KjiKGY19MGBVFGcFE44EZ/SDm37Ks2atLyDNf9Ptf8Xyg4sD73/8pAtDX7
EtrGdyiLWHCUoWJHluas0/SgGXV2zzEX1hlm1QeqvEJ/dBb9btANMvwRm1TICy9Z
6kxHSLJdwh2f2ELOWsqkgxhcPsJFFO1JDfN1kkgAXAC54MbQRQopxJaGTKCjJvEQ
vM+aJqK84ZJl8gOyec04BDtvifk9pTqtPcshjXUGnFauIWcZ8ewZ7vfZcVCvtSaE
jiy2M/ZsnELqwobeGjDfqUr9wudDuzZAEekph0I3JJbA7MrKBdnzHIQqL8JfW7MG
63Ds2uRuChFw4dGtMkkD8E7OkN/Qz8y5enkyIBF0HXmcG4WbHES6kEvE8nXTXypD
BgRKeJD0Rjf9sRawi2gK6vY4A1/UigquRVTCX/j51scnDmlYIFSWHWJLjeoDg6ej
RCaBFveUuiS6DQi2V2t3vIHpYVLlnPCfFUg71x1DaGCQ6MYkkOqAVB0zC3eaa+s7
hEwBMGl+kc4o2AkP+WDLXezZ1dUQ0ohyhCe3t7u0q3pJjEPQW6o=
=zBm7
-----END PGP SIGNATURE-----

--gwvH7ChH0PZjPWLI--

