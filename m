Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC0A37F242
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:33:27 +0200 (CEST)
Received: from localhost ([::1]:40144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh32L-0006Qu-Ud
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sj-0007Qc-PJ; Thu, 13 May 2021 00:23:29 -0400
Received: from ozlabs.org ([203.11.71.1]:47141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sf-0004i8-Jt; Thu, 13 May 2021 00:23:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdmt2HkMz9t6g; Thu, 13 May 2021 14:22:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879774;
 bh=ooxL1e4MoPLv/cbj404S32feT4buKwIxH64WvRGhFfk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RDCVA7BHuzNwQUJL/sXG0efdd+qkyL/O3NHlpL406JlzIVi5k9k4tBtlBPxIYXhYE
 H0jfIpenyK2C/X1WmhOW3LzxceSG1Yftf5MnLuGTpzQoMvfUhmrplb+igJ6SRsn2Ps
 lsbYCPCBye0XVhSwcQcbtTZ4wkaIfM2yGF4G3e4s=
Date: Thu, 13 May 2021 14:22:44 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v4 00/31] Base for adding PowerPC 64-bit instructions
Message-ID: <YJyplOJUjBWrJyZJ@yekko>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5npSKKvIxcbf5qyZ"
Content-Disposition: inline
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5npSKKvIxcbf5qyZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 03:54:10PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> This series provides the basic infrastructure for adding the new 32/64-bit
> instructions in Power ISA 3.1 to target/ppc.

I've applied the first chunk of these.  After that I get conflicts
with my current ppc-for-6.1 tree.  I suspect those are conflicts with
the !TCG changes I recently applied as well.

In any case, please rebase the remainder and resend.

>=20
> v4:
> - Rebase on ppc-for-6.1;
> - Fold do_ldst_D and do_ldst_X;
> - Add tcg_const_tl, used to share do_ldst_D and do_ldst_X code;
> - Unfold prefixed and non-prefixed loads/stores/addi to let non-prefixed =
insns use the non-prefixed formats;
> - PNOP invalid suffixes;
> - setbc/setbcr/stnbc/setnbcr implemented;
> - cfuged/vcfuged implemented;
> - addpcis moved to decodetree.
>=20
> v3:
> - More changes for decodetree.
> - Cleanup exception/is_jmp logic to the point exception is removed.
> - Fold in Luis' isa check for prefixed insn support.
> - Share trans_* between prefixed and non-prefixed instructions.
> - Use macros to minimize the trans_* boilerplate.
> - Fix decode mistake for STHX/STHXU.
>=20
> v2:
> - Store current pc in ctx instead of insn_size
> - Use separate decode files for 32- and 64-bit instructions
> - Improvements to the exception/is_jmp logic
> - Use translator_loop_temp_check()
> - Moved logic to prevent translation from crossing page boundaries
> - Additional instructions using decodetree: addis, pnop, loads/stores
> - Added check for prefixed insn support in cpu flags
>=20
> Matheus Ferst (6):
>   target/ppc: Introduce gen_icount_io_start
>   TCG: add tcg_constant_tl
>   target/ppc: Implement setbc/setbcr/stnbc/setnbcr instructions
>   target/ppc: Implement cfuged instruction
>   target/ppc: Implement vcfuged instruction
>   target/ppc: Move addpcis to decodetree
>=20
> Richard Henderson (25):
>   target/ppc: Add cia field to DisasContext
>   target/ppc: Split out decode_legacy
>   target/ppc: Move DISAS_NORETURN setting into gen_exception*
>   target/ppc: Remove special case for POWERPC_SYSCALL
>   target/ppc: Remove special case for POWERPC_EXCP_TRAP
>   target/ppc: Simplify gen_debug_exception
>   target/ppc: Introduce DISAS_{EXIT,CHAIN}{,_UPDATE}
>   target/ppc: Replace POWERPC_EXCP_SYNC with DISAS_EXIT
>   target/ppc: Remove unnecessary gen_io_end calls
>   target/ppc: Replace POWERPC_EXCP_STOP with DISAS_EXIT_UPDATE
>   target/ppc: Replace POWERPC_EXCP_BRANCH with DISAS_NORETURN
>   target/ppc: Remove DisasContext.exception
>   target/ppc: Move single-step check to ppc_tr_tb_stop
>   target/ppc: Tidy exception vs exit_tb
>   target/ppc: Mark helper_raise_exception* as noreturn
>   target/ppc: Use translator_loop_temp_check
>   target/ppc: Introduce macros to check isa extensions
>   target/ppc: Move page crossing check to ppc_tr_translate_insn
>   target/ppc: Add infrastructure for prefixed insns
>   target/ppc: Move ADDI, ADDIS to decodetree, implement PADDI
>   target/ppc: Implement PNOP
>   target/ppc: Move D/DS/X-form integer loads to decodetree
>   target/ppc: Implement prefixed integer load instructions
>   target/ppc: Move D/DS/X-form integer stores to decodetree
>   target/ppc: Implement prefixed integer store instructions
>=20
>  include/tcg/tcg-op.h                       |   2 +
>  linux-user/ppc/cpu_loop.c                  |   6 -
>  target/ppc/cpu.h                           |   5 +-
>  target/ppc/helper.h                        |   5 +-
>  target/ppc/insn32.decode                   | 112 +++
>  target/ppc/insn64.decode                   | 123 +++
>  target/ppc/int_helper.c                    |  39 +
>  target/ppc/meson.build                     |   9 +
>  target/ppc/translate.c                     | 829 ++++++++-------------
>  target/ppc/translate/fixedpoint-impl.c.inc | 243 ++++++
>  target/ppc/translate/vector-impl.c.inc     |  50 ++
>  11 files changed, 877 insertions(+), 546 deletions(-)
>  create mode 100644 target/ppc/insn32.decode
>  create mode 100644 target/ppc/insn64.decode
>  create mode 100644 target/ppc/translate/fixedpoint-impl.c.inc
>  create mode 100644 target/ppc/translate/vector-impl.c.inc
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5npSKKvIxcbf5qyZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcqZMACgkQbDjKyiDZ
s5KAlxAA2wXkT0KCvEKFiNx0sQNQCwsackjByTLLyqBdHLz/KKcWYnHPlefBXG1h
3sA52tCtgx7StHT0t+QFkblx0IGomc7I8fU0Utyzza2n11VsyiXzVZJX1vnWDwXM
qgKdeOsLKeGHnF+q2tz6p51mEgLzj9QoNj6mitU8RHhI6aBZKP0cBNp0lS6/3fIR
TUmZ9yFvdFldiJTrV9Fpg5xIxLpSA6siQc8Y0oltWSqlDvx0q7WwHN2yHbGfqkWr
DYWYOKBH4PAqQJFmyqtfYKjDS42rPfk5kUYBROhxUc5clZIU/ohWIGfkMELnPjAr
aw33+UeTWsitj2ZIJsnyY56IzPffHqSLIGmyIcXSIlrIkq7zB5kTy871bd/npeAJ
EQ7dearVu5/ev13cCIj5WoxuilWnTu3Rx4tOI3bWs3AEZmNORdsM8JdP43EG++NZ
P9WouL0XT8/DSuF9hn78dxWNBtxwP2BCbtnJdPky7/dLq/o3x5OqJADIMlzAbd0h
/K9AV2iFq8Vf6qTfKzP+B6cLMkAabpACrTZiKYdMnf5xgqm/+Z8HRk9e1hlgJFXU
/t6aDb/+RtwlOdre2QqeKMOachly71nM85R1onp+qiUG9AWs6GgT+ib4e0g32vxF
ba5Ijg0kUJMZDyw1dqr1hTUFdqakmcDWtHI3myyKjD7w0ck0dF0=
=mYRp
-----END PGP SIGNATURE-----

--5npSKKvIxcbf5qyZ--

