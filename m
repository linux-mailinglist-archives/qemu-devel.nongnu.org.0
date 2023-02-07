Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2A368D044
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:12:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI7S-0006TS-V9; Tue, 07 Feb 2023 02:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7B-0006Op-JT
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:05 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI79-0008RG-OJ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753803; x=1707289803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fr5EXtXb4jGUB9bC4txVd0Kiui5bz4EfmiwUZkIFy7w=;
 b=DtXkc97go0EWMYZeGCDt9OPtAMYnnmf0c47LR5CcO741368N5tU+wNvT
 0jCUf89CZsrUIGyWUmnZxaLe8ThvXMJDU7WgYrYuRlZbjYgN8uON/jc88
 TZN8lec84aBq+E3RQNV8+evtVKxsCWIuC3W4saabn0sOUsdBInfjJfW8G
 Ptidey93m/0Nuc04YOz4NryeBUBJp/gycnqM1wRdrZ5nNg0QJD4BJ+8WX
 1vd2UKMEbz+BIuhbDEJCSgHbmXVI8xOGWcY64Ow5JHGY+kHLu/X/9kdiZ
 W4lQksRt269r0wrWDduR/R5AW/1FIPHeo7m0dzCZ3PqOVGu/aRGD3MHR9 g==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657455"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:09:56 +0800
IronPort-SDR: AXPkc0WegC0xYg8UHcYzqNM6BtaavywVehFaVkMTlwM0zetwExXUqb/xX15C1nxiPovoI53lxa
 P8miL/KNd1Dmsz889OpJfXLhPK9TmxhsB3Gc00oAoMKtklxcUaEK6uXydu2YIpk0WSc5st87hm
 g6XEljoPXjAxv/ebNaBdD2YTThvuw8mrfV8HqhT/V7EhK0qfUp1Ta7ocplSfCbgl45V4pMRx6w
 NPb0noNNCV3eSxHuSltRiyiXI7aCTgbnDNh/YqjV0dZUcYMeO/ugkewmP1srnbXuJ9gyCUUw1u
 ZeU=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:13 -0800
IronPort-SDR: sD+XVCuQjDC7WlmaSTteLO6GiWK/ZLFfn+XULl79ilAgZbPlL5EwPQjYpJyB3qdkokZOI/E/d4
 irCGJkyYqDf4uzIiCnc4yiDNTwfsARxbE30BmVqBMKFLHRWyQDGBeZp/gYh96FDF2DfUg42HAs
 39BGS+MAfy3HnNkmAsWPuX8SpLZAaHe2ELcrfsNsm5X96Y24ne0cYc6HF6dIdVgvX1nmLEVcxL
 qwpC0Ojh0LdmSqlbmgL3pOkls7CYF0cMjixhHIovXhxr5jmsn2s9fIsYVHu0aCJ0HE1H+H2aRD
 ugM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:09:56 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vQX4jyKz1Rwt8
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:09:56 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1675753796; x=1678345797; bh=fr5EXtXb4jGUB9bC4t
 xVd0Kiui5bz4EfmiwUZkIFy7w=; b=GYOPyese/Zl4qHnsnHbz5VhZanY0jNDrCs
 stXI+NGL4jPSCSQOJ1xE4ouKvZXVr9gkMugisLwhYLQV7UpsmQMIhvTZFX4YGHL+
 tODV9GP5qb4xaF4pDNmS2bmcwP9lqCNCoIwy33ayVHjhFu4etBR+RKrsdnhaKquT
 RP3rBUdxT5xGUD/fMqmCDZaPJIGx0sKxMzzQcOCn0LEaXMQdSBCbgASfFgGmeNNW
 Wle/9Rj66NqwCWZ/K/MSejY5AvIOMv+X+mNzm1APmo/6rw049PtUg7dpK/sv/fm6
 vK/aFkxnlhclImJTSRqqzMCoir3Jg8lGc5drpCCbMe7rJOruEwAw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id VY6BHFeGR0Xv for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:09:56 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vQW00Znz1RvTp;
 Mon,  6 Feb 2023 23:09:54 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 04/32] target/riscv: Update VS timer whenever htimedelta changes
Date: Tue,  7 Feb 2023 17:09:15 +1000
Message-Id: <20230207070943.2558857-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Anup Patel <apatel@ventanamicro.com>

The htimedelta[h] CSR has impact on the VS timer comparison so we
should call riscv_timer_write_timecmp() whenever htimedelta changes.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230120125950.2246378-2-apatel@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 62e6c4acbd..fa17d7770c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3045,6 +3045,8 @@ static RISCVException read_htimedelta(CPURISCVState=
 *env, int csrno,
 static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
                                        target_ulong val)
 {
+    RISCVCPU *cpu =3D env_archcpu(env);
+
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
@@ -3054,6 +3056,12 @@ static RISCVException write_htimedelta(CPURISCVSta=
te *env, int csrno,
     } else {
         env->htimedelta =3D val;
     }
+
+    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
+        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+                                  env->htimedelta, MIP_VSTIP);
+    }
+
     return RISCV_EXCP_NONE;
 }
=20
@@ -3071,11 +3079,19 @@ static RISCVException read_htimedeltah(CPURISCVSt=
ate *env, int csrno,
 static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
                                         target_ulong val)
 {
+    RISCVCPU *cpu =3D env_archcpu(env);
+
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
=20
     env->htimedelta =3D deposit64(env->htimedelta, 32, 32, (uint64_t)val=
);
+
+    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
+        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+                                  env->htimedelta, MIP_VSTIP);
+    }
+
     return RISCV_EXCP_NONE;
 }
=20
--=20
2.39.1


