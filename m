Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C29C65FA2D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:28:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdBs-0001D0-Tx; Thu, 05 Jan 2023 22:14:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBn-0001CR-3w
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:39 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBl-000892-BW
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974877; x=1704510877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yTwu9/tZ7a+03Ros3BXQg71H300VT0ZyIvOay3XEQg4=;
 b=YnX4ri4C+tDn7lTCNJd/nynEjxOZadJaIPHHPAoXuamjZr7z3rA+ywsX
 l/+xgKchDHu5LxfdmoizG/27422gTz7FpbiCYCLnAcWhIZis/UsSlV3HU
 MepuFdAfWvon493acTI/hjKfH9ff+X6TjJBtQxRHVSPULWndGO3C//VYB
 SjB7Ie83pD2zkQReuhrjRdv58quOGc3FQ+gYvCChXkTHYEG5ZjPfyd3Kn
 hqB1/LtbtJORaQfiQJEyjwvz7qEEtkmt2AD9qFk+RvdizH0c4CGEXo23F
 Rxo/44rOyWJrMlGvDLzOrhwhyicYp/F1PU6MQbisLMb1mswPax4aAO+cb Q==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254766"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:26 +0800
IronPort-SDR: gPfdq6inm0Wz3rx5ADm+ZDfQ0Et5IO3MX16pWUc8N+voWrlxgBreljEnOzf53JAZip441BQcAn
 +QiVSJIEb6P4xEH4GJ9JE9VL7t8mf3XQhMHvgOQH3pUOxIKcIs+diyKWn+ml2P/qBg+ViTqmzX
 GohvCo4bdkbY5PSQgVTCY+qbVNWJkMVdEbjesjahEnggyk1UIdfH979Ovszu8To/fVr1vUWf3b
 1dADIKNGzXCi7bFnZd78heZmWh4C5woln9qtsalssLdf0Nsy72JpP3+lB+wYfuTeY6J4b29XNs
 KSI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:37 -0800
IronPort-SDR: D861HjZgF2MCwUcwXAdGE/NR3MKryBAoiK/f9SMQPYZiB1wkBP5NPzMoxmPnJBgbrucws28YbW
 o4QxWywowocW6SnKfvbzr7I+PoqQP2o1cveqUxJY9WYux04qeuP+/7eCyISxcCFOJg9koHe4kU
 pnHcy8zbcIjtTcEsutLTnT3zD74c2/0lPmAeqiR8cEUGlUl2AY3J/Y2of6p9moIP+2F0P0uj3M
 J+ILy99m8FyHSR8rdsImfnWoxXmHtJdhxb3yY4IVApLSOm8PRC3hF2wJHRxTWRmgEntCr3yfi+
 VqQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:28 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jZ3LwBz1Rwrq
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:26 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974865; x=1675566866; bh=yTwu9/tZ7a+03Ros3B
 XQg71H300VT0ZyIvOay3XEQg4=; b=j0nKg4lLYLUw2bwo/Bq1+2cM7GA6lTUDu8
 qipQr/wM8BakYpno0qdN5qGH1InAFKwCZ2H5VPPpp6mGH5pqiWHz9XQPZgAcFpZL
 5e0tCChWh/bLytZwn2cDTqtpFWUIkBHCcx47bpFVt+kd/ioZjQI3rrfImbn5rGC1
 Ovd38Cx3PurIGPq5eyfmCijC4nGRdSWiD3HY13ivkFI5xtdGmy6oA79EOCpE/iZi
 4YKIvZCBVOslH8wfqkhU7rKCbAgy3bwOw2nloILvbsNVoDLrKsIhMzt+EG3DiPdk
 1vFUHJyIdZ7laIj9HXti5n9MF5IPv4PfLdHV4d3tvpVwJpxNBdUg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ns0fKIcx9tYv for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:25 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jX5S3kz1RvLy;
 Thu,  5 Jan 2023 19:14:24 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 12/43] target/riscv: Enable native debug itrigger
Date: Fri,  6 Jan 2023 13:13:26 +1000
Message-Id: <20230106031357.777790-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

When QEMU is not in icount mode, execute instruction one by one. The
tdata1 can be read directly.

When QEMU is in icount mode, use a timer to simulate the itrigger. The
tdata1 may be not right because of lazy update of count in tdata1. Thus,
We should pack the adjusted count into tdata1 before read it back.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221013062946.7530-4-zhiwei_liu@linux.alibaba.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/debug.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 371862cf38..b3574b250f 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -624,10 +624,80 @@ void riscv_itrigger_update_priv(CPURISCVState *env)
     riscv_itrigger_update_count(env);
 }
=20
+static target_ulong itrigger_validate(CPURISCVState *env,
+                                      target_ulong ctrl)
+{
+    target_ulong val;
+
+    /* validate the generic part first */
+    val =3D tdata1_validate(env, ctrl, TRIGGER_TYPE_INST_CNT);
+
+    /* validate unimplemented (always zero) bits */
+    warn_always_zero_bit(ctrl, ITRIGGER_ACTION, "action");
+    warn_always_zero_bit(ctrl, ITRIGGER_HIT, "hit");
+    warn_always_zero_bit(ctrl, ITRIGGER_PENDING, "pending");
+
+    /* keep the mode and attribute bits */
+    val |=3D ctrl & (ITRIGGER_VU | ITRIGGER_VS | ITRIGGER_U | ITRIGGER_S=
 |
+                   ITRIGGER_M | ITRIGGER_COUNT);
+
+    return val;
+}
+
+static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
+                               int tdata_index, target_ulong val)
+{
+    target_ulong new_val;
+
+    switch (tdata_index) {
+    case TDATA1:
+        /* set timer for icount */
+        new_val =3D itrigger_validate(env, val);
+        if (new_val !=3D env->tdata1[index]) {
+            env->tdata1[index] =3D new_val;
+            if (icount_enabled()) {
+                env->last_icount =3D icount_get_raw();
+                /* set the count to timer */
+                timer_mod(env->itrigger_timer[index],
+                          env->last_icount + itrigger_get_count(env, ind=
ex));
+            }
+        }
+        break;
+    case TDATA2:
+        qemu_log_mask(LOG_UNIMP,
+                      "tdata2 is not supported for icount trigger\n");
+        break;
+    case TDATA3:
+        qemu_log_mask(LOG_UNIMP,
+                      "tdata3 is not supported for icount trigger\n");
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return;
+}
+
+static int itrigger_get_adjust_count(CPURISCVState *env)
+{
+    int count =3D itrigger_get_count(env, env->trigger_cur), executed;
+    if ((count !=3D 0) && check_itrigger_priv(env, env->trigger_cur)) {
+        executed =3D icount_get_raw() - env->last_icount;
+        count +=3D executed;
+    }
+    return count;
+}
+
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
 {
+    int trigger_type;
     switch (tdata_index) {
     case TDATA1:
+        trigger_type =3D extract_trigger_type(env, env->tdata1[env->trig=
ger_cur]);
+        if ((trigger_type =3D=3D TRIGGER_TYPE_INST_CNT) && icount_enable=
d()) {
+            return deposit64(env->tdata1[env->trigger_cur], 10, 14,
+                             itrigger_get_adjust_count(env));
+        }
         return env->tdata1[env->trigger_cur];
     case TDATA2:
         return env->tdata2[env->trigger_cur];
@@ -656,6 +726,8 @@ void tdata_csr_write(CPURISCVState *env, int tdata_in=
dex, target_ulong val)
         type6_reg_write(env, env->trigger_cur, tdata_index, val);
         break;
     case TRIGGER_TYPE_INST_CNT:
+        itrigger_reg_write(env, env->trigger_cur, tdata_index, val);
+        break;
     case TRIGGER_TYPE_INT:
     case TRIGGER_TYPE_EXCP:
     case TRIGGER_TYPE_EXT_SRC:
--=20
2.39.0


