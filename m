Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A505C65FA13
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:21:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdBw-0001EB-A5; Thu, 05 Jan 2023 22:14:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBu-0001Dh-1D
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:46 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBo-00088g-8W
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974880; x=1704510880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nAxEB4eUhN1sYT3+ndTjiPZbkNIkfztPrCBZWXDBqRk=;
 b=VyA0kJ3LKRARdF/+MDU3zyMnpc0WgL2CacRTb3q9LiC9L/ZWEn6qMeYC
 V6tdXOGa9CVGl7GzuJY4CAsrXpvTkdzcD8BiR03wgWrmZ7xmkKFaE4uYU
 Ey1wx/2j40hvF0yAAIRCgQNGh6pdcQs3cWOpPwarndK9igibv8ZAgPlEM
 CnJ8cRi3u+Qjy2uPFPnD3B+NMb3TBN3ooJyVRZ17bGR978utz5sGFEBfk
 G4IGc9eyhhhDAFFEBiUCxPfi+NUc9Q9SJrbr06GBRPwpkvidib2M2zJFy
 7jmDWKxZn42ppcy9koHzguUlSStXaZdVimkiPEVlu4ojnEwFdfTmU36DL A==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254780"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:29 +0800
IronPort-SDR: wznjSO4g7n7hoWmFVKqKUYyZPSxWbH84ceOjuC1+HK4Sr4xgjRvenvr9oD+UnmzpcDe1tQNOc6
 n9+5hsc66zC2dnlG6q1Fq+zO4IsABSBq9UWj8Um2dD3mZdui8Nlif+oHKjW0lFLXQl19ToovnG
 QlmRQBHg+urO3xITHuY83EWu9SCdgaLaHV4/kejbRXt28szIrugouI7Xfs13IXRY1FH4/BYRgP
 72j3iQNj0KBndMmphPhhalgMicwnln/aIsI1+RSbFLIL2g35E67xefizo4jKJXyaeP08sLJCXY
 hhk=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:40 -0800
IronPort-SDR: iF0EhVdrK4hw5CLrY4RzWaq5yvNp7FyHAVeRwjQFiNd2Yucue9odF6qj+lF2qs4B8cCDOwuYrB
 KxJHwDo53EKIT5q+l306XmlpLLozZXBw+CdZCp+4y7+h9Ol+OfifZJknK9uvPOysMRKXLYXvJy
 ef5kprFjGe2PtdvSf7XqdazWa/CrDW5Vyaznmrk6f+P8u1quivmCHCQS2SwnwgOgF+fgKVoRpe
 KQc1o/6HJyZj22vUwh7UNzRrKwT1JHFaT/XyvuyZ/QIYqehZBMx0spv7xsoLsfGAgyEVDOtIvE
 gpk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:29 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jc07JQz1Rwt8
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:28 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974867; x=1675566868; bh=nAxEB4eUhN1sYT3+nd
 TjiPZbkNIkfztPrCBZWXDBqRk=; b=JFaMrpyb9yn+PB32mDYr/7b6HGoivO8kHw
 KK7h8ccjxm3AxlhpSfhGqT5ikOTpUJHOi1ZSFersi4lU2Q1Y2bwuY9D0pILn1f/E
 AdHMxA4i6iuJ3CjqFgOTv/b6fQwec+RbvuSEuGG8yaVtrVPuCX1n2o6VRqvbAgAo
 GCWYGvI3hFAQmKINMZiC5s8lJuin0UmFs2px5G4p3debnmWqrOe693X28eciCogQ
 /peORcU7zhQqEzOVm7TRuHyVUu6CTy300cqOeRDMHgpyII4h0icDeELGMYOvPUzc
 Kpi5mD0UuxCPPqJY72NrzM14rVcwaKTOF+6Zo8VjRhB1fa5r2jeg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id bqrPqjUTq1OU for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:27 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jZ2Wvyz1RvTp;
 Thu,  5 Jan 2023 19:14:26 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 13/43] target/riscv: Add itrigger_enabled field to
 CPURISCVState
Date: Fri,  6 Jan 2023 13:13:27 +1000
Message-Id: <20230106031357.777790-14-alistair.francis@opensource.wdc.com>
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
2.39.0


