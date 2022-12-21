Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B526538D9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:42:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87mC-0007fc-LY; Wed, 21 Dec 2022 17:41:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87m7-0007TK-OB
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:24 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87m6-0000bf-3E
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662481; x=1703198481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Q1etqXq6mt77HOH608vmTWlV47LCAy3tVEsE1U6I48=;
 b=J7MXoU6V7V7yLE8PzMm5sda5b98gLnFqbYd1RBrCa89J3dhGuah8hgDR
 LQ2NB97IpkVhExW4XMahb0KwQy+0jvV+Ei2R1jAUumM2jl94lrObhm4rg
 qTD40AUEnFB8AJFEYR8KHNlMNDh6XAOvB5KGzLFOVtybremlqb0aQ8k69
 0JVGwjYh/2CmeVrUN+RRRLb2PB/v/aZrL0F9LueViDmZrZ+uUjuoYjmp/
 yZ5xdCToar5edRKrI+/dOIWdBU3h8+xpkigJ3lgFQat5LHxgGal8vpIUv
 XXel1d1fVPkf8zqtrBWEGeO0r61k90BsaTlCCZhjqpdeykPSc1KLVxTVl g==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561327"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:40:58 +0800
IronPort-SDR: wlEoH78oHuxEaxTS2t6wgDREhN62/t+Mq5LGQe75nih1hhczD+7y7TCpxw5Lki4iRk7KfVNth6
 1EpwvLfXiKEcGU6tyjUHXjfmEpNjuLrJtMAsZe7p5oUyEiN9wdjMQQpODllR+8PL6siBWj4LTx
 G4Qzyr4EM0qtpgSb0u/2TEIEx+ys4MMFS+svsegjRD06ab4SJyhihgFZ/Eej9LCJ0JkwctAC7j
 2z2XW0jcEtDNdItToxn3ic+oni3vpxt6QmNXbqK55zj7HdRUgtDWk2m6U9oc2cV/ockxArD4Ik
 E3k=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:27 -0800
IronPort-SDR: Z38qq1SmX1SoMpWQhfh4QqkMeNBfwzgjqReFMrwb6FIgOxuQzjzB8i2yHlV/uDUZyZZdEikm8M
 qbNj8r4XzOzOTzdZQvkszjZowpOXOocpzdULAmeegB6P/i2AciujCykIMMQnqNNJIC0DSzIH+S
 FvK/kCJa42OrGv0tgmZckwPjw+J+R4VvncV6OxJgLn4rJVpvmpEB+2CUuAGK4uMtF1AOEQ+7KD
 2MtdMo2KPPbrw+QOl3wIG4ZjzKRgukzWEkGFQRf8L2rCQrVf10tfvbkjCBx/bo+VGaN7Lh1mES
 Ilw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:40:59 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpLz06HBz1RvTp
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:40:59 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662458; x=1674254459; bh=6Q1etqXq6mt77HOH60
 8vmTWlV47LCAy3tVEsE1U6I48=; b=C2Ukcq3lWPLR4H0MxLBRZCNIJg/eqQc9tt
 Ii/qxBty7T7rb1j7kXhuvKkspHHf7+SZ+ggOHk/HRgywFNPRgZkUrcfukHlsFFb3
 3olwDmyx+AfWK9Uq0L7cj6qwVDggLfBHOyD9/vqTb8n1ZovpAHXW5fQOZCLnGGSj
 Hzy2GkysnOi2zzuY9Wsm6aeRdKLqrgPVolU2IRafw8A6BDUkuiy+GTOfVRy33vsG
 ThEVoLBYDYfouoRniHy5yG3hfJjSzFTAlx8uE8ryi1g/FeDEFgEj8j9meqHZK6wK
 ohvo97jspmAYPM8VNub6iF+3p+iqJUnZr7yUQM7C6OUmfzOzrBuA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id yIJNlkqJhO9d for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:40:58 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpLw4KC5z1RvTr;
 Wed, 21 Dec 2022 14:40:56 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 14/45] target/riscv: Enable native debug itrigger
Date: Thu, 22 Dec 2022 08:39:51 +1000
Message-Id: <20221221224022.425831-15-alistair.francis@opensource.wdc.com>
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
2.38.1


