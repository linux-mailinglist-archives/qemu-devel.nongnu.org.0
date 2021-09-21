Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF9A412EF3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:02:32 +0200 (CEST)
Received: from localhost ([::1]:54592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZnT-0007n2-7T
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZfq-0007a6-6G
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:54:39 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:32915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZfo-0003fY-Gs
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632207277; x=1663743277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/By8hcMfszR6aj98qjgmS+3rf+WKkLvhUWvMd941eg4=;
 b=r7NUbXGEb0UECps+5Y+maiyewGgt7iZ1s9Ql4ZGLfydfJXXSF1hYJE8K
 TMO6thb8k7EX5J1DcH9b1SG4BxHj+ukivkjth8stJejwqxxrcsGT14y2Q
 hwLexaRemh2xi4bC+lymd47X9xet5bE6/xuAnFb12pcqSHS1qHfPNhwHL
 2WAGK7D8tnw5kEwJnRj85M4Kzv96y4N3AB8bCmS9vWOT3iCpl0Wg6H93u
 JclSbgRB1LbM+X5Vr5STqAjXKI0gzCTiAQNXOHWZYRQzFJ15sQXjFaEYJ
 w4bzX9AMNZf8+tBWRnBr6WmvohubQhqo+MN83XxFV6zWenQxgCRA0VtlS A==;
X-IronPort-AV: E=Sophos;i="5.85,310,1624291200"; d="scan'208";a="181039173"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2021 14:54:30 +0800
IronPort-SDR: y6YfYAcpB2zNYjll7ETPaQIUSiYtSFuzksFEcdDGb8RXdlltJc94IOpLauXcyRo2nkP6yhtnFb
 8mna2G+dPfJVfBHmJCkCNc6KGK4bElLG7vcYn98TsvZpaAVUhns1ardOXXnFadXIAds4M/fq5Z
 08bqOy9UfY8jO2RxKylAEDYtol3ppbxY/R9AWT6hDs34ZuhQOfznm8PDAp+m9dAAVsU32sv22F
 KqzbcrGfnjyvF2yCYYo26O1emRj3BQNO2n/0aMuLr3Xx0ZRHfqGOkpWtcBZcBIiZpEZRebw7jH
 rX8Y00nQSEjDeeTsROl5FOhu
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:30:44 -0700
IronPort-SDR: VjVlMzsmTSFis/FaCpBuPR578vvUDRH3pBPN9vqdMnm1fam/CjXcrlmeCCxXsWMtxOvpOJx3oF
 KK/8EfAwOBAYKoCTByWp2geHxUO57y52jpVNkgCOs8q3ZiQg0T9FHIZu+z44Nx5mDgTJicZjQN
 irly1GwfNOJQp7kUsrolwhIr82eQ+TvwXDpqSwrgV+V7lg98s5RZ8SY/KV+ecrYqS4xY13I3gm
 4YB5Vgq/y6vkzsbeExapqjlipqIcs0fqp1vOAI7rUJHfgRtH7f1yqWk/g+GTS0pX1V0nzsFfKC
 hmA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:54:31 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HDBxK5bLLz1Rws4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 23:54:29 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1632207269; x=1634799270; bh=/By8hcMfszR6aj98qj
 gmS+3rf+WKkLvhUWvMd941eg4=; b=lXZTU8h6eVsQ6kQIdXVjf/K2n+eI9Qn9bZ
 5/iTNwx616grsdlXb8BZXeaY744QFKsWeC3xxHsUm658rdFkMHd4LX4RgS80yp9k
 dD6A2Hi7hc30uU6/0BOfMZm0xr6Ko7sIcPl3C5ExYmQTGTSvVtU7hxkqyRnS41yT
 wVpfCv7+M+VjUm6DAzjXl1O9uUEZ+4yDdTbBKV4qC29d96FogmhU32/f3VRIytQ9
 0VJqu5yBmhd9nevZEj6GYmPWk2BBUCoEzNL0a1QVpVLrObyUv9ScO3UnbIpJ6tVz
 t/1yxeqTgHdob8B4sH0N9ol2DHgXAfxb7rF1AgpLVeoK76WQe7vw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Izg5PKJK-eTX for <qemu-devel@nongnu.org>;
 Mon, 20 Sep 2021 23:54:29 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.26])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HDBxF5qrpz1Rwry;
 Mon, 20 Sep 2021 23:54:25 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 01/21] target/riscv: Update the ePMP CSR address
Date: Tue, 21 Sep 2021 16:53:52 +1000
Message-Id: <20210921065412.312381-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
References: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=891501f09=alistair.francis@opensource.wdc.com;
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

Update the ePMP CSRs to match the 0.9.3 ePMP spec
https://github.com/riscv/riscv-tee/blob/61455747230a26002d741f64879dd78cc=
9689323/Smepmp/Smepmp.pdf

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 28c908de60b9b04fa20e63d113885c98586053f3.1630543194.git.alist=
air.francis@wdc.com
---
 target/riscv/cpu_bits.h | 4 ++--
 target/riscv/cpu.c      | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7330ff5a19..ce9dcc030c 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -210,8 +210,8 @@
 #define CSR_MTVAL2          0x34b
=20
 /* Enhanced Physical Memory Protection (ePMP) */
-#define CSR_MSECCFG         0x390
-#define CSR_MSECCFGH        0x391
+#define CSR_MSECCFG         0x747
+#define CSR_MSECCFGH        0x757
 /* Physical Memory Protection */
 #define CSR_PMPCFG0         0x3a0
 #define CSR_PMPCFG1         0x3a1
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 13575c1408..d4d5961807 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -599,6 +599,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
=20
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVE=
C),
--=20
2.31.1


