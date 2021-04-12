Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D51E35B9CC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 07:27:48 +0200 (CEST)
Received: from localhost ([::1]:52698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVp6x-0002RJ-5X
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 01:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lVp4M-0000qC-HT; Mon, 12 Apr 2021 01:25:06 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:38423 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lVp4J-0000mu-LT; Mon, 12 Apr 2021 01:25:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FJccj4l9sz9sX2; Mon, 12 Apr 2021 15:24:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618205093;
 bh=NuuQMn8a25a1MR0J53opPCEJ5cdFLSoI6enicl9sGAw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PNAo3FITYRs5I1uHloc1ilfrphq+/+qa9vZSNnaBj6bimGqVxztttLF/4T+j4M0Dk
 NudDuUbSde0SPfynjH0ICK6VxmUAgIRPHMI/tExTVC2qtqbXp6K67yEwzPnU8UYqc9
 GiFkybNPQZi+qF7Dr7TA0A1Fp4nJaiLmQ0qhZsaU=
Date: Mon, 12 Apr 2021 15:13:58 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 0/4] target/ppc: add disable-tcg option
Message-ID: <YHPXFmCyI2s2Lty2@yekko.fritz.box>
References: <20210409151916.97326-1-bruno.larsen@eldorado.org.br>
 <161798386699.23865.7749897228059905728@72b6d80f974b>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vv9MmhV0/vkR1MHP"
Content-Disposition: inline
In-Reply-To: <161798386699.23865.7749897228059905728@72b6d80f974b>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: luis.pires@eldorado.org.br, lagarcia@br.ibm.com,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, andre.silva@eldorado.org.br, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--vv9MmhV0/vkR1MHP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 09, 2021 at 08:57:48AM -0700, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20210409151916.97326-1-bruno.larsen=
@eldorado.org.br/
>=20
>=20
>=20
> Hi,
>=20
> This series seems to have some coding style problems. See output below for
> more information:
>=20
> Type: series
> Message-id: 20210409151916.97326-1-bruno.larsen@eldorado.org.br
> Subject: [RFC PATCH 0/4] target/ppc: add disable-tcg option

You will need to fix these style errors.

Note that there's quite a bit of existing code in target-ppc which
doesn't have current-correct qemu style.  Despite this, please make
any changes in a checkpatch happy style - the hope is that we'll
gradually convert the legacy pieces to updated style.

>=20
> =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> =3D=3D=3D TEST SCRIPT END =3D=3D=3D
>=20
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  - [tag update]      patchew/161786467973.295167.5612704777283969903.stgi=
t@bahia.lan -> patchew/161786467973.295167.5612704777283969903.stgit@bahia.=
lan
>  - [tag update]      patchew/20210409150527.15053-1-peter.maydell@linaro.=
org -> patchew/20210409150527.15053-1-peter.maydell@linaro.org
>  * [new tag]         patchew/20210409151916.97326-1-bruno.larsen@eldorado=
=2Eorg.br -> patchew/20210409151916.97326-1-bruno.larsen@eldorado.org.br
> Switched to a new branch 'test'
> 0250bc9 target/ppc: updated build rules for disable-tcg option
> e36c2a7 target/ppc: Add stubs for tcg functions, so it builds
> 4e6d44d target/ppc: added solutions for building with disable-tcg
> 38ccad3 target/ppc: Code motion required to build disabling tcg
>=20
> =3D=3D=3D OUTPUT BEGIN =3D=3D=3D
> 1/4 Checking commit 38ccad308a44 (target/ppc: Code motion required to bui=
ld disabling tcg)
> 2/4 Checking commit 4e6d44d2a68a (target/ppc: added solutions for buildin=
g with disable-tcg)
> WARNING: Block comments use a leading /* on a separate line
> #43: FILE: target/ppc/arch_dump.c:182:
> +    /* This is the first solution implemented. My personal favorite as it
>=20
> WARNING: Block comments use a trailing */ on a separate line
> #44: FILE: target/ppc/arch_dump.c:183:
> +     * allows for explicit error handling, however it is much less reada=
ble */
>=20
> ERROR: space required before the open brace '{'
> #46: FILE: target/ppc/arch_dump.c:185:
> +    if(kvm_enabled()){
>=20
> ERROR: space required before the open parenthesis '('
> #46: FILE: target/ppc/arch_dump.c:185:
> +    if(kvm_enabled()){
>=20
> ERROR: space required after that close brace '}'
> #48: FILE: target/ppc/arch_dump.c:187:
> +    }else
>=20
> WARNING: line over 80 characters
> #55: FILE: target/ppc/arch_dump.c:194:
> +        /* TODO: add proper error handling, even tough this should never=
 be reached */
>=20
> ERROR: space required before the open brace '{'
> #79: FILE: target/ppc/kvm.c:2953:
> +int kvmppc_mtvscr(PowerPCCPU *cpu, uint32_t val){
>=20
> ERROR: space required before the open brace '{'
> #87: FILE: target/ppc/kvm.c:2961:
> +    if(ret < 0){
>=20
> ERROR: space required before the open parenthesis '('
> #87: FILE: target/ppc/kvm.c:2961:
> +    if(ret < 0){
>=20
> ERROR: space required before the open brace '{'
> #93: FILE: target/ppc/kvm.c:2967:
> +int kvmppc_mfvscr(PowerPCCPU *cpu){
>=20
> ERROR: space required before the open brace '{'
> #101: FILE: target/ppc/kvm.c:2975:
> +    if(ret < 0){
>=20
> ERROR: space required before the open parenthesis '('
> #101: FILE: target/ppc/kvm.c:2975:
> +    if(ret < 0){
>=20
> ERROR: "(foo*)" should be "(foo *)"
> #115: FILE: target/ppc/kvm_ppc.h:90:
> +int kvmppc_mfvscr(PowerPCCPU*);
>=20
> WARNING: Block comments use a leading /* on a separate line
> #117: FILE: target/ppc/kvm_ppc.h:92:
> +/* This is the second (quick and dirty) solution. Not my personal favori=
te
>=20
> WARNING: Block comments use a trailing */ on a separate line
> #119: FILE: target/ppc/kvm_ppc.h:94:
> + * for error checking. but it requires less change in other files */
>=20
> ERROR: space required after that ',' (ctx:VxV)
> #121: FILE: target/ppc/kvm_ppc.h:96:
> +#define helper_mtvscr(env, val) kvmppc_mtvscr(env_archcpu(env),val)
>                                                                ^
>=20
> ERROR: space required before the open brace '{'
> #148: FILE: target/ppc/machine.c:101:
> +    if(kvm_enabled()){
>=20
> ERROR: space required before the open parenthesis '('
> #148: FILE: target/ppc/machine.c:101:
> +    if(kvm_enabled()){
>=20
> ERROR: space required after that close brace '}'
> #150: FILE: target/ppc/machine.c:103:
> +    }else
>=20
> WARNING: line over 80 characters
> #156: FILE: target/ppc/machine.c:109:
> +        /* TODO: Add correct error handling, even though this should nev=
er be reached */
>=20
> ERROR: space required before the open brace '{'
> #167: FILE: target/ppc/machine.c:467:
> +    if(kvm_enabled()){
>=20
> ERROR: space required before the open parenthesis '('
> #167: FILE: target/ppc/machine.c:467:
> +    if(kvm_enabled()){
>=20
> ERROR: space required before the open brace '{'
> #184: FILE: target/ppc/machine.c:484:
> +    if(kvm_enabled()){
>=20
> ERROR: space required before the open parenthesis '('
> #184: FILE: target/ppc/machine.c:484:
> +    if(kvm_enabled()){
>=20
> total: 18 errors, 6 warnings, 147 lines checked
>=20
> Patch 2/4 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>=20
> 3/4 Checking commit e36c2a70087a (target/ppc: Add stubs for tcg functions=
, so it builds)
> Use of uninitialized value $acpi_testexpected in string eq at ./scripts/c=
heckpatch.pl line 1529.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #23:=20
> new file mode 100644
>=20
> ERROR: open brace '{' following function declarations go on the next line
> #37: FILE: target/ppc/tcg-stub.c:10:
> +void ppc_store_sdr1(CPUPPCState *env, target_ulong value) {
>=20
> ERROR: open brace '{' following function declarations go on the next line
> #42: FILE: target/ppc/tcg-stub.c:15:
> +void ppc_store_ptcr(CPUPPCState *env, target_ulong value) {
>=20
> ERROR: open brace '{' following function declarations go on the next line
> #48: FILE: target/ppc/tcg-stub.c:21:
> +void ppc_store_msr(CPUPPCState *env, target_ulong value) {
>=20
> ERROR: space required before the open brace '{'
> #53: FILE: target/ppc/tcg-stub.c:26:
> +void dump_mmu(CPUPPCState *env){
>=20
> ERROR: open brace '{' following function declarations go on the next line
> #58: FILE: target/ppc/tcg-stub.c:31:
> +void store_fpscr(CPUPPCState *env, uint64_t arg, uint32_t mask) {
>=20
> ERROR: open brace '{' following function declarations go on the next line
> #63: FILE: target/ppc/tcg-stub.c:36:
> +void ppc_cpu_do_interrupt(CPUState *cpu) {
>=20
> ERROR: trailing whitespace
> #82: FILE: target/ppc/tcg-stub.c:55:
> +    return; $
>=20
> ERROR: open brace '{' following function declarations go on the next line
> #85: FILE: target/ppc/tcg-stub.c:58:
> +void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val) {
>=20
> ERROR: trailing whitespace
> #99: FILE: target/ppc/tcg-stub.c:72:
> +    return; $
>=20
> ERROR: trailing whitespace
> #105: FILE: target/ppc/tcg-stub.c:78:
> +    return; $
>=20
> ERROR: open brace '{' following function declarations go on the next line
> #114: FILE: target/ppc/tcg-stub.c:87:
> +void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector) {
>=20
> ERROR: space required before the open brace '{'
> #119: FILE: target/ppc/tcg-stub.c:92:
> +void ppc_cpu_do_system_reset(CPUState *cs){
>=20
> ERROR: externs should be avoided in .c files
> #125: FILE: target/ppc/tcg-stub.c:98:
> +bool ppc64_v3_get_pate(PowerPCCPU *cpu, target_ulong lpid,
>=20
> ERROR: open brace '{' following function declarations go on the next line
> #138: FILE: target/ppc/tcg-stub.c:111:
> +void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp) {
>=20
> ERROR: open brace '{' following function declarations go on the next line
> #142: FILE: target/ppc/tcg-stub.c:115:
> +void init_ppc_proc(PowerPCCPU *cpu) {
>=20
> ERROR: open brace '{' following function declarations go on the next line
> #146: FILE: target/ppc/tcg-stub.c:119:
> +void destroy_ppc_opcodes(PowerPCCPU *cpu) {
>=20
> ERROR: open brace '{' following function declarations go on the next line
> #150: FILE: target/ppc/tcg-stub.c:123:
> +void ppc_tlb_invalidate_all(CPUPPCState *env) {
>=20
> ERROR: open brace '{' following function declarations go on the next line
> #154: FILE: target/ppc/tcg-stub.c:127:
> +void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags) {
>=20
> ERROR: open brace '{' following function declarations go on the next line
> #158: FILE: target/ppc/tcg-stub.c:131:
> +void ppc_cpu_dump_statistics(CPUState *cpu, int flags) {
>=20
> ERROR: open brace '{' following function declarations go on the next line
> #164: FILE: target/ppc/tcg-stub.c:137:
> +hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr) {
>=20
> total: 20 errors, 1 warnings, 139 lines checked
>=20
> Patch 3/4 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>=20
> 4/4 Checking commit 0250bc923e4d (target/ppc: updated build rules for dis=
able-tcg option)
> =3D=3D=3D OUTPUT END =3D=3D=3D
>=20
> Test command exited with code: 1
>=20
>=20
> The full log is available at
> http://patchew.org/logs/20210409151916.97326-1-bruno.larsen@eldorado.org.=
br/testing.checkpatch/?type=3Dmessage.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vv9MmhV0/vkR1MHP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBz1xYACgkQbDjKyiDZ
s5Ij/xAApiLE0lZaVA+wTqSRaCDsoj6OUJsssVSeKgCe2z7cbqgLYwlSSjUAL+Gb
zkqweQdbS5pgQSpNzLeEXArzRFSnJ6cTEzER/MX71O6w7wTCyEF0s4i5nmuzIcx5
NUrH5yDwY+B9QLHcSfbVfNcOKuqsI1Bj3v3KIDuS/ae6I9N9+PUPFVkEV1qlL0CJ
qYH8ZiU1G2bbHmc1X+xIFSwYuqLcduACIaclmf4EGGfQAZRSCYx9T+WXLtTcu8O5
wLTv8lQNuSKYKcqGW5BE9hr+2lQP3FZzZyuKeyiaeT4ssPuRb5smadMd4hIMW1qd
LlPseBaZmSNgVguRGjsdIwtnWddq93+fQrpvJdtf7PTb49D/jq8XOQMt13n93HU2
fxbWdxHPNVN33ZZSEGFuZ5cYBbaUnSYbLY/3oefKdCP3i9Ri3AveTpCTV+4Ghzzy
awv3MfbOoDWU0Fw2rifsHYXCk1vPdwdAd/nMAZytp2aXKKOO1TjP6Ppnsvlobynp
AK+aGg6LO5oclIRmq0beBSzTanvPfjxQYug4Pyqsw9OejT0mdio/cklJylLW26Lh
+1Uf6sJmUcLBM1Gql8VYHnTKSpiMZ1ozNPUnTjzLvrb2ITQhhFmr7P1SLRsW3yEF
3lvp+HN9/j1vZ8N9p1TooS6CUXiSGS8zDkCPlk5fZLjik9ELNUg=
=iqOl
-----END PGP SIGNATURE-----

--vv9MmhV0/vkR1MHP--

