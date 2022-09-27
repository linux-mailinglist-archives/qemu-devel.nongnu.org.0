Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DA55EBB5C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:17:14 +0200 (CEST)
Received: from localhost ([::1]:56784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4q9-0000Wc-QU
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48e-0005mW-NO
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:32:20 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48W-0001I9-8L
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260328; x=1695796328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cTRSiAVc30SNI2X5dLZjY0ESKH1G6UIRkS4CwQtAW1A=;
 b=L891iaZb7FVB1asd8dNpXhUnug8x4ieQ3KZ7RYXOqLlaGxbYCe5W5AU7
 wTESJTl1uZ/fEj8/btVqGx66a3li9aAsk+wdEDP48u5Ro8+maOovOo2BT
 USFD2h3cel4B+lNSpAPiPdu7FVAIUc+xBU4i4CNuyJZdZTECdgR/Z7RlM
 ZAApWjFMKInbt7lRQcINCCNNm+/BVZKwwaQXA+Vo7ZwsJrb1EuBryTM9c
 aP5qv2aTvpPSFoQsaDg9j5fAByKdSBCEqT0fCxfUcTFvxCWqLUNv8EZHW
 gno6HuTXbEz1gGKPoKuGMm7ilLhhr3MnWTBhr1UnOlav66zMWUeVhVU5k Q==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530921"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:41 +0800
IronPort-SDR: 8ROnFFB41cbT5IVOP+NH+5F8zVmHs4uycTCPGYgzxXyZ1daKn7yucC9LxcLogsCotl68T0H5UO
 Qcd1Qlo5i7x6Bg5CIcUpkNovme0/ZOuFhcXWrU1dC3RWETnjkOfMkGZ8lLiSTdgQHwAevSCL7m
 QZ9SvWCrU1Ikl9s/LWpMk6EeCCcCJ/0TzQgBYc3MjIhPzgIMTBdBYq+mT0mzo1RwU7MqNmO7Sm
 /H5YsUAMetFMO6i0UaEoZz8y/gfQhcNJ5ieicpp9Dj2VVyBCNiJ2vC3Z+W06BWIV9Aw8AMUBUf
 5BmAw7aIwggHS51M3wC4sTqK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:38 -0700
IronPort-SDR: x66gCID/gpPIxg/yLYbvpH69Ywkt+/miKJEiMraMRlAwKrjGWZVwwagjcboL+5I9I7gWXHQIOv
 iJ6uyl8yuzfUmgc5RficPYQBAxRiZGUEZVvT/q4Jt3+dFkJB7fnf/KN/KRvJMCmryy5t8r2pa6
 RZDi1Mlvw8+pXzBzLd+LPebqf4mHJ/TYkuiE/AcPCElgOqcmxRL0yk0kRURdUldpcgX1uX5N8f
 Io0FAHgSzFdF6Ee+oHDuKexYilan3hVPmQnU4EwHKgZr7kpsbRR4wtP9mWxYQnBUcC+2SZAn6T
 Cvg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:42 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sn4jwZz1Rwt8
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:41 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260301; x=1666852302; bh=cTRSiAVc30SNI2X5dL
 ZjY0ESKH1G6UIRkS4CwQtAW1A=; b=je1Cw/TCr+H7ozhY4z93P+x+A8Qr3qUUnz
 L1FW//dCxzfHohqoCHYk/gMyEddSnCL9u3nPbTg6COZpM+fj5BA9Jw5szyvfEZla
 M6pLWvvf9NpLoQSKKJubqEh41Mj9x3k3cEIls5ayhfyWXb3x9GFSUzpM/c+DYT1g
 A1SA4YocQgjxOWHgolXJBL+7VvmvxE89oLhfmV5f1s96Z4AhJ2qWBM+sRPqkjHtH
 EiGG/BslUoMh4up696rgk69GnvHPkAUZtXj8ODD76/ZXSAHddqQAB4qtb+ecp7G/
 aswO1nnpUn54WLBJCPkONUfA5sO1fgZS/Z05OWmzilkkcj7Xm3kQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id gJCYq6UIPDKs for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:41 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sl4RbYz1RvLy;
 Mon, 26 Sep 2022 23:31:39 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 18/22] target/riscv: debug: Create common trigger actions
 function
Date: Tue, 27 Sep 2022 16:31:00 +1000
Message-Id: <20220927063104.2846825-19-alistair.francis@opensource.wdc.com>
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

Trigger actions are shared among all triggers. Extract to a common
function.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
[bmeng: handle the DBG_ACTION_NONE case]
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220909134215.1843865-7-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/debug.h | 13 ++++++++++
 target/riscv/debug.c | 59 ++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 9f69c64591..0e4859cf74 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -44,6 +44,19 @@ typedef enum {
     TRIGGER_TYPE_NUM
 } trigger_type_t;
=20
+/* actions */
+typedef enum {
+    DBG_ACTION_NONE =3D -1,           /* sentinel value */
+    DBG_ACTION_BP =3D 0,
+    DBG_ACTION_DBG_MODE,
+    DBG_ACTION_TRACE0,
+    DBG_ACTION_TRACE1,
+    DBG_ACTION_TRACE2,
+    DBG_ACTION_TRACE3,
+    DBG_ACTION_EXT_DBG0 =3D 8,
+    DBG_ACTION_EXT_DBG1
+} trigger_action_t;
+
 /* tdata1 field masks */
=20
 #define RV32_TYPE(t)    ((uint32_t)(t) << 28)
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 7d546ace42..7a8910f980 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -92,6 +92,37 @@ static inline target_ulong get_trigger_type(CPURISCVSt=
ate *env,
     return extract_trigger_type(env, env->tdata1[trigger_index]);
 }
=20
+static trigger_action_t get_trigger_action(CPURISCVState *env,
+                                           target_ulong trigger_index)
+{
+    target_ulong tdata1 =3D env->tdata1[trigger_index];
+    int trigger_type =3D get_trigger_type(env, trigger_index);
+    trigger_action_t action =3D DBG_ACTION_NONE;
+
+    switch (trigger_type) {
+    case TRIGGER_TYPE_AD_MATCH:
+        action =3D (tdata1 & TYPE2_ACTION) >> 12;
+        break;
+    case TRIGGER_TYPE_INST_CNT:
+    case TRIGGER_TYPE_INT:
+    case TRIGGER_TYPE_EXCP:
+    case TRIGGER_TYPE_AD_MATCH6:
+    case TRIGGER_TYPE_EXT_SRC:
+        qemu_log_mask(LOG_UNIMP, "trigger type: %d is not supported\n",
+                      trigger_type);
+        break;
+    case TRIGGER_TYPE_NO_EXIST:
+    case TRIGGER_TYPE_UNAVAIL:
+        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n=
",
+                      trigger_type);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return action;
+}
+
 static inline target_ulong build_tdata1(CPURISCVState *env,
                                         trigger_type_t type,
                                         bool dmode, target_ulong data)
@@ -182,6 +213,30 @@ static inline void warn_always_zero_bit(target_ulong=
 val, target_ulong mask,
     }
 }
=20
+static void do_trigger_action(CPURISCVState *env, target_ulong trigger_i=
ndex)
+{
+    trigger_action_t action =3D get_trigger_action(env, trigger_index);
+
+    switch (action) {
+    case DBG_ACTION_NONE:
+        break;
+    case DBG_ACTION_BP:
+        riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
+        break;
+    case DBG_ACTION_DBG_MODE:
+    case DBG_ACTION_TRACE0:
+    case DBG_ACTION_TRACE1:
+    case DBG_ACTION_TRACE2:
+    case DBG_ACTION_TRACE3:
+    case DBG_ACTION_EXT_DBG0:
+    case DBG_ACTION_EXT_DBG1:
+        qemu_log_mask(LOG_UNIMP, "action: %d is not supported\n", action=
);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /* type 2 trigger */
=20
 static uint32_t type2_breakpoint_size(CPURISCVState *env, target_ulong c=
trl)
@@ -384,11 +439,11 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
     if (cs->watchpoint_hit) {
         if (cs->watchpoint_hit->flags & BP_CPU) {
             cs->watchpoint_hit =3D NULL;
-            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
+            do_trigger_action(env, DBG_ACTION_BP);
         }
     } else {
         if (cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
-            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
+            do_trigger_action(env, DBG_ACTION_BP);
         }
     }
 }
--=20
2.37.3


