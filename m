Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ED3375F1D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 05:22:16 +0200 (CEST)
Received: from localhost ([::1]:39284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ler4B-0003KO-SC
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 23:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leqzd-0007UR-Mc; Thu, 06 May 2021 23:17:33 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47057 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leqzX-0007lH-KT; Thu, 06 May 2021 23:17:33 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fbwc269Xpz9sXS; Fri,  7 May 2021 13:17:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620357442;
 bh=K1FoBaNNrRyh+8T5mosJhGeI/FNJNNKMrFwfvf1mS8A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BzsgKvSrJNdPrsWgNfuC87uDo0Sfmp0AJFUGbeu0eEZxthnKbXsvjPgi98wW11Szb
 P+Cet9eT3Ke3+MADapS0svux9x2YGZOLX4zPRv4T6vtCg4SoMpbmoyaCmE1dk6am9d
 03GrDbJfbjaF1fkdOZlTEmQFOknNo3f/RcR6vusg=
Date: Fri, 7 May 2021 13:12:52 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH v3 1/4] hw/ppc: moved hcalls that depend on softmmu
Message-ID: <YJSwNOsUXNMNQ326@yekko>
References: <20210506163941.106984-1-lucas.araujo@eldorado.org.br>
 <20210506163941.106984-2-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IbJelaeHXWpoxXnu"
Content-Disposition: inline
In-Reply-To: <20210506163941.106984-2-lucas.araujo@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 farosas@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IbJelaeHXWpoxXnu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 01:39:38PM -0300, Lucas Mateus Castro (alqotel) wro=
te:
> The hypercalls h_enter, h_remove, h_bulk_remove, h_protect, and h_read,
> have been moved to spapr_softmmu.c with the functions they depend on. The
> functions is_ram_address and push_sregs_to_kvm_pr are not static anymore
> as functions on both spapr_hcall.c and spapr_softmmu.c depend on them.
> The hypercalls h_resize_hpt_prepare and h_resize_hpt_commit have been
> divided, the KVM part stayed in spapr_hcall.c while the softmmu part
> was moved to spapr_softmmu.c
>=20
> Signed-off-by: Lucas Mateus Castro (alqotel)
> <lucas.araujo@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  hw/ppc/meson.build     |   3 +
>  hw/ppc/spapr_hcall.c   | 608 +++------------------------------------
>  hw/ppc/spapr_softmmu.c | 627 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/ppc/spapr.h |   6 +
>  4 files changed, 668 insertions(+), 576 deletions(-)
>  create mode 100644 hw/ppc/spapr_softmmu.c
>=20
> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> index 86d6f379d1..597d974dd4 100644
> --- a/hw/ppc/meson.build
> +++ b/hw/ppc/meson.build
> @@ -29,6 +29,9 @@ ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
>    'spapr_numa.c',
>    'pef.c',
>  ))
> +ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_TCG'], if_true: files(
> +  'spapr_softmmu.c',
> +))
>  ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
>  ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(
>    'spapr_pci_vfio.c',
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 7275d0bba1..62dd015b70 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -27,18 +27,7 @@ static bool has_spr(PowerPCCPU *cpu, int spr)
>      return cpu->env.spr_cb[spr].name !=3D NULL;
>  }
> =20
> -static inline bool valid_ptex(PowerPCCPU *cpu, target_ulong ptex)
> -{
> -    /*
> -     * hash value/pteg group index is normalized by HPT mask
> -     */
> -    if (((ptex & ~7ULL) / HPTES_PER_GROUP) & ~ppc_hash64_hpt_mask(cpu)) {
> -        return false;
> -    }
> -    return true;
> -}
> -
> -static bool is_ram_address(SpaprMachineState *spapr, hwaddr addr)
> +bool is_ram_address(SpaprMachineState *spapr, hwaddr addr)
>  {
>      MachineState *machine =3D MACHINE(spapr);
>      DeviceMemoryState *dms =3D machine->device_memory;
> @@ -54,355 +43,6 @@ static bool is_ram_address(SpaprMachineState *spapr, =
hwaddr addr)
>      return false;
>  }
> =20
> -static target_ulong h_enter(PowerPCCPU *cpu, SpaprMachineState *spapr,
> -                            target_ulong opcode, target_ulong *args)
> -{
> -    target_ulong flags =3D args[0];
> -    target_ulong ptex =3D args[1];
> -    target_ulong pteh =3D args[2];
> -    target_ulong ptel =3D args[3];
> -    unsigned apshift;
> -    target_ulong raddr;
> -    target_ulong slot;
> -    const ppc_hash_pte64_t *hptes;
> -
> -    apshift =3D ppc_hash64_hpte_page_shift_noslb(cpu, pteh, ptel);
> -    if (!apshift) {
> -        /* Bad page size encoding */
> -        return H_PARAMETER;
> -    }
> -
> -    raddr =3D (ptel & HPTE64_R_RPN) & ~((1ULL << apshift) - 1);
> -
> -    if (is_ram_address(spapr, raddr)) {
> -        /* Regular RAM - should have WIMG=3D0010 */
> -        if ((ptel & HPTE64_R_WIMG) !=3D HPTE64_R_M) {
> -            return H_PARAMETER;
> -        }
> -    } else {
> -        target_ulong wimg_flags;
> -        /* Looks like an IO address */
> -        /* FIXME: What WIMG combinations could be sensible for IO?
> -         * For now we allow WIMG=3D010x, but are there others? */
> -        /* FIXME: Should we check against registered IO addresses? */
> -        wimg_flags =3D (ptel & (HPTE64_R_W | HPTE64_R_I | HPTE64_R_M));
> -
> -        if (wimg_flags !=3D HPTE64_R_I &&
> -            wimg_flags !=3D (HPTE64_R_I | HPTE64_R_M)) {
> -            return H_PARAMETER;
> -        }
> -    }
> -
> -    pteh &=3D ~0x60ULL;
> -
> -    if (!valid_ptex(cpu, ptex)) {
> -        return H_PARAMETER;
> -    }
> -
> -    slot =3D ptex & 7ULL;
> -    ptex =3D ptex & ~7ULL;
> -
> -    if (likely((flags & H_EXACT) =3D=3D 0)) {
> -        hptes =3D ppc_hash64_map_hptes(cpu, ptex, HPTES_PER_GROUP);
> -        for (slot =3D 0; slot < 8; slot++) {
> -            if (!(ppc_hash64_hpte0(cpu, hptes, slot) & HPTE64_V_VALID)) {
> -                break;
> -            }
> -        }
> -        ppc_hash64_unmap_hptes(cpu, hptes, ptex, HPTES_PER_GROUP);
> -        if (slot =3D=3D 8) {
> -            return H_PTEG_FULL;
> -        }
> -    } else {
> -        hptes =3D ppc_hash64_map_hptes(cpu, ptex + slot, 1);
> -        if (ppc_hash64_hpte0(cpu, hptes, 0) & HPTE64_V_VALID) {
> -            ppc_hash64_unmap_hptes(cpu, hptes, ptex + slot, 1);
> -            return H_PTEG_FULL;
> -        }
> -        ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
> -    }
> -
> -    spapr_store_hpte(cpu, ptex + slot, pteh | HPTE64_V_HPTE_DIRTY, ptel);
> -
> -    args[0] =3D ptex + slot;
> -    return H_SUCCESS;
> -}
> -
> -typedef enum {
> -    REMOVE_SUCCESS =3D 0,
> -    REMOVE_NOT_FOUND =3D 1,
> -    REMOVE_PARM =3D 2,
> -    REMOVE_HW =3D 3,
> -} RemoveResult;
> -
> -static RemoveResult remove_hpte(PowerPCCPU *cpu
> -                                , target_ulong ptex,
> -                                target_ulong avpn,
> -                                target_ulong flags,
> -                                target_ulong *vp, target_ulong *rp)
> -{
> -    const ppc_hash_pte64_t *hptes;
> -    target_ulong v, r;
> -
> -    if (!valid_ptex(cpu, ptex)) {
> -        return REMOVE_PARM;
> -    }
> -
> -    hptes =3D ppc_hash64_map_hptes(cpu, ptex, 1);
> -    v =3D ppc_hash64_hpte0(cpu, hptes, 0);
> -    r =3D ppc_hash64_hpte1(cpu, hptes, 0);
> -    ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
> -
> -    if ((v & HPTE64_V_VALID) =3D=3D 0 ||
> -        ((flags & H_AVPN) && (v & ~0x7fULL) !=3D avpn) ||
> -        ((flags & H_ANDCOND) && (v & avpn) !=3D 0)) {
> -        return REMOVE_NOT_FOUND;
> -    }
> -    *vp =3D v;
> -    *rp =3D r;
> -    spapr_store_hpte(cpu, ptex, HPTE64_V_HPTE_DIRTY, 0);
> -    ppc_hash64_tlb_flush_hpte(cpu, ptex, v, r);
> -    return REMOVE_SUCCESS;
> -}
> -
> -static target_ulong h_remove(PowerPCCPU *cpu, SpaprMachineState *spapr,
> -                             target_ulong opcode, target_ulong *args)
> -{
> -    CPUPPCState *env =3D &cpu->env;
> -    target_ulong flags =3D args[0];
> -    target_ulong ptex =3D args[1];
> -    target_ulong avpn =3D args[2];
> -    RemoveResult ret;
> -
> -    ret =3D remove_hpte(cpu, ptex, avpn, flags,
> -                      &args[0], &args[1]);
> -
> -    switch (ret) {
> -    case REMOVE_SUCCESS:
> -        check_tlb_flush(env, true);
> -        return H_SUCCESS;
> -
> -    case REMOVE_NOT_FOUND:
> -        return H_NOT_FOUND;
> -
> -    case REMOVE_PARM:
> -        return H_PARAMETER;
> -
> -    case REMOVE_HW:
> -        return H_HARDWARE;
> -    }
> -
> -    g_assert_not_reached();
> -}
> -
> -#define H_BULK_REMOVE_TYPE             0xc000000000000000ULL
> -#define   H_BULK_REMOVE_REQUEST        0x4000000000000000ULL
> -#define   H_BULK_REMOVE_RESPONSE       0x8000000000000000ULL
> -#define   H_BULK_REMOVE_END            0xc000000000000000ULL
> -#define H_BULK_REMOVE_CODE             0x3000000000000000ULL
> -#define   H_BULK_REMOVE_SUCCESS        0x0000000000000000ULL
> -#define   H_BULK_REMOVE_NOT_FOUND      0x1000000000000000ULL
> -#define   H_BULK_REMOVE_PARM           0x2000000000000000ULL
> -#define   H_BULK_REMOVE_HW             0x3000000000000000ULL
> -#define H_BULK_REMOVE_RC               0x0c00000000000000ULL
> -#define H_BULK_REMOVE_FLAGS            0x0300000000000000ULL
> -#define   H_BULK_REMOVE_ABSOLUTE       0x0000000000000000ULL
> -#define   H_BULK_REMOVE_ANDCOND        0x0100000000000000ULL
> -#define   H_BULK_REMOVE_AVPN           0x0200000000000000ULL
> -#define H_BULK_REMOVE_PTEX             0x00ffffffffffffffULL
> -
> -#define H_BULK_REMOVE_MAX_BATCH        4
> -
> -static target_ulong h_bulk_remove(PowerPCCPU *cpu, SpaprMachineState *sp=
apr,
> -                                  target_ulong opcode, target_ulong *arg=
s)
> -{
> -    CPUPPCState *env =3D &cpu->env;
> -    int i;
> -    target_ulong rc =3D H_SUCCESS;
> -
> -    for (i =3D 0; i < H_BULK_REMOVE_MAX_BATCH; i++) {
> -        target_ulong *tsh =3D &args[i*2];
> -        target_ulong tsl =3D args[i*2 + 1];
> -        target_ulong v, r, ret;
> -
> -        if ((*tsh & H_BULK_REMOVE_TYPE) =3D=3D H_BULK_REMOVE_END) {
> -            break;
> -        } else if ((*tsh & H_BULK_REMOVE_TYPE) !=3D H_BULK_REMOVE_REQUES=
T) {
> -            return H_PARAMETER;
> -        }
> -
> -        *tsh &=3D H_BULK_REMOVE_PTEX | H_BULK_REMOVE_FLAGS;
> -        *tsh |=3D H_BULK_REMOVE_RESPONSE;
> -
> -        if ((*tsh & H_BULK_REMOVE_ANDCOND) && (*tsh & H_BULK_REMOVE_AVPN=
)) {
> -            *tsh |=3D H_BULK_REMOVE_PARM;
> -            return H_PARAMETER;
> -        }
> -
> -        ret =3D remove_hpte(cpu, *tsh & H_BULK_REMOVE_PTEX, tsl,
> -                          (*tsh & H_BULK_REMOVE_FLAGS) >> 26,
> -                          &v, &r);
> -
> -        *tsh |=3D ret << 60;
> -
> -        switch (ret) {
> -        case REMOVE_SUCCESS:
> -            *tsh |=3D (r & (HPTE64_R_C | HPTE64_R_R)) << 43;
> -            break;
> -
> -        case REMOVE_PARM:
> -            rc =3D H_PARAMETER;
> -            goto exit;
> -
> -        case REMOVE_HW:
> -            rc =3D H_HARDWARE;
> -            goto exit;
> -        }
> -    }
> - exit:
> -    check_tlb_flush(env, true);
> -
> -    return rc;
> -}
> -
> -static target_ulong h_protect(PowerPCCPU *cpu, SpaprMachineState *spapr,
> -                              target_ulong opcode, target_ulong *args)
> -{
> -    CPUPPCState *env =3D &cpu->env;
> -    target_ulong flags =3D args[0];
> -    target_ulong ptex =3D args[1];
> -    target_ulong avpn =3D args[2];
> -    const ppc_hash_pte64_t *hptes;
> -    target_ulong v, r;
> -
> -    if (!valid_ptex(cpu, ptex)) {
> -        return H_PARAMETER;
> -    }
> -
> -    hptes =3D ppc_hash64_map_hptes(cpu, ptex, 1);
> -    v =3D ppc_hash64_hpte0(cpu, hptes, 0);
> -    r =3D ppc_hash64_hpte1(cpu, hptes, 0);
> -    ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
> -
> -    if ((v & HPTE64_V_VALID) =3D=3D 0 ||
> -        ((flags & H_AVPN) && (v & ~0x7fULL) !=3D avpn)) {
> -        return H_NOT_FOUND;
> -    }
> -
> -    r &=3D ~(HPTE64_R_PP0 | HPTE64_R_PP | HPTE64_R_N |
> -           HPTE64_R_KEY_HI | HPTE64_R_KEY_LO);
> -    r |=3D (flags << 55) & HPTE64_R_PP0;
> -    r |=3D (flags << 48) & HPTE64_R_KEY_HI;
> -    r |=3D flags & (HPTE64_R_PP | HPTE64_R_N | HPTE64_R_KEY_LO);
> -    spapr_store_hpte(cpu, ptex,
> -                     (v & ~HPTE64_V_VALID) | HPTE64_V_HPTE_DIRTY, 0);
> -    ppc_hash64_tlb_flush_hpte(cpu, ptex, v, r);
> -    /* Flush the tlb */
> -    check_tlb_flush(env, true);
> -    /* Don't need a memory barrier, due to qemu's global lock */
> -    spapr_store_hpte(cpu, ptex, v | HPTE64_V_HPTE_DIRTY, r);
> -    return H_SUCCESS;
> -}
> -
> -static target_ulong h_read(PowerPCCPU *cpu, SpaprMachineState *spapr,
> -                           target_ulong opcode, target_ulong *args)
> -{
> -    target_ulong flags =3D args[0];
> -    target_ulong ptex =3D args[1];
> -    int i, ridx, n_entries =3D 1;
> -    const ppc_hash_pte64_t *hptes;
> -
> -    if (!valid_ptex(cpu, ptex)) {
> -        return H_PARAMETER;
> -    }
> -
> -    if (flags & H_READ_4) {
> -        /* Clear the two low order bits */
> -        ptex &=3D ~(3ULL);
> -        n_entries =3D 4;
> -    }
> -
> -    hptes =3D ppc_hash64_map_hptes(cpu, ptex, n_entries);
> -    for (i =3D 0, ridx =3D 0; i < n_entries; i++) {
> -        args[ridx++] =3D ppc_hash64_hpte0(cpu, hptes, i);
> -        args[ridx++] =3D ppc_hash64_hpte1(cpu, hptes, i);
> -    }
> -    ppc_hash64_unmap_hptes(cpu, hptes, ptex, n_entries);
> -
> -    return H_SUCCESS;
> -}
> -
> -struct SpaprPendingHpt {
> -    /* These fields are read-only after initialization */
> -    int shift;
> -    QemuThread thread;
> -
> -    /* These fields are protected by the BQL */
> -    bool complete;
> -
> -    /* These fields are private to the preparation thread if
> -     * !complete, otherwise protected by the BQL */
> -    int ret;
> -    void *hpt;
> -};
> -
> -static void free_pending_hpt(SpaprPendingHpt *pending)
> -{
> -    if (pending->hpt) {
> -        qemu_vfree(pending->hpt);
> -    }
> -
> -    g_free(pending);
> -}
> -
> -static void *hpt_prepare_thread(void *opaque)
> -{
> -    SpaprPendingHpt *pending =3D opaque;
> -    size_t size =3D 1ULL << pending->shift;
> -
> -    pending->hpt =3D qemu_try_memalign(size, size);
> -    if (pending->hpt) {
> -        memset(pending->hpt, 0, size);
> -        pending->ret =3D H_SUCCESS;
> -    } else {
> -        pending->ret =3D H_NO_MEM;
> -    }
> -
> -    qemu_mutex_lock_iothread();
> -
> -    if (SPAPR_MACHINE(qdev_get_machine())->pending_hpt =3D=3D pending) {
> -        /* Ready to go */
> -        pending->complete =3D true;
> -    } else {
> -        /* We've been cancelled, clean ourselves up */
> -        free_pending_hpt(pending);
> -    }
> -
> -    qemu_mutex_unlock_iothread();
> -    return NULL;
> -}
> -
> -/* Must be called with BQL held */
> -static void cancel_hpt_prepare(SpaprMachineState *spapr)
> -{
> -    SpaprPendingHpt *pending =3D spapr->pending_hpt;
> -
> -    /* Let the thread know it's cancelled */
> -    spapr->pending_hpt =3D NULL;
> -
> -    if (!pending) {
> -        /* Nothing to do */
> -        return;
> -    }
> -
> -    if (!pending->complete) {
> -        /* thread will clean itself up */
> -        return;
> -    }
> -
> -    free_pending_hpt(pending);
> -}
> -
>  /* Convert a return code from the KVM ioctl()s implementing resize HPT
>   * into a PAPR hypercall return code */
>  static target_ulong resize_hpt_convert_rc(int ret)
> @@ -448,7 +88,6 @@ static target_ulong h_resize_hpt_prepare(PowerPCCPU *c=
pu,
>  {
>      target_ulong flags =3D args[0];
>      int shift =3D args[1];
> -    SpaprPendingHpt *pending =3D spapr->pending_hpt;
>      uint64_t current_ram_size;
>      int rc;
> =20
> @@ -485,182 +124,11 @@ static target_ulong h_resize_hpt_prepare(PowerPCCP=
U *cpu,
>          return resize_hpt_convert_rc(rc);
>      }
> =20
> -    if (pending) {
> -        /* something already in progress */
> -        if (pending->shift =3D=3D shift) {
> -            /* and it's suitable */
> -            if (pending->complete) {
> -                return pending->ret;
> -            } else {
> -                return H_LONG_BUSY_ORDER_100_MSEC;
> -            }
> -        }
> -
> -        /* not suitable, cancel and replace */
> -        cancel_hpt_prepare(spapr);
> -    }
> -
> -    if (!shift) {
> -        /* nothing to do */
> -        return H_SUCCESS;
> -    }
> -
> -    /* start new prepare */
> -
> -    pending =3D g_new0(SpaprPendingHpt, 1);
> -    pending->shift =3D shift;
> -    pending->ret =3D H_HARDWARE;
> -
> -    qemu_thread_create(&pending->thread, "sPAPR HPT prepare",
> -                       hpt_prepare_thread, pending, QEMU_THREAD_DETACHED=
);
> -
> -    spapr->pending_hpt =3D pending;
> -
> -    /* In theory we could estimate the time more accurately based on
> -     * the new size, but there's not much point */
> -    return H_LONG_BUSY_ORDER_100_MSEC;
> -}
> -
> -static uint64_t new_hpte_load0(void *htab, uint64_t pteg, int slot)
> -{
> -    uint8_t *addr =3D htab;
> -
> -    addr +=3D pteg * HASH_PTEG_SIZE_64;
> -    addr +=3D slot * HASH_PTE_SIZE_64;
> -    return  ldq_p(addr);
> -}
> -
> -static void new_hpte_store(void *htab, uint64_t pteg, int slot,
> -                           uint64_t pte0, uint64_t pte1)
> -{
> -    uint8_t *addr =3D htab;
> -
> -    addr +=3D pteg * HASH_PTEG_SIZE_64;
> -    addr +=3D slot * HASH_PTE_SIZE_64;
> -
> -    stq_p(addr, pte0);
> -    stq_p(addr + HASH_PTE_SIZE_64 / 2, pte1);
> -}
> -
> -static int rehash_hpte(PowerPCCPU *cpu,
> -                       const ppc_hash_pte64_t *hptes,
> -                       void *old_hpt, uint64_t oldsize,
> -                       void *new_hpt, uint64_t newsize,
> -                       uint64_t pteg, int slot)
> -{
> -    uint64_t old_hash_mask =3D (oldsize >> 7) - 1;
> -    uint64_t new_hash_mask =3D (newsize >> 7) - 1;
> -    target_ulong pte0 =3D ppc_hash64_hpte0(cpu, hptes, slot);
> -    target_ulong pte1;
> -    uint64_t avpn;
> -    unsigned base_pg_shift;
> -    uint64_t hash, new_pteg, replace_pte0;
> -
> -    if (!(pte0 & HPTE64_V_VALID) || !(pte0 & HPTE64_V_BOLTED)) {
> -        return H_SUCCESS;
> -    }
> -
> -    pte1 =3D ppc_hash64_hpte1(cpu, hptes, slot);
> -
> -    base_pg_shift =3D ppc_hash64_hpte_page_shift_noslb(cpu, pte0, pte1);
> -    assert(base_pg_shift); /* H_ENTER shouldn't allow a bad encoding */
> -    avpn =3D HPTE64_V_AVPN_VAL(pte0) & ~(((1ULL << base_pg_shift) - 1) >=
> 23);
> -
> -    if (pte0 & HPTE64_V_SECONDARY) {
> -        pteg =3D ~pteg;
> -    }
> -
> -    if ((pte0 & HPTE64_V_SSIZE) =3D=3D HPTE64_V_SSIZE_256M) {
> -        uint64_t offset, vsid;
> -
> -        /* We only have 28 - 23 bits of offset in avpn */
> -        offset =3D (avpn & 0x1f) << 23;
> -        vsid =3D avpn >> 5;
> -        /* We can find more bits from the pteg value */
> -        if (base_pg_shift < 23) {
> -            offset |=3D ((vsid ^ pteg) & old_hash_mask) << base_pg_shift;
> -        }
> -
> -        hash =3D vsid ^ (offset >> base_pg_shift);
> -    } else if ((pte0 & HPTE64_V_SSIZE) =3D=3D HPTE64_V_SSIZE_1T) {
> -        uint64_t offset, vsid;
> -
> -        /* We only have 40 - 23 bits of seg_off in avpn */
> -        offset =3D (avpn & 0x1ffff) << 23;
> -        vsid =3D avpn >> 17;
> -        if (base_pg_shift < 23) {
> -            offset |=3D ((vsid ^ (vsid << 25) ^ pteg) & old_hash_mask)
> -                << base_pg_shift;
> -        }
> -
> -        hash =3D vsid ^ (vsid << 25) ^ (offset >> base_pg_shift);
> -    } else {
> -        error_report("rehash_pte: Bad segment size in HPTE");
> +    if (kvm_enabled()) {
>          return H_HARDWARE;
>      }
> =20
> -    new_pteg =3D hash & new_hash_mask;
> -    if (pte0 & HPTE64_V_SECONDARY) {
> -        assert(~pteg =3D=3D (hash & old_hash_mask));
> -        new_pteg =3D ~new_pteg;
> -    } else {
> -        assert(pteg =3D=3D (hash & old_hash_mask));
> -    }
> -    assert((oldsize !=3D newsize) || (pteg =3D=3D new_pteg));
> -    replace_pte0 =3D new_hpte_load0(new_hpt, new_pteg, slot);
> -    /*
> -     * Strictly speaking, we don't need all these tests, since we only
> -     * ever rehash bolted HPTEs.  We might in future handle non-bolted
> -     * HPTEs, though so make the logic correct for those cases as
> -     * well.
> -     */
> -    if (replace_pte0 & HPTE64_V_VALID) {
> -        assert(newsize < oldsize);
> -        if (replace_pte0 & HPTE64_V_BOLTED) {
> -            if (pte0 & HPTE64_V_BOLTED) {
> -                /* Bolted collision, nothing we can do */
> -                return H_PTEG_FULL;
> -            } else {
> -                /* Discard this hpte */
> -                return H_SUCCESS;
> -            }
> -        }
> -    }
> -
> -    new_hpte_store(new_hpt, new_pteg, slot, pte0, pte1);
> -    return H_SUCCESS;
> -}
> -
> -static int rehash_hpt(PowerPCCPU *cpu,
> -                      void *old_hpt, uint64_t oldsize,
> -                      void *new_hpt, uint64_t newsize)
> -{
> -    uint64_t n_ptegs =3D oldsize >> 7;
> -    uint64_t pteg;
> -    int slot;
> -    int rc;
> -
> -    for (pteg =3D 0; pteg < n_ptegs; pteg++) {
> -        hwaddr ptex =3D pteg * HPTES_PER_GROUP;
> -        const ppc_hash_pte64_t *hptes
> -            =3D ppc_hash64_map_hptes(cpu, ptex, HPTES_PER_GROUP);
> -
> -        if (!hptes) {
> -            return H_HARDWARE;
> -        }
> -
> -        for (slot =3D 0; slot < HPTES_PER_GROUP; slot++) {
> -            rc =3D rehash_hpte(cpu, hptes, old_hpt, oldsize, new_hpt, ne=
wsize,
> -                             pteg, slot);
> -            if (rc !=3D H_SUCCESS) {
> -                ppc_hash64_unmap_hptes(cpu, hptes, ptex, HPTES_PER_GROUP=
);
> -                return rc;
> -            }
> -        }
> -        ppc_hash64_unmap_hptes(cpu, hptes, ptex, HPTES_PER_GROUP);
> -    }
> -
> -    return H_SUCCESS;
> +    return softmmu_resize_hpt_prepare(cpu, spapr, shift);
>  }
> =20
>  static void do_push_sregs_to_kvm_pr(CPUState *cs, run_on_cpu_data data)
> @@ -676,7 +144,7 @@ static void do_push_sregs_to_kvm_pr(CPUState *cs, run=
_on_cpu_data data)
>      }
>  }
> =20
> -static void push_sregs_to_kvm_pr(SpaprMachineState *spapr)
> +void push_sregs_to_kvm_pr(SpaprMachineState *spapr)
>  {
>      CPUState *cs;
> =20
> @@ -701,9 +169,7 @@ static target_ulong h_resize_hpt_commit(PowerPCCPU *c=
pu,
>  {
>      target_ulong flags =3D args[0];
>      target_ulong shift =3D args[1];
> -    SpaprPendingHpt *pending =3D spapr->pending_hpt;
>      int rc;
> -    size_t newsize;
> =20
>      if (spapr->resize_hpt =3D=3D SPAPR_RESIZE_HPT_DISABLED) {
>          return H_AUTHORITY;
> @@ -726,42 +192,14 @@ static target_ulong h_resize_hpt_commit(PowerPCCPU =
*cpu,
>          return rc;
>      }
> =20
> -    if (flags !=3D 0) {
> -        return H_PARAMETER;
> -    }
> -
> -    if (!pending || (pending->shift !=3D shift)) {
> -        /* no matching prepare */
> -        return H_CLOSED;
> -    }
> -
> -    if (!pending->complete) {
> -        /* prepare has not completed */
> -        return H_BUSY;
> +    if (kvm_enabled()) {
> +        return H_HARDWARE;
>      }
> =20
> -    /* Shouldn't have got past PREPARE without an HPT */
> -    g_assert(spapr->htab_shift);
> -
> -    newsize =3D 1ULL << pending->shift;
> -    rc =3D rehash_hpt(cpu, spapr->htab, HTAB_SIZE(spapr),
> -                    pending->hpt, newsize);
> -    if (rc =3D=3D H_SUCCESS) {
> -        qemu_vfree(spapr->htab);
> -        spapr->htab =3D pending->hpt;
> -        spapr->htab_shift =3D pending->shift;
> -
> -        push_sregs_to_kvm_pr(spapr);
> -
> -        pending->hpt =3D NULL; /* so it's not free()d */
> -    }
> +    return softmmu_resize_hpt_commit(cpu, spapr, flags, shift);
> +}
> =20
> -    /* Clean up */
> -    spapr->pending_hpt =3D NULL;
> -    free_pending_hpt(pending);
> =20
> -    return rc;
> -}
> =20
>  static target_ulong h_set_sprg0(PowerPCCPU *cpu, SpaprMachineState *spap=
r,
>                                  target_ulong opcode, target_ulong *args)
> @@ -2024,16 +1462,34 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, tar=
get_ulong opcode,
>      return H_FUNCTION;
>  }
> =20
> -static void hypercall_register_types(void)
> +#ifndef CONFIG_TCG
> +static target_ulong h_softmmu(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                            target_ulong opcode, target_ulong *args)
> +{
> +    g_assert_not_reached();
> +}
> +
> +static void hypercall_register_softmmu(void)
>  {
>      /* hcall-pft */
> -    spapr_register_hypercall(H_ENTER, h_enter);
> -    spapr_register_hypercall(H_REMOVE, h_remove);
> -    spapr_register_hypercall(H_PROTECT, h_protect);
> -    spapr_register_hypercall(H_READ, h_read);
> +    spapr_register_hypercall(H_ENTER, h_softmmu);
> +    spapr_register_hypercall(H_REMOVE, h_softmmu);
> +    spapr_register_hypercall(H_PROTECT, h_softmmu);
> +    spapr_register_hypercall(H_READ, h_softmmu);
> =20
>      /* hcall-bulk */
> -    spapr_register_hypercall(H_BULK_REMOVE, h_bulk_remove);
> +    spapr_register_hypercall(H_BULK_REMOVE, h_softmmu);
> +}
> +#else
> +static void hypercall_register_softmmu(void)
> +{
> +    /* DO NOTHING */
> +}
> +#endif
> +
> +static void hypercall_register_types(void)
> +{
> +    hypercall_register_softmmu();
> =20
>      /* hcall-hpt-resize */
>      spapr_register_hypercall(H_RESIZE_HPT_PREPARE, h_resize_hpt_prepare);
> diff --git a/hw/ppc/spapr_softmmu.c b/hw/ppc/spapr_softmmu.c
> new file mode 100644
> index 0000000000..6c6b86dd3c
> --- /dev/null
> +++ b/hw/ppc/spapr_softmmu.c
> @@ -0,0 +1,627 @@
> +#include "qemu/osdep.h"
> +#include "qemu/cutils.h"
> +#include "qapi/error.h"
> +#include "sysemu/hw_accel.h"
> +#include "sysemu/runstate.h"
> +#include "qemu/log.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/module.h"
> +#include "qemu/error-report.h"
> +#include "cpu.h"
> +#include "exec/exec-all.h"
> +#include "helper_regs.h"
> +#include "hw/ppc/spapr.h"
> +#include "hw/ppc/spapr_cpu_core.h"
> +#include "mmu-hash64.h"
> +#include "cpu-models.h"
> +#include "trace.h"
> +#include "kvm_ppc.h"
> +#include "hw/ppc/fdt.h"
> +#include "hw/ppc/spapr_ovec.h"
> +#include "mmu-book3s-v3.h"
> +#include "hw/mem/memory-device.h"
> +
> +static inline bool valid_ptex(PowerPCCPU *cpu, target_ulong ptex)
> +{
> +    /*
> +     * hash value/pteg group index is normalized by HPT mask
> +     */
> +    if (((ptex & ~7ULL) / HPTES_PER_GROUP) & ~ppc_hash64_hpt_mask(cpu)) {
> +        return false;
> +    }
> +    return true;
> +}
> +
> +static target_ulong h_enter(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                            target_ulong opcode, target_ulong *args)
> +{
> +    target_ulong flags =3D args[0];
> +    target_ulong ptex =3D args[1];
> +    target_ulong pteh =3D args[2];
> +    target_ulong ptel =3D args[3];
> +    unsigned apshift;
> +    target_ulong raddr;
> +    target_ulong slot;
> +    const ppc_hash_pte64_t *hptes;
> +
> +    apshift =3D ppc_hash64_hpte_page_shift_noslb(cpu, pteh, ptel);
> +    if (!apshift) {
> +        /* Bad page size encoding */
> +        return H_PARAMETER;
> +    }
> +
> +    raddr =3D (ptel & HPTE64_R_RPN) & ~((1ULL << apshift) - 1);
> +
> +    if (is_ram_address(spapr, raddr)) {
> +        /* Regular RAM - should have WIMG=3D0010 */
> +        if ((ptel & HPTE64_R_WIMG) !=3D HPTE64_R_M) {
> +            return H_PARAMETER;
> +        }
> +    } else {
> +        target_ulong wimg_flags;
> +        /* Looks like an IO address */
> +        /* FIXME: What WIMG combinations could be sensible for IO?
> +         * For now we allow WIMG=3D010x, but are there others? */
> +        /* FIXME: Should we check against registered IO addresses? */
> +        wimg_flags =3D (ptel & (HPTE64_R_W | HPTE64_R_I | HPTE64_R_M));
> +
> +        if (wimg_flags !=3D HPTE64_R_I &&
> +            wimg_flags !=3D (HPTE64_R_I | HPTE64_R_M)) {
> +            return H_PARAMETER;
> +        }
> +    }
> +
> +    pteh &=3D ~0x60ULL;
> +
> +    if (!valid_ptex(cpu, ptex)) {
> +        return H_PARAMETER;
> +    }
> +
> +    slot =3D ptex & 7ULL;
> +    ptex =3D ptex & ~7ULL;
> +
> +    if (likely((flags & H_EXACT) =3D=3D 0)) {
> +        hptes =3D ppc_hash64_map_hptes(cpu, ptex, HPTES_PER_GROUP);
> +        for (slot =3D 0; slot < 8; slot++) {
> +            if (!(ppc_hash64_hpte0(cpu, hptes, slot) & HPTE64_V_VALID)) {
> +                break;
> +            }
> +        }
> +        ppc_hash64_unmap_hptes(cpu, hptes, ptex, HPTES_PER_GROUP);
> +        if (slot =3D=3D 8) {
> +            return H_PTEG_FULL;
> +        }
> +    } else {
> +        hptes =3D ppc_hash64_map_hptes(cpu, ptex + slot, 1);
> +        if (ppc_hash64_hpte0(cpu, hptes, 0) & HPTE64_V_VALID) {
> +            ppc_hash64_unmap_hptes(cpu, hptes, ptex + slot, 1);
> +            return H_PTEG_FULL;
> +        }
> +        ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
> +    }
> +
> +    spapr_store_hpte(cpu, ptex + slot, pteh | HPTE64_V_HPTE_DIRTY, ptel);
> +
> +    args[0] =3D ptex + slot;
> +    return H_SUCCESS;
> +}
> +
> +typedef enum {
> +    REMOVE_SUCCESS =3D 0,
> +    REMOVE_NOT_FOUND =3D 1,
> +    REMOVE_PARM =3D 2,
> +    REMOVE_HW =3D 3,
> +} RemoveResult;
> +
> +static RemoveResult remove_hpte(PowerPCCPU *cpu
> +                                , target_ulong ptex,
> +                                target_ulong avpn,
> +                                target_ulong flags,
> +                                target_ulong *vp, target_ulong *rp)
> +{
> +    const ppc_hash_pte64_t *hptes;
> +    target_ulong v, r;
> +
> +    if (!valid_ptex(cpu, ptex)) {
> +        return REMOVE_PARM;
> +    }
> +
> +    hptes =3D ppc_hash64_map_hptes(cpu, ptex, 1);
> +    v =3D ppc_hash64_hpte0(cpu, hptes, 0);
> +    r =3D ppc_hash64_hpte1(cpu, hptes, 0);
> +    ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
> +
> +    if ((v & HPTE64_V_VALID) =3D=3D 0 ||
> +        ((flags & H_AVPN) && (v & ~0x7fULL) !=3D avpn) ||
> +        ((flags & H_ANDCOND) && (v & avpn) !=3D 0)) {
> +        return REMOVE_NOT_FOUND;
> +    }
> +    *vp =3D v;
> +    *rp =3D r;
> +    spapr_store_hpte(cpu, ptex, HPTE64_V_HPTE_DIRTY, 0);
> +    ppc_hash64_tlb_flush_hpte(cpu, ptex, v, r);
> +    return REMOVE_SUCCESS;
> +}
> +
> +static target_ulong h_remove(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                             target_ulong opcode, target_ulong *args)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +    target_ulong flags =3D args[0];
> +    target_ulong ptex =3D args[1];
> +    target_ulong avpn =3D args[2];
> +    RemoveResult ret;
> +
> +    ret =3D remove_hpte(cpu, ptex, avpn, flags,
> +                      &args[0], &args[1]);
> +
> +    switch (ret) {
> +    case REMOVE_SUCCESS:
> +        check_tlb_flush(env, true);
> +        return H_SUCCESS;
> +
> +    case REMOVE_NOT_FOUND:
> +        return H_NOT_FOUND;
> +
> +    case REMOVE_PARM:
> +        return H_PARAMETER;
> +
> +    case REMOVE_HW:
> +        return H_HARDWARE;
> +    }
> +
> +    g_assert_not_reached();
> +}
> +
> +#define H_BULK_REMOVE_TYPE             0xc000000000000000ULL
> +#define   H_BULK_REMOVE_REQUEST        0x4000000000000000ULL
> +#define   H_BULK_REMOVE_RESPONSE       0x8000000000000000ULL
> +#define   H_BULK_REMOVE_END            0xc000000000000000ULL
> +#define H_BULK_REMOVE_CODE             0x3000000000000000ULL
> +#define   H_BULK_REMOVE_SUCCESS        0x0000000000000000ULL
> +#define   H_BULK_REMOVE_NOT_FOUND      0x1000000000000000ULL
> +#define   H_BULK_REMOVE_PARM           0x2000000000000000ULL
> +#define   H_BULK_REMOVE_HW             0x3000000000000000ULL
> +#define H_BULK_REMOVE_RC               0x0c00000000000000ULL
> +#define H_BULK_REMOVE_FLAGS            0x0300000000000000ULL
> +#define   H_BULK_REMOVE_ABSOLUTE       0x0000000000000000ULL
> +#define   H_BULK_REMOVE_ANDCOND        0x0100000000000000ULL
> +#define   H_BULK_REMOVE_AVPN           0x0200000000000000ULL
> +#define H_BULK_REMOVE_PTEX             0x00ffffffffffffffULL
> +
> +#define H_BULK_REMOVE_MAX_BATCH        4
> +
> +static target_ulong h_bulk_remove(PowerPCCPU *cpu, SpaprMachineState *sp=
apr,
> +                                  target_ulong opcode, target_ulong *arg=
s)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +    int i;
> +    target_ulong rc =3D H_SUCCESS;
> +
> +    for (i =3D 0; i < H_BULK_REMOVE_MAX_BATCH; i++) {
> +        target_ulong *tsh =3D &args[i*2];
> +        target_ulong tsl =3D args[i*2 + 1];
> +        target_ulong v, r, ret;
> +
> +        if ((*tsh & H_BULK_REMOVE_TYPE) =3D=3D H_BULK_REMOVE_END) {
> +            break;
> +        } else if ((*tsh & H_BULK_REMOVE_TYPE) !=3D H_BULK_REMOVE_REQUES=
T) {
> +            return H_PARAMETER;
> +        }
> +
> +        *tsh &=3D H_BULK_REMOVE_PTEX | H_BULK_REMOVE_FLAGS;
> +        *tsh |=3D H_BULK_REMOVE_RESPONSE;
> +
> +        if ((*tsh & H_BULK_REMOVE_ANDCOND) && (*tsh & H_BULK_REMOVE_AVPN=
)) {
> +            *tsh |=3D H_BULK_REMOVE_PARM;
> +            return H_PARAMETER;
> +        }
> +
> +        ret =3D remove_hpte(cpu, *tsh & H_BULK_REMOVE_PTEX, tsl,
> +                          (*tsh & H_BULK_REMOVE_FLAGS) >> 26,
> +                          &v, &r);
> +
> +        *tsh |=3D ret << 60;
> +
> +        switch (ret) {
> +        case REMOVE_SUCCESS:
> +            *tsh |=3D (r & (HPTE64_R_C | HPTE64_R_R)) << 43;
> +            break;
> +
> +        case REMOVE_PARM:
> +            rc =3D H_PARAMETER;
> +            goto exit;
> +
> +        case REMOVE_HW:
> +            rc =3D H_HARDWARE;
> +            goto exit;
> +        }
> +    }
> + exit:
> +    check_tlb_flush(env, true);
> +
> +    return rc;
> +}
> +
> +static target_ulong h_protect(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                              target_ulong opcode, target_ulong *args)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +    target_ulong flags =3D args[0];
> +    target_ulong ptex =3D args[1];
> +    target_ulong avpn =3D args[2];
> +    const ppc_hash_pte64_t *hptes;
> +    target_ulong v, r;
> +
> +    if (!valid_ptex(cpu, ptex)) {
> +        return H_PARAMETER;
> +    }
> +
> +    hptes =3D ppc_hash64_map_hptes(cpu, ptex, 1);
> +    v =3D ppc_hash64_hpte0(cpu, hptes, 0);
> +    r =3D ppc_hash64_hpte1(cpu, hptes, 0);
> +    ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
> +
> +    if ((v & HPTE64_V_VALID) =3D=3D 0 ||
> +        ((flags & H_AVPN) && (v & ~0x7fULL) !=3D avpn)) {
> +        return H_NOT_FOUND;
> +    }
> +
> +    r &=3D ~(HPTE64_R_PP0 | HPTE64_R_PP | HPTE64_R_N |
> +           HPTE64_R_KEY_HI | HPTE64_R_KEY_LO);
> +    r |=3D (flags << 55) & HPTE64_R_PP0;
> +    r |=3D (flags << 48) & HPTE64_R_KEY_HI;
> +    r |=3D flags & (HPTE64_R_PP | HPTE64_R_N | HPTE64_R_KEY_LO);
> +    spapr_store_hpte(cpu, ptex,
> +                     (v & ~HPTE64_V_VALID) | HPTE64_V_HPTE_DIRTY, 0);
> +    ppc_hash64_tlb_flush_hpte(cpu, ptex, v, r);
> +    /* Flush the tlb */
> +    check_tlb_flush(env, true);
> +    /* Don't need a memory barrier, due to qemu's global lock */
> +    spapr_store_hpte(cpu, ptex, v | HPTE64_V_HPTE_DIRTY, r);
> +    return H_SUCCESS;
> +}
> +
> +static target_ulong h_read(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                           target_ulong opcode, target_ulong *args)
> +{
> +    target_ulong flags =3D args[0];
> +    target_ulong ptex =3D args[1];
> +    int i, ridx, n_entries =3D 1;
> +    const ppc_hash_pte64_t *hptes;
> +
> +    if (!valid_ptex(cpu, ptex)) {
> +        return H_PARAMETER;
> +    }
> +
> +    if (flags & H_READ_4) {
> +        /* Clear the two low order bits */
> +        ptex &=3D ~(3ULL);
> +        n_entries =3D 4;
> +    }
> +
> +    hptes =3D ppc_hash64_map_hptes(cpu, ptex, n_entries);
> +    for (i =3D 0, ridx =3D 0; i < n_entries; i++) {
> +        args[ridx++] =3D ppc_hash64_hpte0(cpu, hptes, i);
> +        args[ridx++] =3D ppc_hash64_hpte1(cpu, hptes, i);
> +    }
> +    ppc_hash64_unmap_hptes(cpu, hptes, ptex, n_entries);
> +
> +    return H_SUCCESS;
> +}
> +
> +struct SpaprPendingHpt {
> +    /* These fields are read-only after initialization */
> +    int shift;
> +    QemuThread thread;
> +
> +    /* These fields are protected by the BQL */
> +    bool complete;
> +
> +    /* These fields are private to the preparation thread if
> +     * !complete, otherwise protected by the BQL */
> +    int ret;
> +    void *hpt;
> +};
> +
> +static void free_pending_hpt(SpaprPendingHpt *pending)
> +{
> +    if (pending->hpt) {
> +        qemu_vfree(pending->hpt);
> +    }
> +
> +    g_free(pending);
> +}
> +
> +static void *hpt_prepare_thread(void *opaque)
> +{
> +    SpaprPendingHpt *pending =3D opaque;
> +    size_t size =3D 1ULL << pending->shift;
> +
> +    pending->hpt =3D qemu_try_memalign(size, size);
> +    if (pending->hpt) {
> +        memset(pending->hpt, 0, size);
> +        pending->ret =3D H_SUCCESS;
> +    } else {
> +        pending->ret =3D H_NO_MEM;
> +    }
> +
> +    qemu_mutex_lock_iothread();
> +
> +    if (SPAPR_MACHINE(qdev_get_machine())->pending_hpt =3D=3D pending) {
> +        /* Ready to go */
> +        pending->complete =3D true;
> +    } else {
> +        /* We've been cancelled, clean ourselves up */
> +        free_pending_hpt(pending);
> +    }
> +
> +    qemu_mutex_unlock_iothread();
> +    return NULL;
> +}
> +
> +/* Must be called with BQL held */
> +static void cancel_hpt_prepare(SpaprMachineState *spapr)
> +{
> +    SpaprPendingHpt *pending =3D spapr->pending_hpt;
> +
> +    /* Let the thread know it's cancelled */
> +    spapr->pending_hpt =3D NULL;
> +
> +    if (!pending) {
> +        /* Nothing to do */
> +        return;
> +    }
> +
> +    if (!pending->complete) {
> +        /* thread will clean itself up */
> +        return;
> +    }
> +
> +    free_pending_hpt(pending);
> +}
> +
> +target_ulong softmmu_resize_hpt_prepare(PowerPCCPU *cpu,
> +                                         SpaprMachineState *spapr,
> +                                         target_ulong shift)
> +{
> +    SpaprPendingHpt *pending =3D spapr->pending_hpt;
> +
> +    if (pending) {
> +        /* something already in progress */
> +        if (pending->shift =3D=3D shift) {
> +            /* and it's suitable */
> +            if (pending->complete) {
> +                return pending->ret;
> +            } else {
> +                return H_LONG_BUSY_ORDER_100_MSEC;
> +            }
> +        }
> +
> +        /* not suitable, cancel and replace */
> +        cancel_hpt_prepare(spapr);
> +    }
> +
> +    if (!shift) {
> +        /* nothing to do */
> +        return H_SUCCESS;
> +    }
> +
> +    /* start new prepare */
> +
> +    pending =3D g_new0(SpaprPendingHpt, 1);
> +    pending->shift =3D shift;
> +    pending->ret =3D H_HARDWARE;
> +
> +    qemu_thread_create(&pending->thread, "sPAPR HPT prepare",
> +                       hpt_prepare_thread, pending, QEMU_THREAD_DETACHED=
);
> +
> +    spapr->pending_hpt =3D pending;
> +
> +    /* In theory we could estimate the time more accurately based on
> +     * the new size, but there's not much point */
> +    return H_LONG_BUSY_ORDER_100_MSEC;
> +}
> +
> +static uint64_t new_hpte_load0(void *htab, uint64_t pteg, int slot)
> +{
> +    uint8_t *addr =3D htab;
> +
> +    addr +=3D pteg * HASH_PTEG_SIZE_64;
> +    addr +=3D slot * HASH_PTE_SIZE_64;
> +    return  ldq_p(addr);
> +}
> +
> +static void new_hpte_store(void *htab, uint64_t pteg, int slot,
> +                           uint64_t pte0, uint64_t pte1)
> +{
> +    uint8_t *addr =3D htab;
> +
> +    addr +=3D pteg * HASH_PTEG_SIZE_64;
> +    addr +=3D slot * HASH_PTE_SIZE_64;
> +
> +    stq_p(addr, pte0);
> +    stq_p(addr + HASH_PTE_SIZE_64 / 2, pte1);
> +}
> +
> +static int rehash_hpte(PowerPCCPU *cpu,
> +                       const ppc_hash_pte64_t *hptes,
> +                       void *old_hpt, uint64_t oldsize,
> +                       void *new_hpt, uint64_t newsize,
> +                       uint64_t pteg, int slot)
> +{
> +    uint64_t old_hash_mask =3D (oldsize >> 7) - 1;
> +    uint64_t new_hash_mask =3D (newsize >> 7) - 1;
> +    target_ulong pte0 =3D ppc_hash64_hpte0(cpu, hptes, slot);
> +    target_ulong pte1;
> +    uint64_t avpn;
> +    unsigned base_pg_shift;
> +    uint64_t hash, new_pteg, replace_pte0;
> +
> +    if (!(pte0 & HPTE64_V_VALID) || !(pte0 & HPTE64_V_BOLTED)) {
> +        return H_SUCCESS;
> +    }
> +
> +    pte1 =3D ppc_hash64_hpte1(cpu, hptes, slot);
> +
> +    base_pg_shift =3D ppc_hash64_hpte_page_shift_noslb(cpu, pte0, pte1);
> +    assert(base_pg_shift); /* H_ENTER shouldn't allow a bad encoding */
> +    avpn =3D HPTE64_V_AVPN_VAL(pte0) & ~(((1ULL << base_pg_shift) - 1) >=
> 23);
> +
> +    if (pte0 & HPTE64_V_SECONDARY) {
> +        pteg =3D ~pteg;
> +    }
> +
> +    if ((pte0 & HPTE64_V_SSIZE) =3D=3D HPTE64_V_SSIZE_256M) {
> +        uint64_t offset, vsid;
> +
> +        /* We only have 28 - 23 bits of offset in avpn */
> +        offset =3D (avpn & 0x1f) << 23;
> +        vsid =3D avpn >> 5;
> +        /* We can find more bits from the pteg value */
> +        if (base_pg_shift < 23) {
> +            offset |=3D ((vsid ^ pteg) & old_hash_mask) << base_pg_shift;
> +        }
> +
> +        hash =3D vsid ^ (offset >> base_pg_shift);
> +    } else if ((pte0 & HPTE64_V_SSIZE) =3D=3D HPTE64_V_SSIZE_1T) {
> +        uint64_t offset, vsid;
> +
> +        /* We only have 40 - 23 bits of seg_off in avpn */
> +        offset =3D (avpn & 0x1ffff) << 23;
> +        vsid =3D avpn >> 17;
> +        if (base_pg_shift < 23) {
> +            offset |=3D ((vsid ^ (vsid << 25) ^ pteg) & old_hash_mask)
> +                << base_pg_shift;
> +        }
> +
> +        hash =3D vsid ^ (vsid << 25) ^ (offset >> base_pg_shift);
> +    } else {
> +        error_report("rehash_pte: Bad segment size in HPTE");
> +        return H_HARDWARE;
> +    }
> +
> +    new_pteg =3D hash & new_hash_mask;
> +    if (pte0 & HPTE64_V_SECONDARY) {
> +        assert(~pteg =3D=3D (hash & old_hash_mask));
> +        new_pteg =3D ~new_pteg;
> +    } else {
> +        assert(pteg =3D=3D (hash & old_hash_mask));
> +    }
> +    assert((oldsize !=3D newsize) || (pteg =3D=3D new_pteg));
> +    replace_pte0 =3D new_hpte_load0(new_hpt, new_pteg, slot);
> +    /*
> +     * Strictly speaking, we don't need all these tests, since we only
> +     * ever rehash bolted HPTEs.  We might in future handle non-bolted
> +     * HPTEs, though so make the logic correct for those cases as
> +     * well.
> +     */
> +    if (replace_pte0 & HPTE64_V_VALID) {
> +        assert(newsize < oldsize);
> +        if (replace_pte0 & HPTE64_V_BOLTED) {
> +            if (pte0 & HPTE64_V_BOLTED) {
> +                /* Bolted collision, nothing we can do */
> +                return H_PTEG_FULL;
> +            } else {
> +                /* Discard this hpte */
> +                return H_SUCCESS;
> +            }
> +        }
> +    }
> +
> +    new_hpte_store(new_hpt, new_pteg, slot, pte0, pte1);
> +    return H_SUCCESS;
> +}
> +
> +static int rehash_hpt(PowerPCCPU *cpu,
> +                      void *old_hpt, uint64_t oldsize,
> +                      void *new_hpt, uint64_t newsize)
> +{
> +    uint64_t n_ptegs =3D oldsize >> 7;
> +    uint64_t pteg;
> +    int slot;
> +    int rc;
> +
> +    for (pteg =3D 0; pteg < n_ptegs; pteg++) {
> +        hwaddr ptex =3D pteg * HPTES_PER_GROUP;
> +        const ppc_hash_pte64_t *hptes
> +            =3D ppc_hash64_map_hptes(cpu, ptex, HPTES_PER_GROUP);
> +
> +        if (!hptes) {
> +            return H_HARDWARE;
> +        }
> +
> +        for (slot =3D 0; slot < HPTES_PER_GROUP; slot++) {
> +            rc =3D rehash_hpte(cpu, hptes, old_hpt, oldsize, new_hpt, ne=
wsize,
> +                             pteg, slot);
> +            if (rc !=3D H_SUCCESS) {
> +                ppc_hash64_unmap_hptes(cpu, hptes, ptex, HPTES_PER_GROUP=
);
> +                return rc;
> +            }
> +        }
> +        ppc_hash64_unmap_hptes(cpu, hptes, ptex, HPTES_PER_GROUP);
> +    }
> +
> +    return H_SUCCESS;
> +}
> +
> +target_ulong softmmu_resize_hpt_commit(PowerPCCPU *cpu,
> +                                        SpaprMachineState *spapr,
> +                                        target_ulong flags,
> +                                        target_ulong shift)
> +{
> +    SpaprPendingHpt *pending =3D spapr->pending_hpt;
> +    int rc;
> +    size_t newsize;
> +
> +    if (flags !=3D 0) {
> +        return H_PARAMETER;
> +    }
> +
> +    if (!pending || (pending->shift !=3D shift)) {
> +        /* no matching prepare */
> +        return H_CLOSED;
> +    }
> +
> +    if (!pending->complete) {
> +        /* prepare has not completed */
> +        return H_BUSY;
> +    }
> +
> +    /* Shouldn't have got past PREPARE without an HPT */
> +    g_assert(spapr->htab_shift);
> +
> +    newsize =3D 1ULL << pending->shift;
> +    rc =3D rehash_hpt(cpu, spapr->htab, HTAB_SIZE(spapr),
> +                    pending->hpt, newsize);
> +    if (rc =3D=3D H_SUCCESS) {
> +        qemu_vfree(spapr->htab);
> +        spapr->htab =3D pending->hpt;
> +        spapr->htab_shift =3D pending->shift;
> +
> +        push_sregs_to_kvm_pr(spapr);
> +
> +        pending->hpt =3D NULL; /* so it's not free()d */
> +    }
> +
> +    /* Clean up */
> +    spapr->pending_hpt =3D NULL;
> +    free_pending_hpt(pending);
> +
> +    return rc;
> +}
> +
> +static void hypercall_register_types(void)
> +{
> +    /* hcall-pft */
> +    spapr_register_hypercall(H_ENTER, h_enter);
> +    spapr_register_hypercall(H_REMOVE, h_remove);
> +    spapr_register_hypercall(H_PROTECT, h_protect);
> +    spapr_register_hypercall(H_READ, h_read);
> +
> +    /* hcall-bulk */
> +    spapr_register_hypercall(H_BULK_REMOVE, h_bulk_remove);
> +
> +}
> +
> +type_init(hypercall_register_types)
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 7f40a158f4..d894a7a6b3 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -582,6 +582,12 @@ typedef target_ulong (*spapr_hcall_fn)(PowerPCCPU *c=
pu, SpaprMachineState *sm,
>  void spapr_register_hypercall(target_ulong opcode, spapr_hcall_fn fn);
>  target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
>                               target_ulong *args);
> +target_ulong softmmu_resize_hpt_prepare(PowerPCCPU *cpu, SpaprMachineSta=
te *spapr,
> +                                         target_ulong shift);
> +target_ulong softmmu_resize_hpt_commit(PowerPCCPU *cpu, SpaprMachineStat=
e *spapr,
> +                                        target_ulong flags, target_ulong=
 shift);
> +bool is_ram_address(SpaprMachineState *spapr, hwaddr addr);
> +void push_sregs_to_kvm_pr(SpaprMachineState *spapr);
> =20
>  /* Virtual Processor Area structure constants */
>  #define VPA_MIN_SIZE           640

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IbJelaeHXWpoxXnu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCUsDIACgkQbDjKyiDZ
s5KX6g//ZMDgM2QhjpJlY6L3T/uO1IFR77tx76r2SfXP8pc8hiIsr4wjCPzOBtX1
egS6sWxdNn4WG0PWSPzIhRiQeQdLS0gDk0ItTNiafpPrrL1EXjEYg0x2UelvlhF7
o6AHWp5le2xoZy0boUa4o5FHSeThcugiD2YQLMM4O2oJsBA2SjMuknD8pEDdtKSf
sAu3a/t2Sv8bvk9abHoSdMZ1UQfh4M/W1CAOBDrHi2UoMRjfJb8ToaSHBqxPK5Hb
EvOU86Rd0X4KOQVXmk1hWoWrbyyy1SDd6VWlSx0GWInJD/PZ7HnqEW5ccqfvUXqd
56mGSLxtAS84Xs9rLuX4rjxVcpke06txZV3iMIPeYZ/k4wAUbjoJ1PF/Tul/ax2o
KGiIPi8aHZizeuwA+Y2G6NP6kzyBBml8KY1wL+sVzr7OTBPljG77Lu045Le3Bkzl
Eld+iUa4+LKn/fXjsuc4KkbU1qe3yjmustCWZJ42AdE/+EaRZaK44fQhavK3YLe+
iUhAcZAdmhUgMNtmbIKhI9vaXkmoLKdcQRjFdFv1F4nX1REElnIR51AOBbWbMRk3
987lEv8fLvaDgXRcQokm0gQqx8xKZHPV8g97dlKyMvHm7E7CQidsCIbQT/ggc5vy
ipGFFG6qLRyPr/QRUfSQ6P0MZC9GVcHmd6WPZqqEMxxmQB/yBq8=
=zcjc
-----END PGP SIGNATURE-----

--IbJelaeHXWpoxXnu--

