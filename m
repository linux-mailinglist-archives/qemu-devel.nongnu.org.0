Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAC93B03BC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 14:08:29 +0200 (CEST)
Received: from localhost ([::1]:38030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvfCe-0004Hs-Bq
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 08:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lvf9x-00026G-Fb
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:05:41 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:53457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lvf9v-0001pb-Gr
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:05:41 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-6F_1GMJ6OUuaTuaE-jFS6Q-1; Tue, 22 Jun 2021 08:05:31 -0400
X-MC-Unique: 6F_1GMJ6OUuaTuaE-jFS6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74A23824F87;
 Tue, 22 Jun 2021 12:05:29 +0000 (UTC)
Received: from bahia.lan (ovpn-113-182.ams2.redhat.com [10.36.113.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF27D5C1CF;
 Tue, 22 Jun 2021 12:05:26 +0000 (UTC)
Date: Tue, 22 Jun 2021 14:05:24 +0200
From: Greg Kurz <groug@kaod.org>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v2 02/10] target/ppc: Use MMUAccessType with
 *_handle_mmu_fault
Message-ID: <20210622140524.1d500f66@bahia.lan>
In-Reply-To: <20210621125115.67717-3-bruno.larsen@eldorado.org.br>
References: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
 <20210621125115.67717-3-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 luis.pires@eldorado.org.br, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Jun 2021 09:51:07 -0300
"Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> wrote:

> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> These changes were waiting until we didn't need to match
> the function type of PowerPCCPUClass.handle_mmu_fault.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  target/ppc/mmu-hash32.c  | 7 ++-----
>  target/ppc/mmu-hash32.h  | 4 ++--
>  target/ppc/mmu-hash64.c  | 6 +-----
>  target/ppc/mmu-hash64.h  | 4 ++--
>  target/ppc/mmu-radix64.c | 7 ++-----
>  target/ppc/mmu-radix64.h | 4 ++--
>  6 files changed, 11 insertions(+), 21 deletions(-)
>=20
> diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
> index 9f0a497657..8f19b43e47 100644
> --- a/target/ppc/mmu-hash32.c
> +++ b/target/ppc/mmu-hash32.c
> @@ -415,8 +415,8 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr, p=
pc_hash_pte32_t pte,
>      return (rpn & ~mask) | (eaddr & mask);
>  }
> =20
> -int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
> -                                int mmu_idx)
> +int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> +                                MMUAccessType access_type, int mmu_idx)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
> @@ -425,11 +425,8 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vad=
dr eaddr, int rwx,
>      ppc_hash_pte32_t pte;
>      int prot;
>      int need_prot;
> -    MMUAccessType access_type;
>      hwaddr raddr;
> =20
> -    assert((rwx =3D=3D 0) || (rwx =3D=3D 1) || (rwx =3D=3D 2));
> -    access_type =3D rwx;
>      need_prot =3D prot_for_access_type(access_type);
> =20
>      /* 1. Handle real mode accesses */
> diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
> index 898021f0d8..30e35718a7 100644
> --- a/target/ppc/mmu-hash32.h
> +++ b/target/ppc/mmu-hash32.h
> @@ -5,8 +5,8 @@
> =20
>  hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash);
>  hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr=
);
> -int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address, int rw,
> -                                int mmu_idx);
> +int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
> +                                MMUAccessType access_type, int mmu_idx);
> =20
>  /*
>   * Segment register definitions
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 708dffc31b..2febd369b1 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -874,7 +874,7 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_t=
 *slb)
>  }
> =20
>  int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> -                                int rwx, int mmu_idx)
> +                                MMUAccessType access_type, int mmu_idx)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
> @@ -884,13 +884,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vad=
dr eaddr,
>      hwaddr ptex;
>      ppc_hash_pte64_t pte;
>      int exec_prot, pp_prot, amr_prot, prot;
> -    MMUAccessType access_type;
>      int need_prot;
>      hwaddr raddr;
> =20
> -    assert((rwx =3D=3D 0) || (rwx =3D=3D 1) || (rwx =3D=3D 2));
> -    access_type =3D rwx;
> -
>      /*
>       * Note on LPCR usage: 970 uses HID4, but our special variant of
>       * store_spr copies relevant fields into env->spr[SPR_LPCR].
> diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
> index 4b8b8e7950..3e8a8eec1f 100644
> --- a/target/ppc/mmu-hash64.h
> +++ b/target/ppc/mmu-hash64.h
> @@ -8,8 +8,8 @@ void dump_slb(PowerPCCPU *cpu);
>  int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
>                    target_ulong esid, target_ulong vsid);
>  hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr=
);
> -int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr address, int rw,
> -                                int mmu_idx);
> +int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
> +                                MMUAccessType access_type, int mmu_idx);
>  void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu,
>                                 target_ulong pte_index,
>                                 target_ulong pte0, target_ulong pte1);
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index b6d191c1d8..1c707d387d 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -555,19 +555,16 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr=
 eaddr,
>      return 0;
>  }
> =20
> -int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
> -                                 int mmu_idx)
> +int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> +                                 MMUAccessType access_type, int mmu_idx)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
>      int page_size, prot;
>      bool relocation;
> -    MMUAccessType access_type;
>      hwaddr raddr;
> =20
>      assert(!(msr_hv && cpu->vhyp));
> -    assert((rwx =3D=3D 0) || (rwx =3D=3D 1) || (rwx =3D=3D 2));
> -    access_type =3D rwx;
> =20
>      relocation =3D (access_type =3D=3D MMU_INST_FETCH ? msr_ir : msr_dr)=
;
>      /* HV or virtual hypervisor Real Mode Access */
> diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
> index f28c5794d0..94bd72cb38 100644
> --- a/target/ppc/mmu-radix64.h
> +++ b/target/ppc/mmu-radix64.h
> @@ -44,8 +44,8 @@
> =20
>  #ifdef TARGET_PPC64
> =20
> -int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
> -                                 int mmu_idx);
> +int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> +                                 MMUAccessType access_type, int mmu_idx)=
;
>  hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong add=
r);
> =20
>  static inline int ppc_radix64_get_prot_eaa(uint64_t pte)


