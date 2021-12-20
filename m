Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D2847B054
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 16:31:37 +0100 (CET)
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzKdU-0004K8-DV
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 10:31:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzApP-0004iX-5X
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:20 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzApM-0008MN-N2
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976593; x=1671512593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PThElRh7iYTXrO1HM72cl/4OiVbD7pTmIxrbZAKx/QE=;
 b=Q8VC8vPIHRJi5APFw6oprfXF9NUTh1kCpnTLd6I9z/pDTN4d5OE/9dzU
 PtkkZH9wbQL3qH+0pCL1o50U6GXbjbpw9Ei098gyPFNjXab1cELG3dP5v
 HSKgS9qXTD9xGGKTSA6pYdbF8hmQGq4qoI3Gvo+25RpAIcV75lFQu28nq
 tJ0HmD9epbfgPc5LSHoWzKRno0YPtN982vp1SymM2Wpe8gFV1ocnZGyte
 A/xqZek9A4G/kpFIavsob7zEdHHnI5Th3SVgI2vfp5voojE0IkQRsLYJP
 AQJM86sDZFAPL7wD5PZUa/GoEMm/6kWcyCAbsGFAwjnb8gpTN6Vw3eiON A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680322"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:02:03 +0800
IronPort-SDR: YpiFAQkvsOm1Ty//Bu5cP51PYw8iaIDs/OCzfOoOGDdYuxafwtv72K8+Aw40+pavjikiu/WXBZ
 JFEYcWzaMpJpNlRAoDbYhyKsNWPLoei82jutvmGq6F97fFLV8nMzdQo709/fiThcBcSdIKRBvF
 4poBrZM/EwVRkCAwtxk4WT22LjuFIJgWjOvFGK89bTY+/TTLgTkeOkGno+xJLoLoFYbZkilVXo
 BPL8N3KhIPe6owchqU50GfEI2SFcZCwzDrFX9vXwzwfvj74/XSy1S83PtFZ+LDt0i6xkg/ZB2B
 h3ZppeKl1WMrnUkGnus98mYw
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:34:52 -0800
IronPort-SDR: WdZwSmAMRm7JSfpgLB+Tn0UhdauPM8TmG4EEdcnY+FWvD0fSEyhipIID6x38lh3Pt2jJe63yuv
 L9+bxIw3JvCwLf7EaFQxITK9xaC0P9PZ7kF9oHOv2iP2UVK7tLAR7uc9yUImFpAjMRsigwmsh6
 cJo2GQQ/ndzOlJvn6PChrMoOjRjodtVrsgBIYgZxjDeOwKY+IxJQo+6qa+YBfo+QdoWFSqHh/3
 gwHpiahcBFN0scuDqvMf45rZIJUdaXHFjpNlydtiTJ8wQsfW+XJE+Lv/fIBNfIbJgmpqScnD+G
 xVY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:02:02 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHSB23Fl8z1RwFN
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:02:02 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976522; x=1642568523; bh=PThElRh7iYTXrO1HM7
 2cl/4OiVbD7pTmIxrbZAKx/QE=; b=lhKzwL/mZmTtEvy22kZ5i7MjIdn+B00Gk7
 S/AAH/BSHTYWfXsvGsF1Jwa/sSjPH5fwx2RruSlERaE4P7zBeX3bBZDlMy9Vq/6C
 PSq+7jXj93hf5xFY3b6V6ItxPA+wJKYe/cgJhHMsHgETZu+AS7Hrhbh8UtxwF208
 RUHn0rPkqPgi/sd56UeQ47Ax3HCjCractrGsVMOby95qqBwiosGEwzeGJ9jaxBPV
 8J55P1M3ZVEkqu0flIUcJpECTETmF61W7RxNMDgbE1XufXLgSnRoJ8NVmt02DK+6
 RLVhhVhU/Iihc6n7SStnDfM4Y0IFslH+LyxY2LyvJ5/LSJHl/Vng==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Zj5N1BgLt32N for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:02:02 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS9z3gWMz1RtVG;
 Sun, 19 Dec 2021 21:01:59 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 71/88] target/riscv: add "set round to odd" rounding mode
 helper function
Date: Mon, 20 Dec 2021 14:56:48 +1000
Message-Id: <20211220045705.62174-72-alistair.francis@opensource.wdc.com>
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

helper_set_rounding_mode() is responsible for SIGILL, and "round to odd"
should be an interface private to translation, so add a new independent
helper_set_rod_rounding_mode().

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-64-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h     | 1 +
 target/riscv/internals.h  | 1 +
 target/riscv/fpu_helper.c | 5 +++++
 target/riscv/translate.c  | 7 +++++++
 4 files changed, 14 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 53cf88cd40..606bf72d5c 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -3,6 +3,7 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
=20
 /* Floating Point - rounding mode */
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
+DEF_HELPER_FLAGS_1(set_rod_rounding_mode, TCG_CALL_NO_WG, void, env)
=20
 /* Floating Point - fused */
 DEF_HELPER_FLAGS_4(fmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index db105d4d64..065e8162a2 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -43,6 +43,7 @@ enum {
     RISCV_FRM_RUP =3D 3,  /* Round Up */
     RISCV_FRM_RMM =3D 4,  /* Round to Nearest, ties to Max Magnitude */
     RISCV_FRM_DYN =3D 7,  /* Dynamic rounding mode */
+    RISCV_FRM_ROD =3D 8,  /* Round to Odd */
 };
=20
 static inline uint64_t nanbox_s(float32 f)
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index dec39d4a9e..4a5982d594 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -81,6 +81,11 @@ void helper_set_rounding_mode(CPURISCVState *env, uint=
32_t rm)
     set_float_rounding_mode(softrm, &env->fp_status);
 }
=20
+void helper_set_rod_rounding_mode(CPURISCVState *env)
+{
+    set_float_rounding_mode(float_round_to_odd, &env->fp_status);
+}
+
 static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs=
2,
                            uint64_t rs3, int flags)
 {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3688e80d03..b4df21bda3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -30,6 +30,7 @@
 #include "exec/log.h"
=20
 #include "instmap.h"
+#include "internals.h"
=20
 /* global register indices */
 static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
@@ -403,6 +404,12 @@ static void gen_set_rm(DisasContext *ctx, int rm)
         return;
     }
     ctx->frm =3D rm;
+
+    if (rm =3D=3D RISCV_FRM_ROD) {
+        gen_helper_set_rod_rounding_mode(cpu_env);
+        return;
+    }
+
     gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
 }
=20
--=20
2.31.1


