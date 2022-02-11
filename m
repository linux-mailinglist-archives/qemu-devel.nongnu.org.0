Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B2D4B31AA
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:07:54 +0100 (CET)
Received: from localhost ([::1]:36964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIfxB-0001Fa-93
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:07:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfr3-0005CU-D2
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:33 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:1868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfr1-0000C5-60
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624091; x=1676160091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uYE/mOCtndKnFgc+9uvpYG2BClhduKs/P6ABzwgR2HE=;
 b=A3U/BduoA420yB9KbnMyiReKK7q6tU4f2mKnKHys8o/crlxf0VNtYY03
 AU7O9jIFHGb87THfIZgkInSz6oQoVo8iu3E7v1iHyswV/fgURET8/68vl
 VtXfjJ9WbjVCJ8s2GAk4EQ8awSJCXR3ZUOCT7/zUpYkI4AkZLaFH79VBP
 ajrn2qkBJX7Fu7U/QUr1/gtAijsODX4kDobC7Dt/6b4fWDEiBQHfc+q9U
 8VTIOCkN49OIoUrfxIg8aMmoHN0rZbIpPQYmue22EF6UFurKI2XBOInFP
 ph3J0eZDmqW79k4ezJNodHjiS1ZAdBT3oOz0rDS6JYtHKRy+hAaAJywa2 w==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="296835688"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:01:30 +0800
IronPort-SDR: j7oZOVaaygT1zsP4iSDn2h29Q1GiUlqnjnMQqpvqIVkJlmTgLF2Y84uSAXHvDMZ8HuBFAY2vJ3
 97QYjByd7O/EfrAK9AFsV2PQs/26DU3f0PXetvzfx9nSJU+DK6Hnz3uqYCZIz27r0fq+Pl/JFz
 QjUIQWcdkLqvhuuTMJG0Gw04W/7QSNjr/j7BeNUtbU+bKfQrCVK33Fdxljn6T7SYM8lNqU/1bk
 R2kT8GBBCtUU3SP3pqVtHZ2OsS0pOq/r/qvSOzp1zqn5wKW8IUh86e6q+FP1/Gk1U0xJS42VSf
 ba7gpmD1jlngRgh64mP0TeCA
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:33:15 -0800
IronPort-SDR: y8aLkmqGWKztGF5/i+8woPthe+TlN03YkFwa0rmBv80GY6Q4HnTRBISB8J1WeKHEYurSitTgzT
 YgfauK0G9pIA5G8JGyR7EMCeYFcr7yXL8mi8dflFr+4yPiiFX2BLJBmWUMlX4BQvNFO3XPHVbL
 fx32tnRzyg4ksO+ICbEAxzjgK+WfmB5ATm6dlCvXGaA3wRcC5jAfR9q7hI60sqcIu5dS4vKE/5
 OaD+xbhqGeAO8tnrfxowsEWWgicJeyHBGYrt/T8owZ3LFBELOsTjmdMHtu42liWUat4cF+E/gy
 oDQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:01:29 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVyK5vH0z1Rwrw
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:01:29 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624089; x=1647216090; bh=uYE/mOCtndKnFgc+9u
 vpYG2BClhduKs/P6ABzwgR2HE=; b=JUl/HdbbL9Lhx01mXuO43LTcFGGQvZ+6yd
 J6zmbNFYG6pdsMnzU51OEC958jvSIzcE9EP/jhA83Demqu6tHIJFDi8KOXM9HhFR
 GzcAVASH+nzS79JGDYDOEXydRhURr+ci8fTlJ3oSKhrIUTMp4GlEgrl4aMA80wpU
 YHym+GRgzJCmplrBjGg3OpKOB1BNpC/5ORGhbFhRdhLMFigh2vdpg+ZAz3LQh4EI
 jvUwDV9qFeyTquD8+89/dQQN22dEbEcVzc+B7McEphqNSi5xAeSzZRT46IjiuR61
 d3j5q3ti910Q4FDljvIwREtIjuoy9bAcHfIVxjdpHXdrb8JoAAFQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id foTaO2NAhc8s for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:01:29 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVyG01MNz1SHwl;
 Fri, 11 Feb 2022 16:01:25 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 07/40] target/riscv: access cfg structure through DisasContext
Date: Sat, 12 Feb 2022 09:59:58 +1000
Message-Id: <20220212000031.3946524-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

The Zb[abcs] support code still uses the RISCV_CPU macros to access
the configuration information (i.e., check whether an extension is
available/enabled).  Now that we provide this information directly
from DisasContext, we can access this directly via the cfg_ptr field.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220202005249.3566542-5-philipp.tomsich@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index 810431a1d6..f9bd3b7ec4 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -19,25 +19,25 @@
  */
=20
 #define REQUIRE_ZBA(ctx) do {                    \
-    if (!RISCV_CPU(ctx->cs)->cfg.ext_zba) {      \
+    if (ctx->cfg_ptr->ext_zba) {                 \
         return false;                            \
     }                                            \
 } while (0)
=20
 #define REQUIRE_ZBB(ctx) do {                    \
-    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbb) {      \
+    if (ctx->cfg_ptr->ext_zbb) {                 \
         return false;                            \
     }                                            \
 } while (0)
=20
 #define REQUIRE_ZBC(ctx) do {                    \
-    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbc) {      \
+    if (ctx->cfg_ptr->ext_zbc) {                 \
         return false;                            \
     }                                            \
 } while (0)
=20
 #define REQUIRE_ZBS(ctx) do {                    \
-    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbs) {      \
+    if (ctx->cfg_ptr->ext_zbs) {                 \
         return false;                            \
     }                                            \
 } while (0)
--=20
2.34.1


