Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4D55EBBB8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:40:15 +0200 (CEST)
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od5CQ-0001xB-HP
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48H-0005jU-Pk
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:32:01 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48F-0001Eu-3l
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260311; x=1695796311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/HeXQHVkXy5DHud8REtBdoMYgtxpOnO0N2okvo72Gmw=;
 b=gPLVCIVa6Twx7iFapcMYmL3K5zB3/rtSuxv53q6IInvUu7D3eAW9/tNw
 5AD8SpnlwFq4brEFwVNyyK+1tj9uRpbJJALinU1AlhQEhMukRzr0AmkXS
 6KQFP+cyOFLa5xVNeVwRsHw+/uVQbqo+nHJ1pCKXuMa5M8aV0y9T6sYFc
 rBgWv1im5e7lNWXojZeALRy6w7HZbvg0C5hnNYQGE9JV8lMaW0whacmVd
 cA/lQGKntQO/6sdZy3Wcd8PCzh9uYmQez9l5xffgAN0wN7LB5s0vkt586
 RgPC0vDdywU6vPPH5426gGfdPzgmAO1kIIHAW+6B6wwzt9j5sWJgqjJ7N Q==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530900"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:34 +0800
IronPort-SDR: 2dbwQagQ5dXEM06mcFzYQ/sswOCoUjjHZ9EACWH/nUdMbcSiDBuFb8faMXlqzxob7dZM1PMfhl
 lnhM4UnA5nB34vGwUmGlawGicxviZeAaAYMu/W6cbdHIvw4nKR6xv19pHEsP0rWfqMCdmlTc4p
 IUCn+DuAGYXWZhKoGLH4yisEOQxeswRb7TvPitsUvEspaSHnnz3wPgnxonhtd2y+r14cpjcsV9
 38a/zPWSOpxKHiO/dfRkdnVgD8BXUGQVtxKyiXr6ZUh8xKOkX4MaiqWHc/N/u5ruDEIcVhf+mc
 EI9mhz5zfiOceAz2w2tGA56H
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:31 -0700
IronPort-SDR: R4/UhZgWqhAdrRJkV/c5vJ0bRlPQGvTU7Lu70yMgO6xl+hM6uFO+kHwhFAPQZSlzhUOwdIfExv
 r32Q9rWu37Oq+Xl7ces6Jnwga9sJPAFAqdxWn9qUyimMZQAkYl4lySVZWLom8w3zosjXiKtieJ
 aNIcXRLLQjqobIIah5W6+OnLdIpZymfeN5WtWABgUiWwyhf8Tr79u0IL1lNKbZnHucWlmFHfZB
 1PFbqraf1mrjLrhYKxNuczncneq5+HMWRpt0dSIJ+LNeMwu5cPfyHVa3tPY6FXOqHsgESK5u6U
 4Aw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sd5Mqkz1Rwtm
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:33 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260293; x=1666852294; bh=/HeXQHVkXy5DHud8RE
 tBdoMYgtxpOnO0N2okvo72Gmw=; b=XUucZGf9H8C1Fdt9VcqXkEarRAkVCTGQyj
 jmZ6AiLlemzplNE1GVqpS6gct4G9UOb088KbErQdz0EOZJ/8m528Ffir44ZOYraH
 r1JkAczNzbGhNH3rarphILZGT0Fx37a2IQkVJYnXdF9jb6GkGSn2rjfLdo01ptuz
 GLPxnEgm3z++qyWC9XDj5t9ZRTYsxHqLwbf2on1CWEYOWmtiGbZ+yFV0irjULUn4
 MIVKIlHXkNmlurH/oRD7epiiZI19oa1DQ3Mm5+9TU/e8nGpggGbGGmmJE6fKYMx9
 s//i8ndyxnnFQT6hjKmLSdpxcW5mV1Copn1ZhMHoVWWf2g7o5Gfw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id wIp2JTlg2ZHP for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:33 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sb49pKz1RvLy;
 Mon, 26 Sep 2022 23:31:31 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 14/22] target/riscv: debug: Introduce build_tdata1() to
 build tdata1 register content
Date: Tue, 27 Sep 2022 16:30:56 +1000
Message-Id: <20220927063104.2846825-15-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
References: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=262caef14=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

Introduce build_tdata1() to build tdata1 register content, which can be
shared among all types of triggers.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
[bmeng: moved RV{32,64}_DATA_MASK definition to this patch]
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220909134215.1843865-3-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/debug.h |  2 ++
 target/riscv/debug.c | 15 ++++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 72e4edcd8c..c422553c27 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -56,9 +56,11 @@ typedef struct {
 #define RV32_TYPE(t)    ((uint32_t)(t) << 28)
 #define RV32_TYPE_MASK  (0xf << 28)
 #define RV32_DMODE      BIT(27)
+#define RV32_DATA_MASK  0x7ffffff
 #define RV64_TYPE(t)    ((uint64_t)(t) << 60)
 #define RV64_TYPE_MASK  (0xfULL << 60)
 #define RV64_DMODE      BIT_ULL(59)
+#define RV64_DATA_MASK  0x7ffffffffffffff
=20
 /* mcontrol field masks */
=20
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 9dd468753a..45aae87ec3 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -95,18 +95,23 @@ static inline target_ulong get_trigger_type(CPURISCVS=
tate *env,
     return extract_trigger_type(env, tdata1);
 }
=20
-static inline target_ulong trigger_type(CPURISCVState *env,
-                                        trigger_type_t type)
+static inline target_ulong build_tdata1(CPURISCVState *env,
+                                        trigger_type_t type,
+                                        bool dmode, target_ulong data)
 {
     target_ulong tdata1;
=20
     switch (riscv_cpu_mxl(env)) {
     case MXL_RV32:
-        tdata1 =3D RV32_TYPE(type);
+        tdata1 =3D RV32_TYPE(type) |
+                 (dmode ? RV32_DMODE : 0) |
+                 (data & RV32_DATA_MASK);
         break;
     case MXL_RV64:
     case MXL_RV128:
-        tdata1 =3D RV64_TYPE(type);
+        tdata1 =3D RV64_TYPE(type) |
+                 (dmode ? RV64_DMODE : 0) |
+                 (data & RV64_DATA_MASK);
         break;
     default:
         g_assert_not_reached();
@@ -495,7 +500,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, C=
PUWatchpoint *wp)
=20
 void riscv_trigger_init(CPURISCVState *env)
 {
-    target_ulong tdata1 =3D trigger_type(env, TRIGGER_TYPE_AD_MATCH);
+    target_ulong tdata1 =3D build_tdata1(env, TRIGGER_TYPE_AD_MATCH, 0, =
0);
     int i;
=20
     /* init to type 2 triggers */
--=20
2.37.3


