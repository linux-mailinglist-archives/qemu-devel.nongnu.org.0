Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E766538DB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:42:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87mF-0007hp-2v; Wed, 21 Dec 2022 17:41:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mA-0007fF-OX
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:27 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87m8-0000bQ-SB
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662484; x=1703198484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hA8GUt3QgaAt1ObukS0M+QptkQXfyXPsaUaQjv3/W5k=;
 b=es5VAXRK4TOcJtkPK4IGrYkwkf0ck2AYd6BkQ/4rBH3/t8XOccrHx82/
 kzTn+yqc4q6dGR+seZlgrXgLQH8goQz/31NOdMIQ4K9DJO+QLqNZl/w/x
 orU9bFslzDP88Ll1xgwFKV2x/Nn350062O2vlF437FWAKyty5tGwPq1LM
 MloLI8qFju61LcgAfR0qDu4je6/JJq5iMNcv/vWzF0yK32we9NCVpvxOq
 HaOzAr9isIx8vd3RgDDfYtPd8KWnzFYYQ+qz8/MFqwbBUBWR7qIHvF7Ku
 chHY2bUQVJKaMpP+6odEVomDsLYb5mBtxJbf057iiI+AwCbPqOSef88tv g==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561334"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:01 +0800
IronPort-SDR: FmGhVmNeB+b1LZuSWNQ6AHGIQX17FscfRtWfprSKA67V69ZXYcezQwWtGTBgzKGvopOl35CdTp
 eap/8yto+L+o67gp8+gLCfLsIVmE2asrlsI2T3JJBegOQVXUotwj1904ll5ZjdfEfW2JDlvdNe
 6tdGqI6V+tKDpM7x1ICcuGIZuxuBVL0c7cZ8ZHG597dRaNhmmD+4Pxp/6SnNkoRxARkhwUVPOX
 ydm9f3Z2+cBn/l2fwIQejUrmTzX1lmTNvGOoJ2/Eg1dpga4Uqg7HFUn+SNZ7VkMeIJPPU0TXon
 c4M=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:29 -0800
IronPort-SDR: Jg00FOxK6ttkwppw1BTIRpnR1JXo4W2MFAicYqN9jWYupzU0fxxbHnAc5VjbSOGHvxBy7SaclN
 wVMZgInVcykrqogQ7zzjeggpzl9i8QfCDuf3dlf7NijgF4Z4s8yir4LGUKXg5Bxg2AYRazgtiX
 PRfFrIypo+gxPd3FfR3aOqwcWg8zOcf6/6UUc3U21WheObfxmnVu+BUlllSMMtnOXEP51RZmIT
 DSDj4UfUbkOfeqvFxJHJ5t+WkFtoIpSw1pYcNPwQebhUibMh8tTKDw6akixlfmecN11Q5w+pV6
 kVU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:01 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpM10R75z1RvLy
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:01 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662460; x=1674254461; bh=hA8GUt3QgaAt1ObukS
 0M+QptkQXfyXPsaUaQjv3/W5k=; b=YeAIiNSdRWQNpDuPAifQNoEJZc4bQZRZf0
 1vRnbHLk6ecxjaUUlkTiAtOoeBmyGwjbtO7s1OSueD++zfRmYUzIItq6hERevxJ4
 0km0gttQ6p046yyiy4jyfoGNmvIgOlp1v+bj2hAfzGOf/bz9eo3BVRUniDsP/SCn
 iwYX4bvaW6XUyNv79zRyqLYZImW9H6hsNHRLIIcEuCBJ9c7psELwPJg/uo4V4UFD
 WQUNmO5OqOdr1jfgA/WufizTbTx2rzBNavtl//Mnb0nwg079Bc0I6nU3cfpxktYo
 61i12rSozK62eybftBt4bIb1FNs37/rKCOXEGlBmcABgAoKS74pA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 6GcPGyssaLxO for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:00 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpLz0fhQz1RvTr;
 Wed, 21 Dec 2022 14:40:58 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 15/45] target/riscv: Add itrigger_enabled field to
 CPURISCVState
Date: Thu, 22 Dec 2022 08:39:52 +1000
Message-Id: <20221221224022.425831-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

Avoid calling riscv_itrigger_enabled() when calculate the tbflags.
As the itrigger enable status can only be changed when write
tdata1, migration load or itrigger fire, update env->itrigger_enabled
at these places.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221013062946.7530-5-zhiwei_liu@linux.alibaba.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  1 +
 target/riscv/cpu_helper.c |  3 +--
 target/riscv/debug.c      |  3 +++
 target/riscv/machine.c    | 15 +++++++++++++++
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b0b4048de9..37f9516941 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -331,6 +331,7 @@ struct CPUArchState {
     struct CPUWatchpoint *cpu_watchpoint[RV_MAX_TRIGGERS];
     QEMUTimer *itrigger_timer[RV_MAX_TRIGGERS];
     int64_t last_icount;
+    bool itrigger_enabled;
=20
     /* machine specific rdtime callback */
     uint64_t (*rdtime_fn)(void *);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 6230f65f70..427d4d4386 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -106,8 +106,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_=
ulong *pc,
                            get_field(env->mstatus_hs, MSTATUS_VS));
     }
     if (riscv_feature(env, RISCV_FEATURE_DEBUG) && !icount_enabled()) {
-        flags =3D FIELD_DP32(flags, TB_FLAGS, ITRIGGER,
-                           riscv_itrigger_enabled(env));
+        flags =3D FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_en=
abled);
     }
 #endif
=20
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index b3574b250f..bf4840a6a3 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -563,6 +563,7 @@ void helper_itrigger_match(CPURISCVState *env)
         }
         itrigger_set_count(env, i, count--);
         if (!count) {
+            env->itrigger_enabled =3D riscv_itrigger_enabled(env);
             do_trigger_action(env, i);
         }
     }
@@ -660,6 +661,8 @@ static void itrigger_reg_write(CPURISCVState *env, ta=
rget_ulong index,
                 /* set the count to timer */
                 timer_mod(env->itrigger_timer[index],
                           env->last_icount + itrigger_get_count(env, ind=
ex));
+            } else {
+                env->itrigger_enabled =3D riscv_itrigger_enabled(env);
             }
         }
         break;
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index e687f9fce0..65a8549ec2 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -21,6 +21,8 @@
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
 #include "migration/cpu.h"
+#include "sysemu/cpu-timers.h"
+#include "debug.h"
=20
 static bool pmp_needed(void *opaque)
 {
@@ -229,11 +231,24 @@ static bool debug_needed(void *opaque)
     return riscv_feature(env, RISCV_FEATURE_DEBUG);
 }
=20
+static int debug_post_load(void *opaque, int version_id)
+{
+    RISCVCPU *cpu =3D opaque;
+    CPURISCVState *env =3D &cpu->env;
+
+    if (icount_enabled()) {
+        env->itrigger_enabled =3D riscv_itrigger_enabled(env);
+    }
+
+    return 0;
+}
+
 static const VMStateDescription vmstate_debug =3D {
     .name =3D "cpu/debug",
     .version_id =3D 2,
     .minimum_version_id =3D 2,
     .needed =3D debug_needed,
+    .post_load =3D debug_post_load,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
         VMSTATE_UINTTL_ARRAY(env.tdata1, RISCVCPU, RV_MAX_TRIGGERS),
--=20
2.38.1


