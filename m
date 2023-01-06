Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE9F65FA03
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:16:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdBo-0001Cq-2P; Thu, 05 Jan 2023 22:14:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBm-0001CB-1X
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:38 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBk-00088M-4S
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974875; x=1704510875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5AXe3twnY8qRsIVhaK0DDoq+iL4EKufgELR3QT3Xi2Q=;
 b=CH83WPRzXjDWiNwBCh2xcqkqcgvmcz+veOZ0uX4vCl9pgBmo4idDy2fa
 8hv0fmfMvsWhMh4lnZasTM8u32+brvwSOCUIJyXu/YYIBsm/Va+O4G+w4
 92dW5s7P/twWVEmkVc0GrChlS4VjOn5W/ef1tW/Plqj62R2Zz1MEhcBMY
 pwgpu4rVqtxJM5ZfxYfLi90lgIG64EGcgxLLTAuWqq9SrWUwORQOpue0R
 n38BsHFydFtRTmhyuxLy8ZwmM/3W315kUK3eT2fUg/xp6UlJN9WYY7eAn
 x0NQ4gIC1dtHpWffP7vvyTZ4xA/aKRSPZSDL8kPF54N4jftdAY2HX1Nfd g==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254762"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:24 +0800
IronPort-SDR: IhEhL2lOe3yFqdJtpnWC+X0gdNOR58/+nbf/yvauWMz5Fp5G5Yfqu/Y8SuXgba/DbPV0C5ju5/
 I65X2PyiVR04nPUXobHJYIDf0CYPbO/V1IKkfNb2TcmKo708sS3asferf+Uo9Kq3iWVJedBDoO
 mKFWmmjPlJKinKFXIxfb70rc1HA3Q6l+imAK/oFakiv/yD4ToYRR2MX9nr7U819Crvs0JPX9Y8
 TOW1qD0DsCk0K83/HmOZFodOBwwhlfWxZkCSI8g6YVZxSAGa9QhOwJGS926xkVri6NmtROf5P5
 ln4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:36 -0800
IronPort-SDR: yetRGAmJSUSuPq2JI3KlKI0A5G0Avk8AcMOTDIXlqhPWXxPDPYUSKEBCVNZh1mvBpe9BiM2Bz7
 ve/XAGktTSIAXCj9esEvxIidSwh1IAC65SdCznbCpAnRKtotzfSRKxtz10fq/qtqClbjEabvrz
 nXIrd2HIvOvTSgxez6ZkL24otVGyPy8vrQqEVeEZV2d/VE9odZMmYDmJbZ3Rig93STtmxqa8Ce
 WP4lGhQc7XUqfUejihPPeX8UAWBCgH68WiuUKTt1PeKFubSRy6EP22IR/4mGKU5wi9TGMZ81Fl
 A1s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:26 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jX71mLz1Rwt8
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:24 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974864; x=1675566865; bh=5AXe3twnY8qRsIVhaK
 0DDoq+iL4EKufgELR3QT3Xi2Q=; b=MNQGawpu+qWKkevZI9eXfdKHL2HktHQh6E
 /3wa7j/FnGLoy1rEvqVOfNrphrZ35INBOwW2kbhTP81uhJ+EiVyx/isPzQlSxaRf
 iJeG2x06FbSmMPJ9DGTromMaDi3i9zBR1IAqpqLkiO6EkSI7oU0U8Djmbxb8tmh6
 96NUpGDfLZkesTWYpfWwegcqXzqImrvVCHBBsAOJU17+LXDSNBAvP6slhyjaFGOV
 ZsuBIOinvm9TsfSAivKA2g1sZMW7H5R6tM3lRk0I6ezMz5G0LJe8j/VXqv+YOpg6
 E9wa+pSMEoAVmWTMocY6qlG4PFU+oUlWNK3xmIbMgoCKq1H89Kig==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id mFxBxK-UXY5b for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:24 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jW0yLyz1RvTp;
 Thu,  5 Jan 2023 19:14:22 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 11/43] target/riscv: Add itrigger support when icount is
 enabled
Date: Fri,  6 Jan 2023 13:13:25 +1000
Message-Id: <20230106031357.777790-12-alistair.francis@opensource.wdc.com>
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

The max count in itrigger can be 0x3FFF, which will cause a no trivial
translation and execution overload.

When icount is enabled, QEMU provides API that can fetch guest
instruction number. Thus, we can set an timer for itrigger with
the count as deadline.

Only when timer expires or priviledge mode changes, do lazy update
to count.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221013062946.7530-3-zhiwei_liu@linux.alibaba.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/debug.h      |  1 +
 target/riscv/cpu_helper.c |  3 ++
 target/riscv/debug.c      | 59 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c32e484c0b..b0b4048de9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -329,6 +329,8 @@ struct CPUArchState {
     target_ulong tdata3[RV_MAX_TRIGGERS];
     struct CPUBreakpoint *cpu_breakpoint[RV_MAX_TRIGGERS];
     struct CPUWatchpoint *cpu_watchpoint[RV_MAX_TRIGGERS];
+    QEMUTimer *itrigger_timer[RV_MAX_TRIGGERS];
+    int64_t last_icount;
=20
     /* machine specific rdtime callback */
     uint64_t (*rdtime_fn)(void *);
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index cc3358e69b..c471748d5a 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -146,4 +146,5 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, C=
PUWatchpoint *wp);
 void riscv_trigger_init(CPURISCVState *env);
=20
 bool riscv_itrigger_enabled(CPURISCVState *env);
+void riscv_itrigger_update_priv(CPURISCVState *env);
 #endif /* RISCV_DEBUG_H */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9d1d1bf9f1..6230f65f70 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -676,6 +676,9 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ul=
ong newpriv)
     if (newpriv =3D=3D PRV_H) {
         newpriv =3D PRV_U;
     }
+    if (icount_enabled() && newpriv !=3D env->priv) {
+        riscv_itrigger_update_priv(env);
+    }
     /* tlb_flush is unnecessary as mode is contained in mmu_idx */
     env->priv =3D newpriv;
     env->xl =3D cpu_recompute_xl(env);
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 036161649f..371862cf38 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -30,6 +30,7 @@
 #include "trace.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
+#include "sysemu/cpu-timers.h"
=20
 /*
  * The following M-mode trigger CSRs are implemented:
@@ -567,6 +568,62 @@ void helper_itrigger_match(CPURISCVState *env)
     }
 }
=20
+static void riscv_itrigger_update_count(CPURISCVState *env)
+{
+    int count, executed;
+    /*
+     * Record last icount, so that we can evaluate the executed instruct=
ions
+     * since last priviledge mode change or timer expire.
+     */
+    int64_t last_icount =3D env->last_icount, current_icount;
+    current_icount =3D env->last_icount =3D icount_get_raw();
+
+    for (int i =3D 0; i < RV_MAX_TRIGGERS; i++) {
+        if (get_trigger_type(env, i) !=3D TRIGGER_TYPE_INST_CNT) {
+            continue;
+        }
+        count =3D itrigger_get_count(env, i);
+        if (!count) {
+            continue;
+        }
+        /*
+         * Only when priviledge is changed or itrigger timer expires,
+         * the count field in itrigger tdata1 register is updated.
+         * And the count field in itrigger only contains remaining value=
.
+         */
+        if (check_itrigger_priv(env, i)) {
+            /*
+             * If itrigger enabled in this priviledge mode, the number o=
f
+             * executed instructions since last priviledge change
+             * should be reduced from current itrigger count.
+             */
+            executed =3D current_icount - last_icount;
+            itrigger_set_count(env, i, count - executed);
+            if (count =3D=3D executed) {
+                do_trigger_action(env, i);
+            }
+        } else {
+            /*
+             * If itrigger is not enabled in this priviledge mode,
+             * the number of executed instructions will be discard and
+             * the count field in itrigger will not change.
+             */
+            timer_mod(env->itrigger_timer[i],
+                      current_icount + count);
+        }
+    }
+}
+
+static void riscv_itrigger_timer_cb(void *opaque)
+{
+    riscv_itrigger_update_count((CPURISCVState *)opaque);
+}
+
+void riscv_itrigger_update_priv(CPURISCVState *env)
+{
+    riscv_itrigger_update_count(env);
+}
+
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
 {
     switch (tdata_index) {
@@ -796,5 +853,7 @@ void riscv_trigger_init(CPURISCVState *env)
         env->tdata3[i] =3D 0;
         env->cpu_breakpoint[i] =3D NULL;
         env->cpu_watchpoint[i] =3D NULL;
+        env->itrigger_timer[i] =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                              riscv_itrigger_timer_cb, e=
nv);
     }
 }
--=20
2.39.0


