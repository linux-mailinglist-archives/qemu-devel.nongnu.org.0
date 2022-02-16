Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3F74B8046
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:47:10 +0100 (CET)
Received: from localhost ([::1]:44646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKD9h-0001RY-Ac
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:47:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7j-0001Kv-Hj; Tue, 15 Feb 2022 23:41:07 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:38487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7e-0000S3-BX; Tue, 15 Feb 2022 23:41:03 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y34StXz4y4y; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=J3yHtjtght3gSW5rX5TQqURRR1eVWghhU0pGQkkSbD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TPCDcD/Nb0OJADYtsIrOJVPBodosEXQpxYUGF/6TgMdPi7Kdm0F0VA2pW2eagnEfd
 cWVnuDB+jVVAlMo4rWf6xsMtfO/NPA/eB+I7KefIXPSLGD7SgdlhA1q3J7/n4ad8Vj
 eHHZ/tqo4yEFs/DtsUGWRyR+9Hj/gxR4c4i81OPo=
Date: Wed, 16 Feb 2022 14:05:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 27/27] target/ppc: Move common SPR functions out of
 cpu_init
Message-ID: <YgxqEtb++wdOmMYz@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-28-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hEk1OgdvgFAEkWhF"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-28-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


--hEk1OgdvgFAEkWhF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:48PM -0300, Fabiano Rosas wrote:
> Let's leave cpu_init with just generic CPU initialization and
> QOM-related functions.
>=20
> The rest of the SPR registration functions will be moved in the
> following patches along with the code that uses them. These are only
> the commonly used ones.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c    | 400 --------------------------------------
>  target/ppc/helper_regs.c | 402 +++++++++++++++++++++++++++++++++++++++
>  target/ppc/spr_tcg.h     |   1 +
>  3 files changed, 403 insertions(+), 400 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 34306e2360..6278729883 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -57,367 +57,6 @@ static inline void vscr_init(CPUPPCState *env, uint32=
_t val)
>      ppc_store_vscr(env, val);
>  }
> =20
> -/**
> - * _spr_register
> - *
> - * Register an SPR with all the callbacks required for tcg,
> - * and the ID number for KVM.
> - *
> - * The reason for the conditional compilation is that the tcg functions
> - * may be compiled out, and the system kvm header may not be available
> - * for supplying the ID numbers.  This is ugly, but the best we can do.
> - */
> -void _spr_register(CPUPPCState *env, int num, const char *name,
> -                   USR_ARG(spr_callback *uea_read)
> -                   USR_ARG(spr_callback *uea_write)
> -                   SYS_ARG(spr_callback *oea_read)
> -                   SYS_ARG(spr_callback *oea_write)
> -                   SYS_ARG(spr_callback *hea_read)
> -                   SYS_ARG(spr_callback *hea_write)
> -                   KVM_ARG(uint64_t one_reg_id)
> -                   target_ulong initial_value)
> -{
> -    ppc_spr_t *spr =3D &env->spr_cb[num];
> -
> -    /* No SPR should be registered twice. */
> -    assert(spr->name =3D=3D NULL);
> -    assert(name !=3D NULL);
> -
> -    spr->name =3D name;
> -    spr->default_value =3D initial_value;
> -    env->spr[num] =3D initial_value;
> -
> -#ifdef CONFIG_TCG
> -    spr->uea_read =3D uea_read;
> -    spr->uea_write =3D uea_write;
> -# ifndef CONFIG_USER_ONLY
> -    spr->oea_read =3D oea_read;
> -    spr->oea_write =3D oea_write;
> -    spr->hea_read =3D hea_read;
> -    spr->hea_write =3D hea_write;
> -# endif
> -#endif
> -#ifdef CONFIG_KVM
> -    spr->one_reg_id =3D one_reg_id;
> -#endif
> -}
> -
> -/* Generic PowerPC SPRs */
> -static void register_generic_sprs(PowerPCCPU *cpu)
> -{
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> -    CPUPPCState *env =3D &cpu->env;
> -
> -    /* Integer processing */
> -    spr_register(env, SPR_XER, "XER",
> -                 &spr_read_xer, &spr_write_xer,
> -                 &spr_read_xer, &spr_write_xer,
> -                 0x00000000);
> -    /* Branch control */
> -    spr_register(env, SPR_LR, "LR",
> -                 &spr_read_lr, &spr_write_lr,
> -                 &spr_read_lr, &spr_write_lr,
> -                 0x00000000);
> -    spr_register(env, SPR_CTR, "CTR",
> -                 &spr_read_ctr, &spr_write_ctr,
> -                 &spr_read_ctr, &spr_write_ctr,
> -                 0x00000000);
> -    /* Interrupt processing */
> -    spr_register(env, SPR_SRR0, "SRR0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    spr_register(env, SPR_SRR1, "SRR1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* Processor control */
> -    spr_register(env, SPR_SPRG0, "SPRG0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    spr_register(env, SPR_SPRG1, "SPRG1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    spr_register(env, SPR_SPRG2, "SPRG2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    spr_register(env, SPR_SPRG3, "SPRG3",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_PVR, "PVR",
> -                 /* Linux permits userspace to read PVR */
> -#if defined(CONFIG_LINUX_USER)
> -                 &spr_read_generic,
> -#else
> -                 SPR_NOACCESS,
> -#endif
> -                 SPR_NOACCESS,
> -                 &spr_read_generic, SPR_NOACCESS,
> -                 pcc->pvr);
> -
> -    /* Register SVR if it's defined to anything else than POWERPC_SVR_NO=
NE */
> -    if (pcc->svr !=3D POWERPC_SVR_NONE) {
> -        if (pcc->svr & POWERPC_SVR_E500) {
> -            spr_register(env, SPR_E500_SVR, "SVR",
> -                         SPR_NOACCESS, SPR_NOACCESS,
> -                         &spr_read_generic, SPR_NOACCESS,
> -                         pcc->svr & ~POWERPC_SVR_E500);
> -        } else {
> -            spr_register(env, SPR_SVR, "SVR",
> -                         SPR_NOACCESS, SPR_NOACCESS,
> -                         &spr_read_generic, SPR_NOACCESS,
> -                         pcc->svr);
> -        }
> -    }
> -
> -    /* Time base */
> -    spr_register(env, SPR_VTBL,  "TBL",
> -                 &spr_read_tbl, SPR_NOACCESS,
> -                 &spr_read_tbl, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_TBL,   "TBL",
> -                 &spr_read_tbl, SPR_NOACCESS,
> -                 &spr_read_tbl, &spr_write_tbl,
> -                 0x00000000);
> -    spr_register(env, SPR_VTBU,  "TBU",
> -                 &spr_read_tbu, SPR_NOACCESS,
> -                 &spr_read_tbu, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_TBU,   "TBU",
> -                 &spr_read_tbu, SPR_NOACCESS,
> -                 &spr_read_tbu, &spr_write_tbu,
> -                 0x00000000);
> -}
> -
> -void register_non_embedded_sprs(CPUPPCState *env)
> -{
> -    /* Exception processing */
> -    spr_register_kvm(env, SPR_DSISR, "DSISR",
> -                     SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> -                     KVM_REG_PPC_DSISR, 0x00000000);
> -    spr_register_kvm(env, SPR_DAR, "DAR",
> -                     SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> -                     KVM_REG_PPC_DAR, 0x00000000);
> -    /* Timer */
> -    spr_register(env, SPR_DECR, "DECR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_decr, &spr_write_decr,
> -                 0x00000000);
> -}
> -
> -/* Storage Description Register 1 */
> -void register_sdr1_sprs(CPUPPCState *env)
> -{
> -#ifndef CONFIG_USER_ONLY
> -    if (env->has_hv_mode) {
> -        /*
> -         * SDR1 is a hypervisor resource on CPUs which have a
> -         * hypervisor mode
> -         */
> -        spr_register_hv(env, SPR_SDR1, "SDR1",
> -                        SPR_NOACCESS, SPR_NOACCESS,
> -                        SPR_NOACCESS, SPR_NOACCESS,
> -                        &spr_read_generic, &spr_write_sdr1,
> -                        0x00000000);
> -    } else {
> -        spr_register(env, SPR_SDR1, "SDR1",
> -                     SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_sdr1,
> -                     0x00000000);
> -    }
> -#endif
> -}
> -
> -/* BATs 0-3 */
> -void register_low_BATs(CPUPPCState *env)
> -{
> -#if !defined(CONFIG_USER_ONLY)
> -    spr_register(env, SPR_IBAT0U, "IBAT0U",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_ibat, &spr_write_ibatu,
> -                 0x00000000);
> -    spr_register(env, SPR_IBAT0L, "IBAT0L",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_ibat, &spr_write_ibatl,
> -                 0x00000000);
> -    spr_register(env, SPR_IBAT1U, "IBAT1U",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_ibat, &spr_write_ibatu,
> -                 0x00000000);
> -    spr_register(env, SPR_IBAT1L, "IBAT1L",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_ibat, &spr_write_ibatl,
> -                 0x00000000);
> -    spr_register(env, SPR_IBAT2U, "IBAT2U",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_ibat, &spr_write_ibatu,
> -                 0x00000000);
> -    spr_register(env, SPR_IBAT2L, "IBAT2L",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_ibat, &spr_write_ibatl,
> -                 0x00000000);
> -    spr_register(env, SPR_IBAT3U, "IBAT3U",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_ibat, &spr_write_ibatu,
> -                 0x00000000);
> -    spr_register(env, SPR_IBAT3L, "IBAT3L",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_ibat, &spr_write_ibatl,
> -                 0x00000000);
> -    spr_register(env, SPR_DBAT0U, "DBAT0U",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_dbat, &spr_write_dbatu,
> -                 0x00000000);
> -    spr_register(env, SPR_DBAT0L, "DBAT0L",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_dbat, &spr_write_dbatl,
> -                 0x00000000);
> -    spr_register(env, SPR_DBAT1U, "DBAT1U",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_dbat, &spr_write_dbatu,
> -                 0x00000000);
> -    spr_register(env, SPR_DBAT1L, "DBAT1L",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_dbat, &spr_write_dbatl,
> -                 0x00000000);
> -    spr_register(env, SPR_DBAT2U, "DBAT2U",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_dbat, &spr_write_dbatu,
> -                 0x00000000);
> -    spr_register(env, SPR_DBAT2L, "DBAT2L",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_dbat, &spr_write_dbatl,
> -                 0x00000000);
> -    spr_register(env, SPR_DBAT3U, "DBAT3U",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_dbat, &spr_write_dbatu,
> -                 0x00000000);
> -    spr_register(env, SPR_DBAT3L, "DBAT3L",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_dbat, &spr_write_dbatl,
> -                 0x00000000);
> -    env->nb_BATs +=3D 4;
> -#endif
> -}
> -
> -/* BATs 4-7 */
> -void register_high_BATs(CPUPPCState *env)
> -{
> -#if !defined(CONFIG_USER_ONLY)
> -    spr_register(env, SPR_IBAT4U, "IBAT4U",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_ibat_h, &spr_write_ibatu_h,
> -                 0x00000000);
> -    spr_register(env, SPR_IBAT4L, "IBAT4L",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_ibat_h, &spr_write_ibatl_h,
> -                 0x00000000);
> -    spr_register(env, SPR_IBAT5U, "IBAT5U",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_ibat_h, &spr_write_ibatu_h,
> -                 0x00000000);
> -    spr_register(env, SPR_IBAT5L, "IBAT5L",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_ibat_h, &spr_write_ibatl_h,
> -                 0x00000000);
> -    spr_register(env, SPR_IBAT6U, "IBAT6U",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_ibat_h, &spr_write_ibatu_h,
> -                 0x00000000);
> -    spr_register(env, SPR_IBAT6L, "IBAT6L",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_ibat_h, &spr_write_ibatl_h,
> -                 0x00000000);
> -    spr_register(env, SPR_IBAT7U, "IBAT7U",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_ibat_h, &spr_write_ibatu_h,
> -                 0x00000000);
> -    spr_register(env, SPR_IBAT7L, "IBAT7L",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_ibat_h, &spr_write_ibatl_h,
> -                 0x00000000);
> -    spr_register(env, SPR_DBAT4U, "DBAT4U",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_dbat_h, &spr_write_dbatu_h,
> -                 0x00000000);
> -    spr_register(env, SPR_DBAT4L, "DBAT4L",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_dbat_h, &spr_write_dbatl_h,
> -                 0x00000000);
> -    spr_register(env, SPR_DBAT5U, "DBAT5U",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_dbat_h, &spr_write_dbatu_h,
> -                 0x00000000);
> -    spr_register(env, SPR_DBAT5L, "DBAT5L",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_dbat_h, &spr_write_dbatl_h,
> -                 0x00000000);
> -    spr_register(env, SPR_DBAT6U, "DBAT6U",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_dbat_h, &spr_write_dbatu_h,
> -                 0x00000000);
> -    spr_register(env, SPR_DBAT6L, "DBAT6L",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_dbat_h, &spr_write_dbatl_h,
> -                 0x00000000);
> -    spr_register(env, SPR_DBAT7U, "DBAT7U",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_dbat_h, &spr_write_dbatu_h,
> -                 0x00000000);
> -    spr_register(env, SPR_DBAT7L, "DBAT7L",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_dbat_h, &spr_write_dbatl_h,
> -                 0x00000000);
> -    env->nb_BATs +=3D 4;
> -#endif
> -}
> -
> -/* Softare table search registers */
> -void register_soft_tlb_sprs(CPUPPCState *env, int nb_tlbs, int nb_ways)
> -{
> -#if !defined(CONFIG_USER_ONLY)
> -    env->nb_tlb =3D nb_tlbs;
> -    env->nb_ways =3D nb_ways;
> -    env->id_tlbs =3D 1;
> -    env->tlb_type =3D TLB_6XX;
> -    spr_register(env, SPR_DMISS, "DMISS",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_DCMP, "DCMP",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_HASH1, "HASH1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_HASH2, "HASH2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_IMISS, "IMISS",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_ICMP, "ICMP",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_RPA, "RPA",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -#endif
> -}
> -
>  static void register_755_sprs(CPUPPCState *env)
>  {
>      /* SGPRs */
> @@ -620,25 +259,6 @@ static void register_iamr_sprs(CPUPPCState *env)
>  }
>  #endif /* TARGET_PPC64 */
> =20
> -void register_thrm_sprs(CPUPPCState *env)
> -{
> -    /* Thermal management */
> -    spr_register(env, SPR_THRM1, "THRM1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_thrm, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_THRM2, "THRM2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_thrm, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_THRM3, "THRM3",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_thrm, &spr_write_generic,
> -                 0x00000000);
> -}
> -
>  /* SPR specific to PowerPC 604 implementation */
>  static void register_604_sprs(CPUPPCState *env)
>  {
> @@ -1025,26 +645,6 @@ static void register_l3_ctrl(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -void register_usprgh_sprs(CPUPPCState *env)
> -{
> -    spr_register(env, SPR_USPRG4, "USPRG4",
> -                 &spr_read_ureg, SPR_NOACCESS,
> -                 &spr_read_ureg, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_USPRG5, "USPRG5",
> -                 &spr_read_ureg, SPR_NOACCESS,
> -                 &spr_read_ureg, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_USPRG6, "USPRG6",
> -                 &spr_read_ureg, SPR_NOACCESS,
> -                 &spr_read_ureg, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_USPRG7, "USPRG7",
> -                 &spr_read_ureg, SPR_NOACCESS,
> -                 &spr_read_ureg, SPR_NOACCESS,
> -                 0x00000000);
> -}
> -
>  /* PowerPC BookE SPR */
>  static void register_BookE_sprs(CPUPPCState *env, uint64_t ivor_mask)
>  {
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 38fcb5fe50..2df86cc76f 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -24,6 +24,8 @@
>  #include "sysemu/kvm.h"
>  #include "helper_regs.h"
>  #include "power8-pmu.h"
> +#include "cpu-models.h"
> +#include "spr_tcg.h"
> =20
>  /* Swap temporary saved registers with GPRs */
>  void hreg_swap_gpr_tgpr(CPUPPCState *env)
> @@ -302,3 +304,403 @@ void check_tlb_flush(CPUPPCState *env, bool global)
>      }
>  }
>  #endif
> +
> +/**
> + * _spr_register
> + *
> + * Register an SPR with all the callbacks required for tcg,
> + * and the ID number for KVM.
> + *
> + * The reason for the conditional compilation is that the tcg functions
> + * may be compiled out, and the system kvm header may not be available
> + * for supplying the ID numbers.  This is ugly, but the best we can do.
> + */
> +void _spr_register(CPUPPCState *env, int num, const char *name,
> +                   USR_ARG(spr_callback *uea_read)
> +                   USR_ARG(spr_callback *uea_write)
> +                   SYS_ARG(spr_callback *oea_read)
> +                   SYS_ARG(spr_callback *oea_write)
> +                   SYS_ARG(spr_callback *hea_read)
> +                   SYS_ARG(spr_callback *hea_write)
> +                   KVM_ARG(uint64_t one_reg_id)
> +                   target_ulong initial_value)
> +{
> +    ppc_spr_t *spr =3D &env->spr_cb[num];
> +
> +    /* No SPR should be registered twice. */
> +    assert(spr->name =3D=3D NULL);
> +    assert(name !=3D NULL);
> +
> +    spr->name =3D name;
> +    spr->default_value =3D initial_value;
> +    env->spr[num] =3D initial_value;
> +
> +#ifdef CONFIG_TCG
> +    spr->uea_read =3D uea_read;
> +    spr->uea_write =3D uea_write;
> +# ifndef CONFIG_USER_ONLY
> +    spr->oea_read =3D oea_read;
> +    spr->oea_write =3D oea_write;
> +    spr->hea_read =3D hea_read;
> +    spr->hea_write =3D hea_write;
> +# endif
> +#endif
> +#ifdef CONFIG_KVM
> +    spr->one_reg_id =3D one_reg_id;
> +#endif
> +}
> +
> +/* Generic PowerPC SPRs */
> +void register_generic_sprs(PowerPCCPU *cpu)
> +{
> +    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    /* Integer processing */
> +    spr_register(env, SPR_XER, "XER",
> +                 &spr_read_xer, &spr_write_xer,
> +                 &spr_read_xer, &spr_write_xer,
> +                 0x00000000);
> +    /* Branch control */
> +    spr_register(env, SPR_LR, "LR",
> +                 &spr_read_lr, &spr_write_lr,
> +                 &spr_read_lr, &spr_write_lr,
> +                 0x00000000);
> +    spr_register(env, SPR_CTR, "CTR",
> +                 &spr_read_ctr, &spr_write_ctr,
> +                 &spr_read_ctr, &spr_write_ctr,
> +                 0x00000000);
> +    /* Interrupt processing */
> +    spr_register(env, SPR_SRR0, "SRR0",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    spr_register(env, SPR_SRR1, "SRR1",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    /* Processor control */
> +    spr_register(env, SPR_SPRG0, "SPRG0",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    spr_register(env, SPR_SPRG1, "SPRG1",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    spr_register(env, SPR_SPRG2, "SPRG2",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    spr_register(env, SPR_SPRG3, "SPRG3",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_PVR, "PVR",
> +                 /* Linux permits userspace to read PVR */
> +#if defined(CONFIG_LINUX_USER)
> +                 &spr_read_generic,
> +#else
> +                 SPR_NOACCESS,
> +#endif
> +                 SPR_NOACCESS,
> +                 &spr_read_generic, SPR_NOACCESS,
> +                 pcc->pvr);
> +
> +    /* Register SVR if it's defined to anything else than POWERPC_SVR_NO=
NE */
> +    if (pcc->svr !=3D POWERPC_SVR_NONE) {
> +        if (pcc->svr & POWERPC_SVR_E500) {
> +            spr_register(env, SPR_E500_SVR, "SVR",
> +                         SPR_NOACCESS, SPR_NOACCESS,
> +                         &spr_read_generic, SPR_NOACCESS,
> +                         pcc->svr & ~POWERPC_SVR_E500);
> +        } else {
> +            spr_register(env, SPR_SVR, "SVR",
> +                         SPR_NOACCESS, SPR_NOACCESS,
> +                         &spr_read_generic, SPR_NOACCESS,
> +                         pcc->svr);
> +        }
> +    }
> +
> +    /* Time base */
> +    spr_register(env, SPR_VTBL,  "TBL",
> +                 &spr_read_tbl, SPR_NOACCESS,
> +                 &spr_read_tbl, SPR_NOACCESS,
> +                 0x00000000);
> +    spr_register(env, SPR_TBL,   "TBL",
> +                 &spr_read_tbl, SPR_NOACCESS,
> +                 &spr_read_tbl, &spr_write_tbl,
> +                 0x00000000);
> +    spr_register(env, SPR_VTBU,  "TBU",
> +                 &spr_read_tbu, SPR_NOACCESS,
> +                 &spr_read_tbu, SPR_NOACCESS,
> +                 0x00000000);
> +    spr_register(env, SPR_TBU,   "TBU",
> +                 &spr_read_tbu, SPR_NOACCESS,
> +                 &spr_read_tbu, &spr_write_tbu,
> +                 0x00000000);
> +}
> +
> +void register_non_embedded_sprs(CPUPPCState *env)
> +{
> +    /* Exception processing */
> +    spr_register_kvm(env, SPR_DSISR, "DSISR",
> +                     SPR_NOACCESS, SPR_NOACCESS,
> +                     &spr_read_generic, &spr_write_generic,
> +                     KVM_REG_PPC_DSISR, 0x00000000);
> +    spr_register_kvm(env, SPR_DAR, "DAR",
> +                     SPR_NOACCESS, SPR_NOACCESS,
> +                     &spr_read_generic, &spr_write_generic,
> +                     KVM_REG_PPC_DAR, 0x00000000);
> +    /* Timer */
> +    spr_register(env, SPR_DECR, "DECR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_decr, &spr_write_decr,
> +                 0x00000000);
> +}
> +
> +/* Storage Description Register 1 */
> +void register_sdr1_sprs(CPUPPCState *env)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    if (env->has_hv_mode) {
> +        /*
> +         * SDR1 is a hypervisor resource on CPUs which have a
> +         * hypervisor mode
> +         */
> +        spr_register_hv(env, SPR_SDR1, "SDR1",
> +                        SPR_NOACCESS, SPR_NOACCESS,
> +                        SPR_NOACCESS, SPR_NOACCESS,
> +                        &spr_read_generic, &spr_write_sdr1,
> +                        0x00000000);
> +    } else {
> +        spr_register(env, SPR_SDR1, "SDR1",
> +                     SPR_NOACCESS, SPR_NOACCESS,
> +                     &spr_read_generic, &spr_write_sdr1,
> +                     0x00000000);
> +    }
> +#endif
> +}
> +
> +/* BATs 0-3 */
> +void register_low_BATs(CPUPPCState *env)
> +{
> +#if !defined(CONFIG_USER_ONLY)
> +    spr_register(env, SPR_IBAT0U, "IBAT0U",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_ibat, &spr_write_ibatu,
> +                 0x00000000);
> +    spr_register(env, SPR_IBAT0L, "IBAT0L",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_ibat, &spr_write_ibatl,
> +                 0x00000000);
> +    spr_register(env, SPR_IBAT1U, "IBAT1U",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_ibat, &spr_write_ibatu,
> +                 0x00000000);
> +    spr_register(env, SPR_IBAT1L, "IBAT1L",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_ibat, &spr_write_ibatl,
> +                 0x00000000);
> +    spr_register(env, SPR_IBAT2U, "IBAT2U",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_ibat, &spr_write_ibatu,
> +                 0x00000000);
> +    spr_register(env, SPR_IBAT2L, "IBAT2L",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_ibat, &spr_write_ibatl,
> +                 0x00000000);
> +    spr_register(env, SPR_IBAT3U, "IBAT3U",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_ibat, &spr_write_ibatu,
> +                 0x00000000);
> +    spr_register(env, SPR_IBAT3L, "IBAT3L",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_ibat, &spr_write_ibatl,
> +                 0x00000000);
> +    spr_register(env, SPR_DBAT0U, "DBAT0U",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_dbat, &spr_write_dbatu,
> +                 0x00000000);
> +    spr_register(env, SPR_DBAT0L, "DBAT0L",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_dbat, &spr_write_dbatl,
> +                 0x00000000);
> +    spr_register(env, SPR_DBAT1U, "DBAT1U",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_dbat, &spr_write_dbatu,
> +                 0x00000000);
> +    spr_register(env, SPR_DBAT1L, "DBAT1L",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_dbat, &spr_write_dbatl,
> +                 0x00000000);
> +    spr_register(env, SPR_DBAT2U, "DBAT2U",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_dbat, &spr_write_dbatu,
> +                 0x00000000);
> +    spr_register(env, SPR_DBAT2L, "DBAT2L",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_dbat, &spr_write_dbatl,
> +                 0x00000000);
> +    spr_register(env, SPR_DBAT3U, "DBAT3U",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_dbat, &spr_write_dbatu,
> +                 0x00000000);
> +    spr_register(env, SPR_DBAT3L, "DBAT3L",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_dbat, &spr_write_dbatl,
> +                 0x00000000);
> +    env->nb_BATs +=3D 4;
> +#endif
> +}
> +
> +/* BATs 4-7 */
> +void register_high_BATs(CPUPPCState *env)
> +{
> +#if !defined(CONFIG_USER_ONLY)
> +    spr_register(env, SPR_IBAT4U, "IBAT4U",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_ibat_h, &spr_write_ibatu_h,
> +                 0x00000000);
> +    spr_register(env, SPR_IBAT4L, "IBAT4L",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_ibat_h, &spr_write_ibatl_h,
> +                 0x00000000);
> +    spr_register(env, SPR_IBAT5U, "IBAT5U",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_ibat_h, &spr_write_ibatu_h,
> +                 0x00000000);
> +    spr_register(env, SPR_IBAT5L, "IBAT5L",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_ibat_h, &spr_write_ibatl_h,
> +                 0x00000000);
> +    spr_register(env, SPR_IBAT6U, "IBAT6U",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_ibat_h, &spr_write_ibatu_h,
> +                 0x00000000);
> +    spr_register(env, SPR_IBAT6L, "IBAT6L",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_ibat_h, &spr_write_ibatl_h,
> +                 0x00000000);
> +    spr_register(env, SPR_IBAT7U, "IBAT7U",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_ibat_h, &spr_write_ibatu_h,
> +                 0x00000000);
> +    spr_register(env, SPR_IBAT7L, "IBAT7L",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_ibat_h, &spr_write_ibatl_h,
> +                 0x00000000);
> +    spr_register(env, SPR_DBAT4U, "DBAT4U",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_dbat_h, &spr_write_dbatu_h,
> +                 0x00000000);
> +    spr_register(env, SPR_DBAT4L, "DBAT4L",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_dbat_h, &spr_write_dbatl_h,
> +                 0x00000000);
> +    spr_register(env, SPR_DBAT5U, "DBAT5U",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_dbat_h, &spr_write_dbatu_h,
> +                 0x00000000);
> +    spr_register(env, SPR_DBAT5L, "DBAT5L",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_dbat_h, &spr_write_dbatl_h,
> +                 0x00000000);
> +    spr_register(env, SPR_DBAT6U, "DBAT6U",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_dbat_h, &spr_write_dbatu_h,
> +                 0x00000000);
> +    spr_register(env, SPR_DBAT6L, "DBAT6L",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_dbat_h, &spr_write_dbatl_h,
> +                 0x00000000);
> +    spr_register(env, SPR_DBAT7U, "DBAT7U",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_dbat_h, &spr_write_dbatu_h,
> +                 0x00000000);
> +    spr_register(env, SPR_DBAT7L, "DBAT7L",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_dbat_h, &spr_write_dbatl_h,
> +                 0x00000000);
> +    env->nb_BATs +=3D 4;
> +#endif
> +}
> +
> +/* Softare table search registers */
> +void register_soft_tlb_sprs(CPUPPCState *env, int nb_tlbs, int nb_ways)
> +{
> +#if !defined(CONFIG_USER_ONLY)
> +    env->nb_tlb =3D nb_tlbs;
> +    env->nb_ways =3D nb_ways;
> +    env->id_tlbs =3D 1;
> +    env->tlb_type =3D TLB_6XX;
> +    spr_register(env, SPR_DMISS, "DMISS",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, SPR_NOACCESS,
> +                 0x00000000);
> +    spr_register(env, SPR_DCMP, "DCMP",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, SPR_NOACCESS,
> +                 0x00000000);
> +    spr_register(env, SPR_HASH1, "HASH1",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, SPR_NOACCESS,
> +                 0x00000000);
> +    spr_register(env, SPR_HASH2, "HASH2",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, SPR_NOACCESS,
> +                 0x00000000);
> +    spr_register(env, SPR_IMISS, "IMISS",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, SPR_NOACCESS,
> +                 0x00000000);
> +    spr_register(env, SPR_ICMP, "ICMP",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, SPR_NOACCESS,
> +                 0x00000000);
> +    spr_register(env, SPR_RPA, "RPA",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +#endif
> +}
> +
> +void register_thrm_sprs(CPUPPCState *env)
> +{
> +    /* Thermal management */
> +    spr_register(env, SPR_THRM1, "THRM1",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_thrm, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_THRM2, "THRM2",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_thrm, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_THRM3, "THRM3",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_thrm, &spr_write_generic,
> +                 0x00000000);
> +}
> +
> +void register_usprgh_sprs(CPUPPCState *env)
> +{
> +    spr_register(env, SPR_USPRG4, "USPRG4",
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 0x00000000);
> +    spr_register(env, SPR_USPRG5, "USPRG5",
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 0x00000000);
> +    spr_register(env, SPR_USPRG6, "USPRG6",
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 0x00000000);
> +    spr_register(env, SPR_USPRG7, "USPRG7",
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 0x00000000);
> +}
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> index 786cdca80d..b6bd305bd7 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_tcg.h
> @@ -204,5 +204,6 @@ void register_thrm_sprs(CPUPPCState *env);
>  void register_usprgh_sprs(CPUPPCState *env);
>  void register_non_embedded_sprs(CPUPPCState *env);
>  void register_soft_tlb_sprs(CPUPPCState *env, int nb_tlbs, int nb_ways);
> +void register_generic_sprs(PowerPCCPU *cpu);
> =20
>  #endif

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hEk1OgdvgFAEkWhF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMagwACgkQgypY4gEw
YSLERhAA0oyq/TaWtbzUPnmyg4+WuUM83dAPXn4MeumAdIMzJJoDI/AuzsrBOCsW
TKk+JR11Tu1xwzA0mMxvsJ+nLufu8AmyQnir+KIvGIi1f9J6VjN2RhRn4XZ9ogjF
ItlbL/F/lgQZSfuWby0lfn0U9yqczS211umvqI5sYXxQ6Yi0J/6JNL4EnJrvvKrH
Yc6amoah/6LGloFporK9eTbTCuWVDmvA65liAaVMbEoq09AnJRtpz1Zut+sRsqw5
xgheswqtH985woFeyIrZxJV61MEiyTH843yvPEQx+yUf3+Wv/410MdEWb7zOIQYC
QLRd+qKeq7o4iAM1BYuJbn7D62oipf5y7SPg7wzNb8UaqgRl/tyTmtLdP6jgrFQM
+cJa/tpFHUpOAgRN6lgmPhWko0V7kZFZtQZQP1EPuegcV/mHula9sbvhJp3vjc/+
/9LejiFIxNPv57jCgQHy7PunF2gLlST5JQ0VuAyG9FIpyeIrHrqBi1+cHQuArBvk
bdQN9S3HAVBRuRq8M8lvZ3nwUdPklCtWjay3fbfObCPP/01fjhRo8vFIruLGPA5b
suvtZXtV8zhnXI+4LEdZ0pPzeE0YZepQPEA1aS9zEQtU05jrH6JMWdY4vDRDZ+C7
TzCzUM2Sry7aUMd/QXRNJTN6VKyZpFlZrIePybexUwZds3ezoQM=
=oTOv
-----END PGP SIGNATURE-----

--hEk1OgdvgFAEkWhF--

