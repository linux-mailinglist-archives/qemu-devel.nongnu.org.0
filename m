Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6106641105A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 09:41:42 +0200 (CEST)
Received: from localhost ([::1]:33466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSDvp-0003v3-Ca
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 03:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSDmt-0006g1-Qy; Mon, 20 Sep 2021 03:32:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42275 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSDmq-0006Aq-LV; Mon, 20 Sep 2021 03:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632123140;
 bh=1Vn0Pnjj7eSOm3I8EG5LaZxTdxV0gCkW72JEm57is/E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E/5JMCai9JzOKClC7FM4XEVNDECRfSqppaHx0ZtyTPG5PDi0RDSx6UHeWRQHzUwP/
 ZUXZo6Asr44OPyRGC/o5/ahB9M3azJpHOIznQiI93zLZvF4gDBEGAhAYDnK08uy+dC
 zSlnt6Xf8yhquhEUMPWHFPrSl78MbAe0GPDW6M9s=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HCbqS1HK0z9sW5; Mon, 20 Sep 2021 17:32:20 +1000 (AEST)
Date: Mon, 20 Sep 2021 16:54:38 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v4 1/4] target/ppc: Convert debug to trace events
 (exceptions)
Message-ID: <YUgwLr7OTNJDv3kL@yekko>
References: <20210920061203.989563-1-clg@kaod.org>
 <20210920061203.989563-2-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LkqCFkUJNqCccLXl"
Content-Disposition: inline
In-Reply-To: <20210920061203.989563-2-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LkqCFkUJNqCccLXl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 08:12:00AM +0200, C=E9dric Le Goater wrote:
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.2, thanks.

> ---
>  target/ppc/excp_helper.c | 38 ++++++++++----------------------------
>  target/ppc/trace-events  |  8 ++++++++
>  2 files changed, 18 insertions(+), 28 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index d7e32ee107e0..b7d176792098 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -23,20 +23,14 @@
>  #include "internal.h"
>  #include "helper_regs.h"
> =20
> +#include "trace.h"
> +
>  #ifdef CONFIG_TCG
>  #include "exec/helper-proto.h"
>  #include "exec/cpu_ldst.h"
>  #endif
> =20
> -/* #define DEBUG_OP */
>  /* #define DEBUG_SOFTWARE_TLB */
> -/* #define DEBUG_EXCEPTIONS */
> -
> -#ifdef DEBUG_EXCEPTIONS
> -#  define LOG_EXCP(...) qemu_log(__VA_ARGS__)
> -#else
> -#  define LOG_EXCP(...) do { } while (0)
> -#endif
> =20
>  /***********************************************************************=
******/
>  /* Exception processing */
> @@ -414,12 +408,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>          }
>          break;
>      case POWERPC_EXCP_DSI:       /* Data storage exception              =
     */
> -        LOG_EXCP("DSI exception: DSISR=3D" TARGET_FMT_lx" DAR=3D" TARGET=
_FMT_lx
> -                 "\n", env->spr[SPR_DSISR], env->spr[SPR_DAR]);
> +        trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
>          break;
>      case POWERPC_EXCP_ISI:       /* Instruction storage exception       =
     */
> -        LOG_EXCP("ISI exception: msr=3D" TARGET_FMT_lx ", nip=3D" TARGET=
_FMT_lx
> -                 "\n", msr, env->nip);
> +        trace_ppc_excp_isi(msr, env->nip);
>          msr |=3D env->error_code;
>          break;
>      case POWERPC_EXCP_EXTERNAL:  /* External input                      =
     */
> @@ -474,7 +466,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>          switch (env->error_code & ~0xF) {
>          case POWERPC_EXCP_FP:
>              if ((msr_fe0 =3D=3D 0 && msr_fe1 =3D=3D 0) || msr_fp =3D=3D =
0) {
> -                LOG_EXCP("Ignore floating point exception\n");
> +                trace_ppc_excp_fp_ignore();
>                  cs->exception_index =3D POWERPC_EXCP_NONE;
>                  env->error_code =3D 0;
>                  return;
> @@ -489,7 +481,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>              env->spr[SPR_BOOKE_ESR] =3D ESR_FP;
>              break;
>          case POWERPC_EXCP_INVAL:
> -            LOG_EXCP("Invalid instruction at " TARGET_FMT_lx "\n", env->=
nip);
> +            trace_ppc_excp_inval(env->nip);
>              msr |=3D 0x00080000;
>              env->spr[SPR_BOOKE_ESR] =3D ESR_PIL;
>              break;
> @@ -547,10 +539,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>          break;
>      case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt      =
     */
>          /* FIT on 4xx */
> -        LOG_EXCP("FIT exception\n");
> +        trace_ppc_excp_print("FIT");
>          break;
>      case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt            =
     */
> -        LOG_EXCP("WDT exception\n");
> +        trace_ppc_excp_print("WDT");
>          switch (excp_model) {
>          case POWERPC_EXCP_BOOKE:
>              srr0 =3D SPR_BOOKE_CSRR0;
> @@ -657,7 +649,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>  #endif
>          break;
>      case POWERPC_EXCP_PIT:       /* Programmable interval timer interrup=
t    */
> -        LOG_EXCP("PIT exception\n");
> +        trace_ppc_excp_print("PIT");
>          break;
>      case POWERPC_EXCP_IO:        /* IO error exception                  =
     */
>          /* XXX: TODO */
> @@ -1115,14 +1107,6 @@ bool ppc_cpu_exec_interrupt(CPUState *cs, int inte=
rrupt_request)
> =20
>  #endif /* !CONFIG_USER_ONLY */
> =20
> -#if defined(DEBUG_OP)
> -static void cpu_dump_rfi(target_ulong RA, target_ulong msr)
> -{
> -    qemu_log("Return from exception at " TARGET_FMT_lx " with flags "
> -             TARGET_FMT_lx "\n", RA, msr);
> -}
> -#endif
> -
>  /***********************************************************************=
******/
>  /* Exceptions processing helpers */
> =20
> @@ -1221,9 +1205,7 @@ static inline void do_rfi(CPUPPCState *env, target_=
ulong nip, target_ulong msr)
>      /* XXX: beware: this is false if VLE is supported */
>      env->nip =3D nip & ~((target_ulong)0x00000003);
>      hreg_store_msr(env, msr, 1);
> -#if defined(DEBUG_OP)
> -    cpu_dump_rfi(env->nip, env->msr);
> -#endif
> +    trace_ppc_excp_rfi(env->nip, env->msr);
>      /*
>       * No need to raise an exception here, as rfi is always the last
>       * insn of a TB
> diff --git a/target/ppc/trace-events b/target/ppc/trace-events
> index c88cfccf8d19..53b107f56eb6 100644
> --- a/target/ppc/trace-events
> +++ b/target/ppc/trace-events
> @@ -28,3 +28,11 @@ kvm_handle_epr(void) "handle epr"
>  kvm_handle_watchdog_expiry(void) "handle watchdog expiry"
>  kvm_handle_debug_exception(void) "handle debug exception"
>  kvm_handle_nmi_exception(void) "handle NMI exception"
> +
> +# excp_helper.c
> +ppc_excp_rfi(uint64_t nip, uint64_t msr) "Return from exception at 0x%" =
PRIx64 " with flags 0x%016" PRIx64
> +ppc_excp_dsi(uint64_t dsisr, uint64_t dar) "DSI exception: DSISR=3D0x%" =
PRIx64 " DAR=3D0x%" PRIx64
> +ppc_excp_isi(uint64_t msr, uint64_t nip) "ISI exception: msr=3D0x%016" P=
RIx64 " nip=3D0x%" PRIx64
> +ppc_excp_fp_ignore(void) "Ignore floating point exception"
> +ppc_excp_inval(uint64_t nip) "Invalid instruction at 0x%" PRIx64
> +ppc_excp_print(const char *excp) "%s exception"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LkqCFkUJNqCccLXl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFIMCwACgkQbDjKyiDZ
s5IMFxAAxcTIkSgyp7WqWsaef2DLczztl3KQzJmsvtAu2IIV+A9Io6NdUQIErISu
O/VJsU4//8aSR28xNn7/bCXGS2kWOchSsdcpkCL4bEa3l4BKgj665DN923Rd40ny
1u13WNGJXhcURlpa+6gco59h3S1wjw5Z7T6mu098ZceHgycY7i2BDncwJMbvaR+w
A7QOMaaCSXrgGL+UeyUvVgzekU4UW7HzHytFUnNvZxagf9hvxVjCLO8zi7OrXzG1
dxLTONJFiPRw4AphZW+gUUbks6QyGFrrfOiKm1TLcZbtFHaIb59tNgSvZgKTJAqb
ax5RissNYqsdtlmMvjnDvmXIulnEH1itJTa4G7I5/+ayBlkVOcs12MUeCk2rUr/P
d4luG2GZHRTGk3PAxlZNr0KIOKYAFROh9HtJeH6hF6MfElQlzxY2Fuizg4Y+vNip
Hz7KphDCjZbLtXFBgV92Y3LqOo/NnF9jycdzciVqw5QrV8LCcqTiEzW0QCvbQ1h7
c2nt8MjIuUkSM2mRdoKttrwxsC1Ld/uNVRPpXfHx/+dQh3TQOuYnYtCfR568IlnV
ZEAIiQu/X4IimcBLwcvCI10c+/XqJWaye1Nol+Hspy4BFo2IDwSnEFphoZ1khYK0
vlhkHzytkOzxqMM4oH4yNd1u5QnivCkx09VzdePLYlskagcz5aU=
=gRsy
-----END PGP SIGNATURE-----

--LkqCFkUJNqCccLXl--

