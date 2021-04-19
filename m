Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3574363B05
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 07:30:21 +0200 (CEST)
Received: from localhost ([::1]:34574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYMUG-0000Kl-Ts
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 01:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYMSX-0007OD-Vz; Mon, 19 Apr 2021 01:28:34 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33641 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYMSV-0008GB-89; Mon, 19 Apr 2021 01:28:33 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNwMX3MNnz9vFb; Mon, 19 Apr 2021 15:28:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618810104;
 bh=j75cEvvrzYAqcksZs4t4KCqOZaNYKvROn90lqK97b4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gmP0EVrTS18aTyoT7ETp70sX9Ki1nEKg+osxmpoxJJe2hDqAgUKV1UCOTKBZV6hRx
 DvwBDK2ohI+isbhi/Z1F44LI525tFjDzeJij7uZ4H9GxP+efPBk067AbAjrrD/hr9S
 2uhWN5GjX+WHfoy+v1u6nhjUSX9xY33/kd+x/I60=
Date: Mon, 19 Apr 2021 15:28:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 3/4] target/ppc: Add stubs for tcg functions, so it builds
Message-ID: <YH0U8c+BiNdVwMm1@yekko.fritz.box>
References: <20210409151916.97326-1-bruno.larsen@eldorado.org.br>
 <20210409151916.97326-4-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rcjJIAO9XsDtyLXG"
Content-Disposition: inline
In-Reply-To: <20210409151916.97326-4-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-devel@nongnu.org, andre.silva@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, lagarcia@br.ibm.com, matheus.ferst@eldorado.org.br,
 luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rcjJIAO9XsDtyLXG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 09, 2021 at 12:19:15PM -0300, Bruno Larsen (billionai) wrote:
> This file basically adds all stubs required to build the project
> with disable-tcg. most of these are not going to remain stubs by the
> end, but this part is where it got complicated, and I wanted to get
> an RFC ASAP. Most of these have to do with mmu emulation, so they'll
> probably be replaced by a KVM implementation in the final product,
> but I'm not sure which ones have to be replace, which can remain
> stubs, and which should not be called at all. Input in general is
> very much welcome.
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/tcg-stub.c | 139 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 139 insertions(+)
>  create mode 100644 target/ppc/tcg-stub.c
>=20
> diff --git a/target/ppc/tcg-stub.c b/target/ppc/tcg-stub.c
> new file mode 100644
> index 0000000000..5dc8cf8911
> --- /dev/null
> +++ b/target/ppc/tcg-stub.c
> @@ -0,0 +1,139 @@
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "mmu-hash64.h"
> +
> +/* STUFF FOR FIRST LINKER ERROR */
> +/* This stuff happens in target/ppc files */
> +
> +#if !defined(CONFIG_USER_ONLY)
> +
> +void ppc_store_sdr1(CPUPPCState *env, target_ulong value) {

In general stubbing ppc_store_*() functions doesn't look seem like a
good idea.  At the very least the KVM code will need to update the
register in env so that it gets synced with KVM later.  I think you're
going to be better off moving those ppc_store_*() functions used from
KVM code into somewhere common, then #ifdefing to remove any TCG
specific operations from them (or else providing KVM stubs for the TCG
things they call).

> +    /* stub to make things compile */
> +    return;
> +}
> +
> +void ppc_store_ptcr(CPUPPCState *env, target_ulong value) {
> +    /* stub to make things compile */
> +    return;
> +}
> +
> +#endif /* !defined(CONFIG_USER_ONLY) */
> +void ppc_store_msr(CPUPPCState *env, target_ulong value) {
> +    /* stub to make things compile */
> +    return;
> +}
> +
> +void dump_mmu(CPUPPCState *env){
> +    /* stub to make things compile */
> +    return;
> +}
> +
> +void store_fpscr(CPUPPCState *env, uint64_t arg, uint32_t mask) {
> +    /* stub to make things compile */
> +    return;
> +}
> +
> +void ppc_cpu_do_interrupt(CPUState *cpu) {
> +    /* stub to make things compile */
> +    return;
> +}
> +
> +/* STUFF FOR SECOND LINKER ERROR*/
> +/* these errors happen mostly in hw/ppc */
> +
> +#ifdef TARGET_PPC64
> +int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
> +                  target_ulong esid, target_ulong vsid) {
> +    /* rquired by kvm.c and machine.c */
> +    return 0;
> +}
> +
> +void ppc_hash64_filter_pagesizes(PowerPCCPU *cpu,
> +                                 bool (*cb)(void *, uint32_t, uint32_t),
> +                                 void *opaque) {
> +    /* required by spapr_caps.c */
> +    return;=20
> +}
> +
> +void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val) {
> +    /* required by spapr_* */
> +    return;
> +}
> +
> +const ppc_hash_pte64_t *ppc_hash64_map_hptes(PowerPCCPU *cpu,
> +                                             hwaddr ptex, int n) {
> +    /* used by spapr_hcall a bunch */
> +    return NULL;
> +}
> +
> +void ppc_hash64_unmap_hptes(PowerPCCPU *cpu, const ppc_hash_pte64_t *hpt=
es,
> +                            hwaddr ptex, int n) {
> +    /* used a bunch by spapr_hcall */
> +    return;=20
> +}
> +
> +void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu,
> +                               target_ulong pte_index,
> +                               target_ulong pte0, target_ulong pte1){
> +    return;=20
> +}
> +
> +unsigned ppc_hash64_hpte_page_shift_noslb(PowerPCCPU *cpu,
> +                                          uint64_t pte0, uint64_t pte1) {
> +    return 0;
> +}
> +#endif
> +
> +void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector) {
> +    /* required by spapr_events spapr_mce_dispatch_elog */
> +    return;
> +}
> +#ifndef CONFIG_USER_ONLY
> +void ppc_cpu_do_system_reset(CPUState *cs){
> +    /* required by pnv and spapr */
> +    return;
> +}
> +#endif
> +
> +bool ppc64_v3_get_pate(PowerPCCPU *cpu, target_ulong lpid,
> +                       ppc_v3_pate_t *entry);
> +
> +bool ppc64_v3_get_pate(PowerPCCPU *cpu, target_ulong lpid,
> +                       ppc_v3_pate_t *entry) {
> +    /* used by spapr_hcall: ppc_hash64_hpt_mask */
> +    return true;
> +}
> +
> +/* THIRD BATCH OF ERRORS, AFTER MOVING STUFF FROM TRANSLATE TO CPU.C */
> +
> +/* they are all coming from cpu.c, probably */
> +
> +void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp) {
> +    return;
> +}
> +
> +void init_ppc_proc(PowerPCCPU *cpu) {
> +    return;
> +}
> +
> +void destroy_ppc_opcodes(PowerPCCPU *cpu) {
> +    return;
> +}
> +
> +void ppc_tlb_invalidate_all(CPUPPCState *env) {
> +    return;
> +}
> +
> +void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags) {
> +    return;
> +}
> +
> +void ppc_cpu_dump_statistics(CPUState *cpu, int flags) {
> +    return;
> +}
> +
> +#include "exec/hwaddr.h"
> +
> +hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr) {
> +    return 0;
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rcjJIAO9XsDtyLXG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB9FPEACgkQbDjKyiDZ
s5Lirw/+IRSLHiqZTQ6KwtQQqufgDxa2UBnN+F/2Ho6YRCk93lNN/wazXfiJG1gS
BF3RsRV/+2alWEDpA6tc/Oh6/0eEVy8hJnF5Gcb7aOStmRhhnaX83IdCPGTF7FdN
oirlUGTfMpPfj47rQVdGtN16yoNb/u+XpB32j5wSJVbw23wS7cJn8x4dHIuOJniW
McGT7kUfMBtkKhcDuuZKVWv1gCNfvxkH+EHlX3qtN53B9bzF9oSf8KpZpX4/4cPw
9aMKxmA/zFI9wr+9Zft8sOpJGh933g2ayN7DJ4PbEDdcEV2EPG6kJzYU5jBGaiB5
UYkwnaSJNnxTpRh9dqUHHr/6du7ma/WPDVSVqHZlmdI6T0KWSgNo6jSN71ksrd3i
mVkqWMTo6v9nRWl/5Br4XXxOC3htrs/q4D8lLzUBz9QqRbCHqq/KFIM3zHJAFjSv
4RCi1Ds/9Lz306oVemQBuVY8y2JPLj6OnO8+c+N8+PnFOCOIaJalfCrLelzlxap2
QPF2tcJwADxpXPpOpVLz36Y8e4/P0tjL0MwfhQEIpNWLHD16jEh4F3XvaAIX5Hxo
l54+43/Jtlm/+06Y1gMq1GUjvOBNgydWt/uf+l+IYtp9z2bAyKlNPC9WzxJu4CzY
hOFLYbZty3BxFwCTKxWknrR3hyZtsMEl8VAsc4OUUNhwY9krm+M=
=ey/Y
-----END PGP SIGNATURE-----

--rcjJIAO9XsDtyLXG--

