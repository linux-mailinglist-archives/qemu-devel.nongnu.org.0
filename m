Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B159403390
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 06:59:06 +0200 (CEST)
Received: from localhost ([::1]:53502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNpft-0007C0-Hs
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 00:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=87817de26=alistair.francis@opensource.wdc.com>)
 id 1mNpbh-0007R2-LX
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:54:45 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:16643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=87817de26=alistair.francis@opensource.wdc.com>)
 id 1mNpbf-0003tb-VC
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631076883; x=1662612883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JnuooeBmOvrNM6LgCIWux/Znpi60xXVkixxcdpQC3rA=;
 b=KPlwOQdiFskG1us3BtP4YN6pYAavHp1g1N2mR9afhllAgPiiLt1cNgpc
 MzWJ5rmvh12FRBoeDQ6LZX7HkCx3pIVA3x9cUuMvYmaiqb8+Oo/tpxuTN
 pXxKD06BJ8BdzsuujEHa6KnIE74xoXmhpPcE6YEyW+yLHCrqJ+/YdNyeX
 09ZHR6gJekGxmM2RSRPHlfkYP4XkVNUkXzVsodrM7YOVnddU+CrnQfI2j
 exBIGZN+uHbx/VUkdnDVtHioIO6Zs9Na8pDrJrNfcmrAlD3OuaMq0tzie
 zBFv4/khOmfEjvfHce7q4BfeZZZ8bWP5l6PIR1j9m4TYgF4/7Ca+iOJNo g==;
X-IronPort-AV: E=Sophos;i="5.85,276,1624291200"; d="scan'208";a="179443435"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Sep 2021 12:54:41 +0800
IronPort-SDR: 7uCrYXnZpzXg7bK9mTf9fK/1Z8pwMsytvluMTVKHQ0riZ4QOZCF/QRZY0czxEl4ELv+9dG83wU
 wAo/cl7bXeG/D31FN7/uBOxjFMfaRCoMyr3t8qpP/KyLk6pUhAD0nDnHlA4k3PbqyOykKilZQm
 tgmxyw13oEGtpnCz9LmZl9wkFfKV1hjKZIArhJOfM+SGEVVNwmR2SbSjQo3mrIpwG+5iAWHPWT
 Ae5u8dG68NWwJZN3X/I8ZMhtLwXAUF6yh7hsMCPJ/lwxHIerMrBKs/JWXT3ZdbyjXHOO3mZyA5
 OwrIM8t1jjgIp/AtBAK7TO69
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 21:29:40 -0700
IronPort-SDR: QYTHQ2dNRFs+O3MoWHelXpdEiF9q0vkgXY0/br6av/C0MItoS1JDM/crHBygIVRgNjdg5HTEWz
 hZ5fzuzCyOCP4zyaLQ7O96nMYoDkooJF04TMuk9YcCaOO4rGwlOtDmEp2EPFN+WUf0FsDkPorZ
 Rn2YMwCkasOeOkXPA2mPagbXn5Ed2mEhCFRWdqcvgSRbHyLlr3RGqDf12idh5KR89TinuU68sF
 q2MKmRHEUF5P8romyV9i+MAYFbwv72pJqRqMtCRofTMiF7S9s1IoQCZ5nmYHGJXLHtrn+9SB50
 bBk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 21:54:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H48v60PnSz1RvlY
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 21:54:42 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631076881; x=1633668882; bh=JnuooeBmOvrNM6LgCI
 Wux/Znpi60xXVkixxcdpQC3rA=; b=KQugqwMO/ulvTIyNkzDA4OUdMZehJxcZ/P
 EdiSk1ERUmcByoPjzemkVkaJGi9o+nSvcO2oCMWPASreG7Zi5ulGjVTqyfm1GVkD
 3jPPVSL1ciktiyRUIbt0IkhAuQ8jLRiMUWXp6BzFl4VWsNF4+jHahNzUZpXGvuP4
 Hvb5mDbTcOYxSD600yKEO+0BOnfQIBx5i0bEd+JTmFFIdeqj5DE4i3N22f7XDsbb
 /vYWwPn3zf9eGMRt73H3cQ2Pns4D3L+rOyB/E2r4IrptUgaxRZtbcIrxH7nroyqT
 tuvT6Noaa5kW0l2EW+MIrJPCRb/fT6rLVNd27Bx1Nq+xUOo3E93A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id IR752sZKVPib for <qemu-devel@nongnu.org>;
 Tue,  7 Sep 2021 21:54:41 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.20])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H48v06kkYz1RvlR;
 Tue,  7 Sep 2021 21:54:36 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 1/3] target/riscv: Set the opcode in DisasContext
Date: Wed,  8 Sep 2021 14:54:28 +1000
Message-Id: <2540484d3fb928600d403182529bf345b2b1f915.1631076834.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631076834.git.alistair.francis@wdc.com>
References: <cover.1631076834.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=87817de26=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e356fc6c46..25670be435 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -485,20 +485,20 @@ static uint32_t opcode_at(DisasContextBase *dcbase,=
 target_ulong pc)
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode-insn16.c.inc"
=20
-static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t o=
pcode)
+static void decode_opc(CPURISCVState *env, DisasContext *ctx)
 {
     /* check for compressed insn */
-    if (extract16(opcode, 0, 2) !=3D 3) {
+    if (extract16(ctx->opcode, 0, 2) !=3D 3) {
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
             ctx->pc_succ_insn =3D ctx->base.pc_next + 2;
-            if (!decode_insn16(ctx, opcode)) {
+            if (!decode_insn16(ctx, ctx->opcode)) {
                 gen_exception_illegal(ctx);
             }
         }
     } else {
-        uint32_t opcode32 =3D opcode;
+        uint32_t opcode32 =3D ctx->opcode;
         opcode32 =3D deposit32(opcode32, 16, 16,
                              translator_lduw(env, ctx->base.pc_next + 2)=
);
         ctx->pc_succ_insn =3D ctx->base.pc_next + 4;
@@ -561,9 +561,9 @@ static void riscv_tr_translate_insn(DisasContextBase =
*dcbase, CPUState *cpu)
 {
     DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
     CPURISCVState *env =3D cpu->env_ptr;
-    uint16_t opcode16 =3D translator_lduw(env, ctx->base.pc_next);
+    ctx->opcode =3D translator_lduw(env, ctx->base.pc_next);
=20
-    decode_opc(env, ctx, opcode16);
+    decode_opc(env, ctx);
     ctx->base.pc_next =3D ctx->pc_succ_insn;
     ctx->w =3D false;
=20
--=20
2.31.1


