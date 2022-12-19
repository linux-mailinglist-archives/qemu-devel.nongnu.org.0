Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE76F650656
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:23:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75jE-0008Mq-KJ; Sun, 18 Dec 2022 21:18:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75j9-0008MN-2F
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:03 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75j7-00015X-5f
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416281; x=1702952281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hA8GUt3QgaAt1ObukS0M+QptkQXfyXPsaUaQjv3/W5k=;
 b=Anz8NP9DCYqcxmLinE16m2nC+L3d90XVv30+UbRvxgTLwzce44bf6CY8
 6wWad+3+ELxoFJoEE0Y7Nrv+EAiTNhg/FJ+gmfVkFcun92WhetYeVscYi
 LShg/Y/AtoHku6pecist1M/pWnVa6kN9lUJfmhbcatDtV1rZvACEjaeCB
 qfXSR+6A0prL+j8zMC+dlPIFJ1q4vTT6pTuiBw7xAUwoYGUtW4j93ovNM
 ssl9n0dhxW25WrV0rTz6O80BuDm3uEzPE/hPlUecNplD4hqTdS7W0IV2o
 bx9Zu2CHx7AM1ruLJH7r8VOSalifjJrlw3Geis4fSX3a/c74Gylr1bcED w==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199329"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:17:50 +0800
IronPort-SDR: 3U2X2YKqBOTdQxikxdbau7286WUZJrLzfAc27kahtwbDZRErqrfFywv4KKVuwIRdtb2PprkHa5
 hliP7vcPvyF/AXAkxujDrwPEWZzqJhzCUDBkLuWqU/w+wO/Dv6IhAjVeP7Oehfpqt3/efN5Fig
 VY2GxEtsY9NYmzvY/gaE+Qb/xXbgfXtcrD6VPdLyrj0L9/4lCZw6tft9HsigN81KOupdIZ1exW
 UDhDp1mZS/xVaYFNciBeuzw4ieThySxY/WHrpS1QLlBkJL3CcZNlp1TqGJyWIkkAgJxyLbXpbP
 fMo=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:30:23 -0800
IronPort-SDR: hzsLtE/eeH9kwU1WCyo0cDq0frrRdn0jedhxOuByrnVbISs86rNeVa7IdSqinCKDSbW5Ontlm8
 HzKgR9qvR1eTNdflssD99U6sloJ0R4VyjdhzWX5y+u35+KsW1xErtJK6Nki1uJ5Vf2h+g9B/8I
 /5s+4j61eLdOTVNIBjenv7xE2kQEN8xFkaoDCI6fiwPb4KgaLm8q67zw/CIRzN/jup9vJHZMqE
 duQ1zN+IARdLe31Nsbgtww0mre/Y4BeLrHrPG0eFLLFJ0uVrDRCWLjr4d2Ka/NgnIgLS/SDqZy
 UT4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:17:50 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3JZ1H5Fz1RvTr
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:17:50 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416269; x=1674008270; bh=hA8GUt3QgaAt1ObukS
 0M+QptkQXfyXPsaUaQjv3/W5k=; b=j1jzgfIZ0uD14T8y8irUu4KQ6+vidY1k7e
 ag/6g8pWs/YhHPVbQONKLsfeZoQVBzrAuCSkcT9/QeUeS0bmQTZ81zvX50XVKr/l
 vc+/AXHWldJV1OnkyCAHEuBkljuEzvA26kiJQugekk4gRWpWf302RC2kQxf3vdii
 mf9qiap7lyQgvbMD4z1IJTWZOnF+T+lfs8tu3VKeBL/60P+MykGFjVUidjNP2iLf
 8LSxDFBkOm6kPa2EOSYWsyhiCxH2UmfNjZSFcT++Iyyo7nKhcWtdmbY3okG1mfTJ
 nSEcwx+tcovyTUWqOcwedX2dSyhtaUZs2/uTD6CnrSffGkSWS/8w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id GF-dSMv71UH3 for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:17:49 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3JX2n5dz1RwqL;
 Sun, 18 Dec 2022 18:17:48 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 15/45] target/riscv: Add itrigger_enabled field to CPURISCVState
Date: Mon, 19 Dec 2022 12:16:33 +1000
Message-Id: <20221219021703.20473-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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


