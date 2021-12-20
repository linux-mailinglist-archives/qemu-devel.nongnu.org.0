Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE08B47A4D9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:06:44 +0100 (CET)
Received: from localhost ([::1]:59754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBop-0005bQ-Ty
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:06:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAo6-0004SV-Hx
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:01:56 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAnv-0008MN-TL
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:01:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976504; x=1671512504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V/4BgI1PBmSB1ZdNCOjxq5vf5DEfjgJfU76ebVsnJ8g=;
 b=DsaGyIPFxX4Z60AsLOcZjAfsZrFTDaqYycCZkS1ETqq/nkUyiSrTEtle
 kYK2Y0JLN3gYLkbGq4e8UziL3GjPI0KazDxcHxOkyr8heIDMJAtoRnOuw
 WYZjshhIwfmcWE011VW52newHYgg/ieEQHhl06COJri4HwbapYb5F+gUm
 KhbGXwsxsUafiO8J4VFHPrWvcvdU7UQAZWdk4RkErxSYBhWNyfE9RuiNS
 T2RIF/cRzyPJFXQdkOtbj+QAI4xLC7HmmlCJAKTsxgTLMCnClwifKuQtZ
 tK5kuSSJUQuirwzehwC6fuUHfeLp1YSXm1PESk3iIW7xFwjXR36qLpYE8 g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680172"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:01:03 +0800
IronPort-SDR: 6I2uKTbgzlA/9uSfd7QF00Np7KywLG98ZD75R+MonD8c1N1uWox06cbLhNbvW7sTU6rVV9D7GN
 ezpMO/22hRKaUB2Djt33l+xpOJJNKqjCKxlfRdEPubuV/W5l5m8oNoGAhMyhTCSVtyY/PT1bYp
 XP8kIDHoKu0vFdvKznjz/pSQ85/SYOb5Iroor6J5ELXoqehwN1MA28aLYu7EnFg4M60IsKAicd
 o+MhJrW2Kdb5m15D1/lYgjyEjOzqLBKHvEfOAGl5yNKKCWEVOS6fwCrCMAa782abD3Il5+Znwx
 ldbKwdUIDXlKOnbRqZBK1XO6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:33:50 -0800
IronPort-SDR: n+ZnKeE6/pEDeJv2xUC5XEEOwU6Hzfn/HXSGVdJZjxSPJzKIo/C4VbNooAJ+JfmlzfFtHR4Dkd
 nJ4etTwQePQLie2pTZ2QYxj45+9SXz/5L+MaGylVnmIPfBtTdZGg/KqwU2k6qzFDxcHAzOAKDQ
 onbv3m6plR0JGSXTURiVrUIgX5uvhSTPMaCXy5ssecV7I4dqQZyNxAGBNztkIcK49tstcXBHXr
 mErqVjDIJYhgF6L8qShRiezrSqTkZSmCG6wSlSJqqVENjfOMOnDAitNr/UAbmGHnm09FLS/LkA
 tqQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:01:01 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS8s0fZtz1RvTh
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:01:01 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976460; x=1642568461; bh=V/4BgI1PBmSB1ZdNCO
 jxq5vf5DEfjgJfU76ebVsnJ8g=; b=FLDIqrU2zI0EzCn/WJ6dlzqc0sFNtMxwYh
 Vbo16GZLP/fxIg8ngvC3aLrg1mzw6AMdzAJerjT1cLLD8iZf6eEFvPOY6Rq/VDMA
 GjKlAw4iwBV2vqlwOHTGvxpPwNk+2I/mSW/qGdGlAZ7/jPYWlsbr7ZdfC+2zzgJY
 CBUysoYkH7/L4OXMqI2mvXNwFT6j/414gGmxx4P1nFuv/z/l1dIfBb4SNiFKThT1
 ZLZLpviHc44NskdNW+4Q9st7ZtC9mia+06WL4q8x+67TdihTi8260a56u1UXqkml
 U85a3CvDeBBGkBKC51lffRxkcVIv/nlorIMPwTwpWrhqOk2na7jg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BQYSbhvG1-Ty for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:01:00 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS8n45nBz1RtVG;
 Sun, 19 Dec 2021 21:00:57 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 55/88] target/riscv: rvv-1.0: integer comparison instructions
Date: Mon, 20 Dec 2021 14:56:32 +1000
Message-Id: <20211220045705.62174-56-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

* Sign-extend vmselu.vi and vmsgtu.vi immediate values.
* Remove "set tail elements to zeros" as tail elements can be unchanged
  for either VTA to have undisturbed or agnostic setting.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211210075704.23951-48-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c            | 9 ---------
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e885d4d353..277a5e4120 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1190,8 +1190,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
 {                                                             \
     uint32_t vm =3D vext_vm(desc);                              \
     uint32_t vl =3D env->vl;                                    \
-    uint32_t vlmax =3D vext_max_elems(desc,                     \
-                                    ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                               \
                                                               \
     for (i =3D 0; i < vl; i++) {                                \
@@ -1202,9 +1200,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
         }                                                     \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
=20
 GEN_VEXT_CMP_VV(vmseq_vv_b, uint8_t,  H1, DO_MSEQ)
@@ -1243,7 +1238,6 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,   \
 {                                                                   \
     uint32_t vm =3D vext_vm(desc);                                    \
     uint32_t vl =3D env->vl;                                          \
-    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i =3D 0; i < vl; i++) {                                      \
@@ -1254,9 +1248,6 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,   \
         vext_set_elem_mask(vd, i,                                   \
                 DO_OP(s2, (ETYPE)(target_long)s1));                 \
     }                                                               \
-    for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, i, 0);                               \
-    }                                                               \
 }
=20
 GEN_VEXT_CMP_VX(vmseq_vx_b, uint8_t,  H1, DO_MSEQ)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index ed4554b6a1..804f423d5b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1809,9 +1809,9 @@ GEN_OPIVX_TRANS(vmsgt_vx, opivx_cmp_check)
=20
 GEN_OPIVI_TRANS(vmseq_vi, IMM_SX, vmseq_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsne_vi, IMM_SX, vmsne_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsleu_vi, IMM_ZX, vmsleu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsleu_vi, IMM_SX, vmsleu_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsle_vi, IMM_SX, vmsle_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsgtu_vi, IMM_ZX, vmsgtu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsgtu_vi, IMM_SX, vmsgtu_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsgt_vi, IMM_SX, vmsgt_vx, opivx_cmp_check)
=20
 /* Vector Integer Min/Max Instructions */
--=20
2.31.1


