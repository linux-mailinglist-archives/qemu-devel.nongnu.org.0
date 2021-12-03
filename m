Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29004673B1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 10:08:56 +0100 (CET)
Received: from localhost ([::1]:59258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4Yp-0001Z0-F7
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 04:08:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mt4TU-0005yf-8H; Fri, 03 Dec 2021 04:03:27 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:47851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mt4TN-00005E-Qr; Fri, 03 Dec 2021 04:03:22 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J56L01XQzz4xR5; Fri,  3 Dec 2021 20:03:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1638522184;
 bh=8N2FgzFzWbV+xmMH8dCD6JgKy3j7UY4kktzMj5lz3+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NvKeMRsuzUxZipRk9pA3zIKB25oZNP2/zu44Gv50eriNPIJvfgFNxQavkRJaJXAFZ
 I1NCppuDrLqOvDU7Es/3iUkLi42GF1qeJiu2gb0Fv9AhzbemTKnWdoNzwkCdLfG8GI
 F1eyypeK4kBZJrXeV3JYMdDPXUUZxcs41dm/sFsA=
Date: Fri, 3 Dec 2021 12:07:50 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] target/ppc: remove 401/403 CPUs
Message-ID: <Yalt5uk6PYBmTHgP@yekko>
References: <20211202191108.1291515-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4JT4vrt3zzukmlkc"
Content-Disposition: inline
In-Reply-To: <20211202191108.1291515-1-clg@kaod.org>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4JT4vrt3zzukmlkc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 02, 2021 at 08:11:08PM +0100, C=E9dric le Goater wrote:
> They have been there since 2007 without any board using them, most
> were protected by a TODO define. Drop support.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu-models.h  |  19 --
>  target/ppc/cpu-qom.h     |   4 -
>  target/ppc/cpu-models.c  |  34 ---
>  target/ppc/cpu_init.c    | 512 ---------------------------------------
>  target/ppc/excp_helper.c |   1 -
>  target/ppc/mmu_common.c  |  41 +---
>  target/ppc/mmu_helper.c  |   1 -
>  7 files changed, 4 insertions(+), 608 deletions(-)
>=20
> diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
> index 095259275941..bf1dc7e5ca3d 100644
> --- a/target/ppc/cpu-models.h
> +++ b/target/ppc/cpu-models.h
> @@ -38,27 +38,8 @@ extern PowerPCCPUAlias ppc_cpu_aliases[];
>  /***********************************************************************=
******/
>  /* PVR definitions for most known PowerPC                               =
     */
>  enum {
> -    /* PowerPC 401 family */
> -    /* Generic PowerPC 401 */
> -#define CPU_POWERPC_401              CPU_POWERPC_401G2
> -    /* PowerPC 401 cores */
> -    CPU_POWERPC_401A1              =3D 0x00210000,
> -    CPU_POWERPC_401B2              =3D 0x00220000,
> -    CPU_POWERPC_401C2              =3D 0x00230000,
> -    CPU_POWERPC_401D2              =3D 0x00240000,
> -    CPU_POWERPC_401E2              =3D 0x00250000,
> -    CPU_POWERPC_401F2              =3D 0x00260000,
> -    CPU_POWERPC_401G2              =3D 0x00270000,
> -    /* PowerPC 401 microcontrolers */
> -#define CPU_POWERPC_IOP480           CPU_POWERPC_401B2
>      /* IBM Processor for Network Resources */
>      CPU_POWERPC_COBRA              =3D 0x10100000, /* XXX: 405 ? */
> -    /* PowerPC 403 family */
> -    /* PowerPC 403 microcontrollers */
> -    CPU_POWERPC_403GA              =3D 0x00200011,
> -    CPU_POWERPC_403GB              =3D 0x00200100,
> -    CPU_POWERPC_403GC              =3D 0x00200200,
> -    CPU_POWERPC_403GCX             =3D 0x00201400,
>      /* PowerPC 405 family */
>      /* PowerPC 405 cores */
>      CPU_POWERPC_405D2              =3D 0x20010000,
> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
> index ef9e32447473..a39ace2b367f 100644
> --- a/target/ppc/cpu-qom.h
> +++ b/target/ppc/cpu-qom.h
> @@ -53,8 +53,6 @@ enum powerpc_mmu_t {
>      POWERPC_MMU_SOFT_74xx  =3D 0x00000003,
>      /* PowerPC 4xx MMU with software TLB                       */
>      POWERPC_MMU_SOFT_4xx   =3D 0x00000004,
> -    /* PowerPC 4xx MMU with software TLB and zones protections */
> -    POWERPC_MMU_SOFT_4xx_Z =3D 0x00000005,
>      /* PowerPC MMU in real mode only                           */
>      POWERPC_MMU_REAL       =3D 0x00000006,
>      /* Freescale MPC8xx MMU model                              */
> @@ -151,8 +149,6 @@ enum powerpc_input_t {
>      PPC_FLAGS_INPUT_POWER7,
>      /* PowerPC POWER9 bus               */
>      PPC_FLAGS_INPUT_POWER9,
> -    /* PowerPC 401 bus                  */
> -    PPC_FLAGS_INPUT_401,
>      /* Freescale RCPU bus               */
>      PPC_FLAGS_INPUT_RCPU,
>  };
> diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
> index 4baa111713b0..c9fcb6119f40 100644
> --- a/target/ppc/cpu-models.c
> +++ b/target/ppc/cpu-models.c
> @@ -67,40 +67,6 @@
>      POWERPC_DEF_SVR(_name, _desc, _pvr, POWERPC_SVR_NONE, _type)
> =20
>      /* Embedded PowerPC                                                 =
     */
> -    /* PowerPC 401 family                                               =
     */
> -    POWERPC_DEF("401",           CPU_POWERPC_401,                    401,
> -                "Generic PowerPC 401")
> -    /* PowerPC 401 cores                                                =
     */
> -    POWERPC_DEF("401a1",         CPU_POWERPC_401A1,                  401,
> -                "PowerPC 401A1")
> -    POWERPC_DEF("401b2",         CPU_POWERPC_401B2,                  401=
x2,
> -                "PowerPC 401B2")
> -    POWERPC_DEF("401c2",         CPU_POWERPC_401C2,                  401=
x2,
> -                "PowerPC 401C2")
> -    POWERPC_DEF("401d2",         CPU_POWERPC_401D2,                  401=
x2,
> -                "PowerPC 401D2")
> -    POWERPC_DEF("401e2",         CPU_POWERPC_401E2,                  401=
x2,
> -                "PowerPC 401E2")
> -    POWERPC_DEF("401f2",         CPU_POWERPC_401F2,                  401=
x2,
> -                "PowerPC 401F2")
> -    /* XXX: to be checked */
> -    POWERPC_DEF("401g2",         CPU_POWERPC_401G2,                  401=
x2,
> -                "PowerPC 401G2")
> -    /* PowerPC 401 microcontrollers                                     =
     */
> -    POWERPC_DEF("iop480",        CPU_POWERPC_IOP480,                 IOP=
480,
> -                "IOP480 (401 microcontroller)")
> -    POWERPC_DEF("cobra",         CPU_POWERPC_COBRA,                  401,
> -                "IBM Processor for Network Resources")
> -    /* PowerPC 403 family                                               =
     */
> -    /* PowerPC 403 microcontrollers                                     =
     */
> -    POWERPC_DEF("403ga",         CPU_POWERPC_403GA,                  403,
> -                "PowerPC 403 GA")
> -    POWERPC_DEF("403gb",         CPU_POWERPC_403GB,                  403,
> -                "PowerPC 403 GB")
> -    POWERPC_DEF("403gc",         CPU_POWERPC_403GC,                  403,
> -                "PowerPC 403 GC")
> -    POWERPC_DEF("403gcx",        CPU_POWERPC_403GCX,                 403=
GCX,
> -                "PowerPC 403 GCX")
>      /* PowerPC 405 family                                               =
     */
>      /* PowerPC 405 cores                                                =
     */
>      POWERPC_DEF("405d2",         CPU_POWERPC_405D2,                  405,
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index ce40368427c2..ddd71dec778a 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -1554,169 +1554,6 @@ static void register_405_sprs(CPUPPCState *env)
>      register_usprgh_sprs(env);
>  }
> =20
> -/* SPR shared between PowerPC 401 & 403 implementations */
> -static void register_401_403_sprs(CPUPPCState *env)
> -{
> -    /* Time base */
> -    spr_register(env, SPR_403_VTBL,  "TBL",
> -                 &spr_read_tbl, SPR_NOACCESS,
> -                 &spr_read_tbl, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_403_TBL,   "TBL",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 SPR_NOACCESS, &spr_write_tbl,
> -                 0x00000000);
> -    spr_register(env, SPR_403_VTBU,  "TBU",
> -                 &spr_read_tbu, SPR_NOACCESS,
> -                 &spr_read_tbu, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_403_TBU,   "TBU",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 SPR_NOACCESS, &spr_write_tbu,
> -                 0x00000000);
> -    /* Debug */
> -    /* not emulated, as QEMU do not emulate caches */
> -    spr_register(env, SPR_403_CDBCR, "CDBCR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -}
> -
> -/* SPR specific to PowerPC 401 implementation */
> -static void register_401_sprs(CPUPPCState *env)
> -{
> -    /* Debug interface */
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_DBCR0, "DBCR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_40x_dbcr0,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_DBSR, "DBSR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_clear,
> -                 /* Last reset was system reset */
> -                 0x00000300);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_DAC1, "DAC",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_IAC1, "IAC",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* Storage control */
> -    /* XXX: TODO: not implemented */
> -    spr_register(env, SPR_405_SLER, "SLER",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_40x_sler,
> -                 0x00000000);
> -    /* not emulated, as QEMU never does speculative access */
> -    spr_register(env, SPR_40x_SGR, "SGR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0xFFFFFFFF);
> -    /* not emulated, as QEMU do not emulate caches */
> -    spr_register(env, SPR_40x_DCWR, "DCWR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -}
> -
> -static void register_401x2_sprs(CPUPPCState *env)
> -{
> -    register_401_sprs(env);
> -    spr_register(env, SPR_40x_PID, "PID",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    spr_register(env, SPR_40x_ZPR, "ZPR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -}
> -
> -/* SPR specific to PowerPC 403 implementation */
> -static void register_403_sprs(CPUPPCState *env)
> -{
> -    /* Debug interface */
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_DBCR0, "DBCR0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_40x_dbcr0,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_DBSR, "DBSR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_clear,
> -                 /* Last reset was system reset */
> -                 0x00000300);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_DAC1, "DAC1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_DAC2, "DAC2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_IAC1, "IAC1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_IAC2, "IAC2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -}
> -
> -static void register_403_real_sprs(CPUPPCState *env)
> -{
> -    spr_register(env, SPR_403_PBL1,  "PBL1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_403_pbr, &spr_write_403_pbr,
> -                 0x00000000);
> -    spr_register(env, SPR_403_PBU1,  "PBU1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_403_pbr, &spr_write_403_pbr,
> -                 0x00000000);
> -    spr_register(env, SPR_403_PBL2,  "PBL2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_403_pbr, &spr_write_403_pbr,
> -                 0x00000000);
> -    spr_register(env, SPR_403_PBU2,  "PBU2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_403_pbr, &spr_write_403_pbr,
> -                 0x00000000);
> -}
> -
> -static void register_403_mmu_sprs(CPUPPCState *env)
> -{
> -    /* MMU */
> -    spr_register(env, SPR_40x_PID, "PID",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    spr_register(env, SPR_40x_ZPR, "ZPR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -}
> -
> -/* SPR specific to PowerPC compression coprocessor extension */
> -static void register_compress_sprs(CPUPPCState *env)
> -{
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_401_SKR, "SKR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -}
> =20
>  static void register_5xx_8xx_sprs(CPUPPCState *env)
>  {
> @@ -2104,26 +1941,6 @@ static void register_8xx_sprs(CPUPPCState *env)
> =20
>  /***********************************************************************=
******/
>  /* Exception vectors models                                             =
     */
> -static void init_excp_4xx_real(CPUPPCState *env)
> -{
> -#if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_CRITICAL] =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_PIT]      =3D 0x00001000;
> -    env->excp_vectors[POWERPC_EXCP_FIT]      =3D 0x00001010;
> -    env->excp_vectors[POWERPC_EXCP_WDT]      =3D 0x00001020;
> -    env->excp_vectors[POWERPC_EXCP_DEBUG]    =3D 0x00002000;
> -    env->ivor_mask =3D 0x0000FFF0UL;
> -    env->ivpr_mask =3D 0xFFFF0000UL;
> -    /* Hardware reset vector */
> -    env->hreset_vector =3D 0xFFFFFFFCUL;
> -#endif
> -}
> -
>  static void init_excp_4xx_softmmu(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> @@ -2663,335 +2480,6 @@ static int check_pow_hid0_74xx(CPUPPCState *env)
>                                                                          =
    \
>      static void glue(glue(ppc_, _name), _cpu_family_class_init)
> =20
> -static void init_proc_401(CPUPPCState *env)
> -{
> -    register_40x_sprs(env);
> -    register_401_403_sprs(env);
> -    register_401_sprs(env);
> -    init_excp_4xx_real(env);
> -    env->dcache_line_size =3D 32;
> -    env->icache_line_size =3D 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc40x_irq_init(env_archcpu(env));
> -
> -    SET_FIT_PERIOD(12, 16, 20, 24);
> -    SET_WDT_PERIOD(16, 20, 24, 28);
> -}
> -
> -POWERPC_FAMILY(401)(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc =3D DEVICE_CLASS(oc);
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
> -
> -    dc->desc =3D "PowerPC 401";
> -    pcc->init_proc =3D init_proc_401;
> -    pcc->check_pow =3D check_pow_nocheck;
> -    pcc->insns_flags =3D PPC_INSNS_BASE | PPC_STRING |
> -                       PPC_WRTEE | PPC_DCR |
> -                       PPC_CACHE | PPC_CACHE_ICBI | PPC_40x_ICBT |
> -                       PPC_CACHE_DCBZ |
> -                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
> -                       PPC_4xx_COMMON | PPC_40x_EXCP;
> -    pcc->msr_mask =3D (1ull << MSR_KEY) |
> -                    (1ull << MSR_POW) |
> -                    (1ull << MSR_CE) |
> -                    (1ull << MSR_ILE) |
> -                    (1ull << MSR_EE) |
> -                    (1ull << MSR_PR) |
> -                    (1ull << MSR_ME) |
> -                    (1ull << MSR_DE) |
> -                    (1ull << MSR_LE);
> -    pcc->mmu_model =3D POWERPC_MMU_REAL;
> -    pcc->excp_model =3D POWERPC_EXCP_40x;
> -    pcc->bus_model =3D PPC_FLAGS_INPUT_401;
> -    pcc->bfd_mach =3D bfd_mach_ppc_403;
> -    pcc->flags =3D POWERPC_FLAG_CE | POWERPC_FLAG_DE |
> -                 POWERPC_FLAG_BUS_CLK;
> -}
> -
> -static void init_proc_401x2(CPUPPCState *env)
> -{
> -    register_40x_sprs(env);
> -    register_401_403_sprs(env);
> -    register_401x2_sprs(env);
> -    register_compress_sprs(env);
> -    /* Memory management */
> -#if !defined(CONFIG_USER_ONLY)
> -    env->nb_tlb =3D 64;
> -    env->nb_ways =3D 1;
> -    env->id_tlbs =3D 0;
> -    env->tlb_type =3D TLB_EMB;
> -#endif
> -    init_excp_4xx_softmmu(env);
> -    env->dcache_line_size =3D 32;
> -    env->icache_line_size =3D 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc40x_irq_init(env_archcpu(env));
> -
> -    SET_FIT_PERIOD(12, 16, 20, 24);
> -    SET_WDT_PERIOD(16, 20, 24, 28);
> -}
> -
> -POWERPC_FAMILY(401x2)(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc =3D DEVICE_CLASS(oc);
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
> -
> -    dc->desc =3D "PowerPC 401x2";
> -    pcc->init_proc =3D init_proc_401x2;
> -    pcc->check_pow =3D check_pow_nocheck;
> -    pcc->insns_flags =3D PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
> -                       PPC_DCR | PPC_WRTEE |
> -                       PPC_CACHE | PPC_CACHE_ICBI | PPC_40x_ICBT |
> -                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
> -                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
> -                       PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
> -                       PPC_4xx_COMMON | PPC_40x_EXCP;
> -    pcc->msr_mask =3D (1ull << 20) |
> -                    (1ull << MSR_KEY) |
> -                    (1ull << MSR_POW) |
> -                    (1ull << MSR_CE) |
> -                    (1ull << MSR_ILE) |
> -                    (1ull << MSR_EE) |
> -                    (1ull << MSR_PR) |
> -                    (1ull << MSR_ME) |
> -                    (1ull << MSR_DE) |
> -                    (1ull << MSR_IR) |
> -                    (1ull << MSR_DR) |
> -                    (1ull << MSR_LE);
> -    pcc->mmu_model =3D POWERPC_MMU_SOFT_4xx_Z;
> -    pcc->excp_model =3D POWERPC_EXCP_40x;
> -    pcc->bus_model =3D PPC_FLAGS_INPUT_401;
> -    pcc->bfd_mach =3D bfd_mach_ppc_403;
> -    pcc->flags =3D POWERPC_FLAG_CE | POWERPC_FLAG_DE |
> -                 POWERPC_FLAG_BUS_CLK;
> -}
> -
> -static void init_proc_401x3(CPUPPCState *env)
> -{
> -    register_40x_sprs(env);
> -    register_401_403_sprs(env);
> -    register_401_sprs(env);
> -    register_401x2_sprs(env);
> -    register_compress_sprs(env);
> -    init_excp_4xx_softmmu(env);
> -    env->dcache_line_size =3D 32;
> -    env->icache_line_size =3D 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc40x_irq_init(env_archcpu(env));
> -
> -    SET_FIT_PERIOD(12, 16, 20, 24);
> -    SET_WDT_PERIOD(16, 20, 24, 28);
> -}
> -
> -POWERPC_FAMILY(401x3)(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc =3D DEVICE_CLASS(oc);
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
> -
> -    dc->desc =3D "PowerPC 401x3";
> -    pcc->init_proc =3D init_proc_401x3;
> -    pcc->check_pow =3D check_pow_nocheck;
> -    pcc->insns_flags =3D PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
> -                       PPC_DCR | PPC_WRTEE |
> -                       PPC_CACHE | PPC_CACHE_ICBI | PPC_40x_ICBT |
> -                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
> -                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
> -                       PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
> -                       PPC_4xx_COMMON | PPC_40x_EXCP;
> -    pcc->msr_mask =3D (1ull << 20) |
> -                    (1ull << MSR_KEY) |
> -                    (1ull << MSR_POW) |
> -                    (1ull << MSR_CE) |
> -                    (1ull << MSR_ILE) |
> -                    (1ull << MSR_EE) |
> -                    (1ull << MSR_PR) |
> -                    (1ull << MSR_ME) |
> -                    (1ull << MSR_DWE) |
> -                    (1ull << MSR_DE) |
> -                    (1ull << MSR_IR) |
> -                    (1ull << MSR_DR) |
> -                    (1ull << MSR_LE);
> -    pcc->mmu_model =3D POWERPC_MMU_SOFT_4xx_Z;
> -    pcc->excp_model =3D POWERPC_EXCP_40x;
> -    pcc->bus_model =3D PPC_FLAGS_INPUT_401;
> -    pcc->bfd_mach =3D bfd_mach_ppc_403;
> -    pcc->flags =3D POWERPC_FLAG_CE | POWERPC_FLAG_DE |
> -                 POWERPC_FLAG_BUS_CLK;
> -}
> -
> -static void init_proc_IOP480(CPUPPCState *env)
> -{
> -    register_40x_sprs(env);
> -    register_401_403_sprs(env);
> -    register_401x2_sprs(env);
> -    register_compress_sprs(env);
> -    /* Memory management */
> -#if !defined(CONFIG_USER_ONLY)
> -    env->nb_tlb =3D 64;
> -    env->nb_ways =3D 1;
> -    env->id_tlbs =3D 0;
> -    env->tlb_type =3D TLB_EMB;
> -#endif
> -    init_excp_4xx_softmmu(env);
> -    env->dcache_line_size =3D 32;
> -    env->icache_line_size =3D 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc40x_irq_init(env_archcpu(env));
> -
> -    SET_FIT_PERIOD(8, 12, 16, 20);
> -    SET_WDT_PERIOD(16, 20, 24, 28);
> -}
> -
> -POWERPC_FAMILY(IOP480)(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc =3D DEVICE_CLASS(oc);
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
> -
> -    dc->desc =3D "IOP480";
> -    pcc->init_proc =3D init_proc_IOP480;
> -    pcc->check_pow =3D check_pow_nocheck;
> -    pcc->insns_flags =3D PPC_INSNS_BASE | PPC_STRING |
> -                       PPC_DCR | PPC_WRTEE |
> -                       PPC_CACHE | PPC_CACHE_ICBI |  PPC_40x_ICBT |
> -                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
> -                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
> -                       PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
> -                       PPC_4xx_COMMON | PPC_40x_EXCP;
> -    pcc->msr_mask =3D (1ull << 20) |
> -                    (1ull << MSR_KEY) |
> -                    (1ull << MSR_POW) |
> -                    (1ull << MSR_CE) |
> -                    (1ull << MSR_ILE) |
> -                    (1ull << MSR_EE) |
> -                    (1ull << MSR_PR) |
> -                    (1ull << MSR_ME) |
> -                    (1ull << MSR_DE) |
> -                    (1ull << MSR_IR) |
> -                    (1ull << MSR_DR) |
> -                    (1ull << MSR_LE);
> -    pcc->mmu_model =3D POWERPC_MMU_SOFT_4xx_Z;
> -    pcc->excp_model =3D POWERPC_EXCP_40x;
> -    pcc->bus_model =3D PPC_FLAGS_INPUT_401;
> -    pcc->bfd_mach =3D bfd_mach_ppc_403;
> -    pcc->flags =3D POWERPC_FLAG_CE | POWERPC_FLAG_DE |
> -                 POWERPC_FLAG_BUS_CLK;
> -}
> -
> -static void init_proc_403(CPUPPCState *env)
> -{
> -    register_40x_sprs(env);
> -    register_401_403_sprs(env);
> -    register_403_sprs(env);
> -    register_403_real_sprs(env);
> -    init_excp_4xx_real(env);
> -    env->dcache_line_size =3D 32;
> -    env->icache_line_size =3D 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc40x_irq_init(env_archcpu(env));
> -
> -    SET_FIT_PERIOD(8, 12, 16, 20);
> -    SET_WDT_PERIOD(16, 20, 24, 28);
> -}
> -
> -POWERPC_FAMILY(403)(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc =3D DEVICE_CLASS(oc);
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
> -
> -    dc->desc =3D "PowerPC 403";
> -    pcc->init_proc =3D init_proc_403;
> -    pcc->check_pow =3D check_pow_nocheck;
> -    pcc->insns_flags =3D PPC_INSNS_BASE | PPC_STRING |
> -                       PPC_DCR | PPC_WRTEE |
> -                       PPC_CACHE | PPC_CACHE_ICBI | PPC_40x_ICBT |
> -                       PPC_CACHE_DCBZ |
> -                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
> -                       PPC_4xx_COMMON | PPC_40x_EXCP;
> -    pcc->msr_mask =3D (1ull << MSR_POW) |
> -                    (1ull << MSR_CE) |
> -                    (1ull << MSR_ILE) |
> -                    (1ull << MSR_EE) |
> -                    (1ull << MSR_PR) |
> -                    (1ull << MSR_ME) |
> -                    (1ull << MSR_PE) |
> -                    (1ull << MSR_PX) |
> -                    (1ull << MSR_LE);
> -    pcc->mmu_model =3D POWERPC_MMU_REAL;
> -    pcc->excp_model =3D POWERPC_EXCP_40x;
> -    pcc->bus_model =3D PPC_FLAGS_INPUT_401;
> -    pcc->bfd_mach =3D bfd_mach_ppc_403;
> -    pcc->flags =3D POWERPC_FLAG_CE | POWERPC_FLAG_PX |
> -                 POWERPC_FLAG_BUS_CLK;
> -}
> -
> -static void init_proc_403GCX(CPUPPCState *env)
> -{
> -    register_40x_sprs(env);
> -    register_401_403_sprs(env);
> -    register_403_sprs(env);
> -    register_403_real_sprs(env);
> -    register_403_mmu_sprs(env);
> -    /* Bus access control */
> -    /* not emulated, as QEMU never does speculative access */
> -    spr_register(env, SPR_40x_SGR, "SGR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0xFFFFFFFF);
> -    /* not emulated, as QEMU do not emulate caches */
> -    spr_register(env, SPR_40x_DCWR, "DCWR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* Memory management */
> -#if !defined(CONFIG_USER_ONLY)
> -    env->nb_tlb =3D 64;
> -    env->nb_ways =3D 1;
> -    env->id_tlbs =3D 0;
> -    env->tlb_type =3D TLB_EMB;
> -#endif
> -    init_excp_4xx_softmmu(env);
> -    env->dcache_line_size =3D 32;
> -    env->icache_line_size =3D 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc40x_irq_init(env_archcpu(env));
> -
> -    SET_FIT_PERIOD(8, 12, 16, 20);
> -    SET_WDT_PERIOD(16, 20, 24, 28);
> -}
> -
> -POWERPC_FAMILY(403GCX)(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc =3D DEVICE_CLASS(oc);
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
> -
> -    dc->desc =3D "PowerPC 403 GCX";
> -    pcc->init_proc =3D init_proc_403GCX;
> -    pcc->check_pow =3D check_pow_nocheck;
> -    pcc->insns_flags =3D PPC_INSNS_BASE | PPC_STRING |
> -                       PPC_DCR | PPC_WRTEE |
> -                       PPC_CACHE | PPC_CACHE_ICBI | PPC_40x_ICBT |
> -                       PPC_CACHE_DCBZ |
> -                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
> -                       PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
> -                       PPC_4xx_COMMON | PPC_40x_EXCP;
> -    pcc->msr_mask =3D (1ull << MSR_POW) |
> -                    (1ull << MSR_CE) |
> -                    (1ull << MSR_ILE) |
> -                    (1ull << MSR_EE) |
> -                    (1ull << MSR_PR) |
> -                    (1ull << MSR_ME) |
> -                    (1ull << MSR_PE) |
> -                    (1ull << MSR_PX) |
> -                    (1ull << MSR_LE);
> -    pcc->mmu_model =3D POWERPC_MMU_SOFT_4xx_Z;
> -    pcc->excp_model =3D POWERPC_EXCP_40x;
> -    pcc->bus_model =3D PPC_FLAGS_INPUT_401;
> -    pcc->bfd_mach =3D bfd_mach_ppc_403;
> -    pcc->flags =3D POWERPC_FLAG_CE | POWERPC_FLAG_PX |
> -                 POWERPC_FLAG_BUS_CLK;
> -}
> -
>  static void init_proc_405(CPUPPCState *env)
>  {
>      /* Time base */
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 121f2f958bc6..cfa2d256e44a 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1528,7 +1528,6 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vadd=
r vaddr,
> =20
>      switch (env->mmu_model) {
>      case POWERPC_MMU_SOFT_4xx:
> -    case POWERPC_MMU_SOFT_4xx_Z:
>          env->spr[SPR_40x_DEAR] =3D vaddr;
>          break;
>      case POWERPC_MMU_BOOKE:
> diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
> index 86795b281427..4e278365ca55 100644
> --- a/target/ppc/mmu_common.c
> +++ b/target/ppc/mmu_common.c
> @@ -1173,11 +1173,9 @@ void dump_mmu(CPUPPCState *env)
>  static int check_physical(CPUPPCState *env, mmu_ctx_t *ctx, target_ulong=
 eaddr,
>                            MMUAccessType access_type)
>  {
> -    int in_plb, ret;
> -
>      ctx->raddr =3D eaddr;
>      ctx->prot =3D PAGE_READ | PAGE_EXEC;
> -    ret =3D 0;
> +
>      switch (env->mmu_model) {
>      case POWERPC_MMU_SOFT_6xx:
>      case POWERPC_MMU_SOFT_4xx:
> @@ -1186,39 +1184,12 @@ static int check_physical(CPUPPCState *env, mmu_c=
tx_t *ctx, target_ulong eaddr,
>          ctx->prot |=3D PAGE_WRITE;
>          break;
> =20
> -    case POWERPC_MMU_SOFT_4xx_Z:
> -        if (unlikely(msr_pe !=3D 0)) {
> -            /*
> -             * 403 family add some particular protections, using
> -             * PBL/PBU registers for accesses with no translation.
> -             */
> -            in_plb =3D
> -                /* Check PLB validity */
> -                (env->pb[0] < env->pb[1] &&
> -                 /* and address in plb area */
> -                 eaddr >=3D env->pb[0] && eaddr < env->pb[1]) ||
> -                (env->pb[2] < env->pb[3] &&
> -                 eaddr >=3D env->pb[2] && eaddr < env->pb[3]) ? 1 : 0;
> -            if (in_plb ^ msr_px) {
> -                /* Access in protected area */
> -                if (access_type =3D=3D MMU_DATA_STORE) {
> -                    /* Access is not allowed */
> -                    ret =3D -2;
> -                }
> -            } else {
> -                /* Read-write access is allowed */
> -                ctx->prot |=3D PAGE_WRITE;
> -            }
> -        }
> -        break;
> -
>      default:
>          /* Caller's checks mean we should never get here for other model=
s */
> -        abort();
> -        return -1;
> +        g_assert_not_reached();
>      }
> =20
> -    return ret;
> +    return 0;
>  }
> =20
>  int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
> @@ -1247,7 +1218,6 @@ int get_physical_address_wtlb(CPUPPCState *env, mmu=
_ctx_t *ctx,
>          break;
> =20
>      case POWERPC_MMU_SOFT_4xx:
> -    case POWERPC_MMU_SOFT_4xx_Z:
>          if (real_mode) {
>              ret =3D check_physical(env, ctx, eaddr, access_type);
>          } else {
> @@ -1381,7 +1351,6 @@ static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr =
eaddr,
>                      env->spr[SPR_ICMP] =3D 0x80000000 | ctx.ptem;
>                      goto tlb_miss;
>                  case POWERPC_MMU_SOFT_4xx:
> -                case POWERPC_MMU_SOFT_4xx_Z:
>                      cs->exception_index =3D POWERPC_EXCP_ITLB;
>                      env->error_code =3D 0;
>                      env->spr[SPR_40x_DEAR] =3D eaddr;
> @@ -1449,7 +1418,6 @@ static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr =
eaddr,
>                          get_pteg_offset32(cpu, ctx.hash[1]);
>                      break;
>                  case POWERPC_MMU_SOFT_4xx:
> -                case POWERPC_MMU_SOFT_4xx_Z:
>                      cs->exception_index =3D POWERPC_EXCP_DTLB;
>                      env->error_code =3D 0;
>                      env->spr[SPR_40x_DEAR] =3D eaddr;
> @@ -1482,8 +1450,7 @@ static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr =
eaddr,
>                  /* Access rights violation */
>                  cs->exception_index =3D POWERPC_EXCP_DSI;
>                  env->error_code =3D 0;
> -                if (env->mmu_model =3D=3D POWERPC_MMU_SOFT_4xx
> -                    || env->mmu_model =3D=3D POWERPC_MMU_SOFT_4xx_Z) {
> +                if (env->mmu_model =3D=3D POWERPC_MMU_SOFT_4xx) {
>                      env->spr[SPR_40x_DEAR] =3D eaddr;
>                      if (access_type =3D=3D MMU_DATA_STORE) {
>                          env->spr[SPR_40x_ESR] |=3D 0x00800000;
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index f992131c1aa5..2ec3d203a081 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -388,7 +388,6 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
>          ppc6xx_tlb_invalidate_all(env);
>          break;
>      case POWERPC_MMU_SOFT_4xx:
> -    case POWERPC_MMU_SOFT_4xx_Z:
>          ppc4xx_tlb_invalidate_all(env);
>          break;
>      case POWERPC_MMU_REAL:

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4JT4vrt3zzukmlkc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGpbeQACgkQbDjKyiDZ
s5JLRA//dS0L0xIYRzypON6zUlWXOf4XSPTs8SPDBEVG7kv0n3DGxIWJTZizPJeF
EdObFu4X54auy8iS/6OrcMpjDSM0/d0yyaX4II+f258avs92WPiudOzDtRVKiIuc
hae9rSru2IY3hFbz0uWeH0QxBA1j8qGwx+6USEH/i4L9qDtdWuWGUmrJ0tL8H4p2
7DankRLIztaHxd2MgfWAxOVWuOVL6dZ22N4e8e7Y5hfQTN/wTF8W1koeyzgjprQU
OyNVsWUVdw8JgZd2bmhHAnq6WuYsCgglThQIN1RXTefZWAOgRisqso5YjIGndCSa
tPbb9ISvB3N4R+8/Tytcj+y6lEmYZ4mNTs5SvAjRiyun4x+d6E9h/IofCp5rnnsk
J+gtzpiyOaOZlX/0gP3Ch3utoPM/c8QNpTFQpGkPmhDTzf8G7eRaouDTcRqqnVwp
+TnGZbMdlYXMBApOV/u+qsyANLWxjLz3hiObee5VGtWZPtpbO13TNZ2u+aNI57fC
ihwiv7/QEN0rBok2pS62K2WTRHGzF4RGJyvNqfk4NwbKdXTbC+C4hzyBsby37qbx
nF8i4ahxgdT5HzFN2fKb6efaOK2McI5fmyO4Bl/yDf8PW0iDQW2rEpfQPDqGbbEt
5MDOuu5BjlhehCx4+P1Q2p2StbMZ5Xs9Ur+KEXfwg9ZCoJPeueM=
=NHnA
-----END PGP SIGNATURE-----

--4JT4vrt3zzukmlkc--

